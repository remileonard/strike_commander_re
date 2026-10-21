ovr205		segment	para public 'OVERLAY' use16
		assume cs:ovr205
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_98210	proc far		; CODE XREF: sub_42560J

var_DCA		= word ptr -0DCAh
var_D9A		= word ptr -0D9Ah
var_D6D		= dword	ptr -0D6Dh
var_D69		= dword	ptr -0D69h
var_D65		= dword	ptr -0D65h
var_D60		= word ptr -0D60h
var_D5E		= word ptr -0D5Eh
var_D58		= word ptr -0D58h
var_D54		= dword	ptr -0D54h
var_D50		= word ptr -0D50h
var_D43		= word ptr -0D43h
var_D41		= byte ptr -0D41h
var_D3E		= word ptr -0D3Eh
var_D3C		= word ptr -0D3Ch
var_D3A		= dword	ptr -0D3Ah
var_D36		= byte ptr -0D36h
var_D35		= dword	ptr -0D35h
var_D30		= word ptr -0D30h
var_D2E		= word ptr -0D2Eh
var_D2C		= dword	ptr -0D2Ch
var_D28		= byte ptr -0D28h
var_D27		= word ptr -0D27h
var_D25		= byte ptr -0D25h
var_D22		= word ptr -0D22h
var_D20		= word ptr -0D20h
var_D0E		= word ptr -0D0Eh
var_D09		= word ptr -0D09h
var_D07		= word ptr -0D07h
var_D05		= word ptr -0D05h
var_D03		= word ptr -0D03h
var_D00		= word ptr -0D00h
var_CE8		= word ptr -0CE8h
var_CE6		= word ptr -0CE6h
var_CD8		= dword	ptr -0CD8h
var_CD4		= byte ptr -0CD4h
var_CD3		= byte ptr -0CD3h
var_CD2		= dword	ptr -0CD2h
var_4CB		= dword	ptr -4CBh
var_4C7		= dword	ptr -4C7h
var_4C2		= word ptr -4C2h
var_4C0		= word ptr -4C0h
var_4BE		= dword	ptr -4BEh
var_4BA		= byte ptr -4BAh
var_4B9		= byte ptr -4B9h
var_4B8		= dword	ptr -4B8h
var_4B4		= word ptr -4B4h
var_43C		= word ptr -43Ch
var_3C4		= word ptr -3C4h
var_34C		= word ptr -34Ch
var_2D4		= word ptr -2D4h
var_25C		= word ptr -25Ch
var_1E4		= word ptr -1E4h
var_1E2		= word ptr -1E2h
var_1E0		= word ptr -1E0h
var_1DE		= word ptr -1DEh
var_1DC		= word ptr -1DCh
var_1DA		= word ptr -1DAh
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1C8		= word ptr -1C8h
var_178		= word ptr -178h
var_176		= word ptr -176h
var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16E		= word ptr -16Eh
var_16C		= word ptr -16Ch
var_16A		= word ptr -16Ah
var_168		= word ptr -168h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_162		= word ptr -162h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_15A		= word ptr -15Ah
var_158		= dword	ptr -158h
var_154		= byte ptr -154h
var_153		= byte ptr -153h
var_152		= dword	ptr -152h
var_14E		= dword	ptr -14Eh
var_14A		= dword	ptr -14Ah
var_146		= word ptr -146h
var_144		= dword	ptr -144h
var_140		= word ptr -140h
var_13E		= dword	ptr -13Eh
var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= word ptr -132h
var_130		= word ptr -130h
var_12E		= word ptr -12Eh
var_12C		= word ptr -12Ch
var_12A		= word ptr -12Ah
var_128		= dword	ptr -128h
var_124		= byte ptr -124h
var_123		= byte ptr -123h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= word ptr -11Ah
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= word ptr -104h
var_102		= dword	ptr -102h
var_FE		= dword	ptr -0FEh
var_FA		= byte ptr -0FAh
var_F9		= byte ptr -0F9h
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= byte ptr -0F0h
var_EF		= byte ptr -0EFh
var_EC		= dword	ptr -0ECh
var_E8		= byte ptr -0E8h
var_E7		= byte ptr -0E7h
var_E6		= dword	ptr -0E6h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_DC		= word ptr -0DCh
var_DA		= byte ptr -0DAh
var_D9		= word ptr -0D9h
var_D6		= dword	ptr -0D6h
var_D2		= byte ptr -0D2h
var_D1		= byte ptr -0D1h
var_D0		= dword	ptr -0D0h
var_CC		= word ptr -0CCh
var_CA		= byte ptr -0CAh
var_C9		= word ptr -0C9h
var_C6		= dword	ptr -0C6h
var_C2		= byte ptr -0C2h
var_C1		= byte ptr -0C1h
var_C0		= dword	ptr -0C0h
var_BC		= word ptr -0BCh
var_BA		= byte ptr -0BAh
var_B9		= word ptr -0B9h
var_B6		= dword	ptr -0B6h
var_B2		= byte ptr -0B2h
var_B1		= byte ptr -0B1h
var_B0		= dword	ptr -0B0h
var_AC		= word ptr -0ACh
var_AA		= byte ptr -0AAh
var_A9		= word ptr -0A9h
var_A6		= dword	ptr -0A6h
var_A2		= byte ptr -0A2h
var_A1		= byte ptr -0A1h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= byte ptr -98h
var_97		= byte ptr -97h
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= byte ptr -8Eh
var_8D		= byte ptr -8Dh
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= byte ptr -84h
var_83		= byte ptr -83h
var_82		= dword	ptr -82h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= byte ptr -66h
var_65		= byte ptr -65h
var_64		= dword	ptr -64h
var_60		= word ptr -60h
var_5E		= byte ptr -5Eh
var_5D		= word ptr -5Dh
var_5A		= dword	ptr -5Ah
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= dword	ptr -54h
var_50		= word ptr -50h
var_4E		= byte ptr -4Eh
var_4D		= word ptr -4Dh
var_4A		= dword	ptr -4Ah
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= byte ptr -3Eh
var_3D		= word ptr -3Dh
var_3A		= dword	ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0DCAh
		push	si
		push	di
		mov	[bp+var_2], 2553h
		mov	byte_495FC, 0
		mov	[bp+var_8], 0
		push	0C8h ; '�'
		push	0Ah
		lea	ax, [bp+var_A]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	[bp+var_B], 0
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		cmp	word_4684B, 0
		jz	short loc_98250
		mov	[bp+var_C], 1

loc_98250:				; CODE XREF: sub_98210+3Aj
		mov	ax, word_46F46
		mov	[bp+var_10], ax
		mov	[bp+var_1D6], 0
		mov	[bp+var_1D4], 0
		push	[bp+var_10]
		lea	ax, [bp+var_1D6]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_1E4], 0
		mov	[bp+var_1E2], 0
		mov	[bp+var_1E0], 0
		mov	[bp+var_1DE], 0
		mov	[bp+var_1DC], 13Fh
		mov	[bp+var_1DA], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_1E4]
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
		mov	[bp+var_1D2], 0
		mov	[bp+var_1D0], 18h
		mov	[bp+var_1CE], 13Fh
		mov	[bp+var_1CC], 97h ; '�'
		mov	byte ptr [bp+var_1E], 0
		mov	byte ptr [bp+var_1E+1],	0
		mov	[bp+var_1C], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid17	; "mid17"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_25C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_30 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_5 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_5 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid17voc ; "mid17voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_C], 0
		jz	short loc_983F5
		push	ds
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_983F5
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_43C]
		push	ax
		mov	bx, [bp+var_43C]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_983F9
; ���������������������������������������������������������������������������

loc_983F5:				; CODE XREF: sub_98210+1B9j
					; sub_98210+1CBj
		mov	[bp+var_C], 0

loc_983F9:				; CODE XREF: sub_98210+1E3j
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	al, byte_46848
		mov	[bp+var_2A], al
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_2A]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_98439
		cmp	ax, 2
		jnz	short loc_98436
		jmp	loc_985A5
; ���������������������������������������������������������������������������

loc_98436:				; CODE XREF: sub_98210+221j
		jmp	loc_98710
; ���������������������������������������������������������������������������

loc_98439:				; CODE XREF: sub_98210+21Cj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_98467
		jmp	loc_98564
; ���������������������������������������������������������������������������

loc_98467:				; CODE XREF: sub_98210+252j
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_4B4]
		push	ax
		mov	bx, [bp+var_4B4]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_31 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_DCA]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_DCA], 556h
		mov	[bp+var_D69], 100h
		mov	[bp+var_D6D], 0
		mov	[bp+var_DCA], 56Eh
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_DCA]
		push	ax
		mov	bx, [bp+var_DCA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_9852C
; ���������������������������������������������������������������������������

loc_98516:				; CODE XREF: sub_98210+31Fj
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_9852C:				; CODE XREF: sub_98210+304j
		cmp	si, 6Ah	; 'j'
		jle	short loc_98516
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_DCA], 56Eh
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_DCA]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_98564:				; CODE XREF: sub_98210+254j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_985A2
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_985A2
		mov	word_48F76, 5Ah	; 'Z'

loc_985A2:				; CODE XREF: sub_98210+37Dj
					; sub_98210+38Aj
		jmp	loc_98710
; ���������������������������������������������������������������������������

loc_985A5:				; CODE XREF: sub_98210+223j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_985D3
		jmp	loc_986D0
; ���������������������������������������������������������������������������

loc_985D3:				; CODE XREF: sub_98210+3BEj
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_4B4]
		push	ax
		mov	bx, [bp+var_4B4]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_32 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_DCA]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_DCA], 556h
		mov	[bp+var_D69], 100h
		mov	[bp+var_D6D], 0
		mov	[bp+var_DCA], 56Eh
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_DCA]
		push	ax
		mov	bx, [bp+var_DCA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	si, 1
		jmp	short loc_98698
; ���������������������������������������������������������������������������

loc_98682:				; CODE XREF: sub_98210+48Bj
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, si
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	si

loc_98698:				; CODE XREF: sub_98210+470j
		cmp	si, 6Ah	; 'j'
		jle	short loc_98682
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_D], 1
		mov	[bp+var_DCA], 56Eh
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_DCA]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_986D0:				; CODE XREF: sub_98210+3C0j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1C8]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_9870E
		mov	[bp+var_B], 1
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9870E
		mov	word_48F76, 0FFh

loc_9870E:				; CODE XREF: sub_98210+4E9j
					; sub_98210+4F6j
		jmp	short $+2

loc_98710:				; CODE XREF: sub_98210:loc_98436j
					; sub_98210:loc_985A2j
		mov	ax, word_4556E
		mov	[bp+var_30], ax
		mov	ax, word_45570
		mov	[bp+var_2E], ax
		mov	al, byte_45572
		mov	[bp+var_2C], al
		cmp	[bp+var_D], 0
		jnz	short loc_9872B
		jmp	loc_98854
; ���������������������������������������������������������������������������

loc_9872B:				; CODE XREF: sub_98210+516j
		mov	[bp+var_D2C], 0
		mov	[bp+var_D28], 2
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		mov	[bp+var_D30], 0
		mov	[bp+var_D2E], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		xor	si, si
		jmp	loc_98800
; ���������������������������������������������������������������������������

loc_98769:				; CODE XREF: sub_98210+5F5j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	3
		lea	ax, [bp+var_EC+2]
		push	ax
		mov	al, byte ptr [bp+si+var_30]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_EC+2]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_987E8
		cmp	[bp+var_EC+2], 0
		jz	short loc_987E8
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_987E8:				; CODE XREF: sub_98210+5B5j
					; sub_98210+5BDj
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		inc	si

loc_98800:				; CODE XREF: sub_98210+556j
		cmp	si, 5
		jge	short loc_98808
		jmp	loc_98769
; ���������������������������������������������������������������������������

loc_98808:				; CODE XREF: sub_98210+5F3j
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D27], 0
		jz	short loc_9883D
		cmp	[bp+var_D2C], 0
		jz	short loc_9883D
		push	0
		mov	al, [bp+var_D28]
		push	ax
		lea	ax, [bp+var_D2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9883D:				; CODE XREF: sub_98210+60Aj
					; sub_98210+612j
		mov	[bp+var_D2C], 0
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0

loc_98854:				; CODE XREF: sub_98210+518j
		mov	[bp+var_4BE], 0
		mov	[bp+var_4BA], 2
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		mov	[bp+var_4C2], 0
		mov	[bp+var_4C0], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_988F5
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_D9A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_C], 0
		jz	short loc_988A3
		mov	byte ptr [bp-0E1h], 0Eh
		jmp	short loc_988A8
; ���������������������������������������������������������������������������

loc_988A3:				; CODE XREF: sub_98210+68Aj
		mov	byte ptr [bp-0E1h], 0Dh

loc_988A8:				; CODE XREF: sub_98210+691j
		push	3
		lea	ax, [bp+var_28]
		push	ax
		mov	al, [bp-0E1h]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_D9A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_4C2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_4C2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_D9A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_988F5:				; CODE XREF: sub_98210+670j
		mov	[bp+var_CE8], 185Fh
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD4], 2
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		mov	[bp+var_CE6], 0
		mov	[bp+var_CE8], 186Fh
		xor	eax, eax
		mov	[bp+var_4CB], eax
		mov	[bp+var_4C7], eax
		cmp	[bp+var_C], 0
		jz	short loc_9894A
		push	word_4684B
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_98C3E
; ���������������������������������������������������������������������������

loc_9894A:				; CODE XREF: sub_98210+724j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_33 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_DCA]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_DCA], 556h
		mov	[bp+var_D69], 100h
		mov	[bp+var_D6D], 0
		mov	[bp+var_DCA], 56Eh
		push	1
		lea	ax, [bp+var_1C8]
		push	ax
		lea	ax, [bp+var_DCA]
		push	ax
		mov	bx, [bp+var_DCA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3731474Dh
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	si, si
		jmp	short loc_98A1B
; ���������������������������������������������������������������������������

loc_989D2:				; CODE XREF: sub_98210+80Ej
		push	1
		push	large 54584554h
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_D58]
		mov	[bp-0E2h], ax
		movsx	eax, word ptr [bp-0E2h]
		push	eax
		push	ds
		mov	ax, [bp+var_A]
		imul	si
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_D54]
		mov	[bp+var_D65], eax
		inc	si

loc_98A1B:				; CODE XREF: sub_98210+7C0j
		cmp	si, 0Ah
		jl	short loc_989D2
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_98A6E
		push	[bp+arg_4]
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_98B25
; ���������������������������������������������������������������������������

loc_98A6E:				; CODE XREF: sub_98210+82Aj
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_98AAE
		push	[bp+arg_2]
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_98B25
; ���������������������������������������������������������������������������

loc_98AAE:				; CODE XREF: sub_98210+86Bj
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_98AEE
		push	[bp+arg_0]
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_98B25
; ���������������������������������������������������������������������������

loc_98AEE:				; CODE XREF: sub_98210+8ABj
		mov	ax, [bp+var_A]
		shl	ax, 1
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_98B25:				; CODE XREF: sub_98210+85Bj
					; sub_98210+89Cj ...
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_98B65
		push	[bp+arg_0]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_98C1C
; ���������������������������������������������������������������������������

loc_98B65:				; CODE XREF: sub_98210+922j
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_98BA4
		push	[bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_98C1C
; ���������������������������������������������������������������������������

loc_98BA4:				; CODE XREF: sub_98210+962j
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_98BE3
		push	[bp+arg_4]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_98C1C
; ���������������������������������������������������������������������������

loc_98BE3:				; CODE XREF: sub_98210+9A1j
		mov	ax, [bp+var_A]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_98C1C:				; CODE XREF: sub_98210+952j
					; sub_98210+992j ...
		mov	[bp+var_DCA], 56Eh
		lea	ax, [bp+var_DCA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_DCA]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_98C3E:				; CODE XREF: sub_98210+737j
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	2
		lea	ax, [bp+var_3A]
		push	ax
		push	15h
		lea	ax, [bp+var_3C4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_3D], 0
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_4A], 0
		mov	[bp+var_46], 2
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_4A]
		push	ax
		push	6
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_4D], 0
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_5A], 0
		mov	[bp+var_56], 2
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	0
		push	2
		lea	ax, [bp+var_5A]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_5D], 0
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_6A], 0
		mov	[bp+var_66], 2
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	ds
		push	offset unk_455C5
		push	ds
		push	offset aConvfont_shp_5 ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_1C8]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1C8]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_6E+2],	dx
		mov	word ptr [bp+var_6E], ax
		mov	eax, [bp+var_6E]
		mov	[bp+var_6A], eax
		mov	[bp+var_66], 2
		mov	[bp+var_65], 1
		mov	[bp+var_64], 0
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_76], 0
		mov	[bp+var_74], 98h ; '�'
		mov	[bp+var_72], 13Fh
		mov	[bp+var_70], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_78], ax
		lea	ax, [bp+var_D00]
		push	ax
		push	[bp+var_78]
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_D22], 1218h
		mov	ax, [bp+var_74]
		mov	[bp+var_7A], ax
		mov	ax, [bp+var_72]
		mov	[bp+var_7C], ax
		mov	ax, [bp+var_70]
		mov	[bp+var_7E], ax
		mov	ax, [bp+var_76]
		mov	[bp+var_D09], ax
		mov	ax, [bp+var_7A]
		mov	[bp+var_D07], ax
		mov	ax, [bp+var_7C]
		mov	[bp+var_D05], ax
		mov	ax, [bp+var_7E]
		mov	[bp+var_D03], ax
		push	0
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_88], 0
		mov	[bp+var_84], 2
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		push	3
		lea	ax, [bp+var_88]
		push	ax
		push	3
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_92], 0
		mov	[bp+var_8E], 2
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		push	3
		lea	ax, [bp+var_92]
		push	ax
		push	32h ; '2'
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_9C], 0
		mov	[bp+var_98], 2
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		push	3
		lea	ax, [bp+var_9C]
		push	ax
		push	4
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A6], 0
		mov	[bp+var_A2], 2
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		push	9
		lea	ax, [bp+var_2D4]
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
		mov	[bp+var_B6], 0
		mov	[bp+var_B2], 2
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_B6]
		push	ax
		push	0Ah
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_B9], 0
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_C6], 0
		mov	[bp+var_C2], 2
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_C6]
		push	ax
		push	0Bh
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_C9], 0
		lea	ax, [bp+var_C6]
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_D6], 0
		mov	[bp+var_D2], 2
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	0
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_D9], 0
		lea	ax, [bp+var_D6]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_98FB3
		jmp	loc_99446
; ���������������������������������������������������������������������������

loc_98FB3:				; CODE XREF: sub_98210+D9Ej
		push	2
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D1], 0
		jz	short loc_98FEA
		cmp	[bp+var_D6], 0
		jz	short loc_98FEA
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_98FEA:				; CODE XREF: sub_98210+DB7j
					; sub_98210+DBFj
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C1], 0
		jz	short loc_99038
		cmp	[bp+var_C6], 0
		jz	short loc_99038
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99038:				; CODE XREF: sub_98210+E05j
					; sub_98210+E0Dj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B1], 0
		jz	short loc_99086
		cmp	[bp+var_B6], 0
		jz	short loc_99086
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99086:				; CODE XREF: sub_98210+E53j
					; sub_98210+E5Bj
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_990D4
		cmp	[bp+var_A6], 0
		jz	short loc_990D4
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_990D4:				; CODE XREF: sub_98210+EA1j
					; sub_98210+EA9j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		cmp	[bp+var_97], 0
		jz	short loc_99113
		cmp	[bp+var_9C], 0
		jz	short loc_99113
		push	0
		mov	al, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99113:				; CODE XREF: sub_98210+EE0j
					; sub_98210+EE8j
		mov	[bp+var_9C], 0
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		cmp	[bp+var_8D], 0
		jz	short loc_99152
		cmp	[bp+var_92], 0
		jz	short loc_99152
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99152:				; CODE XREF: sub_98210+F1Fj
					; sub_98210+F27j
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_99191
		cmp	[bp+var_88], 0
		jz	short loc_99191
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99191:				; CODE XREF: sub_98210+F5Ej
					; sub_98210+F66j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_991E8
		cmp	[bp+var_6A], 0
		jz	short loc_991E8
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_991E8:				; CODE XREF: sub_98210+FB8j
					; sub_98210+FBFj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_9922E
		cmp	[bp+var_5A], 0
		jz	short loc_9922E
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9922E:				; CODE XREF: sub_98210+FFEj
					; sub_98210+1005j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_45], 0
		jz	short loc_99274
		cmp	[bp+var_4A], 0
		jz	short loc_99274
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99274:				; CODE XREF: sub_98210+1044j
					; sub_98210+104Bj
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_992BA
		cmp	[bp+var_3A], 0
		jz	short loc_992BA
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_992BA:				; CODE XREF: sub_98210+108Aj
					; sub_98210+1091j
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CE8], 185Fh
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD3], 0
		jz	short loc_99309
		cmp	[bp+var_CD8], 0
		jz	short loc_99309
		push	0
		mov	al, [bp+var_CD4]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99309:				; CODE XREF: sub_98210+10D6j
					; sub_98210+10DEj
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		lea	ax, [bp+var_4C2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4B9], 0
		jz	short loc_99355
		cmp	[bp+var_4BE], 0
		jz	short loc_99355
		push	0
		mov	al, [bp+var_4BA]
		push	ax
		lea	ax, [bp+var_4BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99355:				; CODE XREF: sub_98210+1122j
					; sub_98210+112Aj
		mov	[bp+var_4BE], 0
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9939F
		cmp	[bp+var_28], 0
		jz	short loc_9939F
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9939F:				; CODE XREF: sub_98210+116Fj
					; sub_98210+1176j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25C]
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
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
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

loc_99446:				; CODE XREF: sub_98210+DA0j
		cmp	[bp+var_B], 0
		jz	short loc_99490
		mov	ax, word_48F76
		mov	[bp+var_DE], ax
		mov	[bp+var_E0], 0
		cmp	[bp+var_4C2], 0
		jz	short loc_99490
		push	[bp+var_4C0]
		mov	bx, [bp+var_4C2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_E0]
		push	[bp+var_DE]
		push	[bp+var_4C0]
		mov	bx, [bp+var_4C2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_99490:				; CODE XREF: sub_98210+123Aj
					; sub_98210+124Ej
		mov	byte ptr [bp-0E1h], 0
		mov	dword ptr [bp-0ECh], 0
		mov	[bp+var_E8], 2
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		mov	[bp+var_D2C], 0
		mov	[bp+var_D28], 2
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		mov	[bp+var_D30], 0
		mov	[bp+var_D2E], 0FFFFh
		cmp	[bp+var_D], 0
		jz	short loc_9951A
		push	3
		lea	ax, [bp+var_EC]
		push	ax
		push	16h
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_9951A:				; CODE XREF: sub_98210+12CDj
		mov	[bp+var_F8+2], 0
		mov	byte ptr [bp+var_F4+2],	2
		mov	byte ptr [bp+var_F4+3],	0
		mov	dword ptr [bp+var_F0], 0
		push	3
		lea	ax, [bp+var_F8+2]
		push	ax
		push	0Ch
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_102+2],	0
		mov	byte ptr [bp+var_FE+2],	2
		mov	byte ptr [bp+var_FE+3],	0
		mov	dword ptr [bp+var_FA], 0
		push	3
		lea	ax, [bp+var_102+2]
		push	ax
		push	0Dh
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_10C+2],	0
		mov	byte ptr [bp+var_108+2], 2
		mov	byte ptr [bp+var_108+3], 0
		mov	dword ptr [bp+var_104],	0
		push	3
		lea	ax, [bp+var_10C+2]
		push	ax
		push	0Eh
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_114], 0
		mov	byte ptr [bp+var_110], 2
		mov	byte ptr [bp+var_110+1], 0
		mov	[bp+var_110+2],	0
		push	3
		lea	ax, [bp+var_114]
		push	ax
		push	0Fh
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11E], 0
		mov	byte ptr [bp+var_11A], 2
		mov	byte ptr [bp+var_11A+1], 0
		mov	[bp+var_118], 0
		push	3
		lea	ax, [bp+var_11E]
		push	ax
		push	10h
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_128], 0
		mov	[bp+var_124], 2
		mov	[bp+var_123], 0
		mov	[bp+var_122], 0
		push	3
		lea	ax, [bp+var_128]
		push	ax
		push	11h
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_F8+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_12A], ax
		push	0
		push	0
		lea	ax, [bp+var_102+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	si, ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_10C+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_12C], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_114]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_12E], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_11E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_130], ax
		push	0FFE9h
		push	0
		lea	ax, [bp+var_128]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_132], ax
		push	[bp+var_12A]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_12C]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_12E]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_BC]
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_AC]
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [si+1Bh], 0
		jmp	loc_99926
; ���������������������������������������������������������������������������

loc_99785:				; CODE XREF: sub_98210+1731j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_136+2], ax
		cmp	word ptr [bp+var_136+2], 6
		jnz	short loc_997E3
		mov	word ptr [si+1Bh], 1
		cmp	[bp+var_D], 0
		jz	short loc_997E3
		mov	ax, word_48ECE
		mov	word ptr [bp+var_136], ax
		mov	word ptr [bp+var_13A+2], 0
		cmp	[bp+var_D30], 0
		jz	short loc_997E3
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		push	word ptr [bp+var_136]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_997E3:				; CODE XREF: sub_98210+1582j
					; sub_98210+158Dj ...
		cmp	word ptr [bp+var_136+2], 8
		jnz	short loc_99811
		mov	word ptr [si+1Bh], 0
		cmp	[bp+var_D], 0
		jz	short loc_99811
		cmp	[bp+var_D30], 0
		jz	short loc_99811
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_99811:				; CODE XREF: sub_98210+15D8j
					; sub_98210+15E3j ...
		cmp	word ptr [bp+var_136+2], 0Ah
		jnz	short loc_99867
		mov	word ptr [si+1Bh], 1
		cmp	[bp+var_D], 0
		jz	short loc_99867
		mov	ax, word_48ECE
		mov	word ptr [bp+var_13A], ax
		mov	word ptr [bp+var_13E+2], 0
		cmp	[bp+var_D30], 0
		jz	short loc_99867
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_13E+2]
		push	word ptr [bp+var_13A]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_99867:				; CODE XREF: sub_98210+1606j
					; sub_98210+1611j ...
		cmp	word ptr [bp+var_136+2], 0Bh
		jnz	short loc_99895
		mov	word ptr [si+1Bh], 0
		cmp	[bp+var_D], 0
		jz	short loc_99895
		cmp	[bp+var_D30], 0
		jz	short loc_99895
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_99895:				; CODE XREF: sub_98210+165Cj
					; sub_98210+1667j ...
		cmp	word ptr [bp+var_136+2], 0Dh
		jnz	short loc_998EB
		mov	word ptr [si+1Bh], 1
		cmp	[bp+var_D], 0
		jz	short loc_998EB
		mov	ax, word_48ECE
		mov	word ptr [bp+var_13E], ax
		mov	[bp+var_140], 0
		cmp	[bp+var_D30], 0
		jz	short loc_998EB
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_140]
		push	word ptr [bp+var_13E]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_998EB:				; CODE XREF: sub_98210+168Aj
					; sub_98210+1695j ...
		cmp	word ptr [bp+var_136+2], 0Fh
		jnz	short loc_99919
		mov	word ptr [si+1Bh], 0
		cmp	[bp+var_D], 0
		jz	short loc_99919
		cmp	[bp+var_D30], 0
		jz	short loc_99919
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_99919:				; CODE XREF: sub_98210+16E0j
					; sub_98210+16EBj ...
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_99926:				; CODE XREF: sub_98210+1572j
		cmp	word ptr [bp+var_D35], 10h
		jnb	short loc_99934
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_99939

loc_99934:				; CODE XREF: sub_98210+171Bj
		mov	ax, 1
		jmp	short loc_9993B
; ���������������������������������������������������������������������������

loc_99939:				; CODE XREF: sub_98210+1722j
		xor	ax, ax

loc_9993B:				; CODE XREF: sub_98210+1727j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_99944
		jmp	loc_99785
; ���������������������������������������������������������������������������

loc_99944:				; CODE XREF: sub_98210+172Fj
		mov	word ptr [bp+var_D35], 0
		cmp	[bp+var_C], 0
		jnz	short loc_99953
		jmp	loc_99CC5
; ���������������������������������������������������������������������������

loc_99953:				; CODE XREF: sub_98210+173Ej
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_13E+2],	0
		mov	byte ptr [bp+var_13A+2], 2
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		push	2
		lea	ax, [bp+var_13E+2]
		push	ax
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_13E+2]
		push	ax
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_999DF
; ���������������������������������������������������������������������������

loc_999AC:				; CODE XREF: sub_98210+17D4j
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_140], ax
		mov	ax, [bp+var_140]
		mov	[si+1Bh], ax
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_999DF:				; CODE XREF: sub_98210+179Aj
		cmp	word ptr [bp+var_13E], 4
		jl	short loc_999AC
		push	0FFFFh
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_83FE
		add	sp, 4
		mov	word ptr [bp+var_13E], 0
		jmp	loc_99AF5
; ���������������������������������������������������������������������������

loc_999FE:				; CODE XREF: sub_98210+18F6j
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_144+2], ax
		mov	ax, word ptr [bp+var_144+2]
		mov	[si+1Bh], ax
		cmp	word ptr [bp+var_13E], 2
		jnz	short loc_99A71
		cmp	[bp+var_D], 0
		jz	short loc_99A71
		mov	ax, word_48ECE
		mov	word ptr [bp+var_144], ax
		mov	[bp+var_146], 0
		cmp	[bp+var_D30], 0
		jz	short loc_99A71
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_146]
		push	word ptr [bp+var_144]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_99A71:				; CODE XREF: sub_98210+1815j
					; sub_98210+181Bj ...
		cmp	word ptr [bp+var_13E], 13h
		jnz	short loc_99ABC
		push	[bp+var_12C]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_12E]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_130]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_132]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_99ABC:				; CODE XREF: sub_98210+1866j
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 0Ah
		jnz	short loc_99ADB
		mov	bx, [bp+var_130]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp+var_132]
		mov	word ptr [bx+1Bh], 1

loc_99ADB:				; CODE XREF: sub_98210+18B7j
		jmp	short loc_99AE8
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_99AE8
		jmp	short loc_99B09
; ���������������������������������������������������������������������������

loc_99AE8:				; CODE XREF: sub_98210:loc_99ADBj
					; sub_98210+18D4j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_99AF5:				; CODE XREF: sub_98210+17EBj
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_99B09
		jmp	loc_999FE
; ���������������������������������������������������������������������������

loc_99B09:				; CODE XREF: sub_98210+18D6j
					; sub_98210+18F4j
		cmp	[bp+var_D], 0
		jz	short loc_99B2B
		cmp	[bp+var_D30], 0
		jz	short loc_99B2B
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_99B2B:				; CODE XREF: sub_98210+18FDj
					; sub_98210+1904j
		mov	word ptr [si+1Bh], 0
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_99B49
; ���������������������������������������������������������������������������

loc_99B38:				; CODE XREF: sub_98210+193Ej
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_99B49:				; CODE XREF: sub_98210+1926j
		cmp	word ptr [bp+var_13E], 4
		jl	short loc_99B38
		mov	[bp+var_152+2],	0
		mov	byte ptr [bp+var_14E+2], 2
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		push	2
		lea	ax, [bp+var_152+2]
		push	ax
		push	0
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_152+2]
		push	ax
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_99BAD
; ���������������������������������������������������������������������������

loc_99B9C:				; CODE XREF: sub_98210+19A2j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_99BAD:				; CODE XREF: sub_98210+198Aj
		cmp	word ptr [bp+var_13E], 4
		jl	short loc_99B9C
		push	0FFFFh
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_99C06
; ���������������������������������������������������������������������������

loc_99BC5:				; CODE XREF: sub_98210+1A05j
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_152], ax
		mov	bx, [bp+var_132]
		mov	ax, word ptr [bp+var_152]
		mov	[bx+1Bh], ax
		jmp	short loc_99BF9
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_99BF9
		jmp	short loc_99C17
; ���������������������������������������������������������������������������

loc_99BF9:				; CODE XREF: sub_98210+19DCj
					; sub_98210+19E5j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_99C06:				; CODE XREF: sub_98210+19B3j
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_99BC5

loc_99C17:				; CODE XREF: sub_98210+19E7j
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_99C30
; ���������������������������������������������������������������������������

loc_99C1F:				; CODE XREF: sub_98210+1A25j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_99C30:				; CODE XREF: sub_98210+1A0Dj
		cmp	word ptr [bp+var_13E], 4
		jl	short loc_99C1F
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_14E+3], 0
		jz	short loc_99C6C
		cmp	[bp+var_152+2],	0
		jz	short loc_99C6C
		push	0
		mov	al, byte ptr [bp+var_14E+2]
		push	ax
		lea	ax, [bp+var_152+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99C6C:				; CODE XREF: sub_98210+1A39j
					; sub_98210+1A41j
		mov	[bp+var_152+2],	0
		mov	byte ptr [bp+var_14E+3], 0
		mov	[bp+var_14A], 0
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_99CAB
		cmp	[bp+var_13E+2],	0
		jz	short loc_99CAB
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, [bp+var_13E+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_99CAB:				; CODE XREF: sub_98210+1A78j
					; sub_98210+1A80j
		mov	[bp+var_13E+2],	0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		jmp	loc_9A383
; ���������������������������������������������������������������������������

loc_99CC5:				; CODE XREF: sub_98210+1740j
		push	23h ; '#'
		push	[bp+var_D0E]
		mov	bx, [bp+var_D0E]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], 3Eh	; '>'
		mov	ax, word ptr [bp+var_D35]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_99EBE
; ���������������������������������������������������������������������������

loc_99CFB:				; CODE XREF: sub_98210+1CC8j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_136+2], ax
		mov	ax, [bp+var_4]
		add	ax, 0Ah
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_99D6E
		cmp	[bp+var_D], 0
		jz	short loc_99D59
		mov	ax, word_48ECE
		mov	word ptr [bp+var_136], ax
		mov	word ptr [bp+var_13A+2], 0
		cmp	[bp+var_D30], 0
		jz	short loc_99D59
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		push	word ptr [bp+var_136]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_99D59:				; CODE XREF: sub_98210+1B03j
					; sub_98210+1B17j
		push	[bp+var_8]
		lea	ax, [bp+var_D22]
		push	ax
		call	sub_C8F5
		add	sp, 4
		mov	word ptr [si+1Bh], 1

loc_99D6E:				; CODE XREF: sub_98210+1AFDj
		mov	ax, [bp+var_4]
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_99DBE
		push	[bp+var_12C]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_12E]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_130]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_132]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_99DBE:				; CODE XREF: sub_98210+1B68j
		mov	ax, [bp+var_4]
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_99DDC
		mov	bx, [bp+var_130]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp+var_132]
		mov	word ptr [bx+1Bh], 1

loc_99DDC:				; CODE XREF: sub_98210+1BB8j
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_136+2]
		jge	short loc_99DEC
		mov	word ptr [si+1Bh], 0

loc_99DEC:				; CODE XREF: sub_98210+1BD5j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_99E17
		cmp	[bp+var_D], 0
		jz	short loc_99E17
		cmp	[bp+var_D30], 0
		jz	short loc_99E17
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_99E17:				; CODE XREF: sub_98210+1BE3j
					; sub_98210+1BE9j ...
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_99E62
		mov	[bp+var_D5E], 11BCh
		mov	[bp+var_D5E], 11C8h
		mov	[bp+var_D5E], 11D8h
		mov	[bp+var_D5E], 11E8h
		mov	[bp+var_D5E], 11FCh
		lea	ax, [bp+var_D20]
		push	ax
		push	0
		push	[bp+var_D03]
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		lea	ax, [bp+var_D5E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_99E62:				; CODE XREF: sub_98210+1C0Ej
		jmp	short loc_99EB1
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_99EB1
		mov	word ptr [bp-0D6Ah], 11BCh
		mov	word ptr [bp-0D6Ah], 11C8h
		mov	word ptr [bp-0D6Ah], 11D8h
		mov	word ptr [bp-0D6Ah], 11E8h
		mov	word ptr [bp-0D6Ah], 11FCh
		lea	ax, [bp-0D20h]
		push	ax
		push	0
		push	word ptr [bp-0D03h]
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		lea	ax, [bp-0D6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_99EDB
; ���������������������������������������������������������������������������

loc_99EB1:				; CODE XREF: sub_98210:loc_99E62j
					; sub_98210+1C5Bj
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_99EBE:				; CODE XREF: sub_98210+1AE8j
		cmp	word ptr [bp+var_D35], di
		jnb	short loc_99ECB
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_99ED0

loc_99ECB:				; CODE XREF: sub_98210+1CB2j
		mov	ax, 1
		jmp	short loc_99ED2
; ���������������������������������������������������������������������������

loc_99ED0:				; CODE XREF: sub_98210+1CB9j
		xor	ax, ax

loc_99ED2:				; CODE XREF: sub_98210+1CBEj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_99EDB
		jmp	loc_99CFB
; ���������������������������������������������������������������������������

loc_99EDB:				; CODE XREF: sub_98210+1C9Fj
					; sub_98210+1CC6j
		cmp	[bp+var_12C], 0
		jz	short loc_99EF5
		push	3
		push	[bp+var_12C]
		mov	bx, [bp+var_12C]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_99EF5:				; CODE XREF: sub_98210+1CD0j
		cmp	[bp+var_12E], 0
		jz	short loc_99F0F
		push	3
		push	[bp+var_12E]
		mov	bx, [bp+var_12E]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_99F0F:				; CODE XREF: sub_98210+1CEAj
		mov	word ptr [si+1Bh], 1
		mov	[bp+var_6], 42h	; 'B'
		mov	ax, word ptr [bp+var_D35]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_9A098
; ���������������������������������������������������������������������������

loc_99F38:				; CODE XREF: sub_98210+1EA2j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_136+2], ax
		mov	ax, [bp+var_4]
		inc	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_99F94
		cmp	[bp+var_D], 0
		jz	short loc_99F94
		mov	ax, word_48ECE
		mov	word ptr [bp+var_136], ax
		mov	word ptr [bp+var_13A+2], 0
		cmp	[bp+var_D30], 0
		jz	short loc_99F94
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		push	word ptr [bp+var_136]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_99F94:				; CODE XREF: sub_98210+1D38j
					; sub_98210+1D3Ej ...
		mov	ax, [bp+var_4]
		add	ax, 2
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_99FB4
		mov	ax, [bp+var_8]
		add	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_D22]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_99FB4:				; CODE XREF: sub_98210+1D8Ej
		mov	ax, di
		add	ax, 0FFFDh
		cmp	ax, word ptr [bp+var_136+2]
		jge	short loc_99FC4
		mov	word ptr [si+1Bh], 0

loc_99FC4:				; CODE XREF: sub_98210+1DADj
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_9A011
		mov	[bp+var_D5E], 11BCh
		mov	[bp+var_D5E], 11C8h
		mov	[bp+var_D5E], 11D8h
		mov	[bp+var_D5E], 11E8h
		mov	[bp+var_D5E], 11FCh
		lea	ax, [bp+var_D20]
		push	ax
		push	0
		push	[bp+var_D03]
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		lea	ax, [bp+var_D5E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9A011:				; CODE XREF: sub_98210+1DBDj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_9A03C
		cmp	[bp+var_D], 0
		jz	short loc_9A03C
		cmp	[bp+var_D30], 0
		jz	short loc_9A03C
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_9A03C:				; CODE XREF: sub_98210+1E08j
					; sub_98210+1E0Ej ...
		jmp	short loc_9A08B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9A08B
		mov	word ptr [bp-0D6Ah], 11BCh
		mov	word ptr [bp-0D6Ah], 11C8h
		mov	word ptr [bp-0D6Ah], 11D8h
		mov	word ptr [bp-0D6Ah], 11E8h
		mov	word ptr [bp-0D6Ah], 11FCh
		lea	ax, [bp-0D20h]
		push	ax
		push	0
		push	word ptr [bp-0D03h]
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		lea	ax, [bp-0D6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9A0B5
; ���������������������������������������������������������������������������

loc_9A08B:				; CODE XREF: sub_98210:loc_9A03Cj
					; sub_98210+1E35j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9A098:				; CODE XREF: sub_98210+1D25j
		cmp	word ptr [bp+var_D35], di
		jnb	short loc_9A0A5
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_9A0AA

loc_9A0A5:				; CODE XREF: sub_98210+1E8Cj
		mov	ax, 1
		jmp	short loc_9A0AC
; ���������������������������������������������������������������������������

loc_9A0AA:				; CODE XREF: sub_98210+1E93j
		xor	ax, ax

loc_9A0AC:				; CODE XREF: sub_98210+1E98j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9A0B5
		jmp	loc_99F38
; ���������������������������������������������������������������������������

loc_9A0B5:				; CODE XREF: sub_98210+1E79j
					; sub_98210+1EA0j
		push	0Fh
		push	[bp+var_D0E]
		mov	bx, [bp+var_D0E]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], 23h	; '#'
		mov	ax, word ptr [bp+var_D35]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_9A206
; ���������������������������������������������������������������������������

loc_9A0EB:				; CODE XREF: sub_98210+2010j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_136+2], ax
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_136+2]
		jge	short loc_9A126
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_136], ax
		mov	bx, [bp+var_132]
		mov	ax, word ptr [bp+var_136]
		mov	[bx+1Bh], ax

loc_9A126:				; CODE XREF: sub_98210+1EEDj
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_9A14B
		mov	ax, [bp+var_A]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D22]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9A14B:				; CODE XREF: sub_98210+1F20j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_9A196
		mov	[bp+var_D5E], 11BCh
		mov	[bp+var_D5E], 11C8h
		mov	[bp+var_D5E], 11D8h
		mov	[bp+var_D5E], 11E8h
		mov	[bp+var_D5E], 11FCh
		lea	ax, [bp+var_D20]
		push	ax
		push	0
		push	[bp+var_D03]
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		lea	ax, [bp+var_D5E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9A196:				; CODE XREF: sub_98210+1F42j
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_136+2]
		jge	short loc_9A1AA
		mov	bx, [bp+var_132]
		mov	word ptr [bx+1Bh], 1

loc_9A1AA:				; CODE XREF: sub_98210+1F8Fj
		jmp	short loc_9A1F9
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9A1F9
		mov	word ptr [bp-0D6Ah], 11BCh
		mov	word ptr [bp-0D6Ah], 11C8h
		mov	word ptr [bp-0D6Ah], 11D8h
		mov	word ptr [bp-0D6Ah], 11E8h
		mov	word ptr [bp-0D6Ah], 11FCh
		lea	ax, [bp-0D20h]
		push	ax
		push	0
		push	word ptr [bp-0D03h]
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		lea	ax, [bp-0D6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9A223
; ���������������������������������������������������������������������������

loc_9A1F9:				; CODE XREF: sub_98210:loc_9A1AAj
					; sub_98210+1FA3j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9A206:				; CODE XREF: sub_98210+1ED8j
		cmp	word ptr [bp+var_D35], di
		jnb	short loc_9A213
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_9A218

loc_9A213:				; CODE XREF: sub_98210+1FFAj
		mov	ax, 1
		jmp	short loc_9A21A
; ���������������������������������������������������������������������������

loc_9A218:				; CODE XREF: sub_98210+2001j
		xor	ax, ax

loc_9A21A:				; CODE XREF: sub_98210+2006j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9A223
		jmp	loc_9A0EB
; ���������������������������������������������������������������������������

loc_9A223:				; CODE XREF: sub_98210+1FE7j
					; sub_98210+200Ej
		mov	[bp+var_6], 26h	; '&'
		mov	ax, word ptr [bp+var_D35]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_9A366
; ���������������������������������������������������������������������������

loc_9A247:				; CODE XREF: sub_98210+2170j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_136+2], ax
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_136+2]
		jge	short loc_9A282
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_136], ax
		mov	bx, [bp+var_132]
		mov	ax, word ptr [bp+var_136]
		mov	[bx+1Bh], ax

loc_9A282:				; CODE XREF: sub_98210+2049j
		mov	ax, [bp+var_4]
		add	ax, 6
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_9A2A9
		mov	ax, [bp+var_A]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D22]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9A2A9:				; CODE XREF: sub_98210+207Cj
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, word ptr [bp+var_136+2]
		jge	short loc_9A2BD
		mov	bx, [bp+var_132]
		mov	word ptr [bx+1Bh], 1

loc_9A2BD:				; CODE XREF: sub_98210+20A2j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_9A30A
		mov	[bp+var_D5E], 11BCh
		mov	[bp+var_D5E], 11C8h
		mov	[bp+var_D5E], 11D8h
		mov	[bp+var_D5E], 11E8h
		mov	[bp+var_D5E], 11FCh
		lea	ax, [bp+var_D20]
		push	ax
		push	0
		push	[bp+var_D03]
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		lea	ax, [bp+var_D5E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9A30A:				; CODE XREF: sub_98210+20B6j
		jmp	short loc_9A359
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9A359
		mov	word ptr [bp-0D6Ah], 11BCh
		mov	word ptr [bp-0D6Ah], 11C8h
		mov	word ptr [bp-0D6Ah], 11D8h
		mov	word ptr [bp-0D6Ah], 11E8h
		mov	word ptr [bp-0D6Ah], 11FCh
		lea	ax, [bp-0D20h]
		push	ax
		push	0
		push	word ptr [bp-0D03h]
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		lea	ax, [bp-0D6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9A383
; ���������������������������������������������������������������������������

loc_9A359:				; CODE XREF: sub_98210:loc_9A30Aj
					; sub_98210+2103j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9A366:				; CODE XREF: sub_98210+2034j
		cmp	word ptr [bp+var_D35], di
		jnb	short loc_9A373
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_9A378

loc_9A373:				; CODE XREF: sub_98210+215Aj
		mov	ax, 1
		jmp	short loc_9A37A
; ���������������������������������������������������������������������������

loc_9A378:				; CODE XREF: sub_98210+2161j
		xor	ax, ax

loc_9A37A:				; CODE XREF: sub_98210+2166j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9A383
		jmp	loc_9A247
; ���������������������������������������������������������������������������

loc_9A383:				; CODE XREF: sub_98210+1AB2j
					; sub_98210+2147j ...
		push	0
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_123], 0
		jz	short loc_9A3BA
		cmp	[bp+var_128], 0
		jz	short loc_9A3BA
		push	0
		mov	al, [bp+var_124]
		push	ax
		lea	ax, [bp+var_128]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A3BA:				; CODE XREF: sub_98210+2187j
					; sub_98210+218Fj
		mov	[bp+var_128], 0
		mov	[bp+var_123], 0
		mov	[bp+var_122], 0
		cmp	byte ptr [bp+var_11A+1], 0
		jz	short loc_9A3F9
		cmp	[bp+var_11E], 0
		jz	short loc_9A3F9
		push	0
		mov	al, byte ptr [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A3F9:				; CODE XREF: sub_98210+21C6j
					; sub_98210+21CEj
		mov	[bp+var_11E], 0
		mov	byte ptr [bp+var_11A+1], 0
		mov	[bp+var_118], 0
		cmp	byte ptr [bp+var_110+1], 0
		jz	short loc_9A438
		cmp	[bp+var_114], 0
		jz	short loc_9A438
		push	0
		mov	al, byte ptr [bp+var_110]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A438:				; CODE XREF: sub_98210+2205j
					; sub_98210+220Dj
		mov	[bp+var_114], 0
		mov	byte ptr [bp+var_110+1], 0
		mov	[bp+var_110+2],	0
		cmp	byte ptr [bp+var_108+3], 0
		jz	short loc_9A477
		cmp	[bp+var_10C+2],	0
		jz	short loc_9A477
		push	0
		mov	al, byte ptr [bp+var_108+2]
		push	ax
		lea	ax, [bp+var_10C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A477:				; CODE XREF: sub_98210+2244j
					; sub_98210+224Cj
		mov	[bp+var_10C+2],	0
		mov	byte ptr [bp+var_108+3], 0
		mov	dword ptr [bp+var_104],	0
		cmp	byte ptr [bp+var_FE+3],	0
		jz	short loc_9A4B6
		cmp	[bp+var_102+2],	0
		jz	short loc_9A4B6
		push	0
		mov	al, byte ptr [bp+var_FE+2]
		push	ax
		lea	ax, [bp+var_102+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A4B6:				; CODE XREF: sub_98210+2283j
					; sub_98210+228Bj
		mov	[bp+var_102+2],	0
		mov	byte ptr [bp+var_FE+3],	0
		mov	dword ptr [bp+var_FA], 0
		cmp	byte ptr [bp+var_F4+3],	0
		jz	short loc_9A4F5
		cmp	[bp+var_F8+2], 0
		jz	short loc_9A4F5
		push	0
		mov	al, byte ptr [bp+var_F4+2]
		push	ax
		lea	ax, [bp+var_F8+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A4F5:				; CODE XREF: sub_98210+22C2j
					; sub_98210+22CAj
		mov	[bp+var_F8+2], 0
		mov	byte ptr [bp+var_F4+3],	0
		mov	dword ptr [bp+var_F0], 0
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D27], 0
		jz	short loc_9A541
		cmp	[bp+var_D2C], 0
		jz	short loc_9A541
		push	0
		mov	al, [bp+var_D28]
		push	ax
		lea	ax, [bp+var_D2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A541:				; CODE XREF: sub_98210+230Ej
					; sub_98210+2316j
		mov	[bp+var_D2C], 0
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		cmp	[bp+var_E7], 0
		jz	short loc_9A580
		cmp	[bp+var_EC], 0
		jz	short loc_9A580
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A580:				; CODE XREF: sub_98210+234Dj
					; sub_98210+2355j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	byte_495FC, 0
		jnz	short loc_9A5A1
		jmp	loc_9AA34
; ���������������������������������������������������������������������������

loc_9A5A1:				; CODE XREF: sub_98210+238Cj
		push	2
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D1], 0
		jz	short loc_9A5D8
		cmp	[bp+var_D6], 0
		jz	short loc_9A5D8
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A5D8:				; CODE XREF: sub_98210+23A5j
					; sub_98210+23ADj
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C1], 0
		jz	short loc_9A626
		cmp	[bp+var_C6], 0
		jz	short loc_9A626
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A626:				; CODE XREF: sub_98210+23F3j
					; sub_98210+23FBj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B1], 0
		jz	short loc_9A674
		cmp	[bp+var_B6], 0
		jz	short loc_9A674
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A674:				; CODE XREF: sub_98210+2441j
					; sub_98210+2449j
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_9A6C2
		cmp	[bp+var_A6], 0
		jz	short loc_9A6C2
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A6C2:				; CODE XREF: sub_98210+248Fj
					; sub_98210+2497j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		cmp	[bp+var_97], 0
		jz	short loc_9A701
		cmp	[bp+var_9C], 0
		jz	short loc_9A701
		push	0
		mov	al, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A701:				; CODE XREF: sub_98210+24CEj
					; sub_98210+24D6j
		mov	[bp+var_9C], 0
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		cmp	[bp+var_8D], 0
		jz	short loc_9A740
		cmp	[bp+var_92], 0
		jz	short loc_9A740
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A740:				; CODE XREF: sub_98210+250Dj
					; sub_98210+2515j
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_9A77F
		cmp	[bp+var_88], 0
		jz	short loc_9A77F
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A77F:				; CODE XREF: sub_98210+254Cj
					; sub_98210+2554j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_9A7D6
		cmp	[bp+var_6A], 0
		jz	short loc_9A7D6
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A7D6:				; CODE XREF: sub_98210+25A6j
					; sub_98210+25ADj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_9A81C
		cmp	[bp+var_5A], 0
		jz	short loc_9A81C
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A81C:				; CODE XREF: sub_98210+25ECj
					; sub_98210+25F3j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_45], 0
		jz	short loc_9A862
		cmp	[bp+var_4A], 0
		jz	short loc_9A862
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A862:				; CODE XREF: sub_98210+2632j
					; sub_98210+2639j
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_9A8A8
		cmp	[bp+var_3A], 0
		jz	short loc_9A8A8
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A8A8:				; CODE XREF: sub_98210+2678j
					; sub_98210+267Fj
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CE8], 185Fh
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD3], 0
		jz	short loc_9A8F7
		cmp	[bp+var_CD8], 0
		jz	short loc_9A8F7
		push	0
		mov	al, [bp+var_CD4]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A8F7:				; CODE XREF: sub_98210+26C4j
					; sub_98210+26CCj
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		lea	ax, [bp+var_4C2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4B9], 0
		jz	short loc_9A943
		cmp	[bp+var_4BE], 0
		jz	short loc_9A943
		push	0
		mov	al, [bp+var_4BA]
		push	ax
		lea	ax, [bp+var_4BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A943:				; CODE XREF: sub_98210+2710j
					; sub_98210+2718j
		mov	[bp+var_4BE], 0
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9A98D
		cmp	[bp+var_28], 0
		jz	short loc_9A98D
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9A98D:				; CODE XREF: sub_98210+275Dj
					; sub_98210+2764j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25C]
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
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
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

loc_9AA34:				; CODE XREF: sub_98210+238Ej
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		mov	[bp+var_D2C], 0
		mov	[bp+var_D28], 2
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		mov	[bp+var_D30], 0
		mov	[bp+var_D2E], 0FFFFh
		cmp	[bp+var_D], 0
		jz	short loc_9AAB9
		push	3
		lea	ax, [bp+var_EC+2]
		push	ax
		push	16h
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_EC+2]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_9AAB9:				; CODE XREF: sub_98210+286Cj
		mov	[bp+var_F4], 0
		mov	[bp+var_F0], 2
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		push	3
		lea	ax, [bp+var_F4]
		push	ax
		push	12h
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	14h
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_F4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	si, ax
		push	si
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	[bp+var_CC]
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_DC]
		mov	al, [bp+var_DA]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0E0h ; '�'
		push	[bp+var_D0E]
		mov	bx, [bp+var_D0E]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	word ptr [si+1Bh], 0
		mov	word ptr [bp+var_F8+2],	0
		push	0
		call	sub_85A
		add	sp, 2
		push	ax
		call	sub_6F2
		add	sp, 2
		mov	word ptr [bp+var_F8], 4
		cmp	[bp+var_C], 0
		jnz	short loc_9ABBE
		jmp	loc_9ADB2
; ���������������������������������������������������������������������������

loc_9ABBE:				; CODE XREF: sub_98210+29A9j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_FE], 2
		mov	byte ptr [bp+var_FE+1],	0
		mov	[bp+var_FE+2], 0
		push	2
		lea	ax, [bp+var_102]
		push	ax
		push	3
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_102]
		push	ax
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	[bp+var_104], 0
		jmp	short loc_9AC4E
; ���������������������������������������������������������������������������

loc_9AC17:				; CODE XREF: sub_98210+2A43j
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_108+2], ax
		mov	ax, word ptr [bp+var_108+2]
		mov	[si+1Bh], ax
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_104]

loc_9AC4E:				; CODE XREF: sub_98210+2A05j
		cmp	[bp+var_104], 4
		jl	short loc_9AC17
		cmp	[bp+var_D], 0
		jz	short loc_9AC9F
		mov	ax, word_48EC2
		mov	word ptr [bp+var_108], ax
		mov	word ptr [bp+var_10C+2], 0
		cmp	[bp+var_D30], 0
		jz	short loc_9AC9F
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_10C+2]
		push	word ptr [bp+var_108]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9AC9F:				; CODE XREF: sub_98210+2A49j
					; sub_98210+2A5Dj
		push	0FFFFh
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_9ACF0
; ���������������������������������������������������������������������������

loc_9ACB0:				; CODE XREF: sub_98210+2AEFj
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_10C], ax
		mov	ax, word ptr [bp+var_10C]
		mov	[si+1Bh], ax
		jmp	short loc_9ACE3
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9ACE3
		jmp	short loc_9AD01
; ���������������������������������������������������������������������������

loc_9ACE3:				; CODE XREF: sub_98210+2AC6j
					; sub_98210+2ACFj
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9ACF0:				; CODE XREF: sub_98210+2A9Ej
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_9ACB0

loc_9AD01:				; CODE XREF: sub_98210+2AD1j
		cmp	[bp+var_D], 0
		jz	short loc_9AD23
		cmp	[bp+var_D30], 0
		jz	short loc_9AD23
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_9AD23:				; CODE XREF: sub_98210+2AF5j
					; sub_98210+2AFCj
		mov	[bp+var_104], 0
		jmp	short loc_9AD5C
; ���������������������������������������������������������������������������

loc_9AD2B:				; CODE XREF: sub_98210+2B51j
		cmp	word ptr [bp+var_F8], 1
		jge	short loc_9AD38
		mov	word ptr [bp+var_F8], 1

loc_9AD38:				; CODE XREF: sub_98210+2B20j
		mov	ax, word ptr [bp+var_F8]
		mov	word ptr [bp+var_110+2], ax
		dec	word ptr [bp+var_F8]
		mov	ax, word ptr [bp+var_110+2]
		mov	[si+1Bh], ax
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_104]

loc_9AD5C:				; CODE XREF: sub_98210+2B19j
		cmp	[bp+var_104], 5
		jl	short loc_9AD2B
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_FE+1],	0
		jz	short loc_9AD98
		cmp	[bp+var_102], 0
		jz	short loc_9AD98
		push	0
		mov	al, byte ptr [bp+var_FE]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9AD98:				; CODE XREF: sub_98210+2B65j
					; sub_98210+2B6Dj
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_FE+1],	0
		mov	[bp+var_FE+2], 0
		jmp	loc_9B19A
; ���������������������������������������������������������������������������

loc_9ADB2:				; CODE XREF: sub_98210+29ABj
		mov	[bp+var_6], 46h	; 'F'
		mov	ax, word ptr [bp+var_D35]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_9AF8A
; ���������������������������������������������������������������������������

loc_9ADD6:				; CODE XREF: sub_98210+2D94j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_FA], ax
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_FA]
		jle	short loc_9AE19
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_F8+2],	ax
		mov	ax, word ptr [bp+var_F8+2]
		mov	word ptr [bp+var_FE+2],	ax
		mov	ax, word ptr [bp+var_FE+2]
		mov	[si+1Bh], ax
		jmp	short loc_9AE3B
; ���������������������������������������������������������������������������

loc_9AE19:				; CODE XREF: sub_98210+2BD7j
		dec	word ptr [bp+var_F8+2]
		mov	ax, word ptr [bp+var_F8+2]
		cmp	ax, 1
		jge	short loc_9AE2C
		mov	word ptr [bp+var_F8+2],	1

loc_9AE2C:				; CODE XREF: sub_98210+2C14j
		mov	ax, word ptr [bp+var_F8+2]
		mov	word ptr [bp+var_FE], ax
		mov	ax, word ptr [bp+var_FE]
		mov	[si+1Bh], ax

loc_9AE3B:				; CODE XREF: sub_98210+2C07j
		mov	ax, [bp+var_4]
		inc	ax
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9AE8F
		cmp	[bp+var_D], 0
		jz	short loc_9AE8F
		mov	ax, word_48ECE
		mov	word ptr [bp+var_102+2], ax
		mov	word ptr [bp+var_102], 0
		cmp	[bp+var_D30], 0
		jz	short loc_9AE8F
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_102]
		push	word ptr [bp+var_102+2]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9AE8F:				; CODE XREF: sub_98210+2C33j
					; sub_98210+2C39j ...
		mov	ax, [bp+var_4]
		add	ax, 2
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9AEB6
		mov	ax, [bp+var_A]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D22]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9AEB6:				; CODE XREF: sub_98210+2C89j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9AF03
		mov	[bp+var_D5E], 11BCh
		mov	[bp+var_D5E], 11C8h
		mov	[bp+var_D5E], 11D8h
		mov	[bp+var_D5E], 11E8h
		mov	[bp+var_D5E], 11FCh
		lea	ax, [bp+var_D20]
		push	ax
		push	0
		push	[bp+var_D03]
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		lea	ax, [bp+var_D5E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9AF03:				; CODE XREF: sub_98210+2CAFj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9AF2E
		cmp	[bp+var_D], 0
		jz	short loc_9AF2E
		cmp	[bp+var_D30], 0
		jz	short loc_9AF2E
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_9AF2E:				; CODE XREF: sub_98210+2CFAj
					; sub_98210+2D00j ...
		jmp	short loc_9AF7D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9AF7D
		mov	word ptr [bp-0D6Ah], 11BCh
		mov	word ptr [bp-0D6Ah], 11C8h
		mov	word ptr [bp-0D6Ah], 11D8h
		mov	word ptr [bp-0D6Ah], 11E8h
		mov	word ptr [bp-0D6Ah], 11FCh
		lea	ax, [bp-0D20h]
		push	ax
		push	0
		push	word ptr [bp-0D03h]
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		lea	ax, [bp-0D6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9AFA7
; ���������������������������������������������������������������������������

loc_9AF7D:				; CODE XREF: sub_98210:loc_9AF2Ej
					; sub_98210+2D27j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9AF8A:				; CODE XREF: sub_98210+2BC3j
		cmp	word ptr [bp+var_D35], di
		jnb	short loc_9AF97
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_9AF9C

loc_9AF97:				; CODE XREF: sub_98210+2D7Ej
		mov	ax, 1
		jmp	short loc_9AF9E
; ���������������������������������������������������������������������������

loc_9AF9C:				; CODE XREF: sub_98210+2D85j
		xor	ax, ax

loc_9AF9E:				; CODE XREF: sub_98210+2D8Aj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9AFA7
		jmp	loc_9ADD6
; ���������������������������������������������������������������������������

loc_9AFA7:				; CODE XREF: sub_98210+2D6Bj
					; sub_98210+2D92j
		mov	[bp+var_6], 52h	; 'R'
		mov	ax, word ptr [bp+var_D35]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_9B17D
; ���������������������������������������������������������������������������

loc_9AFCB:				; CODE XREF: sub_98210+2F87j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_FA], ax
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_FA]
		jle	short loc_9B00E
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 6
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 3
		mov	word ptr [bp+var_F8+2],	ax
		mov	ax, word ptr [bp+var_F8+2]
		mov	word ptr [bp+var_FE+2],	ax
		mov	ax, word ptr [bp+var_FE+2]
		mov	[si+1Bh], ax
		jmp	short loc_9B030
; ���������������������������������������������������������������������������

loc_9B00E:				; CODE XREF: sub_98210+2DCCj
		dec	word ptr [bp+var_F8+2]
		mov	ax, word ptr [bp+var_F8+2]
		cmp	ax, 1
		jge	short loc_9B021
		mov	word ptr [bp+var_F8+2],	1

loc_9B021:				; CODE XREF: sub_98210+2E09j
		mov	ax, word ptr [bp+var_F8+2]
		mov	word ptr [bp+var_FE], ax
		mov	ax, word ptr [bp+var_FE]
		mov	[si+1Bh], ax

loc_9B030:				; CODE XREF: sub_98210+2DFCj
		mov	ax, [bp+var_4]
		inc	ax
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9B084
		cmp	[bp+var_D], 0
		jz	short loc_9B084
		mov	ax, word_48ECE
		mov	word ptr [bp+var_102+2], ax
		mov	word ptr [bp+var_102], 0
		cmp	[bp+var_D30], 0
		jz	short loc_9B084
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_102]
		push	word ptr [bp+var_102+2]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9B084:				; CODE XREF: sub_98210+2E28j
					; sub_98210+2E2Ej ...
		mov	ax, [bp+var_4]
		add	ax, 2
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9B0A9
		mov	ax, [bp+var_A]
		shl	ax, 3
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D22]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9B0A9:				; CODE XREF: sub_98210+2E7Ej
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9B0F6
		mov	[bp+var_D5E], 11BCh
		mov	[bp+var_D5E], 11C8h
		mov	[bp+var_D5E], 11D8h
		mov	[bp+var_D5E], 11E8h
		mov	[bp+var_D5E], 11FCh
		lea	ax, [bp+var_D20]
		push	ax
		push	0
		push	[bp+var_D03]
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		lea	ax, [bp+var_D5E]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9B0F6:				; CODE XREF: sub_98210+2EA2j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_FA]
		jnz	short loc_9B121
		cmp	[bp+var_D], 0
		jz	short loc_9B121
		cmp	[bp+var_D30], 0
		jz	short loc_9B121
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_9B121:				; CODE XREF: sub_98210+2EEDj
					; sub_98210+2EF3j ...
		jmp	short loc_9B170
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9B170
		mov	word ptr [bp-0D6Ah], 11BCh
		mov	word ptr [bp-0D6Ah], 11C8h
		mov	word ptr [bp-0D6Ah], 11D8h
		mov	word ptr [bp-0D6Ah], 11E8h
		mov	word ptr [bp-0D6Ah], 11FCh
		lea	ax, [bp-0D20h]
		push	ax
		push	0
		push	word ptr [bp-0D03h]
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		lea	ax, [bp-0D6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9B19A
; ���������������������������������������������������������������������������

loc_9B170:				; CODE XREF: sub_98210:loc_9B121j
					; sub_98210+2F1Aj
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9B17D:				; CODE XREF: sub_98210+2DB8j
		cmp	word ptr [bp+var_D35], di
		jnb	short loc_9B18A
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_9B18F

loc_9B18A:				; CODE XREF: sub_98210+2F71j
		mov	ax, 1
		jmp	short loc_9B191
; ���������������������������������������������������������������������������

loc_9B18F:				; CODE XREF: sub_98210+2F78j
		xor	ax, ax

loc_9B191:				; CODE XREF: sub_98210+2F7Dj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9B19A
		jmp	loc_9AFCB
; ���������������������������������������������������������������������������

loc_9B19A:				; CODE XREF: sub_98210+2B9Fj
					; sub_98210+2F5Ej ...
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
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_EF], 0
		jz	short loc_9B1E8
		cmp	[bp+var_F4], 0
		jz	short loc_9B1E8
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B1E8:				; CODE XREF: sub_98210+2FB5j
					; sub_98210+2FBDj
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D27], 0
		jz	short loc_9B234
		cmp	[bp+var_D2C], 0
		jz	short loc_9B234
		push	0
		mov	al, [bp+var_D28]
		push	ax
		lea	ax, [bp+var_D2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B234:				; CODE XREF: sub_98210+3001j
					; sub_98210+3009j
		mov	[bp+var_D2C], 0
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_9B273
		cmp	[bp+var_EC+2], 0
		jz	short loc_9B273
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B273:				; CODE XREF: sub_98210+3040j
					; sub_98210+3048j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		cmp	byte_495FC, 0
		jnz	short loc_9B294
		jmp	loc_9B727
; ���������������������������������������������������������������������������

loc_9B294:				; CODE XREF: sub_98210+307Fj
		push	2
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D1], 0
		jz	short loc_9B2CB
		cmp	[bp+var_D6], 0
		jz	short loc_9B2CB
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B2CB:				; CODE XREF: sub_98210+3098j
					; sub_98210+30A0j
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C1], 0
		jz	short loc_9B319
		cmp	[bp+var_C6], 0
		jz	short loc_9B319
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B319:				; CODE XREF: sub_98210+30E6j
					; sub_98210+30EEj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B1], 0
		jz	short loc_9B367
		cmp	[bp+var_B6], 0
		jz	short loc_9B367
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B367:				; CODE XREF: sub_98210+3134j
					; sub_98210+313Cj
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_9B3B5
		cmp	[bp+var_A6], 0
		jz	short loc_9B3B5
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B3B5:				; CODE XREF: sub_98210+3182j
					; sub_98210+318Aj
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		cmp	[bp+var_97], 0
		jz	short loc_9B3F4
		cmp	[bp+var_9C], 0
		jz	short loc_9B3F4
		push	0
		mov	al, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B3F4:				; CODE XREF: sub_98210+31C1j
					; sub_98210+31C9j
		mov	[bp+var_9C], 0
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		cmp	[bp+var_8D], 0
		jz	short loc_9B433
		cmp	[bp+var_92], 0
		jz	short loc_9B433
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B433:				; CODE XREF: sub_98210+3200j
					; sub_98210+3208j
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_9B472
		cmp	[bp+var_88], 0
		jz	short loc_9B472
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B472:				; CODE XREF: sub_98210+323Fj
					; sub_98210+3247j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_9B4C9
		cmp	[bp+var_6A], 0
		jz	short loc_9B4C9
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B4C9:				; CODE XREF: sub_98210+3299j
					; sub_98210+32A0j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_9B50F
		cmp	[bp+var_5A], 0
		jz	short loc_9B50F
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B50F:				; CODE XREF: sub_98210+32DFj
					; sub_98210+32E6j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_45], 0
		jz	short loc_9B555
		cmp	[bp+var_4A], 0
		jz	short loc_9B555
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B555:				; CODE XREF: sub_98210+3325j
					; sub_98210+332Cj
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_9B59B
		cmp	[bp+var_3A], 0
		jz	short loc_9B59B
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B59B:				; CODE XREF: sub_98210+336Bj
					; sub_98210+3372j
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CE8], 185Fh
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD3], 0
		jz	short loc_9B5EA
		cmp	[bp+var_CD8], 0
		jz	short loc_9B5EA
		push	0
		mov	al, [bp+var_CD4]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B5EA:				; CODE XREF: sub_98210+33B7j
					; sub_98210+33BFj
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		lea	ax, [bp+var_4C2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4B9], 0
		jz	short loc_9B636
		cmp	[bp+var_4BE], 0
		jz	short loc_9B636
		push	0
		mov	al, [bp+var_4BA]
		push	ax
		lea	ax, [bp+var_4BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B636:				; CODE XREF: sub_98210+3403j
					; sub_98210+340Bj
		mov	[bp+var_4BE], 0
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9B680
		cmp	[bp+var_28], 0
		jz	short loc_9B680
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9B680:				; CODE XREF: sub_98210+3450j
					; sub_98210+3457j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25C]
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
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
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

loc_9B727:				; CODE XREF: sub_98210+3081j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		mov	[bp+var_D2C], 0
		mov	[bp+var_D28], 2
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		mov	[bp+var_D30], 0
		mov	[bp+var_D2E], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_9B774
		jmp	loc_9B7F3
; ���������������������������������������������������������������������������

loc_9B774:				; CODE XREF: sub_98210+355Fj
		push	3
		lea	ax, [bp+var_EC+2]
		push	ax
		push	7
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_EC+2]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EB0
		mov	word ptr [bp+var_EC], ax
		mov	word ptr [bp-0EEh], 0
		cmp	[bp+var_D30], 0
		jz	short loc_9B7F3
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-0EEh]
		push	word ptr [bp+var_EC]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9B7F3:				; CODE XREF: sub_98210+3561j
					; sub_98210+35B1j
		mov	dword ptr [bp-0F8h], 0
		mov	byte ptr [bp+var_F4], 2
		mov	byte ptr [bp+var_F4+1],	0
		mov	[bp+var_F4+2], 0
		push	2
		lea	ax, [bp+var_F8]
		push	ax
		push	0Ah
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_FE+3],	0
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104], 2
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		push	2
		lea	ax, [bp+var_108]
		push	ax
		push	0Bh
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_10C+1], 0
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_110+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_88]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_110], ax
		push	0
		push	0
		lea	ax, [bp+var_92]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_114+2], ax
		push	0
		push	0
		lea	ax, [bp+var_9C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_114], ax
		push	word ptr [bp+var_FE]
		mov	al, byte ptr [bp+var_FE+2]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_110+2]
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_110+2]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_110]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_114+2]
		lea	ax, [bp+var_D54+2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_114]
		lea	ax, [bp+var_D54+2]
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
		push	0
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0F8h ; '�'
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp+var_118+2], 0
		mov	si, 3
		jmp	short loc_9B9F9
; ���������������������������������������������������������������������������

loc_9B997:				; CODE XREF: sub_98210+3802j
		mov	ax, word ptr [bp+var_D35]
		mov	word ptr [bp+var_118], ax
		cmp	word ptr [bp+var_118], 33h ; '3'
		jge	short loc_9B9B8
		mov	[bp+var_11A], si
		inc	si
		mov	bx, word ptr [bp+var_114]
		mov	ax, [bp+var_11A]
		mov	[bx+1Bh], ax
		jmp	short loc_9B9DF
; ���������������������������������������������������������������������������

loc_9B9B8:				; CODE XREF: sub_98210+3794j
		mov	ax, word ptr [bp+var_118+2]
		mov	word ptr [bp+var_11E+2], ax
		inc	word ptr [bp+var_118+2]
		mov	bx, word ptr [bp+var_114+2]
		mov	ax, word ptr [bp+var_11E+2]
		mov	[bx+1Bh], ax
		mov	word ptr [bp+var_11E], si
		inc	si
		mov	bx, word ptr [bp+var_114]
		mov	ax, word ptr [bp+var_11E]
		mov	[bx+1Bh], ax

loc_9B9DF:				; CODE XREF: sub_98210+37A6j
		jmp	short loc_9B9EC
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9B9EC
		jmp	short loc_9BA14
; ���������������������������������������������������������������������������

loc_9B9EC:				; CODE XREF: sub_98210:loc_9B9DFj
					; sub_98210+37D8j
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9B9F9:				; CODE XREF: sub_98210+3785j
		cmp	word ptr [bp+var_D35], 49h ; 'I'
		jnb	short loc_9BA07
		cmp	byte ptr [bp+var_D35+2], 0
		jz	short loc_9BA0C

loc_9BA07:				; CODE XREF: sub_98210+37EEj
		mov	ax, 1
		jmp	short loc_9BA0E
; ���������������������������������������������������������������������������

loc_9BA0C:				; CODE XREF: sub_98210+37F5j
		xor	ax, ax

loc_9BA0E:				; CODE XREF: sub_98210+37FAj
		mov	ah, 0
		or	ax, ax
		jz	short loc_9B997

loc_9BA14:				; CODE XREF: sub_98210+37DAj
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		lea	ax, [bp+var_D54+2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_110+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_104+1], 0
		jz	short loc_9BA68
		cmp	[bp+var_108], 0
		jz	short loc_9BA68
		push	0
		mov	al, byte ptr [bp+var_104]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BA68:				; CODE XREF: sub_98210+3835j
					; sub_98210+383Dj
		mov	[bp+var_108], 0
		mov	byte ptr [bp+var_104+1], 0
		mov	[bp+var_102], 0
		push	2
		lea	ax, [bp+var_FE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_F4+1],	0
		jz	short loc_9BAB6
		cmp	[bp+var_F8], 0
		jz	short loc_9BAB6
		push	0
		mov	al, byte ptr [bp+var_F4]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BAB6:				; CODE XREF: sub_98210+3883j
					; sub_98210+388Bj
		mov	[bp+var_F8], 0
		mov	byte ptr [bp+var_F4+1],	0
		mov	[bp+var_F4+2], 0
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D27], 0
		jz	short loc_9BB02
		cmp	[bp+var_D2C], 0
		jz	short loc_9BB02
		push	0
		mov	al, [bp+var_D28]
		push	ax
		lea	ax, [bp+var_D2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BB02:				; CODE XREF: sub_98210+38CFj
					; sub_98210+38D7j
		mov	[bp+var_D2C], 0
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_9BB41
		cmp	[bp+var_EC+2], 0
		jz	short loc_9BB41
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BB41:				; CODE XREF: sub_98210+390Ej
					; sub_98210+3916j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		cmp	byte_495FC, 0
		jnz	short loc_9BB62
		jmp	loc_9BFF5
; ���������������������������������������������������������������������������

loc_9BB62:				; CODE XREF: sub_98210+394Dj
		push	2
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D1], 0
		jz	short loc_9BB99
		cmp	[bp+var_D6], 0
		jz	short loc_9BB99
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BB99:				; CODE XREF: sub_98210+3966j
					; sub_98210+396Ej
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C1], 0
		jz	short loc_9BBE7
		cmp	[bp+var_C6], 0
		jz	short loc_9BBE7
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BBE7:				; CODE XREF: sub_98210+39B4j
					; sub_98210+39BCj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B1], 0
		jz	short loc_9BC35
		cmp	[bp+var_B6], 0
		jz	short loc_9BC35
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BC35:				; CODE XREF: sub_98210+3A02j
					; sub_98210+3A0Aj
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_9BC83
		cmp	[bp+var_A6], 0
		jz	short loc_9BC83
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BC83:				; CODE XREF: sub_98210+3A50j
					; sub_98210+3A58j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		cmp	[bp+var_97], 0
		jz	short loc_9BCC2
		cmp	[bp+var_9C], 0
		jz	short loc_9BCC2
		push	0
		mov	al, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BCC2:				; CODE XREF: sub_98210+3A8Fj
					; sub_98210+3A97j
		mov	[bp+var_9C], 0
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		cmp	[bp+var_8D], 0
		jz	short loc_9BD01
		cmp	[bp+var_92], 0
		jz	short loc_9BD01
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BD01:				; CODE XREF: sub_98210+3ACEj
					; sub_98210+3AD6j
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_9BD40
		cmp	[bp+var_88], 0
		jz	short loc_9BD40
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BD40:				; CODE XREF: sub_98210+3B0Dj
					; sub_98210+3B15j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_9BD97
		cmp	[bp+var_6A], 0
		jz	short loc_9BD97
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BD97:				; CODE XREF: sub_98210+3B67j
					; sub_98210+3B6Ej
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_9BDDD
		cmp	[bp+var_5A], 0
		jz	short loc_9BDDD
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BDDD:				; CODE XREF: sub_98210+3BADj
					; sub_98210+3BB4j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_45], 0
		jz	short loc_9BE23
		cmp	[bp+var_4A], 0
		jz	short loc_9BE23
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BE23:				; CODE XREF: sub_98210+3BF3j
					; sub_98210+3BFAj
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_9BE69
		cmp	[bp+var_3A], 0
		jz	short loc_9BE69
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BE69:				; CODE XREF: sub_98210+3C39j
					; sub_98210+3C40j
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CE8], 185Fh
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD3], 0
		jz	short loc_9BEB8
		cmp	[bp+var_CD8], 0
		jz	short loc_9BEB8
		push	0
		mov	al, [bp+var_CD4]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BEB8:				; CODE XREF: sub_98210+3C85j
					; sub_98210+3C8Dj
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		lea	ax, [bp+var_4C2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4B9], 0
		jz	short loc_9BF04
		cmp	[bp+var_4BE], 0
		jz	short loc_9BF04
		push	0
		mov	al, [bp+var_4BA]
		push	ax
		lea	ax, [bp+var_4BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BF04:				; CODE XREF: sub_98210+3CD1j
					; sub_98210+3CD9j
		mov	[bp+var_4BE], 0
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9BF4E
		cmp	[bp+var_28], 0
		jz	short loc_9BF4E
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9BF4E:				; CODE XREF: sub_98210+3D1Ej
					; sub_98210+3D25j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25C]
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
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
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

loc_9BFF5:				; CODE XREF: sub_98210+394Fj
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		mov	[bp+var_F4], 0
		mov	[bp+var_F0], 2
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		mov	[bp+var_D2C], 0
		mov	[bp+var_D28], 2
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		mov	[bp+var_D30], 0
		mov	[bp+var_D2E], 0FFFFh
		mov	[bp+var_D3A], 0
		mov	[bp+var_D36], 2
		mov	byte ptr [bp+var_D35], 0
		mov	[bp+var_D35+1],	0
		mov	[bp+var_D3E], 0
		mov	[bp+var_D3C], 0FFFFh
		cmp	[bp+var_D], 0
		jnz	short loc_9C086
		jmp	loc_9C105
; ���������������������������������������������������������������������������

loc_9C086:				; CODE XREF: sub_98210+3E71j
		push	3
		lea	ax, [bp+var_EC+2]
		push	ax
		push	5Dh ; ']'
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_EC+2]
		push	ax
		lea	ax, [bp+var_D30]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F5C
		mov	word ptr [bp+var_F8+2],	ax
		mov	word ptr [bp+var_F8], 0
		cmp	[bp+var_D30], 0
		jz	short loc_9C105
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_F8]
		push	word ptr [bp+var_F8+2]
		push	[bp+var_D2E]
		mov	bx, [bp+var_D30]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9C105:				; CODE XREF: sub_98210+3E73j
					; sub_98210+3EC3j
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_FE], 2
		mov	byte ptr [bp+var_FE+1],	0
		mov	[bp+var_FE+2], 0
		push	3
		lea	ax, [bp+var_102]
		push	ax
		push	1
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_10C], 0
		mov	byte ptr [bp+var_108], 2
		mov	byte ptr [bp+var_108+1], 0
		mov	[bp+var_108+2],	0
		push	3
		lea	ax, [bp+var_10C]
		push	ax
		push	5
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_118+2],	0
		mov	byte ptr [bp+var_114+2], 2
		mov	byte ptr [bp+var_114+3], 0
		mov	[bp+var_110], 0
		push	2
		lea	ax, [bp+var_118+2]
		push	ax
		push	2Fh ; '/'
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11A+1],	0
		lea	ax, [bp+var_118+2]
		push	ax
		lea	ax, [bp+var_11E+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_128+2],	0
		mov	byte ptr [bp+var_122], 2
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_122+2],	0
		push	2
		lea	ax, [bp+var_128+2]
		push	ax
		push	8
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_12A+1],	0
		lea	ax, [bp+var_128+2]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_102]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_12E], ax
		push	0
		push	0
		lea	ax, [bp+var_10C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_130], ax
		push	[bp+var_12C]
		mov	al, byte ptr [bp+var_12A]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_11E+2]
		mov	al, byte ptr [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E+2]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_12E]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_130]
		lea	ax, [bp+var_D60]
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
		push	0
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136], 2
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_136+2],	0
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	30h ; '0'
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140], 2
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		push	3
		lea	ax, [bp+var_144]
		push	ax
		push	31h ; '1'
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_14A+2],	0
		push	3
		lea	ax, [bp+var_14E]
		push	ax
		push	7
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_158], 0
		mov	[bp+var_154], 2
		mov	[bp+var_153], 0
		mov	[bp+var_152], 0
		push	3
		lea	ax, [bp+var_158]
		push	ax
		push	6
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_15A], ax
		push	0
		push	0
		lea	ax, [bp+var_144]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_15C], ax
		push	0
		push	0
		lea	ax, [bp+var_14E]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_15E], ax
		push	0
		push	0
		lea	ax, [bp+var_158]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_160], ax
		push	[bp+var_130]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_15A]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_15E]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_130]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	si, si
		mov	[bp+var_162], 0
		mov	[bp+var_D43], 0
		jmp	loc_9C6BB
; ���������������������������������������������������������������������������

loc_9C45F:				; CODE XREF: sub_98210+44C6j
		mov	ax, [bp+var_D43]
		mov	[bp+var_164], ax
		cmp	[bp+var_164], 14h
		jnz	short loc_9C47D
		push	0Dh
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_9C47D:				; CODE XREF: sub_98210+425Cj
		cmp	[bp+var_164], 1Eh
		jnz	short loc_9C493
		push	0Bh
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_9C493:				; CODE XREF: sub_98210+4272j
		cmp	[bp+var_164], 28h ; '('
		jnz	short loc_9C4A9
		push	9
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_9C4A9:				; CODE XREF: sub_98210+4288j
		cmp	[bp+var_164], 32h ; '2'
		jnz	short loc_9C4BF
		push	7
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_9C4BF:				; CODE XREF: sub_98210+429Ej
		cmp	[bp+var_164], 1Eh
		jge	short loc_9C4F0
		mov	[bp+var_166], si
		inc	si
		mov	bx, [bp+var_15A]
		mov	ax, [bp+var_166]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_162]
		mov	[bp+var_168], ax
		inc	[bp+var_162]
		mov	bx, [bp+var_15E]
		mov	ax, [bp+var_168]
		mov	[bx+1Bh], ax
		jmp	loc_9C6A1
; ���������������������������������������������������������������������������

loc_9C4F0:				; CODE XREF: sub_98210+42B4j
		cmp	[bp+var_164], 1Eh
		jz	short loc_9C4FA
		jmp	loc_9C584
; ���������������������������������������������������������������������������

loc_9C4FA:				; CODE XREF: sub_98210+42E5j
		xor	si, si
		push	[bp+var_15A]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	[bp+var_15A], 0
		jz	short loc_9C527
		push	3
		push	[bp+var_15A]
		mov	bx, [bp+var_15A]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_9C527:				; CODE XREF: sub_98210+4302j
		push	[bp+var_130]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	[bp+var_15C]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_130]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_16A], si
		inc	si
		mov	bx, [bp+var_15C]
		mov	ax, [bp+var_16A]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_162]
		mov	[bp+var_16C], ax
		inc	[bp+var_162]
		mov	bx, [bp+var_15E]
		mov	ax, [bp+var_16C]
		mov	[bx+1Bh], ax
		jmp	loc_9C6A1
; ���������������������������������������������������������������������������

loc_9C584:				; CODE XREF: sub_98210+42E7j
		cmp	[bp+var_164], 1Eh
		jle	short loc_9C5BC
		cmp	[bp+var_164], 32h ; '2'
		jge	short loc_9C5BC
		mov	[bp+var_16E], si
		inc	si
		mov	bx, [bp+var_15C]
		mov	ax, [bp+var_16E]
		mov	[bx+1Bh], ax
		mov	ax, [bp+var_162]
		mov	[bp+var_170], ax
		inc	[bp+var_162]
		mov	bx, [bp+var_15E]
		mov	ax, [bp+var_170]
		mov	[bx+1Bh], ax
		jmp	loc_9C6A1
; ���������������������������������������������������������������������������

loc_9C5BC:				; CODE XREF: sub_98210+4379j
					; sub_98210+4380j
		cmp	[bp+var_164], 32h ; '2'
		jz	short loc_9C5C6
		jmp	loc_9C682
; ���������������������������������������������������������������������������

loc_9C5C6:				; CODE XREF: sub_98210+43B1j
		cmp	[bp+var_D], 0
		jnz	short loc_9C5CF
		jmp	loc_9C64E
; ���������������������������������������������������������������������������

loc_9C5CF:				; CODE XREF: sub_98210+43BAj
		push	3
		lea	ax, [bp+var_F4]
		push	ax
		push	14h
		lea	ax, [bp+var_4B4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_D3E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_F4]
		push	ax
		lea	ax, [bp+var_D3E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ECA
		mov	[bp+var_172], ax
		mov	[bp+var_174], 0
		cmp	[bp+var_D3E], 0
		jz	short loc_9C64E
		push	[bp+var_D3C]
		mov	bx, [bp+var_D3E]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_174]
		push	[bp+var_172]
		push	[bp+var_D3C]
		mov	bx, [bp+var_D3E]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_9C64E:				; CODE XREF: sub_98210+43BCj
					; sub_98210+440Cj
		xor	si, si
		push	0Fh
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4
		push	[bp+var_160]
		lea	ax, [bp+var_D60]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_176], si
		inc	si
		mov	bx, [bp+var_160]
		mov	ax, [bp+var_176]
		mov	[bx+1Bh], ax
		jmp	short loc_9C6A1
; ���������������������������������������������������������������������������

loc_9C682:				; CODE XREF: sub_98210+43B3j
		cmp	[bp+var_164], 42h ; 'B'
		jge	short loc_9C6A1
		test	[bp+var_164], 1
		jz	short loc_9C6A1
		mov	[bp+var_178], si
		inc	si
		mov	bx, [bp+var_160]
		mov	ax, [bp+var_178]
		mov	[bx+1Bh], ax

loc_9C6A1:				; CODE XREF: sub_98210+42DDj
					; sub_98210+4371j ...
		jmp	short loc_9C6AE
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9C6AE
		jmp	short loc_9C6D9
; ���������������������������������������������������������������������������

loc_9C6AE:				; CODE XREF: sub_98210:loc_9C6A1j
					; sub_98210+449Aj
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9C6BB:				; CODE XREF: sub_98210+424Cj
		cmp	[bp+var_D43], 53h ; 'S'
		jnb	short loc_9C6C9
		cmp	[bp+var_D41], 0
		jz	short loc_9C6CE

loc_9C6C9:				; CODE XREF: sub_98210+44B0j
		mov	ax, 1
		jmp	short loc_9C6D0
; ���������������������������������������������������������������������������

loc_9C6CE:				; CODE XREF: sub_98210+44B7j
		xor	ax, ax

loc_9C6D0:				; CODE XREF: sub_98210+44BCj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9C6D9
		jmp	loc_9C45F
; ���������������������������������������������������������������������������

loc_9C6D9:				; CODE XREF: sub_98210+449Cj
					; sub_98210+44C4j
		cmp	[bp+var_153], 0
		jz	short loc_9C701
		cmp	[bp+var_158], 0
		jz	short loc_9C701
		push	0
		mov	al, [bp+var_154]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C701:				; CODE XREF: sub_98210+44CEj
					; sub_98210+44D6j
		mov	[bp+var_158], 0
		mov	[bp+var_153], 0
		mov	[bp+var_152], 0
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_9C740
		cmp	[bp+var_14E], 0
		jz	short loc_9C740
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C740:				; CODE XREF: sub_98210+450Dj
					; sub_98210+4515j
		mov	[bp+var_14E], 0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_14A+2],	0
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_9C77F
		cmp	[bp+var_144], 0
		jz	short loc_9C77F
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C77F:				; CODE XREF: sub_98210+454Cj
					; sub_98210+4554j
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		cmp	byte ptr [bp+var_136+1], 0
		jz	short loc_9C7BE
		cmp	[bp+var_13A], 0
		jz	short loc_9C7BE
		push	0
		mov	al, byte ptr [bp+var_136]
		push	ax
		lea	ax, [bp+var_13A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C7BE:				; CODE XREF: sub_98210+458Bj
					; sub_98210+4593j
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_136+2],	0
		push	0
		lea	ax, [bp+var_D60]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_12C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_122+1], 0
		jz	short loc_9C81B
		cmp	[bp+var_128+2],	0
		jz	short loc_9C81B
		push	0
		mov	al, byte ptr [bp+var_122]
		push	ax
		lea	ax, [bp+var_128+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C81B:				; CODE XREF: sub_98210+45E8j
					; sub_98210+45F0j
		mov	[bp+var_128+2],	0
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_122+2],	0
		push	2
		lea	ax, [bp+var_11E+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_114+3], 0
		jz	short loc_9C869
		cmp	[bp+var_118+2],	0
		jz	short loc_9C869
		push	0
		mov	al, byte ptr [bp+var_114+2]
		push	ax
		lea	ax, [bp+var_118+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C869:				; CODE XREF: sub_98210+4636j
					; sub_98210+463Ej
		mov	[bp+var_118+2],	0
		mov	byte ptr [bp+var_114+3], 0
		mov	[bp+var_110], 0
		cmp	byte ptr [bp+var_108+1], 0
		jz	short loc_9C8A8
		cmp	[bp+var_10C], 0
		jz	short loc_9C8A8
		push	0
		mov	al, byte ptr [bp+var_108]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C8A8:				; CODE XREF: sub_98210+4675j
					; sub_98210+467Dj
		mov	[bp+var_10C], 0
		mov	byte ptr [bp+var_108+1], 0
		mov	[bp+var_108+2],	0
		cmp	byte ptr [bp+var_FE+1],	0
		jz	short loc_9C8E7
		cmp	[bp+var_102], 0
		jz	short loc_9C8E7
		push	0
		mov	al, byte ptr [bp+var_FE]
		push	ax
		lea	ax, [bp+var_102]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C8E7:				; CODE XREF: sub_98210+46B4j
					; sub_98210+46BCj
		mov	[bp+var_102], 0
		mov	byte ptr [bp+var_FE+1],	0
		mov	[bp+var_FE+2], 0
		lea	ax, [bp+var_D3E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D35], 0
		jz	short loc_9C933
		cmp	[bp+var_D3A], 0
		jz	short loc_9C933
		push	0
		mov	al, [bp+var_D36]
		push	ax
		lea	ax, [bp+var_D3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C933:				; CODE XREF: sub_98210+4700j
					; sub_98210+4708j
		mov	[bp+var_D3A], 0
		mov	byte ptr [bp+var_D35], 0
		mov	[bp+var_D35+1],	0
		lea	ax, [bp+var_D30]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_D27], 0
		jz	short loc_9C97F
		cmp	[bp+var_D2C], 0
		jz	short loc_9C97F
		push	0
		mov	al, [bp+var_D28]
		push	ax
		lea	ax, [bp+var_D2C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C97F:				; CODE XREF: sub_98210+474Cj
					; sub_98210+4754j
		mov	[bp+var_D2C], 0
		mov	byte ptr [bp+var_D27], 0
		mov	dword ptr [bp+var_D27+1], 0
		cmp	[bp+var_EF], 0
		jz	short loc_9C9BE
		cmp	[bp+var_F4], 0
		jz	short loc_9C9BE
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C9BE:				; CODE XREF: sub_98210+478Bj
					; sub_98210+4793j
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_9C9FD
		cmp	[bp+var_EC+2], 0
		jz	short loc_9C9FD
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9C9FD:				; CODE XREF: sub_98210+47CAj
					; sub_98210+47D2j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		cmp	byte_495FC, 0
		jnz	short loc_9CA1E
		jmp	loc_9CEB1
; ���������������������������������������������������������������������������

loc_9CA1E:				; CODE XREF: sub_98210+4809j
		push	2
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D1], 0
		jz	short loc_9CA55
		cmp	[bp+var_D6], 0
		jz	short loc_9CA55
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CA55:				; CODE XREF: sub_98210+4822j
					; sub_98210+482Aj
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C1], 0
		jz	short loc_9CAA3
		cmp	[bp+var_C6], 0
		jz	short loc_9CAA3
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CAA3:				; CODE XREF: sub_98210+4870j
					; sub_98210+4878j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B1], 0
		jz	short loc_9CAF1
		cmp	[bp+var_B6], 0
		jz	short loc_9CAF1
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CAF1:				; CODE XREF: sub_98210+48BEj
					; sub_98210+48C6j
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_9CB3F
		cmp	[bp+var_A6], 0
		jz	short loc_9CB3F
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CB3F:				; CODE XREF: sub_98210+490Cj
					; sub_98210+4914j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		cmp	[bp+var_97], 0
		jz	short loc_9CB7E
		cmp	[bp+var_9C], 0
		jz	short loc_9CB7E
		push	0
		mov	al, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CB7E:				; CODE XREF: sub_98210+494Bj
					; sub_98210+4953j
		mov	[bp+var_9C], 0
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		cmp	[bp+var_8D], 0
		jz	short loc_9CBBD
		cmp	[bp+var_92], 0
		jz	short loc_9CBBD
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CBBD:				; CODE XREF: sub_98210+498Aj
					; sub_98210+4992j
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_9CBFC
		cmp	[bp+var_88], 0
		jz	short loc_9CBFC
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CBFC:				; CODE XREF: sub_98210+49C9j
					; sub_98210+49D1j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_9CC53
		cmp	[bp+var_6A], 0
		jz	short loc_9CC53
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CC53:				; CODE XREF: sub_98210+4A23j
					; sub_98210+4A2Aj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_9CC99
		cmp	[bp+var_5A], 0
		jz	short loc_9CC99
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CC99:				; CODE XREF: sub_98210+4A69j
					; sub_98210+4A70j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_45], 0
		jz	short loc_9CCDF
		cmp	[bp+var_4A], 0
		jz	short loc_9CCDF
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CCDF:				; CODE XREF: sub_98210+4AAFj
					; sub_98210+4AB6j
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_9CD25
		cmp	[bp+var_3A], 0
		jz	short loc_9CD25
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CD25:				; CODE XREF: sub_98210+4AF5j
					; sub_98210+4AFCj
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CE8], 185Fh
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD3], 0
		jz	short loc_9CD74
		cmp	[bp+var_CD8], 0
		jz	short loc_9CD74
		push	0
		mov	al, [bp+var_CD4]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CD74:				; CODE XREF: sub_98210+4B41j
					; sub_98210+4B49j
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		lea	ax, [bp+var_4C2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4B9], 0
		jz	short loc_9CDC0
		cmp	[bp+var_4BE], 0
		jz	short loc_9CDC0
		push	0
		mov	al, [bp+var_4BA]
		push	ax
		lea	ax, [bp+var_4BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CDC0:				; CODE XREF: sub_98210+4B8Dj
					; sub_98210+4B95j
		mov	[bp+var_4BE], 0
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9CE0A
		cmp	[bp+var_28], 0
		jz	short loc_9CE0A
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9CE0A:				; CODE XREF: sub_98210+4BDAj
					; sub_98210+4BE1j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25C]
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
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
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

loc_9CEB1:				; CODE XREF: sub_98210+480Bj
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	3
		lea	ax, [bp+var_EC+2]
		push	ax
		push	74h ; 't'
		lea	ax, [bp+var_34C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F4], 0
		mov	[bp+var_F0], 2
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		push	3
		lea	ax, [bp+var_F4]
		push	ax
		push	4
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	[bp+var_FE], 0
		mov	[bp+var_FA], 2
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		push	3
		lea	ax, [bp+var_FE]
		push	ax
		push	25A6h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp+var_F4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_102+2], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FE]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	si, ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FE]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_102], ax
		push	0FFC0h
		push	0
		lea	ax, [bp+var_EC+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_104], ax
		push	[bp+var_40]
		mov	al, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_50]
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_60]
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
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
		push	[bp+var_104]
		lea	ax, [bp-0D44h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_102+2]
		lea	ax, [bp-0D44h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	si
		lea	ax, [bp-0D44h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_102]
		lea	ax, [bp-0D44h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		push	0FFFFh
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_110+2],	0
		mov	byte ptr [bp+var_10C+2], 2
		mov	byte ptr [bp+var_10C+3], 0
		mov	[bp+var_108], 0
		push	3
		lea	ax, [bp+var_110+2]
		push	ax
		push	0
		lea	ax, [bp+var_2D4]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_110+2]
		push	ax
		push	0
		call	ToggleLayer_Construct_B57B
		add	sp, 0Ah
		mov	word ptr [bp+var_110], ax
		push	word ptr [bp+var_110]
		lea	ax, [bp-0D44h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_9D120
; ���������������������������������������������������������������������������

loc_9D0EC:				; CODE XREF: sub_98210+4F29j
		mov	ax, [bp+var_D27]
		mov	word ptr [bp+var_114+2], ax
		cmp	word ptr [bp+var_114+2], 0Ch
		jnz	short loc_9D106
		push	12h
		push	si
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_9D106:				; CODE XREF: sub_98210+4EE9j
		jmp	short loc_9D113
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9D113
		jmp	short loc_9D13B
; ���������������������������������������������������������������������������

loc_9D113:				; CODE XREF: sub_98210:loc_9D106j
					; sub_98210+4EFFj
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9D120:				; CODE XREF: sub_98210+4EDAj
		cmp	[bp+var_D27], 0Fh
		jnb	short loc_9D12E
		cmp	[bp+var_D25], 0
		jz	short loc_9D133

loc_9D12E:				; CODE XREF: sub_98210+4F15j
		mov	ax, 1
		jmp	short loc_9D135
; ���������������������������������������������������������������������������

loc_9D133:				; CODE XREF: sub_98210+4F1Cj
		xor	ax, ax

loc_9D135:				; CODE XREF: sub_98210+4F21j
		mov	ah, 0
		or	ax, ax
		jz	short loc_9D0EC

loc_9D13B:				; CODE XREF: sub_98210+4F01j
		cmp	byte ptr [bp+var_10C+3], 0
		jz	short loc_9D163
		cmp	[bp+var_110+2],	0
		jz	short loc_9D163
		push	0
		mov	al, byte ptr [bp+var_10C+2]
		push	ax
		lea	ax, [bp+var_110+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D163:				; CODE XREF: sub_98210+4F30j
					; sub_98210+4F38j
		mov	[bp+var_110+2],	0
		mov	byte ptr [bp+var_10C+3], 0
		mov	[bp+var_108], 0
		cmp	[bp+var_F9], 0
		jz	short loc_9D1A2
		cmp	[bp+var_FE], 0
		jz	short loc_9D1A2
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D1A2:				; CODE XREF: sub_98210+4F6Fj
					; sub_98210+4F77j
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		push	0
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_EF], 0
		jz	short loc_9D1F0
		cmp	[bp+var_F4], 0
		jz	short loc_9D1F0
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D1F0:				; CODE XREF: sub_98210+4FBDj
					; sub_98210+4FC5j
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_9D22F
		cmp	[bp+var_EC+2], 0
		jz	short loc_9D22F
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D22F:				; CODE XREF: sub_98210+4FFCj
					; sub_98210+5004j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		cmp	byte_495FC, 0
		jnz	short loc_9D250
		jmp	loc_9D6E3
; ���������������������������������������������������������������������������

loc_9D250:				; CODE XREF: sub_98210+503Bj
		push	2
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D1], 0
		jz	short loc_9D287
		cmp	[bp+var_D6], 0
		jz	short loc_9D287
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D287:				; CODE XREF: sub_98210+5054j
					; sub_98210+505Cj
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C1], 0
		jz	short loc_9D2D5
		cmp	[bp+var_C6], 0
		jz	short loc_9D2D5
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D2D5:				; CODE XREF: sub_98210+50A2j
					; sub_98210+50AAj
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B1], 0
		jz	short loc_9D323
		cmp	[bp+var_B6], 0
		jz	short loc_9D323
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D323:				; CODE XREF: sub_98210+50F0j
					; sub_98210+50F8j
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_9D371
		cmp	[bp+var_A6], 0
		jz	short loc_9D371
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D371:				; CODE XREF: sub_98210+513Ej
					; sub_98210+5146j
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		cmp	[bp+var_97], 0
		jz	short loc_9D3B0
		cmp	[bp+var_9C], 0
		jz	short loc_9D3B0
		push	0
		mov	al, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D3B0:				; CODE XREF: sub_98210+517Dj
					; sub_98210+5185j
		mov	[bp+var_9C], 0
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		cmp	[bp+var_8D], 0
		jz	short loc_9D3EF
		cmp	[bp+var_92], 0
		jz	short loc_9D3EF
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D3EF:				; CODE XREF: sub_98210+51BCj
					; sub_98210+51C4j
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_9D42E
		cmp	[bp+var_88], 0
		jz	short loc_9D42E
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D42E:				; CODE XREF: sub_98210+51FBj
					; sub_98210+5203j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_9D485
		cmp	[bp+var_6A], 0
		jz	short loc_9D485
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D485:				; CODE XREF: sub_98210+5255j
					; sub_98210+525Cj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_9D4CB
		cmp	[bp+var_5A], 0
		jz	short loc_9D4CB
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D4CB:				; CODE XREF: sub_98210+529Bj
					; sub_98210+52A2j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_45], 0
		jz	short loc_9D511
		cmp	[bp+var_4A], 0
		jz	short loc_9D511
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D511:				; CODE XREF: sub_98210+52E1j
					; sub_98210+52E8j
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_9D557
		cmp	[bp+var_3A], 0
		jz	short loc_9D557
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D557:				; CODE XREF: sub_98210+5327j
					; sub_98210+532Ej
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CE8], 185Fh
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD3], 0
		jz	short loc_9D5A6
		cmp	[bp+var_CD8], 0
		jz	short loc_9D5A6
		push	0
		mov	al, [bp+var_CD4]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D5A6:				; CODE XREF: sub_98210+5373j
					; sub_98210+537Bj
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		lea	ax, [bp+var_4C2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4B9], 0
		jz	short loc_9D5F2
		cmp	[bp+var_4BE], 0
		jz	short loc_9D5F2
		push	0
		mov	al, [bp+var_4BA]
		push	ax
		lea	ax, [bp+var_4BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D5F2:				; CODE XREF: sub_98210+53BFj
					; sub_98210+53C7j
		mov	[bp+var_4BE], 0
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9D63C
		cmp	[bp+var_28], 0
		jz	short loc_9D63C
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D63C:				; CODE XREF: sub_98210+540Cj
					; sub_98210+5413j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25C]
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
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
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

loc_9D6E3:				; CODE XREF: sub_98210+503Dj
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6], 2
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	3
		lea	ax, [bp+var_EC+2]
		push	ax
		push	2
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_F4], 0
		mov	[bp+var_F0], 2
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		push	3
		lea	ax, [bp+var_F4]
		push	ax
		push	0
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_FE], 0
		mov	[bp+var_FA], 2
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		push	2
		lea	ax, [bp+var_FE]
		push	ax
		push	9
		lea	ax, [bp+var_25C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_102+1], 0
		lea	ax, [bp+var_FE]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1D6]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	5
		lea	ax, [bp+var_F4]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_108+2], ax
		push	0
		push	0
		lea	ax, [bp+var_EC+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_108], ax
		push	[bp+var_104]
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_108]
		lea	ax, [bp-0D44h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_108+2]
		lea	ax, [bp-0D44h]
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
		push	0
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	80h ; '�'
		lea	ax, [bp+var_D22]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp+var_10C+2], 1
		mov	ax, word ptr [bp+var_10C+2]
		mov	word ptr [bp+var_10C], ax
		mov	bx, word ptr [bp+var_108+2]
		mov	ax, word ptr [bp+var_10C]
		mov	[bx+1Bh], ax
		cmp	[bp+var_C], 0
		jnz	short loc_9D878
		jmp	loc_9D9BA
; ���������������������������������������������������������������������������

loc_9D878:				; CODE XREF: sub_98210+5663j
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		xor	si, si
		jmp	short loc_9D897
; ���������������������������������������������������������������������������

loc_9D889:				; CODE XREF: sub_98210+568Aj
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	si

loc_9D897:				; CODE XREF: sub_98210+5677j
		cmp	si, 4
		jl	short loc_9D889
		mov	[bp+var_118+2],	0
		mov	byte ptr [bp+var_114+2], 2
		mov	byte ptr [bp+var_114+3], 0
		mov	[bp+var_110], 0
		push	2
		lea	ax, [bp+var_118+2]
		push	ax
		push	1
		lea	ax, [bp+var_43C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_118+2]
		push	ax
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	si, si
		jmp	short loc_9D8F2
; ���������������������������������������������������������������������������

loc_9D8E4:				; CODE XREF: sub_98210+56E5j
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	si

loc_9D8F2:				; CODE XREF: sub_98210+56D2j
		cmp	si, 4
		jl	short loc_9D8E4
		push	0FFFFh
		lea	ax, [bp+var_CE8]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_9D922
; ���������������������������������������������������������������������������

loc_9D908:				; CODE XREF: sub_98210+5721j
		jmp	short loc_9D915
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9D915
		jmp	short loc_9D933
; ���������������������������������������������������������������������������

loc_9D915:				; CODE XREF: sub_98210:loc_9D908j
					; sub_98210+5701j
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9D922:				; CODE XREF: sub_98210+56F6j
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_9D908

loc_9D933:				; CODE XREF: sub_98210+5703j
		xor	si, si
		jmp	short loc_9D966
; ���������������������������������������������������������������������������

loc_9D937:				; CODE XREF: sub_98210+5759j
		cmp	si, 4
		jle	short loc_9D958
		cmp	si, 0Dh
		jge	short loc_9D958
		mov	ax, word ptr [bp+var_10C+2]
		mov	word ptr [bp+var_118], ax
		inc	word ptr [bp+var_10C+2]
		mov	bx, word ptr [bp+var_108+2]
		mov	ax, word ptr [bp+var_118]
		mov	[bx+1Bh], ax

loc_9D958:				; CODE XREF: sub_98210+572Aj
					; sub_98210+572Fj
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	si

loc_9D966:				; CODE XREF: sub_98210+5725j
		cmp	si, 11h
		jl	short loc_9D937
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_114+3], 0
		jz	short loc_9D9A0
		cmp	[bp+var_118+2],	0
		jz	short loc_9D9A0
		push	0
		mov	al, byte ptr [bp+var_114+2]
		push	ax
		lea	ax, [bp+var_118+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9D9A0:				; CODE XREF: sub_98210+576Dj
					; sub_98210+5775j
		mov	[bp+var_118+2],	0
		mov	byte ptr [bp+var_114+3], 0
		mov	[bp+var_110], 0
		jmp	loc_9DAF4
; ���������������������������������������������������������������������������

loc_9D9BA:				; CODE XREF: sub_98210+5665j
		mov	[bp+var_6], 4Bh	; 'K'
		mov	ax, [bp+var_D27]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		jmp	loc_9DAD7
; ���������������������������������������������������������������������������

loc_9D9DE:				; CODE XREF: sub_98210+58E1j
		mov	si, [bp+var_D27]
		mov	ax, [bp+var_4]
		add	ax, 8
		cmp	ax, si
		jnz	short loc_9DA07
		mov	ax, [bp+var_A]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_8]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D22]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_9DA07:				; CODE XREF: sub_98210+57DAj
		mov	ax, [bp+var_4]
		add	ax, 18h
		cmp	ax, si
		jge	short loc_9DA32
		mov	ax, [bp+var_4]
		add	ax, 21h	; '!'
		cmp	ax, si
		jle	short loc_9DA32
		mov	ax, word ptr [bp+var_10C+2]
		mov	word ptr [bp+var_110+2], ax
		inc	word ptr [bp+var_10C+2]
		mov	bx, word ptr [bp+var_108+2]
		mov	ax, word ptr [bp+var_110+2]
		mov	[bx+1Bh], ax

loc_9DA32:				; CODE XREF: sub_98210+57FFj
					; sub_98210+5809j
		mov	ax, di
		dec	ax
		cmp	ax, si
		jnz	short loc_9DA7B
		mov	[bp+var_D50], 11BCh
		mov	[bp+var_D50], 11C8h
		mov	[bp+var_D50], 11D8h
		mov	[bp+var_D50], 11E8h
		mov	[bp+var_D50], 11FCh
		lea	ax, [bp+var_D20]
		push	ax
		push	0
		push	[bp+var_D03]
		push	[bp+var_D05]
		push	[bp+var_D07]
		push	[bp+var_D09]
		lea	ax, [bp+var_D50]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_9DA7B:				; CODE XREF: sub_98210+5827j
		jmp	short loc_9DACA
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_9DACA
		mov	word ptr [bp-0D5Ch], 11BCh
		mov	word ptr [bp-0D5Ch], 11C8h
		mov	word ptr [bp-0D5Ch], 11D8h
		mov	word ptr [bp-0D5Ch], 11E8h
		mov	word ptr [bp-0D5Ch], 11FCh
		lea	ax, [bp-0D20h]
		push	ax
		push	0
		push	word ptr [bp-0D03h]
		push	word ptr [bp-0D05h]
		push	word ptr [bp-0D07h]
		push	word ptr [bp-0D09h]
		lea	ax, [bp-0D5Ch]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_9DAF4
; ���������������������������������������������������������������������������

loc_9DACA:				; CODE XREF: sub_98210:loc_9DA7Bj
					; sub_98210+5874j
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_9DAD7:				; CODE XREF: sub_98210+57CBj
		cmp	[bp+var_D27], di
		jnb	short loc_9DAE4
		cmp	[bp+var_D25], 0
		jz	short loc_9DAE9

loc_9DAE4:				; CODE XREF: sub_98210+58CBj
		mov	ax, 1
		jmp	short loc_9DAEB
; ���������������������������������������������������������������������������

loc_9DAE9:				; CODE XREF: sub_98210+58D2j
		xor	ax, ax

loc_9DAEB:				; CODE XREF: sub_98210+58D7j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9DAF4
		jmp	loc_9D9DE
; ���������������������������������������������������������������������������

loc_9DAF4:				; CODE XREF: sub_98210+57A7j
					; sub_98210+58B8j ...
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		lea	ax, [bp-0D44h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_F9], 0
		jz	short loc_9DB51
		cmp	[bp+var_FE], 0
		jz	short loc_9DB51
		push	0
		mov	al, [bp+var_FA]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DB51:				; CODE XREF: sub_98210+591Ej
					; sub_98210+5926j
		mov	[bp+var_FE], 0
		mov	[bp+var_F9], 0
		mov	[bp+var_F8], 0
		cmp	[bp+var_EF], 0
		jz	short loc_9DB90
		cmp	[bp+var_F4], 0
		jz	short loc_9DB90
		push	0
		mov	al, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DB90:				; CODE XREF: sub_98210+595Dj
					; sub_98210+5965j
		mov	[bp+var_F4], 0
		mov	[bp+var_EF], 0
		mov	dword ptr [bp-0EEh], 0
		cmp	byte ptr [bp+var_E6+1],	0
		jz	short loc_9DBCF
		cmp	[bp+var_EC+2], 0
		jz	short loc_9DBCF
		push	0
		mov	al, byte ptr [bp+var_E6]
		push	ax
		lea	ax, [bp+var_EC+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DBCF:				; CODE XREF: sub_98210+599Cj
					; sub_98210+59A4j
		mov	[bp+var_EC+2], 0
		mov	byte ptr [bp+var_E6+1],	0
		mov	[bp+var_E6+2], 0
		push	2
		lea	ax, [bp+var_DC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D1], 0
		jz	short loc_9DC1D
		cmp	[bp+var_D6], 0
		jz	short loc_9DC1D
		push	0
		mov	al, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DC1D:				; CODE XREF: sub_98210+59EAj
					; sub_98210+59F2j
		mov	[bp+var_D6], 0
		mov	[bp+var_D1], 0
		mov	[bp+var_D0], 0
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C1], 0
		jz	short loc_9DC6B
		cmp	[bp+var_C6], 0
		jz	short loc_9DC6B
		push	0
		mov	al, [bp+var_C2]
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DC6B:				; CODE XREF: sub_98210+5A38j
					; sub_98210+5A40j
		mov	[bp+var_C6], 0
		mov	[bp+var_C1], 0
		mov	[bp+var_C0], 0
		push	2
		lea	ax, [bp+var_BC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B1], 0
		jz	short loc_9DCB9
		cmp	[bp+var_B6], 0
		jz	short loc_9DCB9
		push	0
		mov	al, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DCB9:				; CODE XREF: sub_98210+5A86j
					; sub_98210+5A8Ej
		mov	[bp+var_B6], 0
		mov	[bp+var_B1], 0
		mov	[bp+var_B0], 0
		push	2
		lea	ax, [bp+var_AC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_A1], 0
		jz	short loc_9DD07
		cmp	[bp+var_A6], 0
		jz	short loc_9DD07
		push	0
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DD07:				; CODE XREF: sub_98210+5AD4j
					; sub_98210+5ADCj
		mov	[bp+var_A6], 0
		mov	[bp+var_A1], 0
		mov	[bp+var_A0], 0
		cmp	[bp+var_97], 0
		jz	short loc_9DD46
		cmp	[bp+var_9C], 0
		jz	short loc_9DD46
		push	0
		mov	al, [bp+var_98]
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DD46:				; CODE XREF: sub_98210+5B13j
					; sub_98210+5B1Bj
		mov	[bp+var_9C], 0
		mov	[bp+var_97], 0
		mov	[bp+var_96], 0
		cmp	[bp+var_8D], 0
		jz	short loc_9DD85
		cmp	[bp+var_92], 0
		jz	short loc_9DD85
		push	0
		mov	al, [bp+var_8E]
		push	ax
		lea	ax, [bp+var_92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DD85:				; CODE XREF: sub_98210+5B52j
					; sub_98210+5B5Aj
		mov	[bp+var_92], 0
		mov	[bp+var_8D], 0
		mov	[bp+var_8C], 0
		cmp	[bp+var_83], 0
		jz	short loc_9DDC4
		cmp	[bp+var_88], 0
		jz	short loc_9DDC4
		push	0
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_88]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DDC4:				; CODE XREF: sub_98210+5B91j
					; sub_98210+5B99j
		mov	[bp+var_88], 0
		mov	[bp+var_83], 0
		mov	[bp+var_82], 0
		lea	ax, [bp+var_D20]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_D00]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_9DE1B
		cmp	[bp+var_6A], 0
		jz	short loc_9DE1B
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DE1B:				; CODE XREF: sub_98210+5BEBj
					; sub_98210+5BF2j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_9DE61
		cmp	[bp+var_5A], 0
		jz	short loc_9DE61
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DE61:				; CODE XREF: sub_98210+5C31j
					; sub_98210+5C38j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_45], 0
		jz	short loc_9DEA7
		cmp	[bp+var_4A], 0
		jz	short loc_9DEA7
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DEA7:				; CODE XREF: sub_98210+5C77j
					; sub_98210+5C7Ej
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		push	2
		lea	ax, [bp+var_40]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_35], 0
		jz	short loc_9DEED
		cmp	[bp+var_3A], 0
		jz	short loc_9DEED
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DEED:				; CODE XREF: sub_98210+5CBDj
					; sub_98210+5CC4j
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		mov	[bp+var_CE8], 185Fh
		lea	ax, [bp+var_CE8]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_CD3], 0
		jz	short loc_9DF3C
		cmp	[bp+var_CD8], 0
		jz	short loc_9DF3C
		push	0
		mov	al, [bp+var_CD4]
		push	ax
		lea	ax, [bp+var_CD8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DF3C:				; CODE XREF: sub_98210+5D09j
					; sub_98210+5D11j
		mov	[bp+var_CD8], 0
		mov	[bp+var_CD3], 0
		mov	[bp+var_CD2], 0
		lea	ax, [bp+var_4C2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_4B9], 0
		jz	short loc_9DF88
		cmp	[bp+var_4BE], 0
		jz	short loc_9DF88
		push	0
		mov	al, [bp+var_4BA]
		push	ax
		lea	ax, [bp+var_4BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DF88:				; CODE XREF: sub_98210+5D55j
					; sub_98210+5D5Dj
		mov	[bp+var_4BE], 0
		mov	[bp+var_4B9], 0
		mov	[bp+var_4B8], 0
		push	2
		lea	ax, [bp+var_4B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_23], 0
		jz	short loc_9DFD2
		cmp	[bp+var_28], 0
		jz	short loc_9DFD2
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_9DFD2:				; CODE XREF: sub_98210+5DA2j
					; sub_98210+5DA9j
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		push	2
		lea	ax, [bp+var_43C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_3C4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_34C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_25C]
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
		lea	ax, [bp+var_1E4]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1D6]
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
sub_98210	endp

ovr205		ends
