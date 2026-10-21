ovr208		segment	para public 'OVERLAY' use16
		assume cs:ovr208
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_AFB90	proc far		; CODE XREF: sub_425F0J

var_C28		= word ptr -0C28h
var_BF8		= word ptr -0BF8h
var_BCB		= dword	ptr -0BCBh
var_BC7		= dword	ptr -0BC7h
var_BC3		= dword	ptr -0BC3h
var_BBC		= word ptr -0BBCh
var_BB6		= word ptr -0BB6h
var_BB2		= dword	ptr -0BB2h
var_BAE		= word ptr -0BAEh
var_BAC		= dword	ptr -0BACh
var_BA8		= byte ptr -0BA8h
var_BA7		= byte ptr -0BA7h
var_BA6		= dword	ptr -0BA6h
var_BA2		= word ptr -0BA2h
var_B8E		= word ptr -0B8Eh
var_B8C		= word ptr -0B8Ch
var_B8A		= dword	ptr -0B8Ah
var_B86		= byte ptr -0B86h
var_B85		= word ptr -0B85h
var_B83		= byte ptr -0B83h
var_B80		= word ptr -0B80h
var_B7E		= word ptr -0B7Eh
var_B6C		= word ptr -0B6Ch
var_B67		= word ptr -0B67h
var_B65		= word ptr -0B65h
var_B63		= word ptr -0B63h
var_B61		= word ptr -0B61h
var_B5E		= word ptr -0B5Eh
var_B46		= word ptr -0B46h
var_B44		= word ptr -0B44h
var_B36		= dword	ptr -0B36h
var_B32		= byte ptr -0B32h
var_B31		= byte ptr -0B31h
var_B30		= dword	ptr -0B30h
var_329		= dword	ptr -329h
var_325		= dword	ptr -325h
var_320		= word ptr -320h
var_31E		= word ptr -31Eh
var_31C		= dword	ptr -31Ch
var_318		= byte ptr -318h
var_317		= byte ptr -317h
var_316		= dword	ptr -316h
var_312		= word ptr -312h
var_29A		= word ptr -29Ah
var_222		= word ptr -222h
var_1AA		= word ptr -1AAh
var_1A8		= word ptr -1A8h
var_1A6		= word ptr -1A6h
var_1A4		= word ptr -1A4h
var_1A2		= word ptr -1A2h
var_1A0		= word ptr -1A0h
var_19C		= word ptr -19Ch
var_19A		= word ptr -19Ah
var_198		= word ptr -198h
var_196		= word ptr -196h
var_194		= word ptr -194h
var_192		= word ptr -192h
var_18E		= word ptr -18Eh
var_13E		= word ptr -13Eh
var_13C		= word ptr -13Ch
var_13A		= word ptr -13Ah
var_138		= word ptr -138h
var_136		= word ptr -136h
var_134		= dword	ptr -134h
var_130		= byte ptr -130h
var_12F		= byte ptr -12Fh
var_12E		= dword	ptr -12Eh
var_12A		= dword	ptr -12Ah
var_126		= dword	ptr -126h
var_122		= byte ptr -122h
var_121		= byte ptr -121h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= word ptr -118h
var_116		= dword	ptr -116h
var_112		= dword	ptr -112h
var_10E		= word ptr -10Eh
var_10C		= dword	ptr -10Ch
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
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= byte ptr -0ECh
var_EB		= byte ptr -0EBh
var_EA		= dword	ptr -0EAh
var_E6		= dword	ptr -0E6h
var_E2		= byte ptr -0E2h
var_E1		= byte ptr -0E1h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= byte ptr -0D8h
var_D7		= byte ptr -0D7h
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= byte ptr -0CEh
var_CD		= byte ptr -0CDh
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= byte ptr -0C4h
var_C3		= byte ptr -0C3h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= byte ptr -0BAh
var_B9		= byte ptr -0B9h
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= byte ptr -0B0h
var_AF		= byte ptr -0AFh
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= byte ptr -0A6h
var_A5		= byte ptr -0A5h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= byte ptr -9Ch
var_9B		= byte ptr -9Bh
var_9A		= dword	ptr -9Ah
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
var_4C		= word ptr -4Ch
var_4A		= byte ptr -4Ah
var_49		= word ptr -49h
var_46		= dword	ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= dword	ptr -2Ch
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

		push	bp
		mov	bp, sp
		sub	sp, 0C28h
		push	si
		push	di
		mov	[bp+var_6], 0
		push	0C8h ; '�'
		push	0Bh
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	byte_495FC, 0
		mov	[bp+var_9], 0
		mov	[bp+var_A], 0
		mov	[bp+var_B], 0
		cmp	word_4684B, 0
		jz	short loc_AFBCB
		mov	[bp+var_A], 1

loc_AFBCB:				; CODE XREF: sub_AFB90+35j
		mov	ax, word_46F46
		mov	[bp+var_E], ax
		mov	[bp+var_19C], 0
		mov	[bp+var_19A], 0
		push	[bp+var_E]
		lea	ax, [bp+var_19C]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_1AA], 0
		mov	[bp+var_1A8], 0
		mov	[bp+var_1A6], 0
		mov	[bp+var_1A4], 0
		mov	[bp+var_1A2], 13Fh
		mov	[bp+var_1A0], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_1AA]
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
		mov	[bp+var_198], 0
		mov	[bp+var_196], 18h
		mov	[bp+var_194], 13Fh
		mov	[bp+var_192], 97h ; '�'
		mov	byte ptr [bp+var_1C], 0
		mov	byte ptr [bp+var_1C+1],	0
		mov	[bp+var_1A], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_42 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_222]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid34voc ; "mid34voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_A], 0
		jz	short loc_AFCE9
		push	ds
		lea	ax, [bp+var_18E]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_AFCE9
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_29A]
		push	ax
		mov	bx, [bp+var_29A]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_AFCED
; ���������������������������������������������������������������������������

loc_AFCE9:				; CODE XREF: sub_AFB90+12Dj
					; sub_AFB90+13Fj
		mov	[bp+var_A], 0

loc_AFCED:				; CODE XREF: sub_AFB90+157j
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	al, byte_46848
		mov	[bp+var_28], al
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_28]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_AFD2D
		cmp	ax, 2
		jnz	short loc_AFD2A
		jmp	loc_AFE99
; ���������������������������������������������������������������������������

loc_AFD2A:				; CODE XREF: sub_AFB90+195j
		jmp	loc_B0004
; ���������������������������������������������������������������������������

loc_AFD2D:				; CODE XREF: sub_AFB90+190j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_18E]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_AFD5B
		jmp	loc_AFE58
; ���������������������������������������������������������������������������

loc_AFD5B:				; CODE XREF: sub_AFB90+1C6j
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_312]
		push	ax
		mov	bx, [bp+var_312]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_43 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_C28]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_C28], 556h
		mov	[bp+var_BC7], 100h
		mov	[bp+var_BCB], 0
		mov	[bp+var_C28], 56Eh
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_C28]
		push	ax
		mov	bx, [bp+var_C28]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	di, 1
		jmp	short loc_AFE20
; ���������������������������������������������������������������������������

loc_AFE0A:				; CODE XREF: sub_AFB90+293j
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	di

loc_AFE20:				; CODE XREF: sub_AFB90+278j
		cmp	di, 6Ah	; 'j'
		jle	short loc_AFE0A
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_C28], 56Eh
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_C28]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_AFE58:				; CODE XREF: sub_AFB90+1C8j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_18E]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_AFE96
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AFE96
		mov	word_48F76, 5Ah	; 'Z'

loc_AFE96:				; CODE XREF: sub_AFB90+2F1j
					; sub_AFB90+2FEj
		jmp	loc_B0004
; ���������������������������������������������������������������������������

loc_AFE99:				; CODE XREF: sub_AFB90+197j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_18E]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_AFEC7
		jmp	loc_AFFC4
; ���������������������������������������������������������������������������

loc_AFEC7:				; CODE XREF: sub_AFB90+332j
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_312]
		push	ax
		mov	bx, [bp+var_312]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_44 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_C28]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_C28], 556h
		mov	[bp+var_BC7], 100h
		mov	[bp+var_BCB], 0
		mov	[bp+var_C28], 56Eh
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_C28]
		push	ax
		mov	bx, [bp+var_C28]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	di, 1
		jmp	short loc_AFF8C
; ���������������������������������������������������������������������������

loc_AFF76:				; CODE XREF: sub_AFB90+3FFj
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	di

loc_AFF8C:				; CODE XREF: sub_AFB90+3E4j
		cmp	di, 6Ah	; 'j'
		jle	short loc_AFF76
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_C28], 56Eh
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_C28]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_AFFC4:				; CODE XREF: sub_AFB90+334j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_18E]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_B0002
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B0002
		mov	word_48F76, 0FFh

loc_B0002:				; CODE XREF: sub_AFB90+45Dj
					; sub_AFB90+46Aj
		jmp	short $+2

loc_B0004:				; CODE XREF: sub_AFB90:loc_AFD2Aj
					; sub_AFB90:loc_AFE96j
		cmp	[bp+var_B], 0
		jnz	short loc_B000D
		jmp	loc_B0124
; ���������������������������������������������������������������������������

loc_B000D:				; CODE XREF: sub_AFB90+478j
		mov	[bp+var_B8A], 0
		mov	[bp+var_B86], 2
		mov	byte ptr [bp+var_B85], 0
		mov	dword ptr [bp+var_B85+1], 0
		mov	[bp+var_B8E], 0
		mov	[bp+var_B8C], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_B8E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E], 2
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		push	3
		lea	ax, [bp+var_112]
		push	ax
		push	4Ch ; 'L'
		lea	ax, [bp+var_312]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_112]
		push	ax
		lea	ax, [bp+var_B8E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_B8E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_10E+1], 0
		jz	short loc_B00C1
		cmp	[bp+var_112], 0
		jz	short loc_B00C1
		push	0
		mov	al, byte ptr [bp+var_10E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B00C1:				; CODE XREF: sub_AFB90+50Ej
					; sub_AFB90+516j
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		lea	ax, [bp+var_B8E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_B85], 0
		jz	short loc_B010D
		cmp	[bp+var_B8A], 0
		jz	short loc_B010D
		push	0
		mov	al, [bp+var_B86]
		push	ax
		lea	ax, [bp+var_B8A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B010D:				; CODE XREF: sub_AFB90+55Aj
					; sub_AFB90+562j
		mov	[bp+var_B8A], 0
		mov	byte ptr [bp+var_B85], 0
		mov	dword ptr [bp+var_B85+1], 0

loc_B0124:				; CODE XREF: sub_AFB90+47Aj
		mov	[bp+var_31C], 0
		mov	[bp+var_318], 2
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		mov	[bp+var_320], 0
		mov	[bp+var_31E], 0FFFFh
		cmp	[bp+var_9], 0
		jz	short loc_B01C5
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_BF8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_A], 0
		jz	short loc_B0173
		mov	byte ptr [bp+var_10C+3], 14h
		jmp	short loc_B0178
; ���������������������������������������������������������������������������

loc_B0173:				; CODE XREF: sub_AFB90+5DAj
		mov	byte ptr [bp+var_10C+3], 13h

loc_B0178:				; CODE XREF: sub_AFB90+5E1j
		push	3
		lea	ax, [bp+var_26]
		push	ax
		mov	al, byte ptr [bp+var_10C+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_BF8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_320]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_320]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_BF8]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_B01C5:				; CODE XREF: sub_AFB90+5C0j
		mov	[bp+var_B46], 185Fh
		mov	[bp+var_B36], 0
		mov	[bp+var_B32], 2
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		mov	[bp+var_B44], 0
		mov	[bp+var_B46], 186Fh
		xor	eax, eax
		mov	[bp+var_329], eax
		mov	[bp+var_325], eax
		cmp	[bp+var_A], 0
		jz	short loc_B021A
		push	word_4684B
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_B031F
; ���������������������������������������������������������������������������

loc_B021A:				; CODE XREF: sub_AFB90+674j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_45 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_C28]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_C28], 556h
		mov	[bp+var_BC7], 100h
		mov	[bp+var_BCB], 0
		mov	[bp+var_C28], 56Eh
		push	1
		lea	ax, [bp+var_18E]
		push	ax
		lea	ax, [bp+var_C28]
		push	ax
		mov	bx, [bp+var_C28]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3433474Dh
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	di, di
		jmp	short loc_B02EB
; ���������������������������������������������������������������������������

loc_B02A2:				; CODE XREF: sub_AFB90+75Ej
		push	1
		push	large 54584554h
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_BB6]
		mov	word ptr [bp+var_10C+2], ax
		movsx	eax, word ptr [bp+var_10C+2]
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	di
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_BB2]
		mov	[bp+var_BC3], eax
		inc	di

loc_B02EB:				; CODE XREF: sub_AFB90+710j
		cmp	di, 0Bh
		jl	short loc_B02A2
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_C28], 56Eh
		lea	ax, [bp+var_C28]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_C28]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_B031F:				; CODE XREF: sub_AFB90+687j
		mov	[bp+var_32], 0
		mov	[bp+var_2E], 2
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		push	3
		lea	ax, [bp+var_32]
		push	ax
		push	2Ah ; '*'
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_3C], 0
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	3
		lea	ax, [bp+var_3C]
		push	ax
		push	2Ch ; ','
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_46], 0
		mov	[bp+var_42], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_49], 0
		lea	ax, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_56], 0
		mov	[bp+var_52], 2
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		push	25h ; '%'
		lea	ax, [bp+var_222]
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
		push	2Bh ; '+'
		lea	ax, [bp+var_222]
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
		push	2Dh ; '-'
		lea	ax, [bp+var_222]
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
		push	29h ; ')'
		lea	ax, [bp+var_222]
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
		push	3
		lea	ax, [bp+var_96]
		push	ax
		push	1Dh
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A0], 0
		mov	[bp+var_9C], 2
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	3
		lea	ax, [bp+var_A0]
		push	ax
		push	21h ; '!'
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_AA], 0
		mov	[bp+var_A6], 2
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		push	3
		lea	ax, [bp+var_AA]
		push	ax
		push	22h ; '"'
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_B4], 0
		mov	[bp+var_B0], 2
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		push	3
		lea	ax, [bp+var_B4]
		push	ax
		push	23h ; '#'
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_BE], 0
		mov	[bp+var_BA], 2
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		push	3
		lea	ax, [bp+var_BE]
		push	ax
		push	274Dh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_C8], 0
		mov	[bp+var_C4], 2
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	3
		lea	ax, [bp+var_C8]
		push	ax
		push	2751h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_D2], 0
		mov	[bp+var_CE], 2
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		push	3
		lea	ax, [bp+var_D2]
		push	ax
		push	2756h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_DC], 0
		mov	[bp+var_D8], 2
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		push	3
		lea	ax, [bp+var_DC]
		push	ax
		push	275Ah
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_E6], 0
		mov	[bp+var_E2], 2
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		push	3
		lea	ax, [bp+var_E6]
		push	ax
		push	275Fh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_F0], 0
		mov	[bp+var_EC], 2
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aConvfont_2 ; "convfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_18E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_18E]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_F4+2],	dx
		mov	word ptr [bp+var_F4], ax
		mov	eax, [bp+var_F4]
		mov	[bp+var_F0], eax
		mov	[bp+var_EC], 2
		mov	[bp+var_EB], 1
		mov	[bp+var_EA], 0
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_FC], 0
		mov	[bp+var_FA], 98h ; '�'
		mov	[bp+var_F8], 13Fh
		mov	[bp+var_F6], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_FE], ax
		lea	ax, [bp+var_B5E]
		push	ax
		push	[bp+var_FE]
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_B80], 1218h
		mov	ax, [bp+var_FA]
		mov	[bp+var_100], ax
		mov	ax, [bp+var_F8]
		mov	[bp+var_102], ax
		mov	ax, [bp+var_F6]
		mov	[bp+var_104], ax
		mov	ax, [bp+var_FC]
		mov	[bp+var_B67], ax
		mov	ax, [bp+var_100]
		mov	[bp+var_B65], ax
		mov	ax, [bp+var_102]
		mov	[bp+var_B63], ax
		mov	ax, [bp+var_104]
		mov	[bp+var_B61], ax
		push	0
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_B078A
		jmp	loc_B0D3C
; ���������������������������������������������������������������������������

loc_B078A:				; CODE XREF: sub_AFB90+BF5j
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B07CE
		cmp	[bp+var_F0], 0
		jz	short loc_B07CE
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B07CE:				; CODE XREF: sub_AFB90+C1Bj
					; sub_AFB90+C23j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B080D
		cmp	[bp+var_E6], 0
		jz	short loc_B080D
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B080D:				; CODE XREF: sub_AFB90+C5Aj
					; sub_AFB90+C62j
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B084C
		cmp	[bp+var_DC], 0
		jz	short loc_B084C
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B084C:				; CODE XREF: sub_AFB90+C99j
					; sub_AFB90+CA1j
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B088B
		cmp	[bp+var_D2], 0
		jz	short loc_B088B
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B088B:				; CODE XREF: sub_AFB90+CD8j
					; sub_AFB90+CE0j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B08CA
		cmp	[bp+var_C8], 0
		jz	short loc_B08CA
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B08CA:				; CODE XREF: sub_AFB90+D17j
					; sub_AFB90+D1Fj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B0909
		cmp	[bp+var_BE], 0
		jz	short loc_B0909
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0909:				; CODE XREF: sub_AFB90+D56j
					; sub_AFB90+D5Ej
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B0948
		cmp	[bp+var_B4], 0
		jz	short loc_B0948
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0948:				; CODE XREF: sub_AFB90+D95j
					; sub_AFB90+D9Dj
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B0987
		cmp	[bp+var_AA], 0
		jz	short loc_B0987
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0987:				; CODE XREF: sub_AFB90+DD4j
					; sub_AFB90+DDCj
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B09C6
		cmp	[bp+var_A0], 0
		jz	short loc_B09C6
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B09C6:				; CODE XREF: sub_AFB90+E13j
					; sub_AFB90+E1Bj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B0A05
		cmp	[bp+var_96], 0
		jz	short loc_B0A05
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0A05:				; CODE XREF: sub_AFB90+E52j
					; sub_AFB90+E5Aj
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B0A53
		cmp	[bp+var_86], 0
		jz	short loc_B0A53
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0A53:				; CODE XREF: sub_AFB90+EA0j
					; sub_AFB90+EA8j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B0A9B
		cmp	[bp+var_76], 0
		jz	short loc_B0A9B
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0A9B:				; CODE XREF: sub_AFB90+EEBj
					; sub_AFB90+EF2j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B0AE1
		cmp	[bp+var_66], 0
		jz	short loc_B0AE1
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0AE1:				; CODE XREF: sub_AFB90+F31j
					; sub_AFB90+F38j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B0B27
		cmp	[bp+var_56], 0
		jz	short loc_B0B27
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0B27:				; CODE XREF: sub_AFB90+F77j
					; sub_AFB90+F7Ej
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B0B6D
		cmp	[bp+var_46], 0
		jz	short loc_B0B6D
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0B6D:				; CODE XREF: sub_AFB90+FBDj
					; sub_AFB90+FC4j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B0BA5
		cmp	[bp+var_3C], 0
		jz	short loc_B0BA5
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0BA5:				; CODE XREF: sub_AFB90+FF5j
					; sub_AFB90+FFCj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B0BDD
		cmp	[bp+var_32], 0
		jz	short loc_B0BDD
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0BDD:				; CODE XREF: sub_AFB90+102Dj
					; sub_AFB90+1034j
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B0C2C
		cmp	[bp+var_B36], 0
		jz	short loc_B0C2C
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0C2C:				; CODE XREF: sub_AFB90+1079j
					; sub_AFB90+1081j
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B0C78
		cmp	[bp+var_31C], 0
		jz	short loc_B0C78
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0C78:				; CODE XREF: sub_AFB90+10C5j
					; sub_AFB90+10CDj
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B0CC2
		cmp	[bp+var_26], 0
		jz	short loc_B0CC2
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B0CC2:				; CODE XREF: sub_AFB90+1112j
					; sub_AFB90+1119j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B0D3C:				; CODE XREF: sub_AFB90+BF7j
		cmp	[bp+var_9], 0
		jz	short loc_B0D86
		mov	ax, word_48F76
		mov	[bp+var_106], ax
		mov	[bp+var_108], 0
		cmp	[bp+var_320], 0
		jz	short loc_B0D86
		push	[bp+var_31E]
		mov	bx, [bp+var_320]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_108]
		push	[bp+var_106]
		push	[bp+var_31E]
		mov	bx, [bp+var_320]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B0D86:				; CODE XREF: sub_AFB90+11B0j
					; sub_AFB90+11C4j
		lea	ax, [bp+var_19C]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C+2], ax
		push	0
		push	0
		lea	ax, [bp+var_A0]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C], ax
		push	0
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_10E], ax
		push	0
		push	0
		lea	ax, [bp+var_B4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_112+2], ax
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_10C+2]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10C]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_10E]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_112+2]
		lea	ax, [bp+var_BA2]
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
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		lea	ax, [bp+var_BA2]
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
		cmp	[bp+var_A], 0
		jnz	short loc_B0EEA
		jmp	loc_B10CA
; ���������������������������������������������������������������������������

loc_B0EEA:				; CODE XREF: sub_AFB90+1355j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_11C+2],	0
		mov	byte ptr [bp+var_116], 2
		mov	byte ptr [bp+var_116+1], 0
		mov	dword ptr [bp-114h], 0
		push	2
		lea	ax, [bp+var_11C+2]
		push	ax
		push	0
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_11C+2]
		push	ax
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_B0F4D
; ���������������������������������������������������������������������������

loc_B0F3F:				; CODE XREF: sub_AFB90+13C0j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B0F4D:				; CODE XREF: sub_AFB90+13ADj
		cmp	di, 4
		jl	short loc_B0F3F
		push	0FFFFh
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_B0F7D
; ���������������������������������������������������������������������������

loc_B0F63:				; CODE XREF: sub_AFB90+13FCj
		jmp	short loc_B0F70
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B0F70
		jmp	short loc_B0F8E
; ���������������������������������������������������������������������������

loc_B0F70:				; CODE XREF: sub_AFB90:loc_B0F63j
					; sub_AFB90+13DCj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B0F7D:				; CODE XREF: sub_AFB90+13D1j
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_B0F63

loc_B0F8E:				; CODE XREF: sub_AFB90+13DEj
		xor	di, di
		jmp	short loc_B0FA0
; ���������������������������������������������������������������������������

loc_B0F92:				; CODE XREF: sub_AFB90+1413j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B0FA0:				; CODE XREF: sub_AFB90+1400j
		cmp	di, 8
		jl	short loc_B0F92
		mov	[bp+var_126+2],	0
		mov	byte ptr [bp+var_120], 2
		mov	byte ptr [bp+var_120+1], 0
		mov	[bp+var_120+2],	0
		push	2
		lea	ax, [bp+var_126+2]
		push	ax
		push	1
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_126+2]
		push	ax
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_B1014
; ���������������������������������������������������������������������������

loc_B0FFA:				; CODE XREF: sub_AFB90+1493j
		jmp	short loc_B1007
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B1007
		jmp	short loc_B1025
; ���������������������������������������������������������������������������

loc_B1007:				; CODE XREF: sub_AFB90:loc_B0FFAj
					; sub_AFB90+1473j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B1014:				; CODE XREF: sub_AFB90+1468j
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_B0FFA

loc_B1025:				; CODE XREF: sub_AFB90+1475j
		xor	di, di
		jmp	short loc_B1037
; ���������������������������������������������������������������������������

loc_B1029:				; CODE XREF: sub_AFB90+14AAj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B1037:				; CODE XREF: sub_AFB90+1497j
		cmp	di, 4
		jl	short loc_B1029
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_120+1], 0
		jz	short loc_B1071
		cmp	[bp+var_126+2],	0
		jz	short loc_B1071
		push	0
		mov	al, byte ptr [bp+var_120]
		push	ax
		lea	ax, [bp+var_126+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1071:				; CODE XREF: sub_AFB90+14BEj
					; sub_AFB90+14C6j
		mov	[bp+var_126+2],	0
		mov	byte ptr [bp+var_120+1], 0
		mov	[bp+var_120+2],	0
		cmp	byte ptr [bp+var_116+1], 0
		jz	short loc_B10B0
		cmp	[bp+var_11C+2],	0
		jz	short loc_B10B0
		push	0
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, [bp+var_11C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B10B0:				; CODE XREF: sub_AFB90+14FDj
					; sub_AFB90+1505j
		mov	[bp+var_11C+2],	0
		mov	byte ptr [bp+var_116+1], 0
		mov	dword ptr [bp-114h], 0
		jmp	loc_B18BE
; ���������������������������������������������������������������������������

loc_B10CA:				; CODE XREF: sub_AFB90+1357j
		push	0
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0E9h ; '�'
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_4], 32h	; '2'
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B11CD
; ���������������������������������������������������������������������������

loc_B110A:				; CODE XREF: sub_AFB90+165Aj
		mov	di, [bp+var_B85]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B1127
		push	[bp+var_6]
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B1127:				; CODE XREF: sub_AFB90+1585j
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B1171
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B1171:				; CODE XREF: sub_AFB90+159Dj
		jmp	short loc_B11C0
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B11C0
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B11ED
; ���������������������������������������������������������������������������

loc_B11C0:				; CODE XREF: sub_AFB90:loc_B1171j
					; sub_AFB90+15EAj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B11CD:				; CODE XREF: sub_AFB90+1577j
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B11DD
		cmp	[bp+var_B83], 0
		jz	short loc_B11E2

loc_B11DD:				; CODE XREF: sub_AFB90+1644j
		mov	ax, 1
		jmp	short loc_B11E4
; ���������������������������������������������������������������������������

loc_B11E2:				; CODE XREF: sub_AFB90+164Bj
		xor	ax, ax

loc_B11E4:				; CODE XREF: sub_AFB90+1650j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B11ED
		jmp	loc_B110A
; ���������������������������������������������������������������������������

loc_B11ED:				; CODE XREF: sub_AFB90+162Ej
					; sub_AFB90+1658j
		cmp	byte_495FC, 0
		jnz	short loc_B11F7
		jmp	loc_B17B8
; ���������������������������������������������������������������������������

loc_B11F7:				; CODE XREF: sub_AFB90+1662j
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B124A
		cmp	[bp+var_F0], 0
		jz	short loc_B124A
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B124A:				; CODE XREF: sub_AFB90+1697j
					; sub_AFB90+169Fj
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B1289
		cmp	[bp+var_E6], 0
		jz	short loc_B1289
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1289:				; CODE XREF: sub_AFB90+16D6j
					; sub_AFB90+16DEj
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B12C8
		cmp	[bp+var_DC], 0
		jz	short loc_B12C8
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B12C8:				; CODE XREF: sub_AFB90+1715j
					; sub_AFB90+171Dj
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B1307
		cmp	[bp+var_D2], 0
		jz	short loc_B1307
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1307:				; CODE XREF: sub_AFB90+1754j
					; sub_AFB90+175Cj
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B1346
		cmp	[bp+var_C8], 0
		jz	short loc_B1346
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1346:				; CODE XREF: sub_AFB90+1793j
					; sub_AFB90+179Bj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B1385
		cmp	[bp+var_BE], 0
		jz	short loc_B1385
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1385:				; CODE XREF: sub_AFB90+17D2j
					; sub_AFB90+17DAj
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B13C4
		cmp	[bp+var_B4], 0
		jz	short loc_B13C4
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B13C4:				; CODE XREF: sub_AFB90+1811j
					; sub_AFB90+1819j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B1403
		cmp	[bp+var_AA], 0
		jz	short loc_B1403
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1403:				; CODE XREF: sub_AFB90+1850j
					; sub_AFB90+1858j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B1442
		cmp	[bp+var_A0], 0
		jz	short loc_B1442
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1442:				; CODE XREF: sub_AFB90+188Fj
					; sub_AFB90+1897j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B1481
		cmp	[bp+var_96], 0
		jz	short loc_B1481
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1481:				; CODE XREF: sub_AFB90+18CEj
					; sub_AFB90+18D6j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B14CF
		cmp	[bp+var_86], 0
		jz	short loc_B14CF
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B14CF:				; CODE XREF: sub_AFB90+191Cj
					; sub_AFB90+1924j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B1517
		cmp	[bp+var_76], 0
		jz	short loc_B1517
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1517:				; CODE XREF: sub_AFB90+1967j
					; sub_AFB90+196Ej
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B155D
		cmp	[bp+var_66], 0
		jz	short loc_B155D
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B155D:				; CODE XREF: sub_AFB90+19ADj
					; sub_AFB90+19B4j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B15A3
		cmp	[bp+var_56], 0
		jz	short loc_B15A3
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B15A3:				; CODE XREF: sub_AFB90+19F3j
					; sub_AFB90+19FAj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B15E9
		cmp	[bp+var_46], 0
		jz	short loc_B15E9
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B15E9:				; CODE XREF: sub_AFB90+1A39j
					; sub_AFB90+1A40j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B1621
		cmp	[bp+var_3C], 0
		jz	short loc_B1621
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1621:				; CODE XREF: sub_AFB90+1A71j
					; sub_AFB90+1A78j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B1659
		cmp	[bp+var_32], 0
		jz	short loc_B1659
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1659:				; CODE XREF: sub_AFB90+1AA9j
					; sub_AFB90+1AB0j
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B16A8
		cmp	[bp+var_B36], 0
		jz	short loc_B16A8
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B16A8:				; CODE XREF: sub_AFB90+1AF5j
					; sub_AFB90+1AFDj
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B16F4
		cmp	[bp+var_31C], 0
		jz	short loc_B16F4
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B16F4:				; CODE XREF: sub_AFB90+1B41j
					; sub_AFB90+1B49j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B173E
		cmp	[bp+var_26], 0
		jz	short loc_B173E
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B173E:				; CODE XREF: sub_AFB90+1B8Ej
					; sub_AFB90+1B95j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B17B8:				; CODE XREF: sub_AFB90+1664j
		mov	[bp+var_4], 26h	; '&'
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B189E
; ���������������������������������������������������������������������������

loc_B17D9:				; CODE XREF: sub_AFB90+1D2Bj
		mov	di, [bp+var_B85]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_B17F8
		mov	ax, [bp+var_6]
		add	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B17F8:				; CODE XREF: sub_AFB90+1C52j
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B1842
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B1842:				; CODE XREF: sub_AFB90+1C6Ej
		jmp	short loc_B1891
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B1891
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B18BE
; ���������������������������������������������������������������������������

loc_B1891:				; CODE XREF: sub_AFB90:loc_B1842j
					; sub_AFB90+1CBBj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B189E:				; CODE XREF: sub_AFB90+1C46j
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B18AE
		cmp	[bp+var_B83], 0
		jz	short loc_B18B3

loc_B18AE:				; CODE XREF: sub_AFB90+1D15j
		mov	ax, 1
		jmp	short loc_B18B5
; ���������������������������������������������������������������������������

loc_B18B3:				; CODE XREF: sub_AFB90+1D1Cj
		xor	ax, ax

loc_B18B5:				; CODE XREF: sub_AFB90+1D21j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B18BE
		jmp	loc_B17D9
; ���������������������������������������������������������������������������

loc_B18BE:				; CODE XREF: sub_AFB90+1537j
					; sub_AFB90+1CFFj ...
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_B18D7
		jmp	loc_B1E89
; ���������������������������������������������������������������������������

loc_B18D7:				; CODE XREF: sub_AFB90+1D42j
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B191B
		cmp	[bp+var_F0], 0
		jz	short loc_B191B
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B191B:				; CODE XREF: sub_AFB90+1D68j
					; sub_AFB90+1D70j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B195A
		cmp	[bp+var_E6], 0
		jz	short loc_B195A
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B195A:				; CODE XREF: sub_AFB90+1DA7j
					; sub_AFB90+1DAFj
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B1999
		cmp	[bp+var_DC], 0
		jz	short loc_B1999
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1999:				; CODE XREF: sub_AFB90+1DE6j
					; sub_AFB90+1DEEj
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B19D8
		cmp	[bp+var_D2], 0
		jz	short loc_B19D8
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B19D8:				; CODE XREF: sub_AFB90+1E25j
					; sub_AFB90+1E2Dj
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B1A17
		cmp	[bp+var_C8], 0
		jz	short loc_B1A17
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1A17:				; CODE XREF: sub_AFB90+1E64j
					; sub_AFB90+1E6Cj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B1A56
		cmp	[bp+var_BE], 0
		jz	short loc_B1A56
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1A56:				; CODE XREF: sub_AFB90+1EA3j
					; sub_AFB90+1EABj
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B1A95
		cmp	[bp+var_B4], 0
		jz	short loc_B1A95
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1A95:				; CODE XREF: sub_AFB90+1EE2j
					; sub_AFB90+1EEAj
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B1AD4
		cmp	[bp+var_AA], 0
		jz	short loc_B1AD4
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1AD4:				; CODE XREF: sub_AFB90+1F21j
					; sub_AFB90+1F29j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B1B13
		cmp	[bp+var_A0], 0
		jz	short loc_B1B13
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1B13:				; CODE XREF: sub_AFB90+1F60j
					; sub_AFB90+1F68j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B1B52
		cmp	[bp+var_96], 0
		jz	short loc_B1B52
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1B52:				; CODE XREF: sub_AFB90+1F9Fj
					; sub_AFB90+1FA7j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B1BA0
		cmp	[bp+var_86], 0
		jz	short loc_B1BA0
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1BA0:				; CODE XREF: sub_AFB90+1FEDj
					; sub_AFB90+1FF5j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B1BE8
		cmp	[bp+var_76], 0
		jz	short loc_B1BE8
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1BE8:				; CODE XREF: sub_AFB90+2038j
					; sub_AFB90+203Fj
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B1C2E
		cmp	[bp+var_66], 0
		jz	short loc_B1C2E
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1C2E:				; CODE XREF: sub_AFB90+207Ej
					; sub_AFB90+2085j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B1C74
		cmp	[bp+var_56], 0
		jz	short loc_B1C74
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1C74:				; CODE XREF: sub_AFB90+20C4j
					; sub_AFB90+20CBj
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B1CBA
		cmp	[bp+var_46], 0
		jz	short loc_B1CBA
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1CBA:				; CODE XREF: sub_AFB90+210Aj
					; sub_AFB90+2111j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B1CF2
		cmp	[bp+var_3C], 0
		jz	short loc_B1CF2
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1CF2:				; CODE XREF: sub_AFB90+2142j
					; sub_AFB90+2149j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B1D2A
		cmp	[bp+var_32], 0
		jz	short loc_B1D2A
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1D2A:				; CODE XREF: sub_AFB90+217Aj
					; sub_AFB90+2181j
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B1D79
		cmp	[bp+var_B36], 0
		jz	short loc_B1D79
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1D79:				; CODE XREF: sub_AFB90+21C6j
					; sub_AFB90+21CEj
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B1DC5
		cmp	[bp+var_31C], 0
		jz	short loc_B1DC5
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1DC5:				; CODE XREF: sub_AFB90+2212j
					; sub_AFB90+221Aj
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B1E0F
		cmp	[bp+var_26], 0
		jz	short loc_B1E0F
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B1E0F:				; CODE XREF: sub_AFB90+225Fj
					; sub_AFB90+2266j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B1E89:				; CODE XREF: sub_AFB90+1D44j
		lea	ax, [bp+var_19C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C+2], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_10C], ax
		push	13h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	word ptr [bp+var_10C+2]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10C]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_B1F72
		jmp	loc_B27D3
; ���������������������������������������������������������������������������

loc_B1F72:				; CODE XREF: sub_AFB90+23DDj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112], 2
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_112+2],	0
		push	2
		lea	ax, [bp+var_116]
		push	ax
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_116]
		push	ax
		push	word ptr [bp+var_10C]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		xor	di, di
		jmp	short loc_B1FD6
; ���������������������������������������������������������������������������

loc_B1FC8:				; CODE XREF: sub_AFB90+2449j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B1FD6:				; CODE XREF: sub_AFB90+2436j
		cmp	di, 3
		jl	short loc_B1FC8
		xor	di, di
		jmp	short loc_B2048
; ���������������������������������������������������������������������������

loc_B1FDF:				; CODE XREF: sub_AFB90+24C6j
		cmp	di, 5
		jnz	short loc_B1FF2
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B1FF2:				; CODE XREF: sub_AFB90+2452j
		cmp	di, 6
		jnz	short loc_B2005
		push	0FFFFh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2005:				; CODE XREF: sub_AFB90+2465j
		cmp	di, 9
		jnz	short loc_B2018
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2018:				; CODE XREF: sub_AFB90+2478j
		mov	ax, di
		inc	di
		cmp	ax, 0Ah
		jnz	short loc_B202E
		push	13h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B202E:				; CODE XREF: sub_AFB90+248Ej
		jmp	short loc_B203B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B203B
		jmp	short loc_B2058
; ���������������������������������������������������������������������������

loc_B203B:				; CODE XREF: sub_AFB90:loc_B202Ej
					; sub_AFB90+24A7j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B2048:				; CODE XREF: sub_AFB90+244Dj
		push	word ptr [bp+var_10C]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_B1FDF

loc_B2058:				; CODE XREF: sub_AFB90+24A9j
		cmp	byte_495FC, 0
		jnz	short loc_B2062
		jmp	loc_B2662
; ���������������������������������������������������������������������������

loc_B2062:				; CODE XREF: sub_AFB90+24CDj
		cmp	byte ptr [bp+var_112+1], 0
		jz	short loc_B208A
		cmp	[bp+var_116], 0
		jz	short loc_B208A
		push	0
		mov	al, byte ptr [bp+var_112]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B208A:				; CODE XREF: sub_AFB90+24D7j
					; sub_AFB90+24DFj
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_112+2],	0
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B20F4
		cmp	[bp+var_F0], 0
		jz	short loc_B20F4
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B20F4:				; CODE XREF: sub_AFB90+2541j
					; sub_AFB90+2549j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B2133
		cmp	[bp+var_E6], 0
		jz	short loc_B2133
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2133:				; CODE XREF: sub_AFB90+2580j
					; sub_AFB90+2588j
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B2172
		cmp	[bp+var_DC], 0
		jz	short loc_B2172
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2172:				; CODE XREF: sub_AFB90+25BFj
					; sub_AFB90+25C7j
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B21B1
		cmp	[bp+var_D2], 0
		jz	short loc_B21B1
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B21B1:				; CODE XREF: sub_AFB90+25FEj
					; sub_AFB90+2606j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B21F0
		cmp	[bp+var_C8], 0
		jz	short loc_B21F0
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B21F0:				; CODE XREF: sub_AFB90+263Dj
					; sub_AFB90+2645j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B222F
		cmp	[bp+var_BE], 0
		jz	short loc_B222F
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B222F:				; CODE XREF: sub_AFB90+267Cj
					; sub_AFB90+2684j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B226E
		cmp	[bp+var_B4], 0
		jz	short loc_B226E
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B226E:				; CODE XREF: sub_AFB90+26BBj
					; sub_AFB90+26C3j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B22AD
		cmp	[bp+var_AA], 0
		jz	short loc_B22AD
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B22AD:				; CODE XREF: sub_AFB90+26FAj
					; sub_AFB90+2702j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B22EC
		cmp	[bp+var_A0], 0
		jz	short loc_B22EC
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B22EC:				; CODE XREF: sub_AFB90+2739j
					; sub_AFB90+2741j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B232B
		cmp	[bp+var_96], 0
		jz	short loc_B232B
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B232B:				; CODE XREF: sub_AFB90+2778j
					; sub_AFB90+2780j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B2379
		cmp	[bp+var_86], 0
		jz	short loc_B2379
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2379:				; CODE XREF: sub_AFB90+27C6j
					; sub_AFB90+27CEj
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B23C1
		cmp	[bp+var_76], 0
		jz	short loc_B23C1
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B23C1:				; CODE XREF: sub_AFB90+2811j
					; sub_AFB90+2818j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B2407
		cmp	[bp+var_66], 0
		jz	short loc_B2407
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2407:				; CODE XREF: sub_AFB90+2857j
					; sub_AFB90+285Ej
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B244D
		cmp	[bp+var_56], 0
		jz	short loc_B244D
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B244D:				; CODE XREF: sub_AFB90+289Dj
					; sub_AFB90+28A4j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B2493
		cmp	[bp+var_46], 0
		jz	short loc_B2493
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2493:				; CODE XREF: sub_AFB90+28E3j
					; sub_AFB90+28EAj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B24CB
		cmp	[bp+var_3C], 0
		jz	short loc_B24CB
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B24CB:				; CODE XREF: sub_AFB90+291Bj
					; sub_AFB90+2922j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B2503
		cmp	[bp+var_32], 0
		jz	short loc_B2503
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2503:				; CODE XREF: sub_AFB90+2953j
					; sub_AFB90+295Aj
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B2552
		cmp	[bp+var_B36], 0
		jz	short loc_B2552
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2552:				; CODE XREF: sub_AFB90+299Fj
					; sub_AFB90+29A7j
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B259E
		cmp	[bp+var_31C], 0
		jz	short loc_B259E
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B259E:				; CODE XREF: sub_AFB90+29EBj
					; sub_AFB90+29F3j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B25E8
		cmp	[bp+var_26], 0
		jz	short loc_B25E8
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B25E8:				; CODE XREF: sub_AFB90+2A38j
					; sub_AFB90+2A3Fj
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B2662:				; CODE XREF: sub_AFB90+24CFj
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C], 2
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11C+2],	0
		push	2
		lea	ax, [bp+var_120]
		push	ax
		push	3
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_120]
		push	ax
		push	word ptr [bp+var_10C]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		xor	di, di
		jmp	short loc_B26B9
; ���������������������������������������������������������������������������

loc_B26AB:				; CODE XREF: sub_AFB90+2B2Cj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B26B9:				; CODE XREF: sub_AFB90+2B19j
		cmp	di, 0Eh
		jl	short loc_B26AB
		xor	di, di
		jmp	short loc_B272B
; ���������������������������������������������������������������������������

loc_B26C2:				; CODE XREF: sub_AFB90+2BA9j
		cmp	di, 5
		jnz	short loc_B26D5
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B26D5:				; CODE XREF: sub_AFB90+2B35j
		cmp	di, 6
		jnz	short loc_B26E8
		push	0FFFFh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B26E8:				; CODE XREF: sub_AFB90+2B48j
		cmp	di, 9
		jnz	short loc_B26FB
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B26FB:				; CODE XREF: sub_AFB90+2B5Bj
		mov	ax, di
		inc	di
		cmp	ax, 0Ah
		jnz	short loc_B2711
		push	13h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2711:				; CODE XREF: sub_AFB90+2B71j
		jmp	short loc_B271E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B271E
		jmp	short loc_B273B
; ���������������������������������������������������������������������������

loc_B271E:				; CODE XREF: sub_AFB90:loc_B2711j
					; sub_AFB90+2B8Aj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B272B:				; CODE XREF: sub_AFB90+2B30j
		push	word ptr [bp+var_10C]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_B26C2

loc_B273B:				; CODE XREF: sub_AFB90+2B8Cj
		xor	di, di
		jmp	short loc_B274D
; ���������������������������������������������������������������������������

loc_B273F:				; CODE XREF: sub_AFB90+2BC0j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B274D:				; CODE XREF: sub_AFB90+2BADj
		cmp	di, 4
		jl	short loc_B273F
		cmp	byte ptr [bp+var_11C+1], 0
		jz	short loc_B277A
		cmp	[bp+var_120], 0
		jz	short loc_B277A
		push	0
		mov	al, byte ptr [bp+var_11C]
		push	ax
		lea	ax, [bp+var_120]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B277A:				; CODE XREF: sub_AFB90+2BC7j
					; sub_AFB90+2BCFj
		mov	[bp+var_120], 0
		mov	byte ptr [bp+var_11C+1], 0
		mov	[bp+var_11C+2],	0
		cmp	byte ptr [bp+var_112+1], 0
		jz	short loc_B27B9
		cmp	[bp+var_116], 0
		jz	short loc_B27B9
		push	0
		mov	al, byte ptr [bp+var_112]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B27B9:				; CODE XREF: sub_AFB90+2C06j
					; sub_AFB90+2C0Ej
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_112+2],	0
		jmp	loc_B30B4
; ���������������������������������������������������������������������������

loc_B27D3:				; CODE XREF: sub_AFB90+23DFj
		push	0E0h ; '�'
		push	[bp+var_B6C]
		mov	bx, [bp+var_B6C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 56h	; 'V'
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B2946
; ���������������������������������������������������������������������������

loc_B2807:				; CODE XREF: sub_AFB90+2DD3j
		mov	di, [bp+var_B85]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B282C
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B282C:				; CODE XREF: sub_AFB90+2C82j
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B2844
		push	276Fh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_B2844:				; CODE XREF: sub_AFB90+2CA3j
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, di
		jnz	short loc_B285B
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B285B:				; CODE XREF: sub_AFB90+2CBBj
		mov	ax, si
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_B2872
		push	0FFFFh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2872:				; CODE XREF: sub_AFB90+2CD2j
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_B2889
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2889:				; CODE XREF: sub_AFB90+2CE9j
		mov	ax, si
		add	ax, 14h
		cmp	ax, di
		jnz	short loc_B28A0
		push	13h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B28A0:				; CODE XREF: sub_AFB90+2D00j
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B28EA
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B28EA:				; CODE XREF: sub_AFB90+2D16j
		jmp	short loc_B2939
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B2939
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B2966
; ���������������������������������������������������������������������������

loc_B2939:				; CODE XREF: sub_AFB90:loc_B28EAj
					; sub_AFB90+2D63j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B2946:				; CODE XREF: sub_AFB90+2C74j
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B2956
		cmp	[bp+var_B83], 0
		jz	short loc_B295B

loc_B2956:				; CODE XREF: sub_AFB90+2DBDj
		mov	ax, 1
		jmp	short loc_B295D
; ���������������������������������������������������������������������������

loc_B295B:				; CODE XREF: sub_AFB90+2DC4j
		xor	ax, ax

loc_B295D:				; CODE XREF: sub_AFB90+2DC9j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B2966
		jmp	loc_B2807
; ���������������������������������������������������������������������������

loc_B2966:				; CODE XREF: sub_AFB90+2DA7j
					; sub_AFB90+2DD1j
		cmp	byte_495FC, 0
		jnz	short loc_B2970
		jmp	loc_B2F31
; ���������������������������������������������������������������������������

loc_B2970:				; CODE XREF: sub_AFB90+2DDBj
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B29C3
		cmp	[bp+var_F0], 0
		jz	short loc_B29C3
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B29C3:				; CODE XREF: sub_AFB90+2E10j
					; sub_AFB90+2E18j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B2A02
		cmp	[bp+var_E6], 0
		jz	short loc_B2A02
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2A02:				; CODE XREF: sub_AFB90+2E4Fj
					; sub_AFB90+2E57j
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B2A41
		cmp	[bp+var_DC], 0
		jz	short loc_B2A41
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2A41:				; CODE XREF: sub_AFB90+2E8Ej
					; sub_AFB90+2E96j
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B2A80
		cmp	[bp+var_D2], 0
		jz	short loc_B2A80
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2A80:				; CODE XREF: sub_AFB90+2ECDj
					; sub_AFB90+2ED5j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B2ABF
		cmp	[bp+var_C8], 0
		jz	short loc_B2ABF
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2ABF:				; CODE XREF: sub_AFB90+2F0Cj
					; sub_AFB90+2F14j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B2AFE
		cmp	[bp+var_BE], 0
		jz	short loc_B2AFE
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2AFE:				; CODE XREF: sub_AFB90+2F4Bj
					; sub_AFB90+2F53j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B2B3D
		cmp	[bp+var_B4], 0
		jz	short loc_B2B3D
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2B3D:				; CODE XREF: sub_AFB90+2F8Aj
					; sub_AFB90+2F92j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B2B7C
		cmp	[bp+var_AA], 0
		jz	short loc_B2B7C
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2B7C:				; CODE XREF: sub_AFB90+2FC9j
					; sub_AFB90+2FD1j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B2BBB
		cmp	[bp+var_A0], 0
		jz	short loc_B2BBB
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2BBB:				; CODE XREF: sub_AFB90+3008j
					; sub_AFB90+3010j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B2BFA
		cmp	[bp+var_96], 0
		jz	short loc_B2BFA
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2BFA:				; CODE XREF: sub_AFB90+3047j
					; sub_AFB90+304Fj
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B2C48
		cmp	[bp+var_86], 0
		jz	short loc_B2C48
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2C48:				; CODE XREF: sub_AFB90+3095j
					; sub_AFB90+309Dj
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B2C90
		cmp	[bp+var_76], 0
		jz	short loc_B2C90
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2C90:				; CODE XREF: sub_AFB90+30E0j
					; sub_AFB90+30E7j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B2CD6
		cmp	[bp+var_66], 0
		jz	short loc_B2CD6
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2CD6:				; CODE XREF: sub_AFB90+3126j
					; sub_AFB90+312Dj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B2D1C
		cmp	[bp+var_56], 0
		jz	short loc_B2D1C
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2D1C:				; CODE XREF: sub_AFB90+316Cj
					; sub_AFB90+3173j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B2D62
		cmp	[bp+var_46], 0
		jz	short loc_B2D62
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2D62:				; CODE XREF: sub_AFB90+31B2j
					; sub_AFB90+31B9j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B2D9A
		cmp	[bp+var_3C], 0
		jz	short loc_B2D9A
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2D9A:				; CODE XREF: sub_AFB90+31EAj
					; sub_AFB90+31F1j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B2DD2
		cmp	[bp+var_32], 0
		jz	short loc_B2DD2
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2DD2:				; CODE XREF: sub_AFB90+3222j
					; sub_AFB90+3229j
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B2E21
		cmp	[bp+var_B36], 0
		jz	short loc_B2E21
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2E21:				; CODE XREF: sub_AFB90+326Ej
					; sub_AFB90+3276j
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B2E6D
		cmp	[bp+var_31C], 0
		jz	short loc_B2E6D
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2E6D:				; CODE XREF: sub_AFB90+32BAj
					; sub_AFB90+32C2j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B2EB7
		cmp	[bp+var_26], 0
		jz	short loc_B2EB7
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B2EB7:				; CODE XREF: sub_AFB90+3307j
					; sub_AFB90+330Ej
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B2F31:				; CODE XREF: sub_AFB90+2DDDj
		mov	[bp+var_4], 3Ch	; '<'
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B3094
; ���������������������������������������������������������������������������

loc_B2F52:				; CODE XREF: sub_AFB90+3521j
		mov	di, [bp+var_B85]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B2F7A
		mov	ax, [bp+var_8]
		shl	ax, 1
		add	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B2F7A:				; CODE XREF: sub_AFB90+33CDj
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B2F92
		push	2796h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_B2F92:				; CODE XREF: sub_AFB90+33F1j
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, di
		jnz	short loc_B2FA9
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2FA9:				; CODE XREF: sub_AFB90+3409j
		mov	ax, si
		add	ax, 10h
		cmp	ax, di
		jnz	short loc_B2FC0
		push	0FFFFh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2FC0:				; CODE XREF: sub_AFB90+3420j
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_B2FD7
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2FD7:				; CODE XREF: sub_AFB90+3437j
		mov	ax, si
		add	ax, 14h
		cmp	ax, di
		jnz	short loc_B2FEE
		push	13h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B2FEE:				; CODE XREF: sub_AFB90+344Ej
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B3038
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B3038:				; CODE XREF: sub_AFB90+3464j
		jmp	short loc_B3087
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B3087
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B30B4
; ���������������������������������������������������������������������������

loc_B3087:				; CODE XREF: sub_AFB90:loc_B3038j
					; sub_AFB90+34B1j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B3094:				; CODE XREF: sub_AFB90+33BFj
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B30A4
		cmp	[bp+var_B83], 0
		jz	short loc_B30A9

loc_B30A4:				; CODE XREF: sub_AFB90+350Bj
		mov	ax, 1
		jmp	short loc_B30AB
; ���������������������������������������������������������������������������

loc_B30A9:				; CODE XREF: sub_AFB90+3512j
		xor	ax, ax

loc_B30AB:				; CODE XREF: sub_AFB90+3517j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B30B4
		jmp	loc_B2F52
; ���������������������������������������������������������������������������

loc_B30B4:				; CODE XREF: sub_AFB90+2C40j
					; sub_AFB90+34F5j ...
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_B30CD
		jmp	loc_B367F
; ���������������������������������������������������������������������������

loc_B30CD:				; CODE XREF: sub_AFB90+3538j
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B3111
		cmp	[bp+var_F0], 0
		jz	short loc_B3111
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3111:				; CODE XREF: sub_AFB90+355Ej
					; sub_AFB90+3566j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B3150
		cmp	[bp+var_E6], 0
		jz	short loc_B3150
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3150:				; CODE XREF: sub_AFB90+359Dj
					; sub_AFB90+35A5j
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B318F
		cmp	[bp+var_DC], 0
		jz	short loc_B318F
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B318F:				; CODE XREF: sub_AFB90+35DCj
					; sub_AFB90+35E4j
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B31CE
		cmp	[bp+var_D2], 0
		jz	short loc_B31CE
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B31CE:				; CODE XREF: sub_AFB90+361Bj
					; sub_AFB90+3623j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B320D
		cmp	[bp+var_C8], 0
		jz	short loc_B320D
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B320D:				; CODE XREF: sub_AFB90+365Aj
					; sub_AFB90+3662j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B324C
		cmp	[bp+var_BE], 0
		jz	short loc_B324C
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B324C:				; CODE XREF: sub_AFB90+3699j
					; sub_AFB90+36A1j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B328B
		cmp	[bp+var_B4], 0
		jz	short loc_B328B
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B328B:				; CODE XREF: sub_AFB90+36D8j
					; sub_AFB90+36E0j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B32CA
		cmp	[bp+var_AA], 0
		jz	short loc_B32CA
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B32CA:				; CODE XREF: sub_AFB90+3717j
					; sub_AFB90+371Fj
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B3309
		cmp	[bp+var_A0], 0
		jz	short loc_B3309
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3309:				; CODE XREF: sub_AFB90+3756j
					; sub_AFB90+375Ej
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B3348
		cmp	[bp+var_96], 0
		jz	short loc_B3348
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3348:				; CODE XREF: sub_AFB90+3795j
					; sub_AFB90+379Dj
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B3396
		cmp	[bp+var_86], 0
		jz	short loc_B3396
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3396:				; CODE XREF: sub_AFB90+37E3j
					; sub_AFB90+37EBj
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B33DE
		cmp	[bp+var_76], 0
		jz	short loc_B33DE
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B33DE:				; CODE XREF: sub_AFB90+382Ej
					; sub_AFB90+3835j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B3424
		cmp	[bp+var_66], 0
		jz	short loc_B3424
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3424:				; CODE XREF: sub_AFB90+3874j
					; sub_AFB90+387Bj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B346A
		cmp	[bp+var_56], 0
		jz	short loc_B346A
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B346A:				; CODE XREF: sub_AFB90+38BAj
					; sub_AFB90+38C1j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B34B0
		cmp	[bp+var_46], 0
		jz	short loc_B34B0
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B34B0:				; CODE XREF: sub_AFB90+3900j
					; sub_AFB90+3907j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B34E8
		cmp	[bp+var_3C], 0
		jz	short loc_B34E8
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B34E8:				; CODE XREF: sub_AFB90+3938j
					; sub_AFB90+393Fj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B3520
		cmp	[bp+var_32], 0
		jz	short loc_B3520
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3520:				; CODE XREF: sub_AFB90+3970j
					; sub_AFB90+3977j
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B356F
		cmp	[bp+var_B36], 0
		jz	short loc_B356F
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B356F:				; CODE XREF: sub_AFB90+39BCj
					; sub_AFB90+39C4j
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B35BB
		cmp	[bp+var_31C], 0
		jz	short loc_B35BB
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B35BB:				; CODE XREF: sub_AFB90+3A08j
					; sub_AFB90+3A10j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B3605
		cmp	[bp+var_26], 0
		jz	short loc_B3605
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3605:				; CODE XREF: sub_AFB90+3A55j
					; sub_AFB90+3A5Cj
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B367F:				; CODE XREF: sub_AFB90+353Aj
		lea	ax, [bp+var_19C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C+2], ax
		push	80h ; '�'
		push	0A4h ; '�'
		lea	ax, [bp+var_C8]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_10C], ax
		push	1Fh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	word ptr [bp+var_10C+2]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10C]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_B374F
		jmp	loc_B3897
; ���������������������������������������������������������������������������

loc_B374F:				; CODE XREF: sub_AFB90+3BBAj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112], 2
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_112+2],	0
		push	2
		lea	ax, [bp+var_116]
		push	ax
		push	4
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_B37B2
; ���������������������������������������������������������������������������

loc_B37A4:				; CODE XREF: sub_AFB90+3C25j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B37B2:				; CODE XREF: sub_AFB90+3C12j
		cmp	di, 4
		jl	short loc_B37A4
		push	0FFFFh
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_B3820
; ���������������������������������������������������������������������������

loc_B37CA:				; CODE XREF: sub_AFB90+3C9Fj
		cmp	di, 7
		jnz	short loc_B37DD
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B37DD:				; CODE XREF: sub_AFB90+3C3Dj
		cmp	di, 8
		jnz	short loc_B37F0
		push	15h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B37F0:				; CODE XREF: sub_AFB90+3C50j
		mov	ax, di
		inc	di
		cmp	ax, 11h
		jnz	short loc_B3806
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B3806:				; CODE XREF: sub_AFB90+3C66j
		jmp	short loc_B3813
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B3813
		jmp	short loc_B3831
; ���������������������������������������������������������������������������

loc_B3813:				; CODE XREF: sub_AFB90:loc_B3806j
					; sub_AFB90+3C7Fj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B3820:				; CODE XREF: sub_AFB90+3C38j
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_B37CA

loc_B3831:				; CODE XREF: sub_AFB90+3C81j
		xor	di, di
		jmp	short loc_B3843
; ���������������������������������������������������������������������������

loc_B3835:				; CODE XREF: sub_AFB90+3CB6j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B3843:				; CODE XREF: sub_AFB90+3CA3j
		cmp	di, 8
		jl	short loc_B3835
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_112+1], 0
		jz	short loc_B387D
		cmp	[bp+var_116], 0
		jz	short loc_B387D
		push	0
		mov	al, byte ptr [bp+var_112]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B387D:				; CODE XREF: sub_AFB90+3CCAj
					; sub_AFB90+3CD2j
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_112+2],	0
		jmp	loc_B39FC
; ���������������������������������������������������������������������������

loc_B3897:				; CODE XREF: sub_AFB90+3BBCj
		push	0E0h ; '�'
		push	[bp+var_B6C]
		mov	bx, [bp+var_B6C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 5Bh	; '['
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B39DC
; ���������������������������������������������������������������������������

loc_B38CB:				; CODE XREF: sub_AFB90+3E69j
		mov	di, [bp+var_B85]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B38F1
		mov	ax, [bp+var_8]
		shl	ax, 2
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B38F1:				; CODE XREF: sub_AFB90+3D46j
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_B3908
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B3908:				; CODE XREF: sub_AFB90+3D68j
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_B391F
		push	15h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B391F:				; CODE XREF: sub_AFB90+3D7Fj
		mov	ax, si
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_B3936
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B3936:				; CODE XREF: sub_AFB90+3D96j
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B3980
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B3980:				; CODE XREF: sub_AFB90+3DACj
		jmp	short loc_B39CF
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B39CF
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B39FC
; ���������������������������������������������������������������������������

loc_B39CF:				; CODE XREF: sub_AFB90:loc_B3980j
					; sub_AFB90+3DF9j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B39DC:				; CODE XREF: sub_AFB90+3D38j
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B39EC
		cmp	[bp+var_B83], 0
		jz	short loc_B39F1

loc_B39EC:				; CODE XREF: sub_AFB90+3E53j
		mov	ax, 1
		jmp	short loc_B39F3
; ���������������������������������������������������������������������������

loc_B39F1:				; CODE XREF: sub_AFB90+3E5Aj
		xor	ax, ax

loc_B39F3:				; CODE XREF: sub_AFB90+3E5Fj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B39FC
		jmp	loc_B38CB
; ���������������������������������������������������������������������������

loc_B39FC:				; CODE XREF: sub_AFB90+3D04j
					; sub_AFB90+3E3Dj ...
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_B3A15
		jmp	loc_B3FC7
; ���������������������������������������������������������������������������

loc_B3A15:				; CODE XREF: sub_AFB90+3E80j
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B3A59
		cmp	[bp+var_F0], 0
		jz	short loc_B3A59
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3A59:				; CODE XREF: sub_AFB90+3EA6j
					; sub_AFB90+3EAEj
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B3A98
		cmp	[bp+var_E6], 0
		jz	short loc_B3A98
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3A98:				; CODE XREF: sub_AFB90+3EE5j
					; sub_AFB90+3EEDj
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B3AD7
		cmp	[bp+var_DC], 0
		jz	short loc_B3AD7
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3AD7:				; CODE XREF: sub_AFB90+3F24j
					; sub_AFB90+3F2Cj
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B3B16
		cmp	[bp+var_D2], 0
		jz	short loc_B3B16
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3B16:				; CODE XREF: sub_AFB90+3F63j
					; sub_AFB90+3F6Bj
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B3B55
		cmp	[bp+var_C8], 0
		jz	short loc_B3B55
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3B55:				; CODE XREF: sub_AFB90+3FA2j
					; sub_AFB90+3FAAj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B3B94
		cmp	[bp+var_BE], 0
		jz	short loc_B3B94
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3B94:				; CODE XREF: sub_AFB90+3FE1j
					; sub_AFB90+3FE9j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B3BD3
		cmp	[bp+var_B4], 0
		jz	short loc_B3BD3
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3BD3:				; CODE XREF: sub_AFB90+4020j
					; sub_AFB90+4028j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B3C12
		cmp	[bp+var_AA], 0
		jz	short loc_B3C12
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3C12:				; CODE XREF: sub_AFB90+405Fj
					; sub_AFB90+4067j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B3C51
		cmp	[bp+var_A0], 0
		jz	short loc_B3C51
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3C51:				; CODE XREF: sub_AFB90+409Ej
					; sub_AFB90+40A6j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B3C90
		cmp	[bp+var_96], 0
		jz	short loc_B3C90
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3C90:				; CODE XREF: sub_AFB90+40DDj
					; sub_AFB90+40E5j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B3CDE
		cmp	[bp+var_86], 0
		jz	short loc_B3CDE
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3CDE:				; CODE XREF: sub_AFB90+412Bj
					; sub_AFB90+4133j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B3D26
		cmp	[bp+var_76], 0
		jz	short loc_B3D26
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3D26:				; CODE XREF: sub_AFB90+4176j
					; sub_AFB90+417Dj
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B3D6C
		cmp	[bp+var_66], 0
		jz	short loc_B3D6C
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3D6C:				; CODE XREF: sub_AFB90+41BCj
					; sub_AFB90+41C3j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B3DB2
		cmp	[bp+var_56], 0
		jz	short loc_B3DB2
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3DB2:				; CODE XREF: sub_AFB90+4202j
					; sub_AFB90+4209j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B3DF8
		cmp	[bp+var_46], 0
		jz	short loc_B3DF8
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3DF8:				; CODE XREF: sub_AFB90+4248j
					; sub_AFB90+424Fj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B3E30
		cmp	[bp+var_3C], 0
		jz	short loc_B3E30
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3E30:				; CODE XREF: sub_AFB90+4280j
					; sub_AFB90+4287j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B3E68
		cmp	[bp+var_32], 0
		jz	short loc_B3E68
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3E68:				; CODE XREF: sub_AFB90+42B8j
					; sub_AFB90+42BFj
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B3EB7
		cmp	[bp+var_B36], 0
		jz	short loc_B3EB7
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3EB7:				; CODE XREF: sub_AFB90+4304j
					; sub_AFB90+430Cj
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B3F03
		cmp	[bp+var_31C], 0
		jz	short loc_B3F03
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3F03:				; CODE XREF: sub_AFB90+4350j
					; sub_AFB90+4358j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B3F4D
		cmp	[bp+var_26], 0
		jz	short loc_B3F4D
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B3F4D:				; CODE XREF: sub_AFB90+439Dj
					; sub_AFB90+43A4j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B3FC7:				; CODE XREF: sub_AFB90+3E82j
		lea	ax, [bp+var_19C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C+2], ax
		push	80h ; '�'
		push	0FFh
		lea	ax, [bp+var_E6]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_10C], ax
		push	80h ; '�'
		push	5Fh ; '_'
		lea	ax, [bp+var_DC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp+var_10E], ax
		push	13h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	13h
		push	[bp+var_10E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	word ptr [bp+var_10C+2]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10C]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_10E]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_7C]
		mov	al, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_B40CE
		jmp	loc_B4279
; ���������������������������������������������������������������������������

loc_B40CE:				; CODE XREF: sub_AFB90+4539j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp+var_118],	0
		mov	byte ptr [bp+var_116+2], 2
		mov	byte ptr [bp+var_116+3], 0
		mov	[bp+var_112], 0
		push	2
		lea	ax, [bp+var_118]
		push	ax
		push	5
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_118]
		push	ax
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_B4131
; ���������������������������������������������������������������������������

loc_B4123:				; CODE XREF: sub_AFB90+45A4j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B4131:				; CODE XREF: sub_AFB90+4591j
		cmp	di, 4
		jl	short loc_B4123
		push	0FFFFh
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	loc_B41FF
; ���������������������������������������������������������������������������

loc_B414A:				; CODE XREF: sub_AFB90+4680j
		cmp	di, 7
		jnz	short loc_B415D
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B415D:				; CODE XREF: sub_AFB90+45BDj
		cmp	di, 8
		jnz	short loc_B4170
		push	15h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B4170:				; CODE XREF: sub_AFB90+45D0j
		cmp	di, 9
		jnz	short loc_B4183
		push	0FFFFh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B4183:				; CODE XREF: sub_AFB90+45E3j
		cmp	di, 10h
		jnz	short loc_B4196
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B4196:				; CODE XREF: sub_AFB90+45F6j
		cmp	di, 12h
		jnz	short loc_B41A9
		push	15h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B41A9:				; CODE XREF: sub_AFB90+4609j
		cmp	di, 2
		jnz	short loc_B41BC
		push	0Ch
		push	[bp+var_10E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B41BC:				; CODE XREF: sub_AFB90+461Cj
		cmp	di, 3
		jnz	short loc_B41CF
		push	15h
		push	[bp+var_10E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B41CF:				; CODE XREF: sub_AFB90+462Fj
		mov	ax, di
		inc	di
		cmp	ax, 16h
		jnz	short loc_B41E5
		push	0Ch
		push	[bp+var_10E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B41E5:				; CODE XREF: sub_AFB90+4645j
		jmp	short loc_B41F2
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B41F2
		jmp	short loc_B4213
; ���������������������������������������������������������������������������

loc_B41F2:				; CODE XREF: sub_AFB90:loc_B41E5j
					; sub_AFB90+465Ej
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B41FF:				; CODE XREF: sub_AFB90+45B7j
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_B4213
		jmp	loc_B414A
; ���������������������������������������������������������������������������

loc_B4213:				; CODE XREF: sub_AFB90+4660j
					; sub_AFB90+467Ej
		xor	di, di
		jmp	short loc_B4225
; ���������������������������������������������������������������������������

loc_B4217:				; CODE XREF: sub_AFB90+4698j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B4225:				; CODE XREF: sub_AFB90+4685j
		cmp	di, 8
		jl	short loc_B4217
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_116+3], 0
		jz	short loc_B425F
		cmp	dword ptr [bp+var_118],	0
		jz	short loc_B425F
		push	0
		mov	al, byte ptr [bp+var_116+2]
		push	ax
		lea	ax, [bp+var_118]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B425F:				; CODE XREF: sub_AFB90+46ACj
					; sub_AFB90+46B4j
		mov	dword ptr [bp+var_118],	0
		mov	byte ptr [bp+var_116+3], 0
		mov	[bp+var_112], 0
		jmp	loc_B4453
; ���������������������������������������������������������������������������

loc_B4279:				; CODE XREF: sub_AFB90+453Bj
		push	0E0h ; '�'
		push	[bp+var_B6C]
		mov	bx, [bp+var_B6C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 5Bh	; '['
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B4433
; ���������������������������������������������������������������������������

loc_B42AD:				; CODE XREF: sub_AFB90+48C0j
		mov	di, [bp+var_B85]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B42D5
		mov	ax, [bp+var_8]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B42D5:				; CODE XREF: sub_AFB90+4728j
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_B42EC
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B42EC:				; CODE XREF: sub_AFB90+474Cj
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_B4303
		push	15h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B4303:				; CODE XREF: sub_AFB90+4763j
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_B431A
		push	0FFFFh
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B431A:				; CODE XREF: sub_AFB90+477Aj
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_B4331
		push	0Ch
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B4331:				; CODE XREF: sub_AFB90+4791j
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, di
		jnz	short loc_B4348
		push	15h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B4348:				; CODE XREF: sub_AFB90+47A8j
		mov	ax, si
		add	ax, 7
		cmp	ax, di
		jnz	short loc_B435F
		push	0Ch
		push	[bp+var_10E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B435F:				; CODE XREF: sub_AFB90+47BFj
		mov	ax, si
		add	ax, 8
		cmp	ax, di
		jnz	short loc_B4376
		push	15h
		push	[bp+var_10E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B4376:				; CODE XREF: sub_AFB90+47D6j
		mov	ax, si
		add	ax, 20h	; ' '
		cmp	ax, di
		jnz	short loc_B438D
		push	0Ch
		push	[bp+var_10E]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_B438D:				; CODE XREF: sub_AFB90+47EDj
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B43D7
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B43D7:				; CODE XREF: sub_AFB90+4803j
		jmp	short loc_B4426
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B4426
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B4453
; ���������������������������������������������������������������������������

loc_B4426:				; CODE XREF: sub_AFB90:loc_B43D7j
					; sub_AFB90+4850j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B4433:				; CODE XREF: sub_AFB90+471Aj
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B4443
		cmp	[bp+var_B83], 0
		jz	short loc_B4448

loc_B4443:				; CODE XREF: sub_AFB90+48AAj
		mov	ax, 1
		jmp	short loc_B444A
; ���������������������������������������������������������������������������

loc_B4448:				; CODE XREF: sub_AFB90+48B1j
		xor	ax, ax

loc_B444A:				; CODE XREF: sub_AFB90+48B6j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4453
		jmp	loc_B42AD
; ���������������������������������������������������������������������������

loc_B4453:				; CODE XREF: sub_AFB90+46E6j
					; sub_AFB90+4894j ...
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_B446C
		jmp	loc_B4A1E
; ���������������������������������������������������������������������������

loc_B446C:				; CODE XREF: sub_AFB90+48D7j
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B44B0
		cmp	[bp+var_F0], 0
		jz	short loc_B44B0
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B44B0:				; CODE XREF: sub_AFB90+48FDj
					; sub_AFB90+4905j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B44EF
		cmp	[bp+var_E6], 0
		jz	short loc_B44EF
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B44EF:				; CODE XREF: sub_AFB90+493Cj
					; sub_AFB90+4944j
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B452E
		cmp	[bp+var_DC], 0
		jz	short loc_B452E
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B452E:				; CODE XREF: sub_AFB90+497Bj
					; sub_AFB90+4983j
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B456D
		cmp	[bp+var_D2], 0
		jz	short loc_B456D
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B456D:				; CODE XREF: sub_AFB90+49BAj
					; sub_AFB90+49C2j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B45AC
		cmp	[bp+var_C8], 0
		jz	short loc_B45AC
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B45AC:				; CODE XREF: sub_AFB90+49F9j
					; sub_AFB90+4A01j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B45EB
		cmp	[bp+var_BE], 0
		jz	short loc_B45EB
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B45EB:				; CODE XREF: sub_AFB90+4A38j
					; sub_AFB90+4A40j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B462A
		cmp	[bp+var_B4], 0
		jz	short loc_B462A
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B462A:				; CODE XREF: sub_AFB90+4A77j
					; sub_AFB90+4A7Fj
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B4669
		cmp	[bp+var_AA], 0
		jz	short loc_B4669
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4669:				; CODE XREF: sub_AFB90+4AB6j
					; sub_AFB90+4ABEj
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B46A8
		cmp	[bp+var_A0], 0
		jz	short loc_B46A8
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B46A8:				; CODE XREF: sub_AFB90+4AF5j
					; sub_AFB90+4AFDj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B46E7
		cmp	[bp+var_96], 0
		jz	short loc_B46E7
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B46E7:				; CODE XREF: sub_AFB90+4B34j
					; sub_AFB90+4B3Cj
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B4735
		cmp	[bp+var_86], 0
		jz	short loc_B4735
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4735:				; CODE XREF: sub_AFB90+4B82j
					; sub_AFB90+4B8Aj
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B477D
		cmp	[bp+var_76], 0
		jz	short loc_B477D
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B477D:				; CODE XREF: sub_AFB90+4BCDj
					; sub_AFB90+4BD4j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B47C3
		cmp	[bp+var_66], 0
		jz	short loc_B47C3
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B47C3:				; CODE XREF: sub_AFB90+4C13j
					; sub_AFB90+4C1Aj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B4809
		cmp	[bp+var_56], 0
		jz	short loc_B4809
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4809:				; CODE XREF: sub_AFB90+4C59j
					; sub_AFB90+4C60j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B484F
		cmp	[bp+var_46], 0
		jz	short loc_B484F
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B484F:				; CODE XREF: sub_AFB90+4C9Fj
					; sub_AFB90+4CA6j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B4887
		cmp	[bp+var_3C], 0
		jz	short loc_B4887
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4887:				; CODE XREF: sub_AFB90+4CD7j
					; sub_AFB90+4CDEj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B48BF
		cmp	[bp+var_32], 0
		jz	short loc_B48BF
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B48BF:				; CODE XREF: sub_AFB90+4D0Fj
					; sub_AFB90+4D16j
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B490E
		cmp	[bp+var_B36], 0
		jz	short loc_B490E
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B490E:				; CODE XREF: sub_AFB90+4D5Bj
					; sub_AFB90+4D63j
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B495A
		cmp	[bp+var_31C], 0
		jz	short loc_B495A
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B495A:				; CODE XREF: sub_AFB90+4DA7j
					; sub_AFB90+4DAFj
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B49A4
		cmp	[bp+var_26], 0
		jz	short loc_B49A4
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B49A4:				; CODE XREF: sub_AFB90+4DF4j
					; sub_AFB90+4DFBj
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B4A1E:				; CODE XREF: sub_AFB90+48D9j
		lea	ax, [bp+var_19C]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFE2h
		push	0
		lea	ax, [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C+2], ax
		push	80h ; '�'
		push	0A3h ; '�'
		lea	ax, [bp+var_D2]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_10C], ax
		push	19h
		push	word ptr [bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	word ptr [bp+var_10C+2]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10C]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
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
		jnz	short loc_B4AEE
		jmp	loc_B4BF8
; ���������������������������������������������������������������������������

loc_B4AEE:				; CODE XREF: sub_AFB90+4F59j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112], 2
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_112+2],	0
		push	2
		lea	ax, [bp+var_116]
		push	ax
		push	6
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_B4B51
; ���������������������������������������������������������������������������

loc_B4B43:				; CODE XREF: sub_AFB90+4FC4j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B4B51:				; CODE XREF: sub_AFB90+4FB1j
		cmp	di, 4
		jl	short loc_B4B43
		push	0FFFFh
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_B4B81
; ���������������������������������������������������������������������������

loc_B4B67:				; CODE XREF: sub_AFB90+5000j
		jmp	short loc_B4B74
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B4B74
		jmp	short loc_B4B92
; ���������������������������������������������������������������������������

loc_B4B74:				; CODE XREF: sub_AFB90:loc_B4B67j
					; sub_AFB90+4FE0j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B4B81:				; CODE XREF: sub_AFB90+4FD5j
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_B4B67

loc_B4B92:				; CODE XREF: sub_AFB90+4FE2j
		xor	di, di
		jmp	short loc_B4BA4
; ���������������������������������������������������������������������������

loc_B4B96:				; CODE XREF: sub_AFB90+5017j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B4BA4:				; CODE XREF: sub_AFB90+5004j
		cmp	di, 8
		jl	short loc_B4B96
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_112+1], 0
		jz	short loc_B4BDE
		cmp	[bp+var_116], 0
		jz	short loc_B4BDE
		push	0
		mov	al, byte ptr [bp+var_112]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4BDE:				; CODE XREF: sub_AFB90+502Bj
					; sub_AFB90+5033j
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_112+2],	0
		jmp	loc_B4D1A
; ���������������������������������������������������������������������������

loc_B4BF8:				; CODE XREF: sub_AFB90+4F5Bj
		push	0E0h ; '�'
		push	[bp+var_B6C]
		mov	bx, [bp+var_B6C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 50h	; 'P'
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B4CFA
; ���������������������������������������������������������������������������

loc_B4C2C:				; CODE XREF: sub_AFB90+5187j
		mov	di, [bp+var_B85]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B4C54
		mov	ax, [bp+var_8]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B4C54:				; CODE XREF: sub_AFB90+50A7j
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B4C9E
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B4C9E:				; CODE XREF: sub_AFB90+50CAj
		jmp	short loc_B4CED
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B4CED
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B4D1A
; ���������������������������������������������������������������������������

loc_B4CED:				; CODE XREF: sub_AFB90:loc_B4C9Ej
					; sub_AFB90+5117j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B4CFA:				; CODE XREF: sub_AFB90+5099j
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B4D0A
		cmp	[bp+var_B83], 0
		jz	short loc_B4D0F

loc_B4D0A:				; CODE XREF: sub_AFB90+5171j
		mov	ax, 1
		jmp	short loc_B4D11
; ���������������������������������������������������������������������������

loc_B4D0F:				; CODE XREF: sub_AFB90+5178j
		xor	ax, ax

loc_B4D11:				; CODE XREF: sub_AFB90+517Dj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4D1A
		jmp	loc_B4C2C
; ���������������������������������������������������������������������������

loc_B4D1A:				; CODE XREF: sub_AFB90+5065j
					; sub_AFB90+515Bj ...
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_B4D33
		jmp	loc_B52E5
; ���������������������������������������������������������������������������

loc_B4D33:				; CODE XREF: sub_AFB90+519Ej
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B4D77
		cmp	[bp+var_F0], 0
		jz	short loc_B4D77
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4D77:				; CODE XREF: sub_AFB90+51C4j
					; sub_AFB90+51CCj
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B4DB6
		cmp	[bp+var_E6], 0
		jz	short loc_B4DB6
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4DB6:				; CODE XREF: sub_AFB90+5203j
					; sub_AFB90+520Bj
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B4DF5
		cmp	[bp+var_DC], 0
		jz	short loc_B4DF5
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4DF5:				; CODE XREF: sub_AFB90+5242j
					; sub_AFB90+524Aj
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B4E34
		cmp	[bp+var_D2], 0
		jz	short loc_B4E34
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4E34:				; CODE XREF: sub_AFB90+5281j
					; sub_AFB90+5289j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B4E73
		cmp	[bp+var_C8], 0
		jz	short loc_B4E73
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4E73:				; CODE XREF: sub_AFB90+52C0j
					; sub_AFB90+52C8j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B4EB2
		cmp	[bp+var_BE], 0
		jz	short loc_B4EB2
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4EB2:				; CODE XREF: sub_AFB90+52FFj
					; sub_AFB90+5307j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B4EF1
		cmp	[bp+var_B4], 0
		jz	short loc_B4EF1
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4EF1:				; CODE XREF: sub_AFB90+533Ej
					; sub_AFB90+5346j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B4F30
		cmp	[bp+var_AA], 0
		jz	short loc_B4F30
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4F30:				; CODE XREF: sub_AFB90+537Dj
					; sub_AFB90+5385j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B4F6F
		cmp	[bp+var_A0], 0
		jz	short loc_B4F6F
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4F6F:				; CODE XREF: sub_AFB90+53BCj
					; sub_AFB90+53C4j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B4FAE
		cmp	[bp+var_96], 0
		jz	short loc_B4FAE
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4FAE:				; CODE XREF: sub_AFB90+53FBj
					; sub_AFB90+5403j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B4FFC
		cmp	[bp+var_86], 0
		jz	short loc_B4FFC
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B4FFC:				; CODE XREF: sub_AFB90+5449j
					; sub_AFB90+5451j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B5044
		cmp	[bp+var_76], 0
		jz	short loc_B5044
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5044:				; CODE XREF: sub_AFB90+5494j
					; sub_AFB90+549Bj
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B508A
		cmp	[bp+var_66], 0
		jz	short loc_B508A
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B508A:				; CODE XREF: sub_AFB90+54DAj
					; sub_AFB90+54E1j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B50D0
		cmp	[bp+var_56], 0
		jz	short loc_B50D0
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B50D0:				; CODE XREF: sub_AFB90+5520j
					; sub_AFB90+5527j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B5116
		cmp	[bp+var_46], 0
		jz	short loc_B5116
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5116:				; CODE XREF: sub_AFB90+5566j
					; sub_AFB90+556Dj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B514E
		cmp	[bp+var_3C], 0
		jz	short loc_B514E
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B514E:				; CODE XREF: sub_AFB90+559Ej
					; sub_AFB90+55A5j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B5186
		cmp	[bp+var_32], 0
		jz	short loc_B5186
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5186:				; CODE XREF: sub_AFB90+55D6j
					; sub_AFB90+55DDj
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B51D5
		cmp	[bp+var_B36], 0
		jz	short loc_B51D5
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B51D5:				; CODE XREF: sub_AFB90+5622j
					; sub_AFB90+562Aj
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B5221
		cmp	[bp+var_31C], 0
		jz	short loc_B5221
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5221:				; CODE XREF: sub_AFB90+566Ej
					; sub_AFB90+5676j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B526B
		cmp	[bp+var_26], 0
		jz	short loc_B526B
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B526B:				; CODE XREF: sub_AFB90+56BBj
					; sub_AFB90+56C2j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B52E5:				; CODE XREF: sub_AFB90+51A0j
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E], 2
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		push	3
		lea	ax, [bp+var_112]
		push	ax
		push	20h ; ' '
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11C], 0
		mov	byte ptr [bp+var_118], 2
		mov	byte ptr [bp+var_118+1], 0
		mov	[bp+var_116], 0
		push	3
		lea	ax, [bp+var_11C]
		push	ax
		push	1Ah
		lea	ax, [bp+var_222]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_19C]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_112]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_120+2], ax
		push	0
		push	0
		lea	ax, [bp+var_11C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_120], ax
		push	0
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0FDh ; '�'
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		push	word ptr [bp+var_120+2]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_120]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_8C]
		mov	al, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_8C]
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
		jnz	short loc_B5415
		jmp	loc_B557A
; ���������������������������������������������������������������������������

loc_B5415:				; CODE XREF: sub_AFB90+5880j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126], 2
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_126+2],	0
		push	2
		lea	ax, [bp+var_12A]
		push	ax
		push	7
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_12A]
		push	ax
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_B5478
; ���������������������������������������������������������������������������

loc_B546A:				; CODE XREF: sub_AFB90+58EBj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B5478:				; CODE XREF: sub_AFB90+58D8j
		cmp	di, 8
		jl	short loc_B546A
		push	0FFFFh
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_B54A8
; ���������������������������������������������������������������������������

loc_B548E:				; CODE XREF: sub_AFB90+5927j
		jmp	short loc_B549B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B549B
		jmp	short loc_B54B9
; ���������������������������������������������������������������������������

loc_B549B:				; CODE XREF: sub_AFB90:loc_B548Ej
					; sub_AFB90+5907j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B54A8:				; CODE XREF: sub_AFB90+58FCj
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_B548E

loc_B54B9:				; CODE XREF: sub_AFB90+5909j
		mov	[bp+var_134], 0
		mov	[bp+var_130], 2
		mov	[bp+var_12F], 0
		mov	[bp+var_12E], 0
		xor	di, di
		jmp	short loc_B54E7
; ���������������������������������������������������������������������������

loc_B54D9:				; CODE XREF: sub_AFB90+595Aj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_B54E7:				; CODE XREF: sub_AFB90+5947j
		cmp	di, 8
		jl	short loc_B54D9
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_12F], 0
		jz	short loc_B5521
		cmp	[bp+var_134], 0
		jz	short loc_B5521
		push	0
		mov	al, [bp+var_130]
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5521:				; CODE XREF: sub_AFB90+596Ej
					; sub_AFB90+5976j
		mov	[bp+var_134], 0
		mov	[bp+var_12F], 0
		mov	[bp+var_12E], 0
		cmp	byte ptr [bp+var_126+1], 0
		jz	short loc_B5560
		cmp	[bp+var_12A], 0
		jz	short loc_B5560
		push	0
		mov	al, byte ptr [bp+var_126]
		push	ax
		lea	ax, [bp+var_12A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5560:				; CODE XREF: sub_AFB90+59ADj
					; sub_AFB90+59B5j
		mov	[bp+var_12A], 0
		mov	byte ptr [bp+var_126+1], 0
		mov	[bp+var_126+2],	0
		jmp	loc_B5DDD
; ���������������������������������������������������������������������������

loc_B557A:				; CODE XREF: sub_AFB90+5882j
		mov	[bp+var_4], 28h	; '('
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B5669
; ���������������������������������������������������������������������������

loc_B559B:				; CODE XREF: sub_AFB90+5AF6j
		mov	di, [bp+var_B85]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_B55C3
		mov	ax, [bp+var_8]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B55C3:				; CODE XREF: sub_AFB90+5A16j
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B560D
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B560D:				; CODE XREF: sub_AFB90+5A39j
		jmp	short loc_B565C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B565C
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B5689
; ���������������������������������������������������������������������������

loc_B565C:				; CODE XREF: sub_AFB90:loc_B560Dj
					; sub_AFB90+5A86j
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B5669:				; CODE XREF: sub_AFB90+5A08j
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B5679
		cmp	[bp+var_B83], 0
		jz	short loc_B567E

loc_B5679:				; CODE XREF: sub_AFB90+5AE0j
		mov	ax, 1
		jmp	short loc_B5680
; ���������������������������������������������������������������������������

loc_B567E:				; CODE XREF: sub_AFB90+5AE7j
		xor	ax, ax

loc_B5680:				; CODE XREF: sub_AFB90+5AECj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B5689
		jmp	loc_B559B
; ���������������������������������������������������������������������������

loc_B5689:				; CODE XREF: sub_AFB90+5ACAj
					; sub_AFB90+5AF4j
		cmp	byte_495FC, 0
		jnz	short loc_B5693
		jmp	loc_B5CD2
; ���������������������������������������������������������������������������

loc_B5693:				; CODE XREF: sub_AFB90+5AFEj
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_118+1], 0
		jz	short loc_B56CA
		cmp	[bp+var_11C], 0
		jz	short loc_B56CA
		push	0
		mov	al, byte ptr [bp+var_118]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B56CA:				; CODE XREF: sub_AFB90+5B17j
					; sub_AFB90+5B1Fj
		mov	[bp+var_11C], 0
		mov	byte ptr [bp+var_118+1], 0
		mov	[bp+var_116], 0
		cmp	byte ptr [bp+var_10E+1], 0
		jz	short loc_B5709
		cmp	[bp+var_112], 0
		jz	short loc_B5709
		push	0
		mov	al, byte ptr [bp+var_10E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5709:				; CODE XREF: sub_AFB90+5B56j
					; sub_AFB90+5B5Ej
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B5764
		cmp	[bp+var_F0], 0
		jz	short loc_B5764
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5764:				; CODE XREF: sub_AFB90+5BB1j
					; sub_AFB90+5BB9j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B57A3
		cmp	[bp+var_E6], 0
		jz	short loc_B57A3
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B57A3:				; CODE XREF: sub_AFB90+5BF0j
					; sub_AFB90+5BF8j
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B57E2
		cmp	[bp+var_DC], 0
		jz	short loc_B57E2
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B57E2:				; CODE XREF: sub_AFB90+5C2Fj
					; sub_AFB90+5C37j
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B5821
		cmp	[bp+var_D2], 0
		jz	short loc_B5821
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5821:				; CODE XREF: sub_AFB90+5C6Ej
					; sub_AFB90+5C76j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B5860
		cmp	[bp+var_C8], 0
		jz	short loc_B5860
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5860:				; CODE XREF: sub_AFB90+5CADj
					; sub_AFB90+5CB5j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B589F
		cmp	[bp+var_BE], 0
		jz	short loc_B589F
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B589F:				; CODE XREF: sub_AFB90+5CECj
					; sub_AFB90+5CF4j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B58DE
		cmp	[bp+var_B4], 0
		jz	short loc_B58DE
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B58DE:				; CODE XREF: sub_AFB90+5D2Bj
					; sub_AFB90+5D33j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B591D
		cmp	[bp+var_AA], 0
		jz	short loc_B591D
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B591D:				; CODE XREF: sub_AFB90+5D6Aj
					; sub_AFB90+5D72j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B595C
		cmp	[bp+var_A0], 0
		jz	short loc_B595C
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B595C:				; CODE XREF: sub_AFB90+5DA9j
					; sub_AFB90+5DB1j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B599B
		cmp	[bp+var_96], 0
		jz	short loc_B599B
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B599B:				; CODE XREF: sub_AFB90+5DE8j
					; sub_AFB90+5DF0j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B59E9
		cmp	[bp+var_86], 0
		jz	short loc_B59E9
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B59E9:				; CODE XREF: sub_AFB90+5E36j
					; sub_AFB90+5E3Ej
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B5A31
		cmp	[bp+var_76], 0
		jz	short loc_B5A31
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5A31:				; CODE XREF: sub_AFB90+5E81j
					; sub_AFB90+5E88j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B5A77
		cmp	[bp+var_66], 0
		jz	short loc_B5A77
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5A77:				; CODE XREF: sub_AFB90+5EC7j
					; sub_AFB90+5ECEj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B5ABD
		cmp	[bp+var_56], 0
		jz	short loc_B5ABD
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5ABD:				; CODE XREF: sub_AFB90+5F0Dj
					; sub_AFB90+5F14j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B5B03
		cmp	[bp+var_46], 0
		jz	short loc_B5B03
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5B03:				; CODE XREF: sub_AFB90+5F53j
					; sub_AFB90+5F5Aj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B5B3B
		cmp	[bp+var_3C], 0
		jz	short loc_B5B3B
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5B3B:				; CODE XREF: sub_AFB90+5F8Bj
					; sub_AFB90+5F92j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B5B73
		cmp	[bp+var_32], 0
		jz	short loc_B5B73
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5B73:				; CODE XREF: sub_AFB90+5FC3j
					; sub_AFB90+5FCAj
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B5BC2
		cmp	[bp+var_B36], 0
		jz	short loc_B5BC2
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5BC2:				; CODE XREF: sub_AFB90+600Fj
					; sub_AFB90+6017j
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B5C0E
		cmp	[bp+var_31C], 0
		jz	short loc_B5C0E
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5C0E:				; CODE XREF: sub_AFB90+605Bj
					; sub_AFB90+6063j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B5C58
		cmp	[bp+var_26], 0
		jz	short loc_B5C58
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5C58:				; CODE XREF: sub_AFB90+60A8j
					; sub_AFB90+60AFj
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B5CD2:				; CODE XREF: sub_AFB90+5B00j
		mov	[bp+var_4], 52h	; 'R'
		mov	si, [bp+var_B85]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_B5DBD
; ���������������������������������������������������������������������������

loc_B5CF3:				; CODE XREF: sub_AFB90+624Aj
		mov	di, [bp+var_B85]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_B5D17
		mov	ax, [bp+var_8]
		shl	ax, 3
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B5D17:				; CODE XREF: sub_AFB90+616Cj
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, di
		jnz	short loc_B5D61
		mov	[bp+var_BAE], 11BCh
		mov	[bp+var_BAE], 11C8h
		mov	[bp+var_BAE], 11D8h
		mov	[bp+var_BAE], 11E8h
		mov	[bp+var_BAE], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BAE]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B5D61:				; CODE XREF: sub_AFB90+618Dj
		jmp	short loc_B5DB0
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B5DB0
		mov	word ptr [bp-0BBAh], 11BCh
		mov	word ptr [bp-0BBAh], 11C8h
		mov	word ptr [bp-0BBAh], 11D8h
		mov	word ptr [bp-0BBAh], 11E8h
		mov	word ptr [bp-0BBAh], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BBAh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_B5DDD
; ���������������������������������������������������������������������������

loc_B5DB0:				; CODE XREF: sub_AFB90:loc_B5D61j
					; sub_AFB90+61DAj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B5DBD:				; CODE XREF: sub_AFB90+6160j
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B5DCD
		cmp	[bp+var_B83], 0
		jz	short loc_B5DD2

loc_B5DCD:				; CODE XREF: sub_AFB90+6234j
		mov	ax, 1
		jmp	short loc_B5DD4
; ���������������������������������������������������������������������������

loc_B5DD2:				; CODE XREF: sub_AFB90+623Bj
		xor	ax, ax

loc_B5DD4:				; CODE XREF: sub_AFB90+6240j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B5DDD
		jmp	loc_B5CF3
; ���������������������������������������������������������������������������

loc_B5DDD:				; CODE XREF: sub_AFB90+59E7j
					; sub_AFB90+621Ej ...
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_118+1], 0
		jz	short loc_B5E14
		cmp	[bp+var_11C], 0
		jz	short loc_B5E14
		push	0
		mov	al, byte ptr [bp+var_118]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5E14:				; CODE XREF: sub_AFB90+6261j
					; sub_AFB90+6269j
		mov	[bp+var_11C], 0
		mov	byte ptr [bp+var_118+1], 0
		mov	[bp+var_116], 0
		cmp	byte ptr [bp+var_10E+1], 0
		jz	short loc_B5E53
		cmp	[bp+var_112], 0
		jz	short loc_B5E53
		push	0
		mov	al, byte ptr [bp+var_10E]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5E53:				; CODE XREF: sub_AFB90+62A0j
					; sub_AFB90+62A8j
		mov	[bp+var_112], 0
		mov	byte ptr [bp+var_10E+1], 0
		mov	[bp+var_10C], 0
		cmp	byte_495FC, 0
		jnz	short loc_B5E74
		jmp	loc_B6426
; ���������������������������������������������������������������������������

loc_B5E74:				; CODE XREF: sub_AFB90+62DFj
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B5EB8
		cmp	[bp+var_F0], 0
		jz	short loc_B5EB8
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5EB8:				; CODE XREF: sub_AFB90+6305j
					; sub_AFB90+630Dj
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B5EF7
		cmp	[bp+var_E6], 0
		jz	short loc_B5EF7
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5EF7:				; CODE XREF: sub_AFB90+6344j
					; sub_AFB90+634Cj
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B5F36
		cmp	[bp+var_DC], 0
		jz	short loc_B5F36
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5F36:				; CODE XREF: sub_AFB90+6383j
					; sub_AFB90+638Bj
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B5F75
		cmp	[bp+var_D2], 0
		jz	short loc_B5F75
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5F75:				; CODE XREF: sub_AFB90+63C2j
					; sub_AFB90+63CAj
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B5FB4
		cmp	[bp+var_C8], 0
		jz	short loc_B5FB4
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5FB4:				; CODE XREF: sub_AFB90+6401j
					; sub_AFB90+6409j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B5FF3
		cmp	[bp+var_BE], 0
		jz	short loc_B5FF3
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B5FF3:				; CODE XREF: sub_AFB90+6440j
					; sub_AFB90+6448j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B6032
		cmp	[bp+var_B4], 0
		jz	short loc_B6032
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6032:				; CODE XREF: sub_AFB90+647Fj
					; sub_AFB90+6487j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B6071
		cmp	[bp+var_AA], 0
		jz	short loc_B6071
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6071:				; CODE XREF: sub_AFB90+64BEj
					; sub_AFB90+64C6j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B60B0
		cmp	[bp+var_A0], 0
		jz	short loc_B60B0
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B60B0:				; CODE XREF: sub_AFB90+64FDj
					; sub_AFB90+6505j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B60EF
		cmp	[bp+var_96], 0
		jz	short loc_B60EF
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B60EF:				; CODE XREF: sub_AFB90+653Cj
					; sub_AFB90+6544j
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B613D
		cmp	[bp+var_86], 0
		jz	short loc_B613D
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B613D:				; CODE XREF: sub_AFB90+658Aj
					; sub_AFB90+6592j
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B6185
		cmp	[bp+var_76], 0
		jz	short loc_B6185
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6185:				; CODE XREF: sub_AFB90+65D5j
					; sub_AFB90+65DCj
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B61CB
		cmp	[bp+var_66], 0
		jz	short loc_B61CB
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B61CB:				; CODE XREF: sub_AFB90+661Bj
					; sub_AFB90+6622j
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B6211
		cmp	[bp+var_56], 0
		jz	short loc_B6211
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6211:				; CODE XREF: sub_AFB90+6661j
					; sub_AFB90+6668j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B6257
		cmp	[bp+var_46], 0
		jz	short loc_B6257
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6257:				; CODE XREF: sub_AFB90+66A7j
					; sub_AFB90+66AEj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B628F
		cmp	[bp+var_3C], 0
		jz	short loc_B628F
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B628F:				; CODE XREF: sub_AFB90+66DFj
					; sub_AFB90+66E6j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B62C7
		cmp	[bp+var_32], 0
		jz	short loc_B62C7
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B62C7:				; CODE XREF: sub_AFB90+6717j
					; sub_AFB90+671Ej
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B6316
		cmp	[bp+var_B36], 0
		jz	short loc_B6316
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6316:				; CODE XREF: sub_AFB90+6763j
					; sub_AFB90+676Bj
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B6362
		cmp	[bp+var_31C], 0
		jz	short loc_B6362
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6362:				; CODE XREF: sub_AFB90+67AFj
					; sub_AFB90+67B7j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B63AC
		cmp	[bp+var_26], 0
		jz	short loc_B63AC
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B63AC:				; CODE XREF: sub_AFB90+67FCj
					; sub_AFB90+6803j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
; ���������������������������������������������������������������������������

loc_B6426:				; CODE XREF: sub_AFB90+62E1j
		lea	ax, [bp+var_19C]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp+var_32]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C+2], ax
		push	0
		push	0
		lea	ax, [bp+var_A0]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10C], ax
		push	0
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_10E], ax
		push	0
		push	0
		lea	ax, [bp+var_B4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_112+2], ax
		push	0FFE8h
		push	0
		lea	ax, [bp+var_96]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_112], ax
		push	[bp+var_5C]
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_6C]
		mov	al, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_10C+2]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_112]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10C]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_10E]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_112+2]
		lea	ax, [bp+var_BA2]
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
		push	0
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0E9h ; '�'
		lea	ax, [bp+var_B80]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp+var_116+2], 0
		mov	word ptr [bp+var_116], 0
		mov	[bp+var_118], 1
		mov	word ptr [bp+var_11C+2], 0
		mov	word ptr [bp+var_11C], 0
		mov	[bp+var_2], 91h	; '�'
		mov	[bp+var_126], 0
		mov	[bp+var_122], 2
		mov	[bp+var_121], 0
		mov	[bp+var_120], 0
		mov	[bp+var_BAC], 0
		mov	[bp+var_BA8], 2
		mov	[bp+var_BA7], 0
		mov	[bp+var_BA6], 0
		mov	word ptr [bp+var_BB2+2], 0
		mov	[bp+var_BAE], 0FFFFh
		cmp	[bp+var_B], 0
		jnz	short loc_B65E4
		jmp	loc_B6663
; ���������������������������������������������������������������������������

loc_B65E4:				; CODE XREF: sub_AFB90+6A4Fj
		push	3
		lea	ax, [bp+var_126]
		push	ax
		push	4Ch ; 'L'
		lea	ax, [bp+var_312]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_BB2+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_126]
		push	ax
		lea	ax, [bp+var_BB2+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F3A
		mov	word ptr [bp+var_12A+2], ax
		mov	word ptr [bp+var_12A], 0
		cmp	word ptr [bp+var_BB2+2], 0
		jz	short loc_B6663
		push	[bp+var_BAE]
		mov	bx, word ptr [bp+var_BB2+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_12A]
		push	word ptr [bp+var_12A+2]
		push	[bp+var_BAE]
		mov	bx, word ptr [bp+var_BB2+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B6663:				; CODE XREF: sub_AFB90+6A51j
					; sub_AFB90+6AA1j
		mov	[bp+var_134], 0
		mov	[bp+var_130], 2
		mov	[bp+var_12F], 0
		mov	[bp+var_12E], 0
		cmp	[bp+var_A], 0
		jz	short loc_B66BA
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	2
		lea	ax, [bp+var_134]
		push	ax
		push	8
		lea	ax, [bp+var_29A]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_134]
		push	ax
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_7D11
		add	sp, 4

loc_B66BA:				; CODE XREF: sub_AFB90+6AF3j
		jmp	loc_B691B
; ���������������������������������������������������������������������������

loc_B66BD:				; CODE XREF: sub_AFB90+6DA8j
		mov	di, [bp+var_B85]
		cmp	di, 32h	; '2'
		jle	short loc_B66E3
		cmp	di, 8Ch	; '�'
		jge	short loc_B66E3
		mov	ax, [bp+var_118]
		mov	[bp+var_136], ax
		inc	[bp+var_118]
		mov	bx, word ptr [bp+var_112]
		mov	ax, [bp+var_136]
		mov	[bx+1Bh], ax

loc_B66E3:				; CODE XREF: sub_AFB90+6B34j
					; sub_AFB90+6B3Aj
		cmp	di, 6Eh	; 'n'
		jnz	short loc_B66F7
		push	9
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_B66F7:				; CODE XREF: sub_AFB90+6B56j
		cmp	di, 8Ch	; '�'
		jnz	short loc_B6728
		push	word ptr [bp+var_112]
		lea	ax, [bp+var_BA2]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_112], 0
		jz	short loc_B6728
		push	3
		push	word ptr [bp+var_112]
		mov	bx, word ptr [bp+var_112]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_B6728:				; CODE XREF: sub_AFB90+6B6Bj
					; sub_AFB90+6B83j
		mov	ax, word ptr [bp+var_11C+2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_B6748
		cmp	[bp+var_A], 0
		jz	short loc_B6748
		push	0FFFFh
		lea	ax, [bp+var_B46]
		push	ax
		call	sub_83FE
		add	sp, 4

loc_B6748:				; CODE XREF: sub_AFB90+6BA1j
					; sub_AFB90+6BA7j
		mov	ax, word ptr [bp+var_11C+2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_B6777
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B6777
		mov	ax, [bp+var_8]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B6777:				; CODE XREF: sub_AFB90+6BC1j
					; sub_AFB90+6BCAj
		mov	ax, word ptr [bp+var_11C+2]
		add	ax, 5
		cmp	ax, di
		jge	short loc_B67A4
		mov	ax, word ptr [bp+var_11C+2]
		add	ax, 0Ah
		cmp	ax, di
		jle	short loc_B67A4
		mov	ax, word ptr [bp+var_116+2]
		mov	[bp+var_138], ax
		inc	word ptr [bp+var_116+2]
		mov	bx, [bp+var_10E]
		mov	ax, [bp+var_138]
		mov	[bx+1Bh], ax

loc_B67A4:				; CODE XREF: sub_AFB90+6BF0j
					; sub_AFB90+6BFBj
		mov	ax, word ptr [bp+var_11C+2]
		add	ax, 0Dh
		cmp	ax, di
		jge	short loc_B67D1
		mov	ax, word ptr [bp+var_11C+2]
		add	ax, 12h
		cmp	ax, di
		jle	short loc_B67D1
		mov	ax, word ptr [bp+var_116]
		mov	[bp+var_13A], ax
		inc	word ptr [bp+var_116]
		mov	bx, word ptr [bp+var_112+2]
		mov	ax, [bp+var_13A]
		mov	[bx+1Bh], ax

loc_B67D1:				; CODE XREF: sub_AFB90+6C1Dj
					; sub_AFB90+6C28j
		mov	ax, word ptr [bp+var_11C]
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_B6800
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B6800
		mov	ax, [bp+var_8]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_B80]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_B6800:				; CODE XREF: sub_AFB90+6C4Aj
					; sub_AFB90+6C53j
		mov	ax, word ptr [bp+var_11C]
		add	ax, 19h
		cmp	ax, di
		jge	short loc_B682D
		mov	ax, word ptr [bp+var_11C]
		add	ax, 1Eh
		cmp	ax, di
		jle	short loc_B682D
		dec	word ptr [bp+var_116+2]
		mov	ax, word ptr [bp+var_116+2]
		mov	[bp+var_13C], ax
		mov	bx, [bp+var_10E]
		mov	ax, [bp+var_13C]
		mov	[bx+1Bh], ax

loc_B682D:				; CODE XREF: sub_AFB90+6C79j
					; sub_AFB90+6C84j
		mov	ax, word ptr [bp+var_11C]
		add	ax, 20h	; ' '
		cmp	ax, di
		jge	short loc_B6860
		mov	ax, word ptr [bp+var_11C]
		add	ax, 29h	; ')'
		cmp	ax, di
		jle	short loc_B6860
		test	di, 1
		jz	short loc_B6860
		dec	word ptr [bp+var_116]
		mov	ax, word ptr [bp+var_116]
		mov	[bp+var_13E], ax
		mov	bx, word ptr [bp+var_112+2]
		mov	ax, [bp+var_13E]
		mov	[bx+1Bh], ax

loc_B6860:				; CODE XREF: sub_AFB90+6CA6j
					; sub_AFB90+6CB1j ...
		mov	ax, word ptr [bp+var_11C]
		add	ax, 3Ch	; '<'
		cmp	ax, di
		jnz	short loc_B68B6
		mov	al, [bp+var_A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B68B6
		mov	[bp+var_BBC], 11BCh
		mov	[bp+var_BBC], 11C8h
		mov	[bp+var_BBC], 11D8h
		mov	[bp+var_BBC], 11E8h
		mov	[bp+var_BBC], 11FCh
		lea	ax, [bp+var_B7E]
		push	ax
		push	0
		push	[bp+var_B61]
		push	[bp+var_B63]
		push	[bp+var_B65]
		push	[bp+var_B67]
		lea	ax, [bp+var_BBC]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B68B6:				; CODE XREF: sub_AFB90+6CD9j
					; sub_AFB90+6CE2j
		jmp	short loc_B690E
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B690E
		mov	al, [bp-0Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B690C
		mov	word ptr [bp-0BC8h], 11BCh
		mov	word ptr [bp-0BC8h], 11C8h
		mov	word ptr [bp-0BC8h], 11D8h
		mov	word ptr [bp-0BC8h], 11E8h
		mov	word ptr [bp-0BC8h], 11FCh
		lea	ax, [bp-0B7Eh]
		push	ax
		push	0
		push	word ptr [bp-0B61h]
		push	word ptr [bp-0B63h]
		push	word ptr [bp-0B65h]
		push	word ptr [bp-0B67h]
		lea	ax, [bp-0BC8h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_B690C:				; CODE XREF: sub_AFB90+6D38j
		jmp	short loc_B693B
; ���������������������������������������������������������������������������

loc_B690E:				; CODE XREF: sub_AFB90:loc_B68B6j
					; sub_AFB90+6D2Fj
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B691B:				; CODE XREF: sub_AFB90:loc_B66BAj
		mov	ax, [bp+var_B85]
		cmp	ax, [bp+var_2]
		jnb	short loc_B692B
		cmp	[bp+var_B83], 0
		jz	short loc_B6930

loc_B692B:				; CODE XREF: sub_AFB90+6D92j
		mov	ax, 1
		jmp	short loc_B6932
; ���������������������������������������������������������������������������

loc_B6930:				; CODE XREF: sub_AFB90+6D99j
		xor	ax, ax

loc_B6932:				; CODE XREF: sub_AFB90+6D9Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B693B
		jmp	loc_B66BD
; ���������������������������������������������������������������������������

loc_B693B:				; CODE XREF: sub_AFB90:loc_B690Cj
					; sub_AFB90+6DA6j
		cmp	[bp+var_A], 0
		jz	short loc_B694E
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_B694E:				; CODE XREF: sub_AFB90+6DAFj
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		cmp	[bp+var_12F], 0
		jz	short loc_B698D
		cmp	[bp+var_134], 0
		jz	short loc_B698D
		push	0
		mov	al, [bp+var_130]
		push	ax
		lea	ax, [bp+var_134]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B698D:				; CODE XREF: sub_AFB90+6DDAj
					; sub_AFB90+6DE2j
		mov	[bp+var_134], 0
		mov	[bp+var_12F], 0
		mov	[bp+var_12E], 0
		lea	ax, [bp+var_BB2+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_BA7], 0
		jz	short loc_B69D9
		cmp	[bp+var_BAC], 0
		jz	short loc_B69D9
		push	0
		mov	al, [bp+var_BA8]
		push	ax
		lea	ax, [bp+var_BAC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B69D9:				; CODE XREF: sub_AFB90+6E26j
					; sub_AFB90+6E2Ej
		mov	[bp+var_BAC], 0
		mov	[bp+var_BA7], 0
		mov	[bp+var_BA6], 0
		cmp	[bp+var_121], 0
		jz	short loc_B6A18
		cmp	[bp+var_126], 0
		jz	short loc_B6A18
		push	0
		mov	al, [bp+var_122]
		push	ax
		lea	ax, [bp+var_126]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6A18:				; CODE XREF: sub_AFB90+6E65j
					; sub_AFB90+6E6Dj
		mov	[bp+var_126], 0
		mov	[bp+var_121], 0
		mov	[bp+var_120], 0
		push	0
		lea	ax, [bp+var_BA2]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_B7E]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_B5E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_EB], 0
		jz	short loc_B6A82
		cmp	[bp+var_F0], 0
		jz	short loc_B6A82
		push	0
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_F0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6A82:				; CODE XREF: sub_AFB90+6ECFj
					; sub_AFB90+6ED7j
		mov	[bp+var_F0], 0
		mov	[bp+var_EB], 0
		mov	[bp+var_EA], 0
		cmp	[bp+var_E1], 0
		jz	short loc_B6AC1
		cmp	[bp+var_E6], 0
		jz	short loc_B6AC1
		push	0
		mov	al, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6AC1:				; CODE XREF: sub_AFB90+6F0Ej
					; sub_AFB90+6F16j
		mov	[bp+var_E6], 0
		mov	[bp+var_E1], 0
		mov	[bp+var_E0], 0
		cmp	[bp+var_D7], 0
		jz	short loc_B6B00
		cmp	[bp+var_DC], 0
		jz	short loc_B6B00
		push	0
		mov	al, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6B00:				; CODE XREF: sub_AFB90+6F4Dj
					; sub_AFB90+6F55j
		mov	[bp+var_DC], 0
		mov	[bp+var_D7], 0
		mov	[bp+var_D6], 0
		cmp	[bp+var_CD], 0
		jz	short loc_B6B3F
		cmp	[bp+var_D2], 0
		jz	short loc_B6B3F
		push	0
		mov	al, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6B3F:				; CODE XREF: sub_AFB90+6F8Cj
					; sub_AFB90+6F94j
		mov	[bp+var_D2], 0
		mov	[bp+var_CD], 0
		mov	[bp+var_CC], 0
		cmp	[bp+var_C3], 0
		jz	short loc_B6B7E
		cmp	[bp+var_C8], 0
		jz	short loc_B6B7E
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6B7E:				; CODE XREF: sub_AFB90+6FCBj
					; sub_AFB90+6FD3j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		cmp	[bp+var_B9], 0
		jz	short loc_B6BBD
		cmp	[bp+var_BE], 0
		jz	short loc_B6BBD
		push	0
		mov	al, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6BBD:				; CODE XREF: sub_AFB90+700Aj
					; sub_AFB90+7012j
		mov	[bp+var_BE], 0
		mov	[bp+var_B9], 0
		mov	[bp+var_B8], 0
		cmp	[bp+var_AF], 0
		jz	short loc_B6BFC
		cmp	[bp+var_B4], 0
		jz	short loc_B6BFC
		push	0
		mov	al, [bp+var_B0]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6BFC:				; CODE XREF: sub_AFB90+7049j
					; sub_AFB90+7051j
		mov	[bp+var_B4], 0
		mov	[bp+var_AF], 0
		mov	[bp+var_AE], 0
		cmp	[bp+var_A5], 0
		jz	short loc_B6C3B
		cmp	[bp+var_AA], 0
		jz	short loc_B6C3B
		push	0
		mov	al, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6C3B:				; CODE XREF: sub_AFB90+7088j
					; sub_AFB90+7090j
		mov	[bp+var_AA], 0
		mov	[bp+var_A5], 0
		mov	[bp+var_A4], 0
		cmp	[bp+var_9B], 0
		jz	short loc_B6C7A
		cmp	[bp+var_A0], 0
		jz	short loc_B6C7A
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6C7A:				; CODE XREF: sub_AFB90+70C7j
					; sub_AFB90+70CFj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		cmp	[bp+var_91], 0
		jz	short loc_B6CB9
		cmp	[bp+var_96], 0
		jz	short loc_B6CB9
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6CB9:				; CODE XREF: sub_AFB90+7106j
					; sub_AFB90+710Ej
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0
		push	2
		lea	ax, [bp+var_8C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_81], 0
		jz	short loc_B6D07
		cmp	[bp+var_86], 0
		jz	short loc_B6D07
		push	0
		mov	al, [bp+var_82]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6D07:				; CODE XREF: sub_AFB90+7154j
					; sub_AFB90+715Cj
		mov	[bp+var_86], 0
		mov	[bp+var_81], 0
		mov	[bp+var_80], 0
		push	2
		lea	ax, [bp+var_7C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_71], 0
		jz	short loc_B6D4F
		cmp	[bp+var_76], 0
		jz	short loc_B6D4F
		push	0
		mov	al, [bp+var_72]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6D4F:				; CODE XREF: sub_AFB90+719Fj
					; sub_AFB90+71A6j
		mov	[bp+var_76], 0
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_61], 0
		jz	short loc_B6D95
		cmp	[bp+var_66], 0
		jz	short loc_B6D95
		push	0
		mov	al, [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6D95:				; CODE XREF: sub_AFB90+71E5j
					; sub_AFB90+71ECj
		mov	[bp+var_66], 0
		mov	[bp+var_61], 0
		mov	[bp+var_60], 0
		push	2
		lea	ax, [bp+var_5C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_51], 0
		jz	short loc_B6DDB
		cmp	[bp+var_56], 0
		jz	short loc_B6DDB
		push	0
		mov	al, [bp+var_52]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6DDB:				; CODE XREF: sub_AFB90+722Bj
					; sub_AFB90+7232j
		mov	[bp+var_56], 0
		mov	[bp+var_51], 0
		mov	[bp+var_50], 0
		push	2
		lea	ax, [bp+var_4C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_41], 0
		jz	short loc_B6E21
		cmp	[bp+var_46], 0
		jz	short loc_B6E21
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6E21:				; CODE XREF: sub_AFB90+7271j
					; sub_AFB90+7278j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_B6E59
		cmp	[bp+var_3C], 0
		jz	short loc_B6E59
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6E59:				; CODE XREF: sub_AFB90+72A9j
					; sub_AFB90+72B0j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_2D], 0
		jz	short loc_B6E91
		cmp	[bp+var_32], 0
		jz	short loc_B6E91
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6E91:				; CODE XREF: sub_AFB90+72E1j
					; sub_AFB90+72E8j
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		mov	[bp+var_B46], 185Fh
		lea	ax, [bp+var_B46]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_B31], 0
		jz	short loc_B6EE0
		cmp	[bp+var_B36], 0
		jz	short loc_B6EE0
		push	0
		mov	al, [bp+var_B32]
		push	ax
		lea	ax, [bp+var_B36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6EE0:				; CODE XREF: sub_AFB90+732Dj
					; sub_AFB90+7335j
		mov	[bp+var_B36], 0
		mov	[bp+var_B31], 0
		mov	[bp+var_B30], 0
		lea	ax, [bp+var_320]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_317], 0
		jz	short loc_B6F2C
		cmp	[bp+var_31C], 0
		jz	short loc_B6F2C
		push	0
		mov	al, [bp+var_318]
		push	ax
		lea	ax, [bp+var_31C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6F2C:				; CODE XREF: sub_AFB90+7379j
					; sub_AFB90+7381j
		mov	[bp+var_31C], 0
		mov	[bp+var_317], 0
		mov	[bp+var_316], 0
		push	2
		lea	ax, [bp+var_312]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_B6F76
		cmp	[bp+var_26], 0
		jz	short loc_B6F76
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B6F76:				; CODE XREF: sub_AFB90+73C6j
					; sub_AFB90+73CDj
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_29A]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_222]
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
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_19C]
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
sub_AFB90	endp

ovr208		ends
