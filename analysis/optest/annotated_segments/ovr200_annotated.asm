ovr200		segment	para public 'OVERLAY' use16
		assume cs:ovr200
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_768F0	proc far		; CODE XREF: sub_42470J

var_CBC		= word ptr -0CBCh
var_C8C		= word ptr -0C8Ch
var_C6E		= word ptr -0C6Eh
var_C6C		= word ptr -0C6Ch
var_C6A		= dword	ptr -0C6Ah
var_C66		= byte ptr -0C66h
var_C65		= byte ptr -0C65h
var_C64		= dword	ptr -0C64h
var_C5F		= dword	ptr -0C5Fh
var_C5B		= dword	ptr -0C5Bh
var_C57		= dword	ptr -0C57h
var_C52		= word ptr -0C52h
var_C50		= word ptr -0C50h
var_C4E		= dword	ptr -0C4Eh
var_C4A		= word ptr -0C4Ah
var_C46		= dword	ptr -0C46h
var_C42		= word ptr -0C42h
var_C40		= dword	ptr -0C40h
var_C3C		= byte ptr -0C3Ch
var_C3B		= byte ptr -0C3Bh
var_C3A		= dword	ptr -0C3Ah
var_C36		= word ptr -0C36h
var_C19		= word ptr -0C19h
var_C17		= byte ptr -0C17h
var_C14		= word ptr -0C14h
var_C12		= word ptr -0C12h
var_C04		= dword	ptr -0C04h
var_C00		= byte ptr -0C00h
var_BFF		= byte ptr -0BFFh
var_BFE		= dword	ptr -0BFEh
var_3F7		= dword	ptr -3F7h
var_3F3		= dword	ptr -3F3h
var_3EE		= word ptr -3EEh
var_3EC		= word ptr -3ECh
var_3EA		= dword	ptr -3EAh
var_3E6		= byte ptr -3E6h
var_3E5		= byte ptr -3E5h
var_3E4		= dword	ptr -3E4h
var_3E0		= word ptr -3E0h
var_368		= word ptr -368h
var_2F0		= word ptr -2F0h
var_278		= word ptr -278h
var_200		= word ptr -200h
var_1FE		= word ptr -1FEh
var_1EC		= word ptr -1ECh
var_1E7		= word ptr -1E7h
var_1E5		= word ptr -1E5h
var_1E3		= word ptr -1E3h
var_1E1		= word ptr -1E1h
var_1DE		= word ptr -1DEh
var_1C6		= word ptr -1C6h
var_1C4		= word ptr -1C4h
var_1C2		= word ptr -1C2h
var_1C0		= word ptr -1C0h
var_1BE		= word ptr -1BEh
var_1BC		= word ptr -1BCh
var_1B8		= word ptr -1B8h
var_1B6		= word ptr -1B6h
var_1B4		= word ptr -1B4h
var_1B2		= word ptr -1B2h
var_1B0		= word ptr -1B0h
var_1AE		= word ptr -1AEh
var_1AA		= word ptr -1AAh
var_15A		= word ptr -15Ah
var_158		= word ptr -158h
var_156		= dword	ptr -156h
var_152		= word ptr -152h
var_150		= dword	ptr -150h
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= word ptr -140h
var_13E		= dword	ptr -13Eh
var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= dword	ptr -132h
var_12D		= byte ptr -12Dh
var_12C		= dword	ptr -12Ch
var_128		= word ptr -128h
var_126		= dword	ptr -126h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= dword	ptr -11Ah
var_116		= dword	ptr -116h
var_112		= word ptr -112h
var_110		= dword	ptr -110h
var_10C		= word ptr -10Ch
var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= word ptr -102h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= byte ptr -0F8h
var_F7		= byte ptr -0F7h
var_F6		= dword	ptr -0F6h
var_F2		= word ptr -0F2h
var_F0		= word ptr -0F0h
var_EE		= word ptr -0EEh
var_EC		= byte ptr -0ECh
var_EB		= word ptr -0EBh
var_E8		= dword	ptr -0E8h
var_E4		= byte ptr -0E4h
var_E3		= byte ptr -0E3h
var_E2		= dword	ptr -0E2h
var_DE		= word ptr -0DEh
var_DC		= byte ptr -0DCh
var_DB		= word ptr -0DBh
var_D8		= dword	ptr -0D8h
var_D4		= byte ptr -0D4h
var_D3		= byte ptr -0D3h
var_D2		= dword	ptr -0D2h
var_CE		= word ptr -0CEh
var_CC		= byte ptr -0CCh
var_CB		= word ptr -0CBh
var_C8		= dword	ptr -0C8h
var_C4		= byte ptr -0C4h
var_C3		= byte ptr -0C3h
var_C2		= dword	ptr -0C2h
var_BE		= word ptr -0BEh
var_BC		= byte ptr -0BCh
var_BB		= word ptr -0BBh
var_B8		= dword	ptr -0B8h
var_B4		= byte ptr -0B4h
var_B3		= byte ptr -0B3h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= byte ptr -0AAh
var_A9		= byte ptr -0A9h
var_A8		= dword	ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= byte ptr -0A2h
var_A1		= word ptr -0A1h
var_9E		= dword	ptr -9Eh
var_9A		= byte ptr -9Ah
var_99		= byte ptr -99h
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= byte ptr -90h
var_8F		= byte ptr -8Fh
var_8E		= dword	ptr -8Eh
var_8A		= word ptr -8Ah
var_88		= byte ptr -88h
var_87		= word ptr -87h
var_84		= dword	ptr -84h
var_80		= byte ptr -80h
var_7F		= byte ptr -7Fh
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= byte ptr -76h
var_75		= byte ptr -75h
var_74		= dword	ptr -74h
var_70		= word ptr -70h
var_6E		= byte ptr -6Eh
var_6D		= word ptr -6Dh
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
var_50		= dword	ptr -50h
var_4C		= byte ptr -4Ch
var_4B		= byte ptr -4Bh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_42		= byte ptr -42h
var_40		= dword	ptr -40h
var_3C		= byte ptr -3Ch
var_3B		= byte ptr -3Bh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h
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
		sub	sp, 0CBCh
		push	si
		push	di
		mov	[bp+var_2], 2002h
		mov	[bp+var_6], 0
		push	0C8h ; '�'
		push	13h
		lea	ax, [bp+var_8]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	[bp+var_9], 0
		mov	[bp+var_A], 0
		mov	[bp+var_B], 0
		cmp	word_4684B, 0
		jz	short loc_7692B
		mov	[bp+var_A], 1

loc_7692B:				; CODE XREF: sub_768F0+35j
		mov	byte_495FC, 0
		mov	ax, word_46F46
		mov	[bp+var_E], ax
		mov	[bp+var_1B8], 0
		mov	[bp+var_1B6], 0
		push	[bp+var_E]
		lea	ax, [bp+var_1B8]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_1C6], 0
		mov	[bp+var_1C4], 0
		mov	[bp+var_1C2], 0
		mov	[bp+var_1C0], 0
		mov	[bp+var_1BE], 13Fh
		mov	[bp+var_1BC], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		mov	[bp+var_1B4], 0
		mov	[bp+var_1B2], 18h
		mov	[bp+var_1B0], 13Fh
		mov	[bp+var_1AE], 97h ; '�'
		push	100h
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	byte ptr [bp+var_18], 0
		mov	byte ptr [bp+var_18+1],	0
		mov	[bp+var_16], 0
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aConvfont_0 ; "convfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_1AA]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		mov	eax, [bp+var_26]
		mov	[bp+var_22], eax
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 1
		mov	[bp+var_1C], 0
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_2E], 0
		mov	[bp+var_2C], 98h ; '�'
		mov	[bp+var_2A], 13Fh
		mov	[bp+var_28], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_30], ax
		lea	ax, [bp+var_1DE]
		push	ax
		push	[bp+var_30]
		lea	ax, [bp+var_200]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_200], 1218h
		mov	ax, [bp+var_2C]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_2A]
		mov	[bp+var_34], ax
		mov	ax, [bp+var_28]
		mov	[bp+var_36], ax
		mov	ax, [bp+var_2E]
		mov	[bp+var_1E7], ax
		mov	ax, [bp+var_32]
		mov	[bp+var_1E5], ax
		mov	ax, [bp+var_34]
		mov	[bp+var_1E3], ax
		mov	ax, [bp+var_36]
		mov	[bp+var_1E1], ax
		push	0
		lea	ax, [bp+var_200]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_200]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid5	; "mid5"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_11 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid5voc	; "mid5voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_A], 0
		jz	short loc_76B5B
		push	ds
		lea	ax, [bp+var_1AA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_76B5B
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_368]
		push	ax
		mov	bx, [bp+var_368]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_76B5F
; ���������������������������������������������������������������������������

loc_76B5B:				; CODE XREF: sub_768F0+23Fj
					; sub_768F0+251j
		mov	[bp+var_A], 0

loc_76B5F:				; CODE XREF: sub_768F0+269j
		mov	[bp+var_40], 0
		mov	[bp+var_3C], 2
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		mov	al, byte_46848
		mov	[bp+var_42], al
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_42]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_76B9F
		cmp	ax, 2
		jnz	short loc_76B9C
		jmp	loc_76D15
; ���������������������������������������������������������������������������

loc_76B9C:				; CODE XREF: sub_768F0+2A7j
		jmp	loc_76E8A
; ���������������������������������������������������������������������������

loc_76B9F:				; CODE XREF: sub_768F0+2A2j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1AA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_76BCD
		jmp	loc_76CD4
; ���������������������������������������������������������������������������

loc_76BCD:				; CODE XREF: sub_768F0+2D8j
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_3E0]
		push	ax
		mov	bx, [bp+var_3E0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_12 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_CBC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_CBC], 556h
		mov	[bp+var_C5B], 100h
		mov	[bp+var_C5F], 0
		mov	[bp+var_CBC], 56Eh
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_CBC]
		push	ax
		mov	bx, [bp+var_CBC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	word ptr [bp+var_F6+2],	1
		jmp	short loc_76C9A
; ���������������������������������������������������������������������������

loc_76C7F:				; CODE XREF: sub_768F0+3AFj
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, word ptr [bp+var_F6+2]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	word ptr [bp+var_F6+2]

loc_76C9A:				; CODE XREF: sub_768F0+38Dj
		cmp	word ptr [bp+var_F6+2],	6Ah ; 'j'
		jle	short loc_76C7F
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_CBC], 56Eh
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_CBC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_76CD4:				; CODE XREF: sub_768F0+2DAj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1AA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_76D12
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_76D12
		mov	word_48F76, 5Ah	; 'Z'

loc_76D12:				; CODE XREF: sub_768F0+40Dj
					; sub_768F0+41Aj
		jmp	loc_76E8A
; ���������������������������������������������������������������������������

loc_76D15:				; CODE XREF: sub_768F0+2A9j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1AA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_76D43
		jmp	loc_76E4A
; ���������������������������������������������������������������������������

loc_76D43:				; CODE XREF: sub_768F0+44Ej
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_3E0]
		push	ax
		mov	bx, [bp+var_3E0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_13 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_CBC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_CBC], 556h
		mov	[bp+var_C5B], 100h
		mov	[bp+var_C5F], 0
		mov	[bp+var_CBC], 56Eh
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_CBC]
		push	ax
		mov	bx, [bp+var_CBC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	word ptr [bp+var_F6+2],	1
		jmp	short loc_76E10
; ���������������������������������������������������������������������������

loc_76DF5:				; CODE XREF: sub_768F0+525j
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, word ptr [bp+var_F6+2]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	word ptr [bp+var_F6+2]

loc_76E10:				; CODE XREF: sub_768F0+503j
		cmp	word ptr [bp+var_F6+2],	6Ah ; 'j'
		jle	short loc_76DF5
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B], 1
		mov	[bp+var_CBC], 56Eh
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_CBC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_76E4A:				; CODE XREF: sub_768F0+450j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_1AA]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_76E88
		mov	[bp+var_9], 1
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_76E88
		mov	word_48F76, 0FFh

loc_76E88:				; CODE XREF: sub_768F0+583j
					; sub_768F0+590j
		jmp	short $+2

loc_76E8A:				; CODE XREF: sub_768F0:loc_76B9Cj
					; sub_768F0:loc_76D12j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E6], 2
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		mov	[bp+var_3EE], 0
		mov	[bp+var_3EC], 0FFFFh
		cmp	[bp+var_9], 0
		jz	short loc_76F2B
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_C8C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_A], 0
		jz	short loc_76ED9
		mov	byte ptr [bp+var_F6+3],	5
		jmp	short loc_76EDE
; ���������������������������������������������������������������������������

loc_76ED9:				; CODE XREF: sub_768F0+5E0j
		mov	byte ptr [bp+var_F6+3],	4

loc_76EDE:				; CODE XREF: sub_768F0+5E7j
		push	3
		lea	ax, [bp+var_40]
		push	ax
		mov	al, byte ptr [bp+var_F6+3]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_C8C]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_3EE]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_3EE]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_C8C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_76F2B:				; CODE XREF: sub_768F0+5C6j
		mov	[bp+var_C14], 185Fh
		mov	[bp+var_C04], 0
		mov	[bp+var_C00], 2
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		mov	[bp+var_C12], 0
		mov	[bp+var_C14], 186Fh
		xor	eax, eax
		mov	[bp+var_3F7], eax
		mov	[bp+var_3F3], eax
		cmp	[bp+var_A], 0
		jz	short loc_76F80
		push	word_4684B
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_77198
; ���������������������������������������������������������������������������

loc_76F80:				; CODE XREF: sub_768F0+67Aj
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_14 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_1AA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_CBC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_CBC], 556h
		mov	[bp+var_C5B], 100h
		mov	[bp+var_C5F], 0
		mov	[bp+var_CBC], 56Eh
		push	1
		lea	ax, [bp+var_1AA]
		push	ax
		lea	ax, [bp+var_CBC]
		push	ax
		mov	bx, [bp+var_CBC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3530474Dh
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		mov	word ptr [bp+var_F6+2],	0
		jmp	short loc_7705A
; ���������������������������������������������������������������������������

loc_7700C:				; CODE XREF: sub_768F0+76Fj
		push	1
		push	large 54584554h
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_C4A]
		mov	word ptr [bp+var_F6], ax
		movsx	eax, word ptr [bp+var_F6]
		push	eax
		push	ds
		mov	ax, [bp+var_8]
		imul	word ptr [bp+var_F6+2]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_C46]
		mov	[bp+var_C57], eax
		inc	word ptr [bp+var_F6+2]

loc_7705A:				; CODE XREF: sub_768F0+71Aj
		cmp	word ptr [bp+var_F6+2],	13h
		jl	short loc_7700C
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_770B2
		push	[bp+arg_0]
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_77176
; ���������������������������������������������������������������������������

loc_770B2:				; CODE XREF: sub_768F0+78Bj
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_770F6
		push	[bp+arg_2]
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_77176
; ���������������������������������������������������������������������������

loc_770F6:				; CODE XREF: sub_768F0+7CFj
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_77139
		push	[bp+arg_4]
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_77176
; ���������������������������������������������������������������������������

loc_77139:				; CODE XREF: sub_768F0+813j
		mov	ax, [bp+var_8]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_77176:				; CODE XREF: sub_768F0+7BFj
					; sub_768F0+803j ...
		mov	[bp+var_CBC], 56Eh
		lea	ax, [bp+var_CBC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_CBC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_77198:				; CODE XREF: sub_768F0+68Dj
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		mov	[bp+var_50], 0
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	3
		lea	ax, [bp+var_50]
		push	ax
		push	1
		lea	ax, [bp+var_2F0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_5A], 0
		mov	[bp+var_56], 2
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		push	2
		lea	ax, [bp+var_5A]
		push	ax
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
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
		push	2
		lea	ax, [bp+var_6A]
		push	ax
		push	11h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_6D], 0
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_7A], 0
		mov	[bp+var_76], 2
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	3
		lea	ax, [bp+var_7A]
		push	ax
		push	1
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_84], 0
		mov	[bp+var_80], 2
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		push	2
		lea	ax, [bp+var_84]
		push	ax
		push	12h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_87], 0
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_94], 0
		mov	[bp+var_90], 2
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	3
		lea	ax, [bp+var_94]
		push	ax
		push	0Bh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_9E], 0
		mov	[bp+var_9A], 2
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		push	16h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_A1], 0
		lea	ax, [bp+var_9E]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_AE], 0
		mov	[bp+var_AA], 2
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	3
		lea	ax, [bp+var_AE]
		push	ax
		push	9
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_B8], 0
		mov	[bp+var_B4], 2
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		push	2
		lea	ax, [bp+var_B8]
		push	ax
		push	14h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_BB], 0
		lea	ax, [bp+var_B8]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_C8], 0
		mov	[bp+var_C4], 2
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_C8]
		push	ax
		push	17h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_CB], 0
		lea	ax, [bp+var_C8]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_D8], 0
		mov	[bp+var_D4], 2
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_D8]
		push	ax
		push	0Eh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_DB], 0
		lea	ax, [bp+var_D8]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_E8], 0
		mov	[bp+var_E4], 2
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	1
		push	2
		lea	ax, [bp+var_E8]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_EB], 0
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_774A9
		jmp	loc_779A1
; ���������������������������������������������������������������������������

loc_774A9:				; CODE XREF: sub_768F0+BB4j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_774E0
		cmp	[bp+var_E8], 0
		jz	short loc_774E0
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_774E0:				; CODE XREF: sub_768F0+BCDj
					; sub_768F0+BD5j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7752E
		cmp	[bp+var_D8], 0
		jz	short loc_7752E
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7752E:				; CODE XREF: sub_768F0+C1Bj
					; sub_768F0+C23j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7757C
		cmp	[bp+var_C8], 0
		jz	short loc_7757C
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7757C:				; CODE XREF: sub_768F0+C69j
					; sub_768F0+C71j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_775CA
		cmp	[bp+var_B8], 0
		jz	short loc_775CA
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_775CA:				; CODE XREF: sub_768F0+CB7j
					; sub_768F0+CBFj
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_77609
		cmp	[bp+var_AE], 0
		jz	short loc_77609
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77609:				; CODE XREF: sub_768F0+CF6j
					; sub_768F0+CFEj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_77657
		cmp	[bp+var_9E], 0
		jz	short loc_77657
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77657:				; CODE XREF: sub_768F0+D44j
					; sub_768F0+D4Cj
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_77696
		cmp	[bp+var_94], 0
		jz	short loc_77696
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77696:				; CODE XREF: sub_768F0+D83j
					; sub_768F0+D8Bj
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_776E2
		cmp	[bp+var_84], 0
		jz	short loc_776E2
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_776E2:				; CODE XREF: sub_768F0+DD0j
					; sub_768F0+DD8j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7771B
		cmp	[bp+var_7A], 0
		jz	short loc_7771B
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7771B:				; CODE XREF: sub_768F0+E0Bj
					; sub_768F0+E12j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_77761
		cmp	[bp+var_6A], 0
		jz	short loc_77761
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77761:				; CODE XREF: sub_768F0+E51j
					; sub_768F0+E58j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_777A7
		cmp	[bp+var_5A], 0
		jz	short loc_777A7
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_777A7:				; CODE XREF: sub_768F0+E97j
					; sub_768F0+E9Ej
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_777DF
		cmp	[bp+var_50], 0
		jz	short loc_777DF
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_777DF:				; CODE XREF: sub_768F0+ECFj
					; sub_768F0+ED6j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7783C
		cmp	[bp+var_C04], 0
		jz	short loc_7783C
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7783C:				; CODE XREF: sub_768F0+F29j
					; sub_768F0+F31j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_77888
		cmp	[bp+var_3EA], 0
		jz	short loc_77888
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77888:				; CODE XREF: sub_768F0+F75j
					; sub_768F0+F7Dj
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_778D2
		cmp	[bp+var_40], 0
		jz	short loc_778D2
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_778D2:				; CODE XREF: sub_768F0+FC2j
					; sub_768F0+FC9j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_77953
		cmp	[bp+var_22], 0
		jz	short loc_77953
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77953:				; CODE XREF: sub_768F0+1043j
					; sub_768F0+104Aj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_779A1:				; CODE XREF: sub_768F0+BB6j
		cmp	[bp+var_9], 0
		jz	short loc_779EB
		mov	ax, word_48F76
		mov	[bp+var_F0], ax
		mov	[bp+var_F2], 0
		cmp	[bp+var_3EE], 0
		jz	short loc_779EB
		push	[bp+var_3EC]
		mov	bx, [bp+var_3EE]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_F2]
		push	[bp+var_F0]
		push	[bp+var_3EC]
		mov	bx, [bp+var_3EE]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_779EB:				; CODE XREF: sub_768F0+10B5j
					; sub_768F0+10C9j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	8
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, [bp+var_106]
		push	ax
		push	10h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_10A+1], 0
		lea	ax, [bp+var_106]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	7
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_110+2], ax
		push	1
		push	0
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_110], ax
		push	8
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_112], ax
		push	[bp+var_60]
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_10C]
		mov	al, byte ptr [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_110]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_110+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_112]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	[bp+var_11E+2],	0
		mov	byte ptr [bp+var_11A+2], 2
		mov	byte ptr [bp+var_11A+3], 0
		mov	[bp+var_116], 0
		mov	[bp+var_126], 0
		mov	byte ptr [bp+var_122], 2
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_122+2],	0
		mov	[bp+var_C40], 0
		mov	[bp+var_C3C], 2
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		mov	word ptr [bp+var_C46+2], 0
		mov	[bp+var_C42], 0FFFFh
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A], 2
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		mov	[bp+var_C52], 0
		mov	[bp+var_C50], 0FFFFh
		mov	ax, word_4501C
		mov	word ptr [bp+var_12C], ax
		mov	ax, word_4501E
		mov	word ptr [bp+var_12C+2], ax
		mov	ax, word_45020
		mov	[bp+var_128], ax
		cmp	[bp+var_B], 0
		jnz	short loc_77BF2
		jmp	loc_77DA3
; ���������������������������������������������������������������������������

loc_77BF2:				; CODE XREF: sub_768F0+12FDj
		push	3
		lea	ax, [bp+var_11E+2]
		push	ax
		push	55h ; 'U'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_11E+2]
		push	ax
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_126]
		push	ax
		push	40h ; '@'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_126]
		push	ax
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	[bp+var_C5F+3],	0
		mov	byte ptr [bp+var_C5B+3], 2
		mov	byte ptr [bp+var_C57], 0
		mov	[bp+var_C57+1],	0
		mov	word ptr [bp-0C60h], 0
		mov	word ptr [bp+var_C5F+1], 0FFFFh
		push	word_46849
		lea	ax, [bp-0C60h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	word ptr [bp-12Eh], 0
		jmp	loc_77D4D
; ���������������������������������������������������������������������������

loc_77CAA:				; CODE XREF: sub_768F0+1464j
		mov	[bp+var_13A+2],	0
		mov	byte ptr [bp+var_136+2], 2
		mov	byte ptr [bp+var_136+3], 0
		mov	[bp+var_132], 0
		push	3
		lea	ax, [bp+var_13A+2]
		push	ax
		lea	ax, [bp+var_12C]
		mov	bx, [bp-12Eh]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_13A+2]
		push	ax
		lea	ax, [bp-0C60h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp-0C60h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_136+3], 0
		jz	short loc_77D32
		cmp	[bp+var_13A+2],	0
		jz	short loc_77D32
		push	0
		mov	al, byte ptr [bp+var_136+2]
		push	ax
		lea	ax, [bp+var_13A+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77D32:				; CODE XREF: sub_768F0+141Fj
					; sub_768F0+1427j
		mov	[bp+var_13A+2],	0
		mov	byte ptr [bp+var_136+3], 0
		mov	[bp+var_132], 0
		inc	word ptr [bp-12Eh]

loc_77D4D:				; CODE XREF: sub_768F0+13B7j
		cmp	word ptr [bp-12Eh], 6
		jge	short loc_77D57
		jmp	loc_77CAA
; ���������������������������������������������������������������������������

loc_77D57:				; CODE XREF: sub_768F0+1462j
		lea	ax, [bp-0C60h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_C57], 0
		jz	short loc_77D8C
		cmp	[bp+var_C5F+3],	0
		jz	short loc_77D8C
		push	0
		mov	al, byte ptr [bp+var_C5B+3]
		push	ax
		lea	ax, [bp+var_C5F+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77D8C:				; CODE XREF: sub_768F0+1479j
					; sub_768F0+1481j
		mov	[bp+var_C5F+3],	0
		mov	byte ptr [bp+var_C57], 0
		mov	[bp+var_C57+1],	0

loc_77DA3:				; CODE XREF: sub_768F0+12FFj
		cmp	[bp+var_A], 0
		jnz	short loc_77DAC
		jmp	loc_77FA9
; ���������������������������������������������������������������������������

loc_77DAC:				; CODE XREF: sub_768F0+14B7j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_136], 0
		mov	byte ptr [bp+var_132], 2
		mov	byte ptr [bp+var_132+1], 0
		mov	[bp+var_132+2],	0
		push	2
		lea	ax, [bp+var_136]
		push	ax
		push	7
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_136]
		push	ax
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_7D11
		add	sp, 4
		jmp	loc_77F0F
; ���������������������������������������������������������������������������

loc_77E00:				; CODE XREF: sub_768F0+163Aj
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_13A+2], ax
		cmp	word ptr [bp+var_13A+2], 1Bh
		jl	short loc_77E12
		jmp	loc_77EDF
; ���������������������������������������������������������������������������

loc_77E12:				; CODE XREF: sub_768F0+151Dj
		mov	ax, word ptr [bp+var_13A+2]
		mov	word ptr [bp+var_13A], ax
		mov	bx, [bp+var_112]
		mov	ax, word ptr [bp+var_13A]
		mov	[bx+1Bh], ax
		cmp	[bp+var_B], 0
		jnz	short loc_77E2E
		jmp	loc_77EDF
; ���������������������������������������������������������������������������

loc_77E2E:				; CODE XREF: sub_768F0+1539j
		cmp	word ptr [bp+var_13A+2], 1Bh
		jl	short loc_77E38
		jmp	loc_77EDF
; ���������������������������������������������������������������������������

loc_77E38:				; CODE XREF: sub_768F0+1543j
		mov	ax, word ptr [bp+var_13A+2]
		mov	bx, 8
		cwd
		idiv	bx
		or	dx, dx
		jnz	short loc_77E8C
		mov	ax, word_48F4C
		mov	word ptr [bp+var_13E+2], ax
		mov	word ptr [bp+var_13E], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_77E8A
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_13E]
		push	word ptr [bp+var_13E+2]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_77E8A:				; CODE XREF: sub_768F0+1568j
		jmp	short loc_77EDF
; ���������������������������������������������������������������������������

loc_77E8C:				; CODE XREF: sub_768F0+1554j
		mov	ax, word ptr [bp+var_13A+2]
		mov	bx, 8
		cwd
		idiv	bx
		cmp	dx, 4
		jnz	short loc_77EDF
		mov	ax, word_48F22
		mov	[bp+var_140], ax
		mov	word ptr [bp+var_144+2], 0
		cmp	[bp+var_C52], 0
		jz	short loc_77EDF
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_144+2]
		push	[bp+var_140]
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_77EDF:				; CODE XREF: sub_768F0+151Fj
					; sub_768F0+153Bj ...
		cmp	word ptr [bp+var_13A+2], 14h
		jnz	short loc_77EF5
		push	0FFFFh
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_83FE
		add	sp, 4

loc_77EF5:				; CODE XREF: sub_768F0+15F4j
		jmp	short loc_77F02
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_77F02
		jmp	short loc_77F2D
; ���������������������������������������������������������������������������

loc_77F02:				; CODE XREF: sub_768F0:loc_77EF5j
					; sub_768F0+160Ej
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_77F0F:				; CODE XREF: sub_768F0+150Dj
		cmp	[bp+var_C19], 1Eh
		jnb	short loc_77F1D
		cmp	[bp+var_C17], 0
		jz	short loc_77F22

loc_77F1D:				; CODE XREF: sub_768F0+1624j
		mov	ax, 1
		jmp	short loc_77F24
; ���������������������������������������������������������������������������

loc_77F22:				; CODE XREF: sub_768F0+162Bj
		xor	ax, ax

loc_77F24:				; CODE XREF: sub_768F0+1630j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_77F2D
		jmp	loc_77E00
; ���������������������������������������������������������������������������

loc_77F2D:				; CODE XREF: sub_768F0+1610j
					; sub_768F0+1638j
		jmp	short loc_77F49
; ���������������������������������������������������������������������������

loc_77F2F:				; CODE XREF: sub_768F0+1668j
		jmp	short loc_77F3C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_77F3C
		jmp	short loc_77F5A
; ���������������������������������������������������������������������������

loc_77F3C:				; CODE XREF: sub_768F0:loc_77F2Fj
					; sub_768F0+1648j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_77F49:				; CODE XREF: sub_768F0:loc_77F2Dj
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_77F2F

loc_77F5A:				; CODE XREF: sub_768F0+164Aj
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_132+1], 0
		jz	short loc_77F8F
		cmp	[bp+var_136], 0
		jz	short loc_77F8F
		push	0
		mov	al, byte ptr [bp+var_132]
		push	ax
		lea	ax, [bp+var_136]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_77F8F:				; CODE XREF: sub_768F0+167Cj
					; sub_768F0+1684j
		mov	[bp+var_136], 0
		mov	byte ptr [bp+var_132+1], 0
		mov	[bp+var_132+2],	0
		jmp	loc_78138
; ���������������������������������������������������������������������������

loc_77FA9:				; CODE XREF: sub_768F0+14B9j
		push	80h ; '�'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	loc_7811A
; ���������������������������������������������������������������������������

loc_77FBF:				; CODE XREF: sub_768F0+1845j
		mov	ax, [bp+var_C19]
		mov	[bp-12Eh], ax
		cmp	word ptr [bp-12Eh], 1Bh
		jl	short loc_77FD1
		jmp	loc_780A7
; ���������������������������������������������������������������������������

loc_77FD1:				; CODE XREF: sub_768F0+16DCj
		mov	ax, [bp-12Eh]
		mov	word ptr [bp+var_132+2], ax
		mov	bx, [bp+var_112]
		mov	ax, word ptr [bp+var_132+2]
		mov	[bx+1Bh], ax
		mov	al, [bp+var_B]
		mov	ah, 0
		push	ax
		cmp	word ptr [bp-12Eh], 1Bh
		jge	short loc_77FF6
		mov	ax, 1
		jmp	short loc_77FF8
; ���������������������������������������������������������������������������

loc_77FF6:				; CODE XREF: sub_768F0+16FFj
		xor	ax, ax

loc_77FF8:				; CODE XREF: sub_768F0+1704j
		pop	dx
		test	dx, ax
		jnz	short loc_78000
		jmp	loc_780A7
; ���������������������������������������������������������������������������

loc_78000:				; CODE XREF: sub_768F0+170Bj
		mov	ax, [bp-12Eh]
		mov	bx, 8
		cwd
		idiv	bx
		or	dx, dx
		jnz	short loc_78054
		mov	ax, word_48F4C
		mov	word ptr [bp+var_132], ax
		mov	word ptr [bp+var_136+2], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_78052
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_136+2]
		push	word ptr [bp+var_132]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_78052:				; CODE XREF: sub_768F0+1730j
		jmp	short loc_780A7
; ���������������������������������������������������������������������������

loc_78054:				; CODE XREF: sub_768F0+171Cj
		mov	ax, [bp-12Eh]
		mov	bx, 8
		cwd
		idiv	bx
		cmp	dx, 4
		jnz	short loc_780A7
		mov	ax, word_48F22
		mov	word ptr [bp+var_136], ax
		mov	word ptr [bp+var_13A+2], 0
		cmp	[bp+var_C52], 0
		jz	short loc_780A7
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		push	word ptr [bp+var_136]
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_780A7:				; CODE XREF: sub_768F0+16DEj
					; sub_768F0+170Dj ...
		cmp	word ptr [bp-12Eh], 14h
		jnz	short loc_780BE
		push	[bp+var_6]
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_780BE:				; CODE XREF: sub_768F0+17BCj
		jmp	short loc_7810D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7810D
		mov	word ptr [bp-0C5Eh], 11BCh
		mov	word ptr [bp-0C5Eh], 11C8h
		mov	word ptr [bp-0C5Eh], 11D8h
		mov	word ptr [bp-0C5Eh], 11E8h
		mov	word ptr [bp-0C5Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C5Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_78138
; ���������������������������������������������������������������������������

loc_7810D:				; CODE XREF: sub_768F0:loc_780BEj
					; sub_768F0+17D7j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7811A:				; CODE XREF: sub_768F0+16CCj
		cmp	[bp+var_C19], 1Eh
		jnb	short loc_78128
		cmp	[bp+var_C17], 0
		jz	short loc_7812D

loc_78128:				; CODE XREF: sub_768F0+182Fj
		mov	ax, 1
		jmp	short loc_7812F
; ���������������������������������������������������������������������������

loc_7812D:				; CODE XREF: sub_768F0+1836j
		xor	ax, ax

loc_7812F:				; CODE XREF: sub_768F0+183Bj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_78138
		jmp	loc_77FBF
; ���������������������������������������������������������������������������

loc_78138:				; CODE XREF: sub_768F0+16B6j
					; sub_768F0+181Bj ...
		lea	ax, [bp+var_C52]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_C4A+1], 0
		jz	short loc_7816D
		cmp	[bp+var_C4E], 0
		jz	short loc_7816D
		push	0
		mov	al, byte ptr [bp+var_C4A]
		push	ax
		lea	ax, [bp+var_C4E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7816D:				; CODE XREF: sub_768F0+185Aj
					; sub_768F0+1862j
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		lea	ax, [bp+var_C46+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C3B], 0
		jz	short loc_781B9
		cmp	[bp+var_C40], 0
		jz	short loc_781B9
		push	0
		mov	al, [bp+var_C3C]
		push	ax
		lea	ax, [bp+var_C40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_781B9:				; CODE XREF: sub_768F0+18A6j
					; sub_768F0+18AEj
		mov	[bp+var_C40], 0
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		cmp	byte ptr [bp+var_122+1], 0
		jz	short loc_781F8
		cmp	[bp+var_126], 0
		jz	short loc_781F8
		push	0
		mov	al, byte ptr [bp+var_122]
		push	ax
		lea	ax, [bp+var_126]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_781F8:				; CODE XREF: sub_768F0+18E5j
					; sub_768F0+18EDj
		mov	[bp+var_126], 0
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_122+2],	0
		cmp	byte ptr [bp+var_11A+3], 0
		jz	short loc_78237
		cmp	[bp+var_11E+2],	0
		jz	short loc_78237
		push	0
		mov	al, byte ptr [bp+var_11A+2]
		push	ax
		lea	ax, [bp+var_11E+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78237:				; CODE XREF: sub_768F0+1924j
					; sub_768F0+192Cj
		mov	[bp+var_11E+2],	0
		mov	byte ptr [bp+var_11A+3], 0
		mov	[bp+var_116], 0
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_78294
		cmp	[bp+var_106], 0
		jz	short loc_78294
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78294:				; CODE XREF: sub_768F0+1981j
					; sub_768F0+1989j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_782D3
		cmp	[bp+var_FC], 0
		jz	short loc_782D3
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_782D3:				; CODE XREF: sub_768F0+19C0j
					; sub_768F0+19C8j
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_782F4
		jmp	loc_787EC
; ���������������������������������������������������������������������������

loc_782F4:				; CODE XREF: sub_768F0+19FFj
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7832B
		cmp	[bp+var_E8], 0
		jz	short loc_7832B
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7832B:				; CODE XREF: sub_768F0+1A18j
					; sub_768F0+1A20j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_78379
		cmp	[bp+var_D8], 0
		jz	short loc_78379
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78379:				; CODE XREF: sub_768F0+1A66j
					; sub_768F0+1A6Ej
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_783C7
		cmp	[bp+var_C8], 0
		jz	short loc_783C7
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_783C7:				; CODE XREF: sub_768F0+1AB4j
					; sub_768F0+1ABCj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_78415
		cmp	[bp+var_B8], 0
		jz	short loc_78415
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78415:				; CODE XREF: sub_768F0+1B02j
					; sub_768F0+1B0Aj
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_78454
		cmp	[bp+var_AE], 0
		jz	short loc_78454
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78454:				; CODE XREF: sub_768F0+1B41j
					; sub_768F0+1B49j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_784A2
		cmp	[bp+var_9E], 0
		jz	short loc_784A2
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_784A2:				; CODE XREF: sub_768F0+1B8Fj
					; sub_768F0+1B97j
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_784E1
		cmp	[bp+var_94], 0
		jz	short loc_784E1
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_784E1:				; CODE XREF: sub_768F0+1BCEj
					; sub_768F0+1BD6j
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7852D
		cmp	[bp+var_84], 0
		jz	short loc_7852D
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7852D:				; CODE XREF: sub_768F0+1C1Bj
					; sub_768F0+1C23j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_78566
		cmp	[bp+var_7A], 0
		jz	short loc_78566
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78566:				; CODE XREF: sub_768F0+1C56j
					; sub_768F0+1C5Dj
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_785AC
		cmp	[bp+var_6A], 0
		jz	short loc_785AC
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_785AC:				; CODE XREF: sub_768F0+1C9Cj
					; sub_768F0+1CA3j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_785F2
		cmp	[bp+var_5A], 0
		jz	short loc_785F2
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_785F2:				; CODE XREF: sub_768F0+1CE2j
					; sub_768F0+1CE9j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7862A
		cmp	[bp+var_50], 0
		jz	short loc_7862A
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7862A:				; CODE XREF: sub_768F0+1D1Aj
					; sub_768F0+1D21j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_78687
		cmp	[bp+var_C04], 0
		jz	short loc_78687
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78687:				; CODE XREF: sub_768F0+1D74j
					; sub_768F0+1D7Cj
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_786D3
		cmp	[bp+var_3EA], 0
		jz	short loc_786D3
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_786D3:				; CODE XREF: sub_768F0+1DC0j
					; sub_768F0+1DC8j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7871D
		cmp	[bp+var_40], 0
		jz	short loc_7871D
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7871D:				; CODE XREF: sub_768F0+1E0Dj
					; sub_768F0+1E14j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7879E
		cmp	[bp+var_22], 0
		jz	short loc_7879E
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7879E:				; CODE XREF: sub_768F0+1E8Ej
					; sub_768F0+1E95j
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_787EC:				; CODE XREF: sub_768F0+1A01j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	6
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C], 2
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		push	3
		lea	ax, [bp+var_110]
		push	ax
		push	7
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116], 2
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		push	2
		lea	ax, [bp+var_11A]
		push	ax
		push	0Fh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_11E+1], 0
		lea	ax, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_122+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_122], ax
		push	0
		push	28h ; '('
		lea	ax, [bp+var_110]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_126+2], ax
		push	0
		push	0
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_126], ax
		push	[bp+var_70]
		mov	al, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_122+2]
		mov	al, byte ptr [bp+var_11E]
		push	ax
		lea	ax, [bp+var_122+2]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	[bp+var_132+2],	0
		mov	byte ptr [bp+var_12C], 2
		mov	byte ptr [bp+var_12C+1], 0
		mov	[bp+var_12C+2],	0
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136], 2
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_136+2],	0
		mov	[bp+var_C40], 0
		mov	[bp+var_C3C], 2
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		mov	word ptr [bp+var_C46+2], 0
		mov	[bp+var_C42], 0FFFFh
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A], 2
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		mov	[bp+var_C52], 0
		mov	[bp+var_C50], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_78A80
		push	3
		lea	ax, [bp+var_132+2]
		push	ax
		push	55h ; 'U'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_132+2]
		push	ax
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	40h ; '@'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_78A80:				; CODE XREF: sub_768F0+2118j
		push	word ptr [bp+var_122]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_126+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_126]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_A], 0
		jnz	short loc_78ABC
		jmp	loc_78D43
; ���������������������������������������������������������������������������

loc_78ABC:				; CODE XREF: sub_768F0+21C7j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-144h], 0
		mov	byte ptr [bp+var_140], 2
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		push	2
		lea	ax, [bp+var_144]
		push	ax
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_7D11
		add	sp, 4
		jmp	loc_78C0A
; ���������������������������������������������������������������������������

loc_78B10:				; CODE XREF: sub_768F0+2335j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_150], ax
		cmp	word ptr [bp+var_150], 2
		jnz	short loc_78B6C
		cmp	[bp+var_B], 0
		jz	short loc_78B6C
		mov	ax, word_48F4C
		add	ax, 32h	; '2'
		mov	[bp+var_152], ax
		mov	word ptr [bp+var_156+2], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_78B6C
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_156+2]
		push	[bp+var_152]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_78B6C:				; CODE XREF: sub_768F0+222Dj
					; sub_768F0+2233j ...
		cmp	word ptr [bp+var_150], 5
		jnz	short loc_78BC0
		cmp	[bp+var_B], 0
		jz	short loc_78BC0
		mov	ax, word_48F22
		add	ax, 32h	; '2'
		mov	word ptr [bp+var_156], ax
		mov	[bp+var_158], 0
		cmp	[bp+var_C52], 0
		jz	short loc_78BC0
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_158]
		push	word ptr [bp+var_156]
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_78BC0:				; CODE XREF: sub_768F0+2281j
					; sub_768F0+2287j ...
		cmp	word ptr [bp+var_150], 8
		jge	short loc_78BDA
		mov	ax, word ptr [bp+var_150]
		mov	[bp+var_15A], ax
		mov	bx, word ptr [bp+var_126+2]
		mov	ax, [bp+var_15A]
		mov	[bx+1Bh], ax

loc_78BDA:				; CODE XREF: sub_768F0+22D5j
		cmp	word ptr [bp+var_150], 5
		jnz	short loc_78BF0
		push	0FFFFh
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_83FE
		add	sp, 4

loc_78BF0:				; CODE XREF: sub_768F0+22EFj
		jmp	short loc_78BFD
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_78BFD
		jmp	short loc_78C28
; ���������������������������������������������������������������������������

loc_78BFD:				; CODE XREF: sub_768F0:loc_78BF0j
					; sub_768F0+2309j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_78C0A:				; CODE XREF: sub_768F0+221Dj
		cmp	[bp+var_C19], 0Ah
		jnb	short loc_78C18
		cmp	[bp+var_C17], 0
		jz	short loc_78C1D

loc_78C18:				; CODE XREF: sub_768F0+231Fj
		mov	ax, 1
		jmp	short loc_78C1F
; ���������������������������������������������������������������������������

loc_78C1D:				; CODE XREF: sub_768F0+2326j
		xor	ax, ax

loc_78C1F:				; CODE XREF: sub_768F0+232Bj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_78C28
		jmp	loc_78B10
; ���������������������������������������������������������������������������

loc_78C28:				; CODE XREF: sub_768F0+230Bj
					; sub_768F0+2333j
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		mov	[bp+var_150+2],	0
		mov	byte ptr [bp+var_14A], 2
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		push	2
		lea	ax, [bp+var_150+2]
		push	ax
		push	8
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_150+2]
		push	ax
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_7D11
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_78CA4
; ���������������������������������������������������������������������������

loc_78C8A:				; CODE XREF: sub_768F0+23C3j
		jmp	short loc_78C97
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_78C97
		jmp	short loc_78CB5
; ���������������������������������������������������������������������������

loc_78C97:				; CODE XREF: sub_768F0:loc_78C8Aj
					; sub_768F0+23A3j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_78CA4:				; CODE XREF: sub_768F0+2398j
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_78C8A

loc_78CB5:				; CODE XREF: sub_768F0+23A5j
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_14A+1], 0
		jz	short loc_78CEA
		cmp	[bp+var_150+2],	0
		jz	short loc_78CEA
		push	0
		mov	al, byte ptr [bp+var_14A]
		push	ax
		lea	ax, [bp+var_150+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78CEA:				; CODE XREF: sub_768F0+23D7j
					; sub_768F0+23DFj
		mov	[bp+var_150+2],	0
		mov	byte ptr [bp+var_14A+1], 0
		mov	[bp+var_148], 0
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_78D29
		cmp	[bp+var_144], 0
		jz	short loc_78D29
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_78D29:				; CODE XREF: sub_768F0+2416j
					; sub_768F0+241Ej
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_13E], 0
		jmp	loc_7907F
; ���������������������������������������������������������������������������

loc_78D43:				; CODE XREF: sub_768F0+21C9j
		push	81h ; '�'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	loc_78E9A
; ���������������������������������������������������������������������������

loc_78D59:				; CODE XREF: sub_768F0+25C5j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_13E+2], ax
		cmp	word ptr [bp+var_13E+2], 2
		jnz	short loc_78DB5
		cmp	[bp+var_B], 0
		jz	short loc_78DB5
		mov	ax, word_48F4C
		add	ax, 32h	; '2'
		mov	word ptr [bp+var_13E], ax
		mov	[bp+var_140], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_78DB5
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_140]
		push	word ptr [bp+var_13E]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_78DB5:				; CODE XREF: sub_768F0+2476j
					; sub_768F0+247Cj ...
		cmp	word ptr [bp+var_13E+2], 5
		jnz	short loc_78E09
		cmp	[bp+var_B], 0
		jz	short loc_78E09
		mov	ax, word_48F22
		add	ax, 32h	; '2'
		mov	word ptr [bp+var_144+2], ax
		mov	word ptr [bp+var_144], 0
		cmp	[bp+var_C52], 0
		jz	short loc_78E09
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_144+2]
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_78E09:				; CODE XREF: sub_768F0+24CAj
					; sub_768F0+24D0j ...
		cmp	word ptr [bp+var_13E+2], 8
		jge	short loc_78E23
		mov	ax, word ptr [bp+var_13E+2]
		mov	word ptr [bp+var_148+2], ax
		mov	bx, word ptr [bp+var_126+2]
		mov	ax, word ptr [bp+var_148+2]
		mov	[bx+1Bh], ax

loc_78E23:				; CODE XREF: sub_768F0+251Ej
		cmp	word ptr [bp+var_13E+2], 5
		jnz	short loc_78E3E
		mov	ax, [bp+var_6]
		add	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_78E3E:				; CODE XREF: sub_768F0+2538j
		jmp	short loc_78E8D
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_78E8D
		mov	word ptr [bp-0C5Eh], 11BCh
		mov	word ptr [bp-0C5Eh], 11C8h
		mov	word ptr [bp-0C5Eh], 11D8h
		mov	word ptr [bp-0C5Eh], 11E8h
		mov	word ptr [bp-0C5Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C5Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_78EB8
; ���������������������������������������������������������������������������

loc_78E8D:				; CODE XREF: sub_768F0:loc_78E3Ej
					; sub_768F0+2557j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_78E9A:				; CODE XREF: sub_768F0+2466j
		cmp	[bp+var_C19], 0Ah
		jnb	short loc_78EA8
		cmp	[bp+var_C17], 0
		jz	short loc_78EAD

loc_78EA8:				; CODE XREF: sub_768F0+25AFj
		mov	ax, 1
		jmp	short loc_78EAF
; ���������������������������������������������������������������������������

loc_78EAD:				; CODE XREF: sub_768F0+25B6j
		xor	ax, ax

loc_78EAF:				; CODE XREF: sub_768F0+25BBj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_78EB8
		jmp	loc_78D59
; ���������������������������������������������������������������������������

loc_78EB8:				; CODE XREF: sub_768F0+259Bj
					; sub_768F0+25C3j
		jmp	loc_78F68
; ���������������������������������������������������������������������������

loc_78EBB:				; CODE XREF: sub_768F0+2693j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_13E+2], ax
		cmp	word ptr [bp+var_13E+2], 0Bh
		jnz	short loc_78F0C
		mov	word ptr [bp+var_C5F+1], 11BCh
		mov	word ptr [bp+var_C5F+1], 11C8h
		mov	word ptr [bp+var_C5F+1], 11D8h
		mov	word ptr [bp+var_C5F+1], 11E8h
		mov	word ptr [bp+var_C5F+1], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C5F+1]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_78F0C:				; CODE XREF: sub_768F0+25D8j
		jmp	short loc_78F5B
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_78F5B
		mov	word ptr [bp-0C6Ah], 11BCh
		mov	word ptr [bp-0C6Ah], 11C8h
		mov	word ptr [bp-0C6Ah], 11D8h
		mov	word ptr [bp-0C6Ah], 11E8h
		mov	word ptr [bp-0C6Ah], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_78F86
; ���������������������������������������������������������������������������

loc_78F5B:				; CODE XREF: sub_768F0:loc_78F0Cj
					; sub_768F0+2625j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_78F68:				; CODE XREF: sub_768F0:loc_78EB8j
		cmp	[bp+var_C19], 0Eh
		jnb	short loc_78F76
		cmp	[bp+var_C17], 0
		jz	short loc_78F7B

loc_78F76:				; CODE XREF: sub_768F0+267Dj
		mov	ax, 1
		jmp	short loc_78F7D
; ���������������������������������������������������������������������������

loc_78F7B:				; CODE XREF: sub_768F0+2684j
		xor	ax, ax

loc_78F7D:				; CODE XREF: sub_768F0+2689j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_78F86
		jmp	loc_78EBB
; ���������������������������������������������������������������������������

loc_78F86:				; CODE XREF: sub_768F0+2669j
					; sub_768F0+2691j
		push	80h ; '�'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4
		jmp	loc_79061
; ���������������������������������������������������������������������������

loc_78FB4:				; CODE XREF: sub_768F0+278Cj
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_13E+2], ax
		cmp	word ptr [bp+var_13E+2], 19h
		jnz	short loc_79005
		mov	word ptr [bp+var_C5F+1], 11BCh
		mov	word ptr [bp+var_C5F+1], 11C8h
		mov	word ptr [bp+var_C5F+1], 11D8h
		mov	word ptr [bp+var_C5F+1], 11E8h
		mov	word ptr [bp+var_C5F+1], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C5F+1]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_79005:				; CODE XREF: sub_768F0+26D1j
		jmp	short loc_79054
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_79054
		mov	word ptr [bp-0C6Ah], 11BCh
		mov	word ptr [bp-0C6Ah], 11C8h
		mov	word ptr [bp-0C6Ah], 11D8h
		mov	word ptr [bp-0C6Ah], 11E8h
		mov	word ptr [bp-0C6Ah], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C6Ah]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7907F
; ���������������������������������������������������������������������������

loc_79054:				; CODE XREF: sub_768F0:loc_79005j
					; sub_768F0+271Ej
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_79061:				; CODE XREF: sub_768F0+26C1j
		cmp	[bp+var_C19], 1Eh
		jnb	short loc_7906F
		cmp	[bp+var_C17], 0
		jz	short loc_79074

loc_7906F:				; CODE XREF: sub_768F0+2776j
		mov	ax, 1
		jmp	short loc_79076
; ���������������������������������������������������������������������������

loc_79074:				; CODE XREF: sub_768F0+277Dj
		xor	ax, ax

loc_79076:				; CODE XREF: sub_768F0+2782j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7907F
		jmp	loc_78FB4
; ���������������������������������������������������������������������������

loc_7907F:				; CODE XREF: sub_768F0+2450j
					; sub_768F0+2762j ...
		lea	ax, [bp+var_C52]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_C4A+1], 0
		jz	short loc_790B4
		cmp	[bp+var_C4E], 0
		jz	short loc_790B4
		push	0
		mov	al, byte ptr [bp+var_C4A]
		push	ax
		lea	ax, [bp+var_C4E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_790B4:				; CODE XREF: sub_768F0+27A1j
					; sub_768F0+27A9j
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		lea	ax, [bp+var_C46+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C3B], 0
		jz	short loc_79100
		cmp	[bp+var_C40], 0
		jz	short loc_79100
		push	0
		mov	al, [bp+var_C3C]
		push	ax
		lea	ax, [bp+var_C40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79100:				; CODE XREF: sub_768F0+27EDj
					; sub_768F0+27F5j
		mov	[bp+var_C40], 0
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		cmp	byte ptr [bp+var_136+1], 0
		jz	short loc_7913F
		cmp	[bp+var_13A], 0
		jz	short loc_7913F
		push	0
		mov	al, byte ptr [bp+var_136]
		push	ax
		lea	ax, [bp+var_13A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7913F:				; CODE XREF: sub_768F0+282Cj
					; sub_768F0+2834j
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_136+2],	0
		cmp	byte ptr [bp+var_12C+1], 0
		jz	short loc_7917E
		cmp	[bp+var_132+2],	0
		jz	short loc_7917E
		push	0
		mov	al, byte ptr [bp+var_12C]
		push	ax
		lea	ax, [bp+var_132+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7917E:				; CODE XREF: sub_768F0+286Bj
					; sub_768F0+2873j
		mov	[bp+var_132+2],	0
		mov	byte ptr [bp+var_12C+1], 0
		mov	[bp+var_12C+2],	0
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_122+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_116+1], 0
		jz	short loc_791DB
		cmp	[bp+var_11A], 0
		jz	short loc_791DB
		push	0
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_791DB:				; CODE XREF: sub_768F0+28C8j
					; sub_768F0+28D0j
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		cmp	byte ptr [bp+var_10C+1], 0
		jz	short loc_7921A
		cmp	[bp+var_110], 0
		jz	short loc_7921A
		push	0
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7921A:				; CODE XREF: sub_768F0+2907j
					; sub_768F0+290Fj
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_79259
		cmp	[bp+var_106], 0
		jz	short loc_79259
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79259:				; CODE XREF: sub_768F0+2946j
					; sub_768F0+294Ej
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_79298
		cmp	[bp+var_FC], 0
		jz	short loc_79298
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79298:				; CODE XREF: sub_768F0+2985j
					; sub_768F0+298Dj
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_792B9
		jmp	loc_797B1
; ���������������������������������������������������������������������������

loc_792B9:				; CODE XREF: sub_768F0+29C4j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_792F0
		cmp	[bp+var_E8], 0
		jz	short loc_792F0
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_792F0:				; CODE XREF: sub_768F0+29DDj
					; sub_768F0+29E5j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7933E
		cmp	[bp+var_D8], 0
		jz	short loc_7933E
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7933E:				; CODE XREF: sub_768F0+2A2Bj
					; sub_768F0+2A33j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7938C
		cmp	[bp+var_C8], 0
		jz	short loc_7938C
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7938C:				; CODE XREF: sub_768F0+2A79j
					; sub_768F0+2A81j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_793DA
		cmp	[bp+var_B8], 0
		jz	short loc_793DA
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_793DA:				; CODE XREF: sub_768F0+2AC7j
					; sub_768F0+2ACFj
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_79419
		cmp	[bp+var_AE], 0
		jz	short loc_79419
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79419:				; CODE XREF: sub_768F0+2B06j
					; sub_768F0+2B0Ej
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_79467
		cmp	[bp+var_9E], 0
		jz	short loc_79467
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79467:				; CODE XREF: sub_768F0+2B54j
					; sub_768F0+2B5Cj
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_794A6
		cmp	[bp+var_94], 0
		jz	short loc_794A6
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_794A6:				; CODE XREF: sub_768F0+2B93j
					; sub_768F0+2B9Bj
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_794F2
		cmp	[bp+var_84], 0
		jz	short loc_794F2
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_794F2:				; CODE XREF: sub_768F0+2BE0j
					; sub_768F0+2BE8j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7952B
		cmp	[bp+var_7A], 0
		jz	short loc_7952B
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7952B:				; CODE XREF: sub_768F0+2C1Bj
					; sub_768F0+2C22j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_79571
		cmp	[bp+var_6A], 0
		jz	short loc_79571
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79571:				; CODE XREF: sub_768F0+2C61j
					; sub_768F0+2C68j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_795B7
		cmp	[bp+var_5A], 0
		jz	short loc_795B7
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_795B7:				; CODE XREF: sub_768F0+2CA7j
					; sub_768F0+2CAEj
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_795EF
		cmp	[bp+var_50], 0
		jz	short loc_795EF
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_795EF:				; CODE XREF: sub_768F0+2CDFj
					; sub_768F0+2CE6j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7964C
		cmp	[bp+var_C04], 0
		jz	short loc_7964C
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7964C:				; CODE XREF: sub_768F0+2D39j
					; sub_768F0+2D41j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_79698
		cmp	[bp+var_3EA], 0
		jz	short loc_79698
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79698:				; CODE XREF: sub_768F0+2D85j
					; sub_768F0+2D8Dj
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_796E2
		cmp	[bp+var_40], 0
		jz	short loc_796E2
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_796E2:				; CODE XREF: sub_768F0+2DD2j
					; sub_768F0+2DD9j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_79763
		cmp	[bp+var_22], 0
		jz	short loc_79763
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79763:				; CODE XREF: sub_768F0+2E53j
					; sub_768F0+2E5Aj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_797B1:				; CODE XREF: sub_768F0+29C6j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	2040h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	4
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_7A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10A+2], ax
		push	0FFF5h
		push	0
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10A], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp+var_10C], ax
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EE]
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112], 2
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_110], 0
		mov	[bp+var_C40], 0
		mov	[bp+var_C3C], 2
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		mov	word ptr [bp+var_C46+2], 0
		mov	[bp+var_C42], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_79935
		push	3
		lea	ax, [bp+var_116]
		push	ax
		push	3Fh ; '?'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_79935:				; CODE XREF: sub_768F0+3008j
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_10A+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_10C]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [bp+var_11A+2], 0
		push	1Bh
		push	[bp+var_10C]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		cmp	[bp+var_A], 0
		jnz	short loc_79989
		jmp	loc_79C62
; ���������������������������������������������������������������������������

loc_79989:				; CODE XREF: sub_768F0+3094j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_122], 0
		mov	byte ptr [bp+var_11E], 2
		mov	byte ptr [bp+var_11E+1], 0
		mov	[bp+var_11E+2],	0
		push	2
		lea	ax, [bp+var_122]
		push	ax
		push	9
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_122]
		push	ax
		push	[bp+var_10C]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_126+2], 0
		jmp	short loc_799F4
; ���������������������������������������������������������������������������

loc_799E3:				; CODE XREF: sub_768F0+3109j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_126+2]

loc_799F4:				; CODE XREF: sub_768F0+30F1j
		cmp	word ptr [bp+var_126+2], 3
		jl	short loc_799E3
		jmp	short loc_79A17
; ���������������������������������������������������������������������������

loc_799FD:				; CODE XREF: sub_768F0+3135j
		jmp	short loc_79A0A
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_79A0A
		jmp	short loc_79A27
; ���������������������������������������������������������������������������

loc_79A0A:				; CODE XREF: sub_768F0:loc_799FDj
					; sub_768F0+3116j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_79A17:				; CODE XREF: sub_768F0+310Bj
		push	[bp+var_10C]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_799FD

loc_79A27:				; CODE XREF: sub_768F0+3118j
		mov	[bp+var_C19], 0
		jmp	loc_79B12
; ���������������������������������������������������������������������������

loc_79A30:				; CODE XREF: sub_768F0+323Dj
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_132+2], ax
		cmp	word ptr [bp+var_132+2], 0
		jnz	short loc_79A50
		push	word ptr [bp+var_10A]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_79A50:				; CODE XREF: sub_768F0+314Dj
		cmp	word ptr [bp+var_132+2], 4
		jge	short loc_79A6E
		mov	ax, word ptr [bp+var_11A+2]
		mov	word ptr [bp+var_132], ax
		inc	word ptr [bp+var_11A+2]
		mov	bx, word ptr [bp+var_10A]
		mov	ax, word ptr [bp+var_132]
		mov	[bx+1Bh], ax

loc_79A6E:				; CODE XREF: sub_768F0+3165j
		cmp	word ptr [bp+var_132+2], 8
		jnz	short loc_79ABF
		cmp	[bp+var_B], 0
		jz	short loc_79ABF
		mov	ax, word_48F20
		mov	word ptr [bp+var_136+2], ax
		mov	word ptr [bp+var_136], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_79ABF
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_136]
		push	word ptr [bp+var_136+2]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_79ABF:				; CODE XREF: sub_768F0+3183j
					; sub_768F0+3189j ...
		cmp	word ptr [bp+var_132+2], 7
		jle	short loc_79AE8
		mov	ax, si
		add	ax, 0Bh
		cmp	ax, word ptr [bp+var_132+2]
		jle	short loc_79AE8
		mov	ax, word ptr [bp+var_11A+2]
		mov	word ptr [bp+var_13A+2], ax
		inc	word ptr [bp+var_11A+2]
		mov	bx, word ptr [bp+var_10A]
		mov	ax, word ptr [bp+var_13A+2]
		mov	[bx+1Bh], ax

loc_79AE8:				; CODE XREF: sub_768F0+31D4j
					; sub_768F0+31DFj
		cmp	word ptr [bp+var_132+2], 0Bh
		jnz	short loc_79AF8
		mov	bx, word ptr [bp+var_10A]
		mov	word ptr [bx+1Bh], 5

loc_79AF8:				; CODE XREF: sub_768F0+31FDj
		jmp	short loc_79B05
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_79B05
		jmp	short loc_79B30
; ���������������������������������������������������������������������������

loc_79B05:				; CODE XREF: sub_768F0:loc_79AF8j
					; sub_768F0+3211j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_79B12:				; CODE XREF: sub_768F0+313Dj
		cmp	[bp+var_C19], 0Ch
		jnb	short loc_79B20
		cmp	[bp+var_C17], 0
		jz	short loc_79B25

loc_79B20:				; CODE XREF: sub_768F0+3227j
		mov	ax, 1
		jmp	short loc_79B27
; ���������������������������������������������������������������������������

loc_79B25:				; CODE XREF: sub_768F0+322Ej
		xor	ax, ax

loc_79B27:				; CODE XREF: sub_768F0+3233j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_79B30
		jmp	loc_79A30
; ���������������������������������������������������������������������������

loc_79B30:				; CODE XREF: sub_768F0+3213j
					; sub_768F0+323Bj
		mov	dword ptr [bp-12Eh], 0
		mov	byte ptr [bp+var_12C+2], 2
		mov	byte ptr [bp+var_12C+3], 0
		mov	dword ptr [bp+var_128],	0
		push	2
		lea	ax, [bp-12Eh]
		push	ax
		push	0Ah
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-12Eh]
		push	ax
		push	[bp+var_10C]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_126+2], 0
		jmp	short loc_79B8E
; ���������������������������������������������������������������������������

loc_79B7D:				; CODE XREF: sub_768F0+32A3j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_126+2]

loc_79B8E:				; CODE XREF: sub_768F0+328Bj
		cmp	word ptr [bp+var_126+2], 3
		jl	short loc_79B7D
		jmp	short loc_79BB1
; ���������������������������������������������������������������������������

loc_79B97:				; CODE XREF: sub_768F0+32CFj
		jmp	short loc_79BA4
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_79BA4
		jmp	short loc_79BC1
; ���������������������������������������������������������������������������

loc_79BA4:				; CODE XREF: sub_768F0:loc_79B97j
					; sub_768F0+32B0j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_79BB1:				; CODE XREF: sub_768F0+32A5j
		push	[bp+var_10C]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_79B97

loc_79BC1:				; CODE XREF: sub_768F0+32B2j
		mov	word ptr [bp+var_126+2], 0
		jmp	short loc_79BDA
; ���������������������������������������������������������������������������

loc_79BC9:				; CODE XREF: sub_768F0+32EFj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_126+2]

loc_79BDA:				; CODE XREF: sub_768F0+32D7j
		cmp	word ptr [bp+var_126+2], 2
		jl	short loc_79BC9
		cmp	byte ptr [bp+var_12C+3], 0
		jz	short loc_79C09
		cmp	dword ptr [bp-12Eh], 0
		jz	short loc_79C09
		push	0
		mov	al, byte ptr [bp+var_12C+2]
		push	ax
		lea	ax, [bp-12Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79C09:				; CODE XREF: sub_768F0+32F6j
					; sub_768F0+32FEj
		mov	dword ptr [bp-12Eh], 0
		mov	byte ptr [bp+var_12C+3], 0
		mov	dword ptr [bp+var_128],	0
		cmp	byte ptr [bp+var_11E+1], 0
		jz	short loc_79C48
		cmp	[bp+var_122], 0
		jz	short loc_79C48
		push	0
		mov	al, byte ptr [bp+var_11E]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79C48:				; CODE XREF: sub_768F0+3335j
					; sub_768F0+333Dj
		mov	[bp+var_122], 0
		mov	byte ptr [bp+var_11E+1], 0
		mov	[bp+var_11E+2],	0
		jmp	loc_79F99
; ���������������������������������������������������������������������������

loc_79C62:				; CODE XREF: sub_768F0+3096j
		push	7Dh ; '}'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 23h	; '#'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_79D83
; ���������������������������������������������������������������������������

loc_79C94:				; CODE XREF: sub_768F0+34ADj
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_11A], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79CC2
		mov	ax, [bp+var_8]
		shl	ax, 1
		add	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_79CC2:				; CODE XREF: sub_768F0+33B5j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79CDC
		push	2045h
		push	[bp+var_10C]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_79CDC:				; CODE XREF: sub_768F0+33DBj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79D27
		mov	[bp+var_C50], 11BCh
		mov	[bp+var_C50], 11C8h
		mov	[bp+var_C50], 11D8h
		mov	[bp+var_C50], 11E8h
		mov	[bp+var_C50], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C50]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_79D27:				; CODE XREF: sub_768F0+33F3j
		jmp	short loc_79D76
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_79D76
		mov	word ptr [bp-0C5Ch], 11BCh
		mov	word ptr [bp-0C5Ch], 11C8h
		mov	word ptr [bp-0C5Ch], 11D8h
		mov	word ptr [bp-0C5Ch], 11E8h
		mov	word ptr [bp-0C5Ch], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C5Ch]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_79DA0
; ���������������������������������������������������������������������������

loc_79D76:				; CODE XREF: sub_768F0:loc_79D27j
					; sub_768F0+3440j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_79D83:				; CODE XREF: sub_768F0+33A1j
		cmp	[bp+var_C19], di
		jnb	short loc_79D90
		cmp	[bp+var_C17], 0
		jz	short loc_79D95

loc_79D90:				; CODE XREF: sub_768F0+3497j
		mov	ax, 1
		jmp	short loc_79D97
; ���������������������������������������������������������������������������

loc_79D95:				; CODE XREF: sub_768F0+349Ej
		xor	ax, ax

loc_79D97:				; CODE XREF: sub_768F0+34A3j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_79DA0
		jmp	loc_79C94
; ���������������������������������������������������������������������������

loc_79DA0:				; CODE XREF: sub_768F0+3484j
					; sub_768F0+34ABj
		mov	[bp+var_4], 4Ch	; 'L'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_79F7C
; ���������������������������������������������������������������������������

loc_79DC0:				; CODE XREF: sub_768F0+36A6j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_11A], ax
		cmp	word ptr [bp+var_11A], si
		jnz	short loc_79DDF
		push	word ptr [bp+var_10A]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_79DDF:				; CODE XREF: sub_768F0+34DCj
		mov	ax, si
		add	ax, 4
		cmp	ax, word ptr [bp+var_11A]
		jle	short loc_79E01
		mov	ax, word ptr [bp+var_11A+2]
		mov	word ptr [bp+var_11E+2], ax
		inc	word ptr [bp+var_11A+2]
		mov	bx, word ptr [bp+var_10A]
		mov	ax, word ptr [bp+var_11E+2]
		mov	[bx+1Bh], ax

loc_79E01:				; CODE XREF: sub_768F0+34F8j
		mov	ax, si
		add	ax, 8
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79E56
		cmp	[bp+var_B], 0
		jz	short loc_79E56
		mov	ax, word_48F20
		mov	word ptr [bp+var_11E], ax
		mov	word ptr [bp+var_122+2], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_79E56
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_122+2]
		push	word ptr [bp+var_11E]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_79E56:				; CODE XREF: sub_768F0+351Aj
					; sub_768F0+3520j ...
		mov	ax, si
		add	ax, 7
		cmp	ax, word ptr [bp+var_11A]
		jge	short loc_79E83
		mov	ax, si
		add	ax, 0Bh
		cmp	ax, word ptr [bp+var_11A]
		jle	short loc_79E83
		mov	ax, word ptr [bp+var_11A+2]
		mov	word ptr [bp+var_122], ax
		inc	word ptr [bp+var_11A+2]
		mov	bx, word ptr [bp+var_10A]
		mov	ax, word ptr [bp+var_122]
		mov	[bx+1Bh], ax

loc_79E83:				; CODE XREF: sub_768F0+356Fj
					; sub_768F0+357Aj
		mov	ax, si
		add	ax, 0Bh
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79E97
		mov	bx, word ptr [bp+var_10A]
		mov	word ptr [bx+1Bh], 5

loc_79E97:				; CODE XREF: sub_768F0+359Cj
		mov	ax, si
		add	ax, 12h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79EBB
		mov	ax, [bp+var_8]
		shl	ax, 2
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_79EBB:				; CODE XREF: sub_768F0+35B0j
		mov	ax, si
		add	ax, 12h
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79ED5
		push	2053h
		push	[bp+var_10C]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_79ED5:				; CODE XREF: sub_768F0+35D4j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_11A]
		jnz	short loc_79F20
		mov	[bp+var_C50], 11BCh
		mov	[bp+var_C50], 11C8h
		mov	[bp+var_C50], 11D8h
		mov	[bp+var_C50], 11E8h
		mov	[bp+var_C50], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C50]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_79F20:				; CODE XREF: sub_768F0+35ECj
		jmp	short loc_79F6F
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_79F6F
		mov	word ptr [bp-0C5Ch], 11BCh
		mov	word ptr [bp-0C5Ch], 11C8h
		mov	word ptr [bp-0C5Ch], 11D8h
		mov	word ptr [bp-0C5Ch], 11E8h
		mov	word ptr [bp-0C5Ch], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C5Ch]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_79F99
; ���������������������������������������������������������������������������

loc_79F6F:				; CODE XREF: sub_768F0:loc_79F20j
					; sub_768F0+3639j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_79F7C:				; CODE XREF: sub_768F0+34CDj
		cmp	[bp+var_C19], di
		jnb	short loc_79F89
		cmp	[bp+var_C17], 0
		jz	short loc_79F8E

loc_79F89:				; CODE XREF: sub_768F0+3690j
		mov	ax, 1
		jmp	short loc_79F90
; ���������������������������������������������������������������������������

loc_79F8E:				; CODE XREF: sub_768F0+3697j
		xor	ax, ax

loc_79F90:				; CODE XREF: sub_768F0+369Cj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_79F99
		jmp	loc_79DC0
; ���������������������������������������������������������������������������

loc_79F99:				; CODE XREF: sub_768F0+336Fj
					; sub_768F0+367Dj ...
		lea	ax, [bp+var_C46+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C3B], 0
		jz	short loc_79FCE
		cmp	[bp+var_C40], 0
		jz	short loc_79FCE
		push	0
		mov	al, [bp+var_C3C]
		push	ax
		lea	ax, [bp+var_C40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_79FCE:				; CODE XREF: sub_768F0+36BBj
					; sub_768F0+36C3j
		mov	[bp+var_C40], 0
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		cmp	byte ptr [bp+var_112+1], 0
		jz	short loc_7A00D
		cmp	[bp+var_116], 0
		jz	short loc_7A00D
		push	0
		mov	al, byte ptr [bp+var_112]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A00D:				; CODE XREF: sub_768F0+36FAj
					; sub_768F0+3702j
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_110], 0
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_7A05B
		cmp	[bp+var_106], 0
		jz	short loc_7A05B
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A05B:				; CODE XREF: sub_768F0+3748j
					; sub_768F0+3750j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_7A09A
		cmp	[bp+var_FC], 0
		jz	short loc_7A09A
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A09A:				; CODE XREF: sub_768F0+3787j
					; sub_768F0+378Fj
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7A0BB
		jmp	loc_7A5B3
; ���������������������������������������������������������������������������

loc_7A0BB:				; CODE XREF: sub_768F0+37C6j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7A0F2
		cmp	[bp+var_E8], 0
		jz	short loc_7A0F2
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A0F2:				; CODE XREF: sub_768F0+37DFj
					; sub_768F0+37E7j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7A140
		cmp	[bp+var_D8], 0
		jz	short loc_7A140
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A140:				; CODE XREF: sub_768F0+382Dj
					; sub_768F0+3835j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7A18E
		cmp	[bp+var_C8], 0
		jz	short loc_7A18E
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A18E:				; CODE XREF: sub_768F0+387Bj
					; sub_768F0+3883j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7A1DC
		cmp	[bp+var_B8], 0
		jz	short loc_7A1DC
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A1DC:				; CODE XREF: sub_768F0+38C9j
					; sub_768F0+38D1j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7A21B
		cmp	[bp+var_AE], 0
		jz	short loc_7A21B
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A21B:				; CODE XREF: sub_768F0+3908j
					; sub_768F0+3910j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7A269
		cmp	[bp+var_9E], 0
		jz	short loc_7A269
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A269:				; CODE XREF: sub_768F0+3956j
					; sub_768F0+395Ej
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7A2A8
		cmp	[bp+var_94], 0
		jz	short loc_7A2A8
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A2A8:				; CODE XREF: sub_768F0+3995j
					; sub_768F0+399Dj
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7A2F4
		cmp	[bp+var_84], 0
		jz	short loc_7A2F4
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A2F4:				; CODE XREF: sub_768F0+39E2j
					; sub_768F0+39EAj
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7A32D
		cmp	[bp+var_7A], 0
		jz	short loc_7A32D
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A32D:				; CODE XREF: sub_768F0+3A1Dj
					; sub_768F0+3A24j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7A373
		cmp	[bp+var_6A], 0
		jz	short loc_7A373
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A373:				; CODE XREF: sub_768F0+3A63j
					; sub_768F0+3A6Aj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7A3B9
		cmp	[bp+var_5A], 0
		jz	short loc_7A3B9
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A3B9:				; CODE XREF: sub_768F0+3AA9j
					; sub_768F0+3AB0j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7A3F1
		cmp	[bp+var_50], 0
		jz	short loc_7A3F1
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A3F1:				; CODE XREF: sub_768F0+3AE1j
					; sub_768F0+3AE8j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7A44E
		cmp	[bp+var_C04], 0
		jz	short loc_7A44E
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A44E:				; CODE XREF: sub_768F0+3B3Bj
					; sub_768F0+3B43j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7A49A
		cmp	[bp+var_3EA], 0
		jz	short loc_7A49A
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A49A:				; CODE XREF: sub_768F0+3B87j
					; sub_768F0+3B8Fj
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7A4E4
		cmp	[bp+var_40], 0
		jz	short loc_7A4E4
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A4E4:				; CODE XREF: sub_768F0+3BD4j
					; sub_768F0+3BDBj
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7A565
		cmp	[bp+var_22], 0
		jz	short loc_7A565
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A565:				; CODE XREF: sub_768F0+3C55j
					; sub_768F0+3C5Cj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7A5B3:				; CODE XREF: sub_768F0+37C8j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	2
		lea	ax, [bp+var_FC]
		push	ax
		push	2065h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_94]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	[bp+var_A4]
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EE]
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	21h ; '!'
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		cmp	[bp+var_A], 0
		jnz	short loc_7A6B8
		jmp	loc_7A8A3
; ���������������������������������������������������������������������������

loc_7A6B8:				; CODE XREF: sub_768F0+3DC3j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106], 2
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		push	3
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_10A]
		push	ax
		push	word ptr [bp+var_100]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_10C], 0
		jmp	short loc_7A723
; ���������������������������������������������������������������������������

loc_7A712:				; CODE XREF: sub_768F0+3E38j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_7A723:				; CODE XREF: sub_768F0+3E20j
		cmp	[bp+var_10C], 3
		jl	short loc_7A712
		jmp	short loc_7A746
; ���������������������������������������������������������������������������

loc_7A72C:				; CODE XREF: sub_768F0+3E64j
		jmp	short loc_7A739
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7A739
		jmp	short loc_7A756
; ���������������������������������������������������������������������������

loc_7A739:				; CODE XREF: sub_768F0:loc_7A72Cj
					; sub_768F0+3E45j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7A746:				; CODE XREF: sub_768F0+3E3Aj
		push	word ptr [bp+var_100]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_7A72C

loc_7A756:				; CODE XREF: sub_768F0+3E47j
		push	0Eh
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112], 2
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_110], 0
		push	2
		lea	ax, [bp+var_116]
		push	ax
		push	4
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_116]
		push	ax
		push	word ptr [bp+var_100]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_10C], 0
		jmp	short loc_7A7CF
; ���������������������������������������������������������������������������

loc_7A7BE:				; CODE XREF: sub_768F0+3EE4j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_7A7CF:				; CODE XREF: sub_768F0+3ECCj
		cmp	[bp+var_10C], 3
		jl	short loc_7A7BE
		jmp	short loc_7A7F2
; ���������������������������������������������������������������������������

loc_7A7D8:				; CODE XREF: sub_768F0+3F10j
		jmp	short loc_7A7E5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7A7E5
		jmp	short loc_7A802
; ���������������������������������������������������������������������������

loc_7A7E5:				; CODE XREF: sub_768F0:loc_7A7D8j
					; sub_768F0+3EF1j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7A7F2:				; CODE XREF: sub_768F0+3EE6j
		push	word ptr [bp+var_100]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_7A7D8

loc_7A802:				; CODE XREF: sub_768F0+3EF3j
		mov	[bp+var_10C], 0
		jmp	short loc_7A81B
; ���������������������������������������������������������������������������

loc_7A80A:				; CODE XREF: sub_768F0+3F30j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_7A81B:				; CODE XREF: sub_768F0+3F18j
		cmp	[bp+var_10C], 2
		jl	short loc_7A80A
		cmp	byte ptr [bp+var_112+1], 0
		jz	short loc_7A84A
		cmp	[bp+var_116], 0
		jz	short loc_7A84A
		push	0
		mov	al, byte ptr [bp+var_112]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A84A:				; CODE XREF: sub_768F0+3F37j
					; sub_768F0+3F3Fj
		mov	[bp+var_116], 0
		mov	byte ptr [bp+var_112+1], 0
		mov	[bp+var_110], 0
		cmp	byte ptr [bp+var_106+1], 0
		jz	short loc_7A889
		cmp	[bp+var_10A], 0
		jz	short loc_7A889
		push	0
		mov	al, byte ptr [bp+var_106]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7A889:				; CODE XREF: sub_768F0+3F76j
					; sub_768F0+3F7Ej
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		jmp	loc_7AB32
; ���������������������������������������������������������������������������

loc_7A8A3:				; CODE XREF: sub_768F0+3DC5j
		push	7Dh ; '}'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 28h	; '('
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7A9C4
; ���������������������������������������������������������������������������

loc_7A8D5:				; CODE XREF: sub_768F0+40EEj
		mov	ax, [bp+var_C19]
		mov	[bp+var_102], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_7A903
		mov	ax, [bp+var_8]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7A903:				; CODE XREF: sub_768F0+3FF6j
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_7A91D
		push	2069h
		push	word ptr [bp+var_100]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7A91D:				; CODE XREF: sub_768F0+401Cj
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_7A968
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7A968:				; CODE XREF: sub_768F0+4034j
		jmp	short loc_7A9B7
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7A9B7
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7A9E1
; ���������������������������������������������������������������������������

loc_7A9B7:				; CODE XREF: sub_768F0:loc_7A968j
					; sub_768F0+4081j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7A9C4:				; CODE XREF: sub_768F0+3FE2j
		cmp	[bp+var_C19], di
		jnb	short loc_7A9D1
		cmp	[bp+var_C17], 0
		jz	short loc_7A9D6

loc_7A9D1:				; CODE XREF: sub_768F0+40D8j
		mov	ax, 1
		jmp	short loc_7A9D8
; ���������������������������������������������������������������������������

loc_7A9D6:				; CODE XREF: sub_768F0+40DFj
		xor	ax, ax

loc_7A9D8:				; CODE XREF: sub_768F0+40E4j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A9E1
		jmp	loc_7A8D5
; ���������������������������������������������������������������������������

loc_7A9E1:				; CODE XREF: sub_768F0+40C5j
					; sub_768F0+40ECj
		push	0Eh
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_4], 1Eh
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7AB15
; ���������������������������������������������������������������������������

loc_7AA0F:				; CODE XREF: sub_768F0+423Fj
		mov	ax, [bp+var_C19]
		mov	[bp+var_102], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_7AA3B
		mov	ax, [bp+var_8]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7AA3B:				; CODE XREF: sub_768F0+412Ej
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_7AA55
		push	2078h
		push	word ptr [bp+var_100]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7AA55:				; CODE XREF: sub_768F0+4154j
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, [bp+var_102]
		jnz	short loc_7AA6E
		push	19h
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7AA6E:				; CODE XREF: sub_768F0+416Ej
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_7AAB9
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7AAB9:				; CODE XREF: sub_768F0+4185j
		jmp	short loc_7AB08
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7AB08
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7AB32
; ���������������������������������������������������������������������������

loc_7AB08:				; CODE XREF: sub_768F0:loc_7AAB9j
					; sub_768F0+41D2j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7AB15:				; CODE XREF: sub_768F0+411Cj
		cmp	[bp+var_C19], di
		jnb	short loc_7AB22
		cmp	[bp+var_C17], 0
		jz	short loc_7AB27

loc_7AB22:				; CODE XREF: sub_768F0+4229j
		mov	ax, 1
		jmp	short loc_7AB29
; ���������������������������������������������������������������������������

loc_7AB27:				; CODE XREF: sub_768F0+4230j
		xor	ax, ax

loc_7AB29:				; CODE XREF: sub_768F0+4235j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AB32
		jmp	loc_7AA0F
; ���������������������������������������������������������������������������

loc_7AB32:				; CODE XREF: sub_768F0+3FB0j
					; sub_768F0+4216j ...
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_F7], 0
		jz	short loc_7AB69
		cmp	[bp+var_FC], 0
		jz	short loc_7AB69
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AB69:				; CODE XREF: sub_768F0+4256j
					; sub_768F0+425Ej
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7AB8A
		jmp	loc_7B082
; ���������������������������������������������������������������������������

loc_7AB8A:				; CODE XREF: sub_768F0+4295j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7ABC1
		cmp	[bp+var_E8], 0
		jz	short loc_7ABC1
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7ABC1:				; CODE XREF: sub_768F0+42AEj
					; sub_768F0+42B6j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7AC0F
		cmp	[bp+var_D8], 0
		jz	short loc_7AC0F
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AC0F:				; CODE XREF: sub_768F0+42FCj
					; sub_768F0+4304j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7AC5D
		cmp	[bp+var_C8], 0
		jz	short loc_7AC5D
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AC5D:				; CODE XREF: sub_768F0+434Aj
					; sub_768F0+4352j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7ACAB
		cmp	[bp+var_B8], 0
		jz	short loc_7ACAB
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7ACAB:				; CODE XREF: sub_768F0+4398j
					; sub_768F0+43A0j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7ACEA
		cmp	[bp+var_AE], 0
		jz	short loc_7ACEA
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7ACEA:				; CODE XREF: sub_768F0+43D7j
					; sub_768F0+43DFj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7AD38
		cmp	[bp+var_9E], 0
		jz	short loc_7AD38
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AD38:				; CODE XREF: sub_768F0+4425j
					; sub_768F0+442Dj
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7AD77
		cmp	[bp+var_94], 0
		jz	short loc_7AD77
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AD77:				; CODE XREF: sub_768F0+4464j
					; sub_768F0+446Cj
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7ADC3
		cmp	[bp+var_84], 0
		jz	short loc_7ADC3
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7ADC3:				; CODE XREF: sub_768F0+44B1j
					; sub_768F0+44B9j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7ADFC
		cmp	[bp+var_7A], 0
		jz	short loc_7ADFC
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7ADFC:				; CODE XREF: sub_768F0+44ECj
					; sub_768F0+44F3j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7AE42
		cmp	[bp+var_6A], 0
		jz	short loc_7AE42
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AE42:				; CODE XREF: sub_768F0+4532j
					; sub_768F0+4539j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7AE88
		cmp	[bp+var_5A], 0
		jz	short loc_7AE88
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AE88:				; CODE XREF: sub_768F0+4578j
					; sub_768F0+457Fj
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7AEC0
		cmp	[bp+var_50], 0
		jz	short loc_7AEC0
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AEC0:				; CODE XREF: sub_768F0+45B0j
					; sub_768F0+45B7j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7AF1D
		cmp	[bp+var_C04], 0
		jz	short loc_7AF1D
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AF1D:				; CODE XREF: sub_768F0+460Aj
					; sub_768F0+4612j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7AF69
		cmp	[bp+var_3EA], 0
		jz	short loc_7AF69
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AF69:				; CODE XREF: sub_768F0+4656j
					; sub_768F0+465Ej
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7AFB3
		cmp	[bp+var_40], 0
		jz	short loc_7AFB3
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7AFB3:				; CODE XREF: sub_768F0+46A3j
					; sub_768F0+46AAj
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7B034
		cmp	[bp+var_22], 0
		jz	short loc_7B034
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B034:				; CODE XREF: sub_768F0+4724j
					; sub_768F0+472Bj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7B082:				; CODE XREF: sub_768F0+4297j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	2
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, [bp+var_106]
		push	ax
		push	13h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_10A+1], 0
		lea	ax, [bp+var_106]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	8
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_110+2], ax
		push	0
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_110], ax
		push	[bp+var_BE]
		mov	al, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_10C]
		mov	al, byte ptr [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116], 2
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		mov	[bp+var_C40], 0
		mov	[bp+var_C3C], 2
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		mov	word ptr [bp+var_C46+2], 0
		mov	[bp+var_C42], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_7B20A
		push	3
		lea	ax, [bp+var_11A]
		push	ax
		push	50h ; 'P'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_7B20A:				; CODE XREF: sub_768F0+48DDj
		mov	[bp+var_126+2],	0
		mov	byte ptr [bp+var_122+2], 2
		mov	byte ptr [bp+var_122+3], 0
		mov	[bp+var_11E], 0
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A], 2
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		mov	[bp+var_C52], 0
		mov	[bp+var_C50], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_7B28F
		push	3
		lea	ax, [bp+var_126+2]
		push	ax
		push	55h ; 'U'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_126+2]
		push	ax
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_7B28F:				; CODE XREF: sub_768F0+4962j
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_110+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_110]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	loc_7B396
; ���������������������������������������������������������������������������

loc_7B2C9:				; CODE XREF: sub_768F0+4AC1j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_126], ax
		mov	ax, word ptr [bp+var_126]
		mov	[bp+var_128], ax
		mov	bx, word ptr [bp+var_110]
		mov	ax, [bp+var_128]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_126], 2
		jnz	short loc_7B335
		cmp	[bp+var_B], 0
		jz	short loc_7B335
		mov	ax, word_48F42
		mov	word ptr [bp+var_12C+2], ax
		mov	word ptr [bp+var_12C], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_7B335
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_12C]
		push	word ptr [bp+var_12C+2]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7B335:				; CODE XREF: sub_768F0+49F9j
					; sub_768F0+49FFj ...
		cmp	word ptr [bp+var_126], 3
		jnz	short loc_7B389
		cmp	[bp+var_B], 0
		jz	short loc_7B389
		mov	ax, word_48F4C
		add	ax, 28h	; '('
		mov	[bp-12Eh], ax
		mov	word ptr [bp+var_132+2], 0
		cmp	[bp+var_C52], 0
		jz	short loc_7B389
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_132+2]
		push	word ptr [bp-12Eh]
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7B389:				; CODE XREF: sub_768F0+4A4Aj
					; sub_768F0+4A50j ...
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7B396:				; CODE XREF: sub_768F0+49D6j
		cmp	[bp+var_C19], 0Dh
		jnb	short loc_7B3A4
		cmp	[bp+var_C17], 0
		jz	short loc_7B3A9

loc_7B3A4:				; CODE XREF: sub_768F0+4AABj
		mov	ax, 1
		jmp	short loc_7B3AB
; ���������������������������������������������������������������������������

loc_7B3A9:				; CODE XREF: sub_768F0+4AB2j
		xor	ax, ax

loc_7B3AB:				; CODE XREF: sub_768F0+4AB7j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7B3B4
		jmp	loc_7B2C9
; ���������������������������������������������������������������������������

loc_7B3B4:				; CODE XREF: sub_768F0+4ABFj
		lea	ax, [bp+var_C52]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_C4A+1], 0
		jz	short loc_7B3E9
		cmp	[bp+var_C4E], 0
		jz	short loc_7B3E9
		push	0
		mov	al, byte ptr [bp+var_C4A]
		push	ax
		lea	ax, [bp+var_C4E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B3E9:				; CODE XREF: sub_768F0+4AD6j
					; sub_768F0+4ADEj
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		cmp	byte ptr [bp+var_122+3], 0
		jz	short loc_7B428
		cmp	[bp+var_126+2],	0
		jz	short loc_7B428
		push	0
		mov	al, byte ptr [bp+var_122+2]
		push	ax
		lea	ax, [bp+var_126+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B428:				; CODE XREF: sub_768F0+4B15j
					; sub_768F0+4B1Dj
		mov	[bp+var_126+2],	0
		mov	byte ptr [bp+var_122+3], 0
		mov	[bp+var_11E], 0
		lea	ax, [bp+var_C46+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C3B], 0
		jz	short loc_7B474
		cmp	[bp+var_C40], 0
		jz	short loc_7B474
		push	0
		mov	al, [bp+var_C3C]
		push	ax
		lea	ax, [bp+var_C40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B474:				; CODE XREF: sub_768F0+4B61j
					; sub_768F0+4B69j
		mov	[bp+var_C40], 0
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		cmp	byte ptr [bp+var_116+1], 0
		jz	short loc_7B4B3
		cmp	dword ptr [bp-11Ah], 0
		jz	short loc_7B4B3
		push	0
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B4B3:				; CODE XREF: sub_768F0+4BA0j
					; sub_768F0+4BA8j
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_7B510
		cmp	[bp+var_106], 0
		jz	short loc_7B510
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B510:				; CODE XREF: sub_768F0+4BFDj
					; sub_768F0+4C05j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_7B54F
		cmp	[bp+var_FC], 0
		jz	short loc_7B54F
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B54F:				; CODE XREF: sub_768F0+4C3Cj
					; sub_768F0+4C44j
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7B570
		jmp	loc_7BA68
; ���������������������������������������������������������������������������

loc_7B570:				; CODE XREF: sub_768F0+4C7Bj
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7B5A7
		cmp	[bp+var_E8], 0
		jz	short loc_7B5A7
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B5A7:				; CODE XREF: sub_768F0+4C94j
					; sub_768F0+4C9Cj
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7B5F5
		cmp	[bp+var_D8], 0
		jz	short loc_7B5F5
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B5F5:				; CODE XREF: sub_768F0+4CE2j
					; sub_768F0+4CEAj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7B643
		cmp	[bp+var_C8], 0
		jz	short loc_7B643
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B643:				; CODE XREF: sub_768F0+4D30j
					; sub_768F0+4D38j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7B691
		cmp	[bp+var_B8], 0
		jz	short loc_7B691
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B691:				; CODE XREF: sub_768F0+4D7Ej
					; sub_768F0+4D86j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7B6D0
		cmp	[bp+var_AE], 0
		jz	short loc_7B6D0
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B6D0:				; CODE XREF: sub_768F0+4DBDj
					; sub_768F0+4DC5j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7B71E
		cmp	[bp+var_9E], 0
		jz	short loc_7B71E
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B71E:				; CODE XREF: sub_768F0+4E0Bj
					; sub_768F0+4E13j
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7B75D
		cmp	[bp+var_94], 0
		jz	short loc_7B75D
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B75D:				; CODE XREF: sub_768F0+4E4Aj
					; sub_768F0+4E52j
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7B7A9
		cmp	[bp+var_84], 0
		jz	short loc_7B7A9
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B7A9:				; CODE XREF: sub_768F0+4E97j
					; sub_768F0+4E9Fj
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7B7E2
		cmp	[bp+var_7A], 0
		jz	short loc_7B7E2
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B7E2:				; CODE XREF: sub_768F0+4ED2j
					; sub_768F0+4ED9j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7B828
		cmp	[bp+var_6A], 0
		jz	short loc_7B828
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B828:				; CODE XREF: sub_768F0+4F18j
					; sub_768F0+4F1Fj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7B86E
		cmp	[bp+var_5A], 0
		jz	short loc_7B86E
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B86E:				; CODE XREF: sub_768F0+4F5Ej
					; sub_768F0+4F65j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7B8A6
		cmp	[bp+var_50], 0
		jz	short loc_7B8A6
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B8A6:				; CODE XREF: sub_768F0+4F96j
					; sub_768F0+4F9Dj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7B903
		cmp	[bp+var_C04], 0
		jz	short loc_7B903
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B903:				; CODE XREF: sub_768F0+4FF0j
					; sub_768F0+4FF8j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7B94F
		cmp	[bp+var_3EA], 0
		jz	short loc_7B94F
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B94F:				; CODE XREF: sub_768F0+503Cj
					; sub_768F0+5044j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7B999
		cmp	[bp+var_40], 0
		jz	short loc_7B999
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7B999:				; CODE XREF: sub_768F0+5089j
					; sub_768F0+5090j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7BA1A
		cmp	[bp+var_22], 0
		jz	short loc_7BA1A
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BA1A:				; CODE XREF: sub_768F0+510Aj
					; sub_768F0+5111j
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7BA68:				; CODE XREF: sub_768F0+4C7Dj
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	2082h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_94]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	[bp+var_A4]
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EE]
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0Eh
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		cmp	[bp+var_A], 0
		jnz	short loc_7BB6D
		jmp	loc_7BC6D
; ���������������������������������������������������������������������������

loc_7BB6D:				; CODE XREF: sub_768F0+5278j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106], 2
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		push	5
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_10A]
		push	ax
		push	word ptr [bp+var_100]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_10C], 0
		jmp	short loc_7BBD8
; ���������������������������������������������������������������������������

loc_7BBC7:				; CODE XREF: sub_768F0+52EDj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_7BBD8:				; CODE XREF: sub_768F0+52D5j
		cmp	[bp+var_10C], 3
		jl	short loc_7BBC7
		jmp	short loc_7BBFB
; ���������������������������������������������������������������������������

loc_7BBE1:				; CODE XREF: sub_768F0+5319j
		jmp	short loc_7BBEE
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7BBEE
		jmp	short loc_7BC0B
; ���������������������������������������������������������������������������

loc_7BBEE:				; CODE XREF: sub_768F0:loc_7BBE1j
					; sub_768F0+52FAj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7BBFB:				; CODE XREF: sub_768F0+52EFj
		push	word ptr [bp+var_100]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_7BBE1

loc_7BC0B:				; CODE XREF: sub_768F0+52FCj
		mov	[bp+var_10C], 0
		jmp	short loc_7BC24
; ���������������������������������������������������������������������������

loc_7BC13:				; CODE XREF: sub_768F0+5339j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_7BC24:				; CODE XREF: sub_768F0+5321j
		cmp	[bp+var_10C], 2
		jl	short loc_7BC13
		cmp	byte ptr [bp+var_106+1], 0
		jz	short loc_7BC53
		cmp	[bp+var_10A], 0
		jz	short loc_7BC53
		push	0
		mov	al, byte ptr [bp+var_106]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BC53:				; CODE XREF: sub_768F0+5340j
					; sub_768F0+5348j
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		jmp	loc_7BDA9
; ���������������������������������������������������������������������������

loc_7BC6D:				; CODE XREF: sub_768F0+527Aj
		push	7Dh ; '}'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 2Ch	; ','
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7BD8C
; ���������������������������������������������������������������������������

loc_7BC9F:				; CODE XREF: sub_768F0+54B6j
		mov	ax, [bp+var_C19]
		mov	[bp+var_102], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_7BCCB
		mov	ax, [bp+var_8]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7BCCB:				; CODE XREF: sub_768F0+53BEj
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_7BCE5
		push	2086h
		push	word ptr [bp+var_100]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7BCE5:				; CODE XREF: sub_768F0+53E4j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_7BD30
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7BD30:				; CODE XREF: sub_768F0+53FCj
		jmp	short loc_7BD7F
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7BD7F
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7BDA9
; ���������������������������������������������������������������������������

loc_7BD7F:				; CODE XREF: sub_768F0:loc_7BD30j
					; sub_768F0+5449j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7BD8C:				; CODE XREF: sub_768F0+53ACj
		cmp	[bp+var_C19], di
		jnb	short loc_7BD99
		cmp	[bp+var_C17], 0
		jz	short loc_7BD9E

loc_7BD99:				; CODE XREF: sub_768F0+54A0j
		mov	ax, 1
		jmp	short loc_7BDA0
; ���������������������������������������������������������������������������

loc_7BD9E:				; CODE XREF: sub_768F0+54A7j
		xor	ax, ax

loc_7BDA0:				; CODE XREF: sub_768F0+54ACj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7BDA9
		jmp	loc_7BC9F
; ���������������������������������������������������������������������������

loc_7BDA9:				; CODE XREF: sub_768F0+537Aj
					; sub_768F0+548Dj ...
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_F7], 0
		jz	short loc_7BDE0
		cmp	[bp+var_FC], 0
		jz	short loc_7BDE0
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BDE0:				; CODE XREF: sub_768F0+54CDj
					; sub_768F0+54D5j
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7BE01
		jmp	loc_7C2F9
; ���������������������������������������������������������������������������

loc_7BE01:				; CODE XREF: sub_768F0+550Cj
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7BE38
		cmp	[bp+var_E8], 0
		jz	short loc_7BE38
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BE38:				; CODE XREF: sub_768F0+5525j
					; sub_768F0+552Dj
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7BE86
		cmp	[bp+var_D8], 0
		jz	short loc_7BE86
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BE86:				; CODE XREF: sub_768F0+5573j
					; sub_768F0+557Bj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7BED4
		cmp	[bp+var_C8], 0
		jz	short loc_7BED4
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BED4:				; CODE XREF: sub_768F0+55C1j
					; sub_768F0+55C9j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7BF22
		cmp	[bp+var_B8], 0
		jz	short loc_7BF22
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BF22:				; CODE XREF: sub_768F0+560Fj
					; sub_768F0+5617j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7BF61
		cmp	[bp+var_AE], 0
		jz	short loc_7BF61
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BF61:				; CODE XREF: sub_768F0+564Ej
					; sub_768F0+5656j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7BFAF
		cmp	[bp+var_9E], 0
		jz	short loc_7BFAF
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BFAF:				; CODE XREF: sub_768F0+569Cj
					; sub_768F0+56A4j
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7BFEE
		cmp	[bp+var_94], 0
		jz	short loc_7BFEE
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7BFEE:				; CODE XREF: sub_768F0+56DBj
					; sub_768F0+56E3j
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7C03A
		cmp	[bp+var_84], 0
		jz	short loc_7C03A
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C03A:				; CODE XREF: sub_768F0+5728j
					; sub_768F0+5730j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7C073
		cmp	[bp+var_7A], 0
		jz	short loc_7C073
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C073:				; CODE XREF: sub_768F0+5763j
					; sub_768F0+576Aj
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7C0B9
		cmp	[bp+var_6A], 0
		jz	short loc_7C0B9
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C0B9:				; CODE XREF: sub_768F0+57A9j
					; sub_768F0+57B0j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7C0FF
		cmp	[bp+var_5A], 0
		jz	short loc_7C0FF
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C0FF:				; CODE XREF: sub_768F0+57EFj
					; sub_768F0+57F6j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7C137
		cmp	[bp+var_50], 0
		jz	short loc_7C137
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C137:				; CODE XREF: sub_768F0+5827j
					; sub_768F0+582Ej
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7C194
		cmp	[bp+var_C04], 0
		jz	short loc_7C194
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C194:				; CODE XREF: sub_768F0+5881j
					; sub_768F0+5889j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7C1E0
		cmp	[bp+var_3EA], 0
		jz	short loc_7C1E0
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C1E0:				; CODE XREF: sub_768F0+58CDj
					; sub_768F0+58D5j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7C22A
		cmp	[bp+var_40], 0
		jz	short loc_7C22A
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C22A:				; CODE XREF: sub_768F0+591Aj
					; sub_768F0+5921j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7C2AB
		cmp	[bp+var_22], 0
		jz	short loc_7C2AB
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C2AB:				; CODE XREF: sub_768F0+599Bj
					; sub_768F0+59A2j
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7C2F9:				; CODE XREF: sub_768F0+550Ej
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	1Bh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	1Ch
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C], 2
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		push	2
		lea	ax, [bp+var_110]
		push	ax
		push	13h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_116+3], 0
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	8
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_11A+2], ax
		push	0
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_11A], ax
		push	0
		push	0
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_11E+2], ax
		push	[bp+var_BE]
		mov	al, [bp+var_BC]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_116]
		mov	al, byte ptr [bp+var_116+2]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_11A+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_11A]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_11E+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	loc_7C510
; ���������������������������������������������������������������������������

loc_7C490:				; CODE XREF: sub_768F0+5C3Bj
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_11E], ax
		mov	ax, word ptr [bp+var_11E]
		mov	word ptr [bp+var_122+2], ax
		mov	bx, word ptr [bp+var_11A]
		mov	ax, word ptr [bp+var_122+2]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp+var_11E], 0Ch
		jnz	short loc_7C4C1
		push	7
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_7C4C1:				; CODE XREF: sub_768F0+5BC0j
		cmp	word ptr [bp+var_11E], 0Eh
		jnz	short loc_7C4D7
		push	6
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_7C4D7:				; CODE XREF: sub_768F0+5BD6j
		cmp	word ptr [bp+var_11E], 10h
		jnz	short loc_7C4ED
		push	5
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_7C4ED:				; CODE XREF: sub_768F0+5BECj
		cmp	word ptr [bp+var_11E], 12h
		jnz	short loc_7C503
		push	4
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_7C503:				; CODE XREF: sub_768F0+5C02j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7C510:				; CODE XREF: sub_768F0+5B9Dj
		cmp	[bp+var_C19], 15h
		jnb	short loc_7C51E
		cmp	[bp+var_C17], 0
		jz	short loc_7C523

loc_7C51E:				; CODE XREF: sub_768F0+5C25j
		mov	ax, 1
		jmp	short loc_7C525
; ���������������������������������������������������������������������������

loc_7C523:				; CODE XREF: sub_768F0+5C2Cj
		xor	ax, ax

loc_7C525:				; CODE XREF: sub_768F0+5C31j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7C52E
		jmp	loc_7C490
; ���������������������������������������������������������������������������

loc_7C52E:				; CODE XREF: sub_768F0+5C39j
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_116]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_10C+1], 0
		jz	short loc_7C574
		cmp	[bp+var_110], 0
		jz	short loc_7C574
		push	0
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C574:				; CODE XREF: sub_768F0+5C61j
					; sub_768F0+5C69j
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_7C5B3
		cmp	[bp+var_106], 0
		jz	short loc_7C5B3
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C5B3:				; CODE XREF: sub_768F0+5CA0j
					; sub_768F0+5CA8j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_7C5F2
		cmp	[bp+var_FC], 0
		jz	short loc_7C5F2
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C5F2:				; CODE XREF: sub_768F0+5CDFj
					; sub_768F0+5CE7j
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7C613
		jmp	loc_7CB0B
; ���������������������������������������������������������������������������

loc_7C613:				; CODE XREF: sub_768F0+5D1Ej
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7C64A
		cmp	[bp+var_E8], 0
		jz	short loc_7C64A
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C64A:				; CODE XREF: sub_768F0+5D37j
					; sub_768F0+5D3Fj
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7C698
		cmp	[bp+var_D8], 0
		jz	short loc_7C698
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C698:				; CODE XREF: sub_768F0+5D85j
					; sub_768F0+5D8Dj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7C6E6
		cmp	[bp+var_C8], 0
		jz	short loc_7C6E6
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C6E6:				; CODE XREF: sub_768F0+5DD3j
					; sub_768F0+5DDBj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7C734
		cmp	[bp+var_B8], 0
		jz	short loc_7C734
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C734:				; CODE XREF: sub_768F0+5E21j
					; sub_768F0+5E29j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7C773
		cmp	[bp+var_AE], 0
		jz	short loc_7C773
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C773:				; CODE XREF: sub_768F0+5E60j
					; sub_768F0+5E68j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7C7C1
		cmp	[bp+var_9E], 0
		jz	short loc_7C7C1
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C7C1:				; CODE XREF: sub_768F0+5EAEj
					; sub_768F0+5EB6j
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7C800
		cmp	[bp+var_94], 0
		jz	short loc_7C800
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C800:				; CODE XREF: sub_768F0+5EEDj
					; sub_768F0+5EF5j
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7C84C
		cmp	[bp+var_84], 0
		jz	short loc_7C84C
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C84C:				; CODE XREF: sub_768F0+5F3Aj
					; sub_768F0+5F42j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7C885
		cmp	[bp+var_7A], 0
		jz	short loc_7C885
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C885:				; CODE XREF: sub_768F0+5F75j
					; sub_768F0+5F7Cj
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7C8CB
		cmp	[bp+var_6A], 0
		jz	short loc_7C8CB
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C8CB:				; CODE XREF: sub_768F0+5FBBj
					; sub_768F0+5FC2j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7C911
		cmp	[bp+var_5A], 0
		jz	short loc_7C911
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C911:				; CODE XREF: sub_768F0+6001j
					; sub_768F0+6008j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7C949
		cmp	[bp+var_50], 0
		jz	short loc_7C949
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C949:				; CODE XREF: sub_768F0+6039j
					; sub_768F0+6040j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7C9A6
		cmp	[bp+var_C04], 0
		jz	short loc_7C9A6
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C9A6:				; CODE XREF: sub_768F0+6093j
					; sub_768F0+609Bj
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7C9F2
		cmp	[bp+var_3EA], 0
		jz	short loc_7C9F2
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7C9F2:				; CODE XREF: sub_768F0+60DFj
					; sub_768F0+60E7j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7CA3C
		cmp	[bp+var_40], 0
		jz	short loc_7CA3C
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7CA3C:				; CODE XREF: sub_768F0+612Cj
					; sub_768F0+6133j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7CABD
		cmp	[bp+var_22], 0
		jz	short loc_7CABD
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7CABD:				; CODE XREF: sub_768F0+61ADj
					; sub_768F0+61B4j
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7CB0B:				; CODE XREF: sub_768F0+5D20j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	0Ah
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	18h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C], 2
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		push	3
		lea	ax, [bp+var_110]
		push	ax
		push	19h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116], 2
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		push	3
		lea	ax, [bp+var_11A]
		push	ax
		push	1Ah
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_126+2],	0
		mov	byte ptr [bp+var_122+2], 2
		mov	byte ptr [bp+var_122+3], 0
		mov	[bp+var_11E], 0
		push	2
		lea	ax, [bp+var_126+2]
		push	ax
		push	15h
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_128+1],	0
		lea	ax, [bp+var_126+2]
		push	ax
		lea	ax, [bp+var_12C+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_94]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_12C], ax
		push	0
		push	0
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-12Eh], ax
		push	1
		push	0
		push	0Ah
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_132+2], ax
		push	0
		push	0
		push	0
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_132], ax
		push	1
		push	0
		push	0
		lea	ax, [bp+var_110]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_136+2], ax
		push	0
		push	0
		lea	ax, [bp+var_11A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_136], ax
		push	[bp+var_A4]
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp+var_12C+2]
		mov	al, byte ptr [bp+var_128]
		push	ax
		lea	ax, [bp+var_12C+2]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_12C]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-12Eh]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_132+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_132]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_136+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [bp+var_13A+2], 1
		mov	word ptr [bp+var_13A], 1
		jmp	loc_7CEBB
; ���������������������������������������������������������������������������

loc_7CD81:				; CODE XREF: sub_768F0+65E6j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_13E+2], ax
		cmp	word ptr [bp+var_13E+2], 1
		jle	short loc_7CDAE
		cmp	word ptr [bp+var_13E+2], 5
		jge	short loc_7CDAE
		mov	ax, word ptr [bp+var_13A+2]
		mov	word ptr [bp+var_13E], ax
		inc	word ptr [bp+var_13A+2]
		mov	bx, word ptr [bp+var_136+2]
		mov	ax, word ptr [bp+var_13E]
		mov	[bx+1Bh], ax

loc_7CDAE:				; CODE XREF: sub_768F0+649Ej
					; sub_768F0+64A5j
		cmp	word ptr [bp+var_13E+2], 0Dh
		jle	short loc_7CDD3
		cmp	word ptr [bp+var_13E+2], 12h
		jge	short loc_7CDD3
		mov	ax, word ptr [bp+var_13A+2]
		mov	[bp+var_140], ax
		inc	word ptr [bp+var_13A+2]
		mov	bx, word ptr [bp+var_136+2]
		mov	ax, [bp+var_140]
		mov	[bx+1Bh], ax

loc_7CDD3:				; CODE XREF: sub_768F0+64C3j
					; sub_768F0+64CAj
		cmp	word ptr [bp+var_13E+2], 12h
		jnz	short loc_7CDFC
		push	word ptr [bp+var_136+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	word ptr [bp+var_136]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_7CDFC:				; CODE XREF: sub_768F0+64E8j
		cmp	word ptr [bp+var_13E+2], 1Ch
		jnz	short loc_7CE16
		mov	ax, word ptr [bp+var_13A]
		mov	word ptr [bp+var_144+2], ax
		mov	bx, word ptr [bp+var_136]
		mov	ax, word ptr [bp+var_144+2]
		mov	[bx+1Bh], ax

loc_7CE16:				; CODE XREF: sub_768F0+6511j
		cmp	word ptr [bp+var_13E+2], 1Dh
		jnz	short loc_7CE6C
		push	word ptr [bp+var_136]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_136], 0
		jz	short loc_7CE48
		push	3
		push	word ptr [bp+var_136]
		mov	bx, word ptr [bp+var_136]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_7CE48:				; CODE XREF: sub_768F0+6543j
		push	word ptr [bp+var_136+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	ax, word ptr [bp+var_13A+2]
		mov	word ptr [bp+var_144], ax
		mov	bx, word ptr [bp+var_136+2]
		mov	ax, word ptr [bp+var_144]
		mov	[bx+1Bh], ax

loc_7CE6C:				; CODE XREF: sub_768F0+652Bj
		cmp	word ptr [bp+var_13E+2], 1Dh
		jle	short loc_7CE91
		cmp	word ptr [bp+var_13E+2], 1Fh
		jge	short loc_7CE91
		mov	ax, word ptr [bp+var_13A+2]
		mov	word ptr [bp+var_148+2], ax
		inc	word ptr [bp+var_13A+2]
		mov	bx, word ptr [bp+var_136+2]
		mov	ax, word ptr [bp+var_148+2]
		mov	[bx+1Bh], ax

loc_7CE91:				; CODE XREF: sub_768F0+6581j
					; sub_768F0+6588j
		cmp	word ptr [bp+var_13E+2], 1Fh
		jnz	short loc_7CEA1
		mov	bx, word ptr [bp+var_136+2]
		mov	word ptr [bx+1Bh], 1

loc_7CEA1:				; CODE XREF: sub_768F0+65A6j
		jmp	short loc_7CEAE
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7CEAE
		jmp	short loc_7CED9
; ���������������������������������������������������������������������������

loc_7CEAE:				; CODE XREF: sub_768F0:loc_7CEA1j
					; sub_768F0+65BAj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7CEBB:				; CODE XREF: sub_768F0+648Ej
		cmp	[bp+var_C19], 26h ; '&'
		jnb	short loc_7CEC9
		cmp	[bp+var_C17], 0
		jz	short loc_7CECE

loc_7CEC9:				; CODE XREF: sub_768F0+65D0j
		mov	ax, 1
		jmp	short loc_7CED0
; ���������������������������������������������������������������������������

loc_7CECE:				; CODE XREF: sub_768F0+65D7j
		xor	ax, ax

loc_7CED0:				; CODE XREF: sub_768F0+65DCj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7CED9
		jmp	loc_7CD81
; ���������������������������������������������������������������������������

loc_7CED9:				; CODE XREF: sub_768F0+65BCj
					; sub_768F0+65E4j
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_12C+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_122+3], 0
		jz	short loc_7CF1F
		cmp	[bp+var_126+2],	0
		jz	short loc_7CF1F
		push	0
		mov	al, byte ptr [bp+var_122+2]
		push	ax
		lea	ax, [bp+var_126+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7CF1F:				; CODE XREF: sub_768F0+660Cj
					; sub_768F0+6614j
		mov	[bp+var_126+2],	0
		mov	byte ptr [bp+var_122+3], 0
		mov	[bp+var_11E], 0
		cmp	byte ptr [bp+var_116+1], 0
		jz	short loc_7CF5E
		cmp	[bp+var_11A], 0
		jz	short loc_7CF5E
		push	0
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7CF5E:				; CODE XREF: sub_768F0+664Bj
					; sub_768F0+6653j
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		cmp	byte ptr [bp+var_10C+1], 0
		jz	short loc_7CF9D
		cmp	[bp+var_110], 0
		jz	short loc_7CF9D
		push	0
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7CF9D:				; CODE XREF: sub_768F0+668Aj
					; sub_768F0+6692j
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_7CFDC
		cmp	[bp+var_106], 0
		jz	short loc_7CFDC
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7CFDC:				; CODE XREF: sub_768F0+66C9j
					; sub_768F0+66D1j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_7D01B
		cmp	[bp+var_FC], 0
		jz	short loc_7D01B
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7D01B:				; CODE XREF: sub_768F0+6708j
					; sub_768F0+6710j
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	2093h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	4
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C], 2
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		push	3
		lea	ax, [bp+var_110]
		push	ax
		push	1Dh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116], 2
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		push	2
		lea	ax, [bp+var_11A]
		push	ax
		push	1Eh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_11E+1], 0
		lea	ax, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_122+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_7A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_122], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_126+2], ax
		push	0FFF5h
		push	0
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_126], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_110]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp+var_128], ax
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EE]
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_132], 0
		mov	byte ptr [bp-12Eh], 2
		mov	[bp+var_12D], 0
		mov	[bp+var_12C], 0
		mov	[bp+var_C40], 0
		mov	[bp+var_C3C], 2
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		mov	word ptr [bp+var_C46+2], 0
		mov	[bp+var_C42], 0FFFFh
		cmp	[bp+var_B], 0
		jz	short loc_7D24B
		push	3
		lea	ax, [bp+var_132]
		push	ax
		push	2Bh ; '+'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_7D24B:				; CODE XREF: sub_768F0+691Ej
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_122]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_126+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_126]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_128]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 5
		cmp	[bp+var_A], 0
		jnz	short loc_7D2C4
		jmp	loc_7D67C
; ���������������������������������������������������������������������������

loc_7D2C4:				; CODE XREF: sub_768F0+69CFj
		lea	ax, [bp+var_C36]
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
		push	0Bh
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_13E+2]
		push	ax
		push	word ptr [bp+var_126+2]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_7D32F
; ���������������������������������������������������������������������������

loc_7D31E:				; CODE XREF: sub_768F0+6A44j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_7D32F:				; CODE XREF: sub_768F0+6A2Cj
		cmp	word ptr [bp+var_13E], 3
		jl	short loc_7D31E
		jmp	short loc_7D352
; ���������������������������������������������������������������������������

loc_7D338:				; CODE XREF: sub_768F0+6A70j
		jmp	short loc_7D345
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7D345
		jmp	short loc_7D362
; ���������������������������������������������������������������������������

loc_7D345:				; CODE XREF: sub_768F0:loc_7D338j
					; sub_768F0+6A51j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7D352:				; CODE XREF: sub_768F0+6A46j
		push	word ptr [bp+var_126+2]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_7D338

loc_7D362:				; CODE XREF: sub_768F0+6A53j
		mov	[bp+var_C19], 0
		jmp	short loc_7D3C3
; ���������������������������������������������������������������������������

loc_7D36A:				; CODE XREF: sub_768F0+6AECj
		mov	ax, [bp+var_C19]
		mov	[bp+var_158], ax
		cmp	[bp+var_158], si
		jnz	short loc_7D381
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 6

loc_7D381:				; CODE XREF: sub_768F0+6A86j
		mov	ax, si
		add	ax, 5
		cmp	ax, [bp+var_158]
		jnz	short loc_7D395
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 5

loc_7D395:				; CODE XREF: sub_768F0+6A9Aj
		mov	ax, si
		add	ax, 8
		cmp	ax, [bp+var_158]
		jnz	short loc_7D3A9
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 6

loc_7D3A9:				; CODE XREF: sub_768F0+6AAEj
		jmp	short loc_7D3B6
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7D3B6
		jmp	short loc_7D3DE
; ���������������������������������������������������������������������������

loc_7D3B6:				; CODE XREF: sub_768F0:loc_7D3A9j
					; sub_768F0+6AC2j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7D3C3:				; CODE XREF: sub_768F0+6A78j
		cmp	[bp+var_C19], 8
		jnb	short loc_7D3D1
		cmp	[bp+var_C17], 0
		jz	short loc_7D3D6

loc_7D3D1:				; CODE XREF: sub_768F0+6AD8j
		mov	ax, 1
		jmp	short loc_7D3D8
; ���������������������������������������������������������������������������

loc_7D3D6:				; CODE XREF: sub_768F0+6ADFj
		xor	ax, ax

loc_7D3D8:				; CODE XREF: sub_768F0+6AE4j
		mov	ah, 0
		or	ax, ax
		jz	short loc_7D36A

loc_7D3DE:				; CODE XREF: sub_768F0+6AC4j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		push	2
		lea	ax, [bp+var_148]
		push	ax
		push	0Ch
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_148]
		push	ax
		push	word ptr [bp+var_126+2]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_7D43C
; ���������������������������������������������������������������������������

loc_7D42B:				; CODE XREF: sub_768F0+6B51j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_7D43C:				; CODE XREF: sub_768F0+6B39j
		cmp	word ptr [bp+var_13E], 3
		jl	short loc_7D42B
		jmp	short loc_7D45F
; ���������������������������������������������������������������������������

loc_7D445:				; CODE XREF: sub_768F0+6B7Dj
		jmp	short loc_7D452
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7D452
		jmp	short loc_7D46F
; ���������������������������������������������������������������������������

loc_7D452:				; CODE XREF: sub_768F0:loc_7D445j
					; sub_768F0+6B5Ej
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7D45F:				; CODE XREF: sub_768F0+6B53j
		push	word ptr [bp+var_126+2]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_7D445

loc_7D46F:				; CODE XREF: sub_768F0+6B60j
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_7D488
; ���������������������������������������������������������������������������

loc_7D477:				; CODE XREF: sub_768F0+6B9Dj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_7D488:				; CODE XREF: sub_768F0+6B85j
		cmp	word ptr [bp+var_13E], 4
		jl	short loc_7D477
		push	1Ch
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp+var_13E], 0
		jmp	short loc_7D507
; ���������������������������������������������������������������������������

loc_7D4A5:				; CODE XREF: sub_768F0+6C1Cj
		cmp	word ptr [bp+var_13E], 6
		jnz	short loc_7D4F6
		cmp	[bp+var_B], 0
		jz	short loc_7D4F6
		mov	ax, word_48EF8
		mov	[bp+var_14A], ax
		mov	[bp+var_14C], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_7D4F6
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_14C]
		push	[bp+var_14A]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7D4F6:				; CODE XREF: sub_768F0+6BBAj
					; sub_768F0+6BC0j ...
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_13E]

loc_7D507:				; CODE XREF: sub_768F0+6BB3j
		cmp	word ptr [bp+var_13E], 0Ch
		jl	short loc_7D4A5
		mov	[bp+var_156], 0
		mov	byte ptr [bp+var_152], 2
		mov	byte ptr [bp+var_152+1], 0
		mov	[bp+var_150], 0
		push	2
		lea	ax, [bp+var_156]
		push	ax
		push	0
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_156]
		push	ax
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_7D11
		add	sp, 4
		mov	word ptr [bp+var_13E], 0
		push	0FFFFh
		lea	ax, [bp+var_C14]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_7D59E
; ���������������������������������������������������������������������������

loc_7D569:				; CODE XREF: sub_768F0+6CBDj
		mov	ax, word ptr [bp+var_13E]
		inc	word ptr [bp+var_13E]
		cmp	ax, 5
		jnz	short loc_7D584
		push	19h
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7D584:				; CODE XREF: sub_768F0+6C84j
		jmp	short loc_7D591
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7D591
		jmp	short loc_7D5AF
; ���������������������������������������������������������������������������

loc_7D591:				; CODE XREF: sub_768F0:loc_7D584j
					; sub_768F0+6C9Dj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7D59E:				; CODE XREF: sub_768F0+6C77j
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_7D569

loc_7D5AF:				; CODE XREF: sub_768F0+6C9Fj
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_152+1], 0
		jz	short loc_7D5E4
		cmp	[bp+var_156], 0
		jz	short loc_7D5E4
		push	0
		mov	al, byte ptr [bp+var_152]
		push	ax
		lea	ax, [bp+var_156]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7D5E4:				; CODE XREF: sub_768F0+6CD1j
					; sub_768F0+6CD9j
		mov	[bp+var_156], 0
		mov	byte ptr [bp+var_152+1], 0
		mov	[bp+var_150], 0
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_7D623
		cmp	[bp+var_148], 0
		jz	short loc_7D623
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7D623:				; CODE XREF: sub_768F0+6D10j
					; sub_768F0+6D18j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		cmp	byte ptr [bp+var_13A+3], 0
		jz	short loc_7D662
		cmp	[bp+var_13E+2],	0
		jz	short loc_7D662
		push	0
		mov	al, byte ptr [bp+var_13A+2]
		push	ax
		lea	ax, [bp+var_13E+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7D662:				; CODE XREF: sub_768F0+6D4Fj
					; sub_768F0+6D57j
		mov	[bp+var_13E+2],	0
		mov	byte ptr [bp+var_13A+3], 0
		mov	[bp+var_136], 0
		jmp	loc_7DB9A
; ���������������������������������������������������������������������������

loc_7D67C:				; CODE XREF: sub_768F0+69D1j
		push	7Dh ; '}'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 27h	; '''
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7D7F1
; ���������������������������������������������������������������������������

loc_7D6AE:				; CODE XREF: sub_768F0+6F1Bj
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_136+2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D6DA
		mov	ax, [bp+var_8]
		shl	ax, 3
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7D6DA:				; CODE XREF: sub_768F0+6DCFj
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D6F4
		push	2098h
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7D6F4:				; CODE XREF: sub_768F0+6DF3j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D70E
		push	20A4h
		push	[bp+var_128]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7D70E:				; CODE XREF: sub_768F0+6E0Dj
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D722
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 6

loc_7D722:				; CODE XREF: sub_768F0+6E27j
		mov	ax, si
		add	ax, 0Bh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D736
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 5

loc_7D736:				; CODE XREF: sub_768F0+6E3Bj
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D74A
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 6

loc_7D74A:				; CODE XREF: sub_768F0+6E4Fj
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D795
		mov	[bp+var_C50], 11BCh
		mov	[bp+var_C50], 11C8h
		mov	[bp+var_C50], 11D8h
		mov	[bp+var_C50], 11E8h
		mov	[bp+var_C50], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C50]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7D795:				; CODE XREF: sub_768F0+6E61j
		jmp	short loc_7D7E4
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7D7E4
		mov	word ptr [bp-0C5Ch], 11BCh
		mov	word ptr [bp-0C5Ch], 11C8h
		mov	word ptr [bp-0C5Ch], 11D8h
		mov	word ptr [bp-0C5Ch], 11E8h
		mov	word ptr [bp-0C5Ch], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C5Ch]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7D80E
; ���������������������������������������������������������������������������

loc_7D7E4:				; CODE XREF: sub_768F0:loc_7D795j
					; sub_768F0+6EAEj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7D7F1:				; CODE XREF: sub_768F0+6DBBj
		cmp	[bp+var_C19], di
		jnb	short loc_7D7FE
		cmp	[bp+var_C17], 0
		jz	short loc_7D803

loc_7D7FE:				; CODE XREF: sub_768F0+6F05j
		mov	ax, 1
		jmp	short loc_7D805
; ���������������������������������������������������������������������������

loc_7D803:				; CODE XREF: sub_768F0+6F0Cj
		xor	ax, ax

loc_7D805:				; CODE XREF: sub_768F0+6F11j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7D80E
		jmp	loc_7D6AE
; ���������������������������������������������������������������������������

loc_7D80E:				; CODE XREF: sub_768F0+6EF2j
					; sub_768F0+6F19j
		mov	[bp+var_4], 40h	; '@'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7D959
; ���������������������������������������������������������������������������

loc_7D82E:				; CODE XREF: sub_768F0+7083j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_136+2], ax
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D85A
		mov	ax, [bp+var_8]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7D85A:				; CODE XREF: sub_768F0+6F4Dj
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D872
		push	20B0h
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7D872:				; CODE XREF: sub_768F0+6F71j
		mov	ax, si
		inc	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D88A
		push	20C4h
		push	[bp+var_128]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7D88A:				; CODE XREF: sub_768F0+6F89j
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D89E
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 6

loc_7D89E:				; CODE XREF: sub_768F0+6FA3j
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D8B2
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 5

loc_7D8B2:				; CODE XREF: sub_768F0+6FB7j
		mov	ax, di
		dec	ax
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D8FD
		mov	[bp+var_C50], 11BCh
		mov	[bp+var_C50], 11C8h
		mov	[bp+var_C50], 11D8h
		mov	[bp+var_C50], 11E8h
		mov	[bp+var_C50], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C50]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7D8FD:				; CODE XREF: sub_768F0+6FC9j
		jmp	short loc_7D94C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7D94C
		mov	word ptr [bp-0C5Ch], 11BCh
		mov	word ptr [bp-0C5Ch], 11C8h
		mov	word ptr [bp-0C5Ch], 11D8h
		mov	word ptr [bp-0C5Ch], 11E8h
		mov	word ptr [bp-0C5Ch], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C5Ch]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7D976
; ���������������������������������������������������������������������������

loc_7D94C:				; CODE XREF: sub_768F0:loc_7D8FDj
					; sub_768F0+7016j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7D959:				; CODE XREF: sub_768F0+6F3Bj
		cmp	[bp+var_C19], di
		jnb	short loc_7D966
		cmp	[bp+var_C17], 0
		jz	short loc_7D96B

loc_7D966:				; CODE XREF: sub_768F0+706Dj
		mov	ax, 1
		jmp	short loc_7D96D
; ���������������������������������������������������������������������������

loc_7D96B:				; CODE XREF: sub_768F0+7074j
		xor	ax, ax

loc_7D96D:				; CODE XREF: sub_768F0+7079j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7D976
		jmp	loc_7D82E
; ���������������������������������������������������������������������������

loc_7D976:				; CODE XREF: sub_768F0+705Aj
					; sub_768F0+7081j
		mov	[bp+var_4], 40h	; '@'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7DB7D
; ���������������������������������������������������������������������������

loc_7D996:				; CODE XREF: sub_768F0+72A7j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_136+2], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D9B7
		push	0FFFFh
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7D9B7:				; CODE XREF: sub_768F0+70B7j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D9D1
		push	20D8h
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7D9D1:				; CODE XREF: sub_768F0+70D0j
		mov	ax, si
		add	ax, 2
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7D9EB
		push	20E1h
		push	[bp+var_128]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7D9EB:				; CODE XREF: sub_768F0+70EAj
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DA11
		mov	ax, [bp+var_8]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7DA11:				; CODE XREF: sub_768F0+7104j
		mov	ax, si
		add	ax, 6
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DA25
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 5

loc_7DA25:				; CODE XREF: sub_768F0+712Aj
		mov	ax, si
		add	ax, 0Bh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DA39
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 6

loc_7DA39:				; CODE XREF: sub_768F0+713Ej
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DA4D
		mov	bx, word ptr [bp+var_126]
		mov	word ptr [bx+1Bh], 5

loc_7DA4D:				; CODE XREF: sub_768F0+7152j
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DA66
		push	1Ch
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7DA66:				; CODE XREF: sub_768F0+7166j
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DABB
		cmp	[bp+var_B], 0
		jz	short loc_7DABB
		mov	ax, word_48EF8
		mov	word ptr [bp+var_136], ax
		mov	word ptr [bp+var_13A+2], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_7DABB
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		push	word ptr [bp+var_136]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7DABB:				; CODE XREF: sub_768F0+717Fj
					; sub_768F0+7185j ...
		mov	ax, di
		add	ax, 0FFFEh
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DAD4
		push	19h
		push	word ptr [bp+var_126+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7DAD4:				; CODE XREF: sub_768F0+71D4j
		mov	ax, di
		add	ax, 0FFF6h
		cmp	ax, word ptr [bp+var_136+2]
		jnz	short loc_7DB21
		mov	[bp+var_C50], 11BCh
		mov	[bp+var_C50], 11C8h
		mov	[bp+var_C50], 11D8h
		mov	[bp+var_C50], 11E8h
		mov	[bp+var_C50], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C50]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7DB21:				; CODE XREF: sub_768F0+71EDj
		jmp	short loc_7DB70
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7DB70
		mov	word ptr [bp-0C5Ch], 11BCh
		mov	word ptr [bp-0C5Ch], 11C8h
		mov	word ptr [bp-0C5Ch], 11D8h
		mov	word ptr [bp-0C5Ch], 11E8h
		mov	word ptr [bp-0C5Ch], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C5Ch]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7DB9A
; ���������������������������������������������������������������������������

loc_7DB70:				; CODE XREF: sub_768F0:loc_7DB21j
					; sub_768F0+723Aj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7DB7D:				; CODE XREF: sub_768F0+70A3j
		cmp	[bp+var_C19], di
		jnb	short loc_7DB8A
		cmp	[bp+var_C17], 0
		jz	short loc_7DB8F

loc_7DB8A:				; CODE XREF: sub_768F0+7291j
		mov	ax, 1
		jmp	short loc_7DB91
; ���������������������������������������������������������������������������

loc_7DB8F:				; CODE XREF: sub_768F0+7298j
		xor	ax, ax

loc_7DB91:				; CODE XREF: sub_768F0+729Dj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7DB9A
		jmp	loc_7D996
; ���������������������������������������������������������������������������

loc_7DB9A:				; CODE XREF: sub_768F0+6D89j
					; sub_768F0+727Ej ...
		lea	ax, [bp+var_C46+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C3B], 0
		jz	short loc_7DBCF
		cmp	[bp+var_C40], 0
		jz	short loc_7DBCF
		push	0
		mov	al, [bp+var_C3C]
		push	ax
		lea	ax, [bp+var_C40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DBCF:				; CODE XREF: sub_768F0+72BCj
					; sub_768F0+72C4j
		mov	[bp+var_C40], 0
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		cmp	[bp+var_12D], 0
		jz	short loc_7DC0E
		cmp	dword ptr [bp-132h], 0
		jz	short loc_7DC0E
		push	0
		mov	al, [bp-12Eh]
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DC0E:				; CODE XREF: sub_768F0+72FBj
					; sub_768F0+7303j
		mov	[bp+var_132], 0
		mov	[bp+var_12D], 0
		mov	[bp+var_12C], 0
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_122+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_116+1], 0
		jz	short loc_7DC6B
		cmp	[bp+var_11A], 0
		jz	short loc_7DC6B
		push	0
		mov	al, byte ptr [bp+var_116]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DC6B:				; CODE XREF: sub_768F0+7358j
					; sub_768F0+7360j
		mov	[bp+var_11A], 0
		mov	byte ptr [bp+var_116+1], 0
		mov	[bp+var_116+2],	0
		cmp	byte ptr [bp+var_10C+1], 0
		jz	short loc_7DCAA
		cmp	[bp+var_110], 0
		jz	short loc_7DCAA
		push	0
		mov	al, byte ptr [bp+var_10C]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DCAA:				; CODE XREF: sub_768F0+7397j
					; sub_768F0+739Fj
		mov	[bp+var_110], 0
		mov	byte ptr [bp+var_10C+1], 0
		mov	[bp+var_10A], 0
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_7DCE9
		cmp	[bp+var_106], 0
		jz	short loc_7DCE9
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DCE9:				; CODE XREF: sub_768F0+73D6j
					; sub_768F0+73DEj
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_7DD28
		cmp	[bp+var_FC], 0
		jz	short loc_7DD28
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DD28:				; CODE XREF: sub_768F0+7415j
					; sub_768F0+741Dj
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7DD49
		jmp	loc_7E241
; ���������������������������������������������������������������������������

loc_7DD49:				; CODE XREF: sub_768F0+7454j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7DD80
		cmp	[bp+var_E8], 0
		jz	short loc_7DD80
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DD80:				; CODE XREF: sub_768F0+746Dj
					; sub_768F0+7475j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7DDCE
		cmp	[bp+var_D8], 0
		jz	short loc_7DDCE
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DDCE:				; CODE XREF: sub_768F0+74BBj
					; sub_768F0+74C3j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7DE1C
		cmp	[bp+var_C8], 0
		jz	short loc_7DE1C
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DE1C:				; CODE XREF: sub_768F0+7509j
					; sub_768F0+7511j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7DE6A
		cmp	[bp+var_B8], 0
		jz	short loc_7DE6A
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DE6A:				; CODE XREF: sub_768F0+7557j
					; sub_768F0+755Fj
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7DEA9
		cmp	[bp+var_AE], 0
		jz	short loc_7DEA9
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DEA9:				; CODE XREF: sub_768F0+7596j
					; sub_768F0+759Ej
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7DEF7
		cmp	[bp+var_9E], 0
		jz	short loc_7DEF7
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DEF7:				; CODE XREF: sub_768F0+75E4j
					; sub_768F0+75ECj
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7DF36
		cmp	[bp+var_94], 0
		jz	short loc_7DF36
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DF36:				; CODE XREF: sub_768F0+7623j
					; sub_768F0+762Bj
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7DF82
		cmp	[bp+var_84], 0
		jz	short loc_7DF82
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DF82:				; CODE XREF: sub_768F0+7670j
					; sub_768F0+7678j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7DFBB
		cmp	[bp+var_7A], 0
		jz	short loc_7DFBB
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7DFBB:				; CODE XREF: sub_768F0+76ABj
					; sub_768F0+76B2j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7E001
		cmp	[bp+var_6A], 0
		jz	short loc_7E001
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E001:				; CODE XREF: sub_768F0+76F1j
					; sub_768F0+76F8j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7E047
		cmp	[bp+var_5A], 0
		jz	short loc_7E047
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E047:				; CODE XREF: sub_768F0+7737j
					; sub_768F0+773Ej
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7E07F
		cmp	[bp+var_50], 0
		jz	short loc_7E07F
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E07F:				; CODE XREF: sub_768F0+776Fj
					; sub_768F0+7776j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7E0DC
		cmp	[bp+var_C04], 0
		jz	short loc_7E0DC
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E0DC:				; CODE XREF: sub_768F0+77C9j
					; sub_768F0+77D1j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7E128
		cmp	[bp+var_3EA], 0
		jz	short loc_7E128
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E128:				; CODE XREF: sub_768F0+7815j
					; sub_768F0+781Dj
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7E172
		cmp	[bp+var_40], 0
		jz	short loc_7E172
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E172:				; CODE XREF: sub_768F0+7862j
					; sub_768F0+7869j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7E1F3
		cmp	[bp+var_22], 0
		jz	short loc_7E1F3
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E1F3:				; CODE XREF: sub_768F0+78E3j
					; sub_768F0+78EAj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7E241:				; CODE XREF: sub_768F0+7456j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	3
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	0Ch
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_10A+2], ax
		push	0
		push	0FFE8h
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_10A], ax
		push	[bp+var_CE]
		mov	al, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_DE]
		mov	al, [bp+var_DC]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_10A+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10A]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_A], 0
		jz	short loc_7E3A5
		jmp	short loc_7E387
; ���������������������������������������������������������������������������

loc_7E36D:				; CODE XREF: sub_768F0+7AB0j
		jmp	short loc_7E37A
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7E37A
		jmp	short loc_7E3A2
; ���������������������������������������������������������������������������

loc_7E37A:				; CODE XREF: sub_768F0:loc_7E36Dj
					; sub_768F0+7A86j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7E387:				; CODE XREF: sub_768F0+7A7Bj
		cmp	[bp+var_C19], 10h
		jnb	short loc_7E395
		cmp	[bp+var_C17], 0
		jz	short loc_7E39A

loc_7E395:				; CODE XREF: sub_768F0+7A9Cj
		mov	ax, 1
		jmp	short loc_7E39C
; ���������������������������������������������������������������������������

loc_7E39A:				; CODE XREF: sub_768F0+7AA3j
		xor	ax, ax

loc_7E39C:				; CODE XREF: sub_768F0+7AA8j
		mov	ah, 0
		or	ax, ax
		jz	short loc_7E36D

loc_7E3A2:				; CODE XREF: sub_768F0+7A88j
		jmp	loc_7E511
; ���������������������������������������������������������������������������

loc_7E3A5:				; CODE XREF: sub_768F0+7A79j
		push	80h ; '�'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 32h	; '2'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7E4F4
; ���������������������������������������������������������������������������

loc_7E3D8:				; CODE XREF: sub_768F0+7C1Ej
		mov	ax, [bp+var_C19]
		mov	[bp+var_10C], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, [bp+var_10C]
		jnz	short loc_7E406
		mov	ax, [bp+var_8]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7E406:				; CODE XREF: sub_768F0+7AF9j
		mov	ax, si
		add	ax, 12h
		cmp	ax, [bp+var_10C]
		jle	short loc_7E439
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 2
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	word ptr [bp+var_110+2], ax
		mov	bx, word ptr [bp+var_10A]
		mov	ax, word ptr [bp+var_110+2]
		mov	[bx+1Bh], ax

loc_7E439:				; CODE XREF: sub_768F0+7B1Fj
		mov	ax, si
		add	ax, 12h
		cmp	ax, [bp+var_10C]
		jnz	short loc_7E44D
		mov	bx, word ptr [bp+var_10A]
		mov	word ptr [bx+1Bh], 1

loc_7E44D:				; CODE XREF: sub_768F0+7B52j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_10C]
		jnz	short loc_7E498
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7E498:				; CODE XREF: sub_768F0+7B64j
		jmp	short loc_7E4E7
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7E4E7
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7E511
; ���������������������������������������������������������������������������

loc_7E4E7:				; CODE XREF: sub_768F0:loc_7E498j
					; sub_768F0+7BB1j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7E4F4:				; CODE XREF: sub_768F0+7AE5j
		cmp	[bp+var_C19], di
		jnb	short loc_7E501
		cmp	[bp+var_C17], 0
		jz	short loc_7E506

loc_7E501:				; CODE XREF: sub_768F0+7C08j
		mov	ax, 1
		jmp	short loc_7E508
; ���������������������������������������������������������������������������

loc_7E506:				; CODE XREF: sub_768F0+7C0Fj
		xor	ax, ax

loc_7E508:				; CODE XREF: sub_768F0+7C14j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7E511
		jmp	loc_7E3D8
; ���������������������������������������������������������������������������

loc_7E511:				; CODE XREF: sub_768F0:loc_7E3A2j
					; sub_768F0+7BF5j ...
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_7E548
		cmp	[bp+var_106], 0
		jz	short loc_7E548
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E548:				; CODE XREF: sub_768F0+7C35j
					; sub_768F0+7C3Dj
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_7E587
		cmp	[bp+var_FC], 0
		jz	short loc_7E587
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E587:				; CODE XREF: sub_768F0+7C74j
					; sub_768F0+7C7Cj
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7E5A8
		jmp	loc_7EAA0
; ���������������������������������������������������������������������������

loc_7E5A8:				; CODE XREF: sub_768F0+7CB3j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7E5DF
		cmp	[bp+var_E8], 0
		jz	short loc_7E5DF
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E5DF:				; CODE XREF: sub_768F0+7CCCj
					; sub_768F0+7CD4j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7E62D
		cmp	[bp+var_D8], 0
		jz	short loc_7E62D
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E62D:				; CODE XREF: sub_768F0+7D1Aj
					; sub_768F0+7D22j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7E67B
		cmp	[bp+var_C8], 0
		jz	short loc_7E67B
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E67B:				; CODE XREF: sub_768F0+7D68j
					; sub_768F0+7D70j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7E6C9
		cmp	[bp+var_B8], 0
		jz	short loc_7E6C9
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E6C9:				; CODE XREF: sub_768F0+7DB6j
					; sub_768F0+7DBEj
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7E708
		cmp	[bp+var_AE], 0
		jz	short loc_7E708
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E708:				; CODE XREF: sub_768F0+7DF5j
					; sub_768F0+7DFDj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7E756
		cmp	[bp+var_9E], 0
		jz	short loc_7E756
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E756:				; CODE XREF: sub_768F0+7E43j
					; sub_768F0+7E4Bj
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7E795
		cmp	[bp+var_94], 0
		jz	short loc_7E795
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E795:				; CODE XREF: sub_768F0+7E82j
					; sub_768F0+7E8Aj
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7E7E1
		cmp	[bp+var_84], 0
		jz	short loc_7E7E1
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E7E1:				; CODE XREF: sub_768F0+7ECFj
					; sub_768F0+7ED7j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7E81A
		cmp	[bp+var_7A], 0
		jz	short loc_7E81A
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E81A:				; CODE XREF: sub_768F0+7F0Aj
					; sub_768F0+7F11j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7E860
		cmp	[bp+var_6A], 0
		jz	short loc_7E860
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E860:				; CODE XREF: sub_768F0+7F50j
					; sub_768F0+7F57j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7E8A6
		cmp	[bp+var_5A], 0
		jz	short loc_7E8A6
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E8A6:				; CODE XREF: sub_768F0+7F96j
					; sub_768F0+7F9Dj
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7E8DE
		cmp	[bp+var_50], 0
		jz	short loc_7E8DE
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E8DE:				; CODE XREF: sub_768F0+7FCEj
					; sub_768F0+7FD5j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7E93B
		cmp	[bp+var_C04], 0
		jz	short loc_7E93B
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E93B:				; CODE XREF: sub_768F0+8028j
					; sub_768F0+8030j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7E987
		cmp	[bp+var_3EA], 0
		jz	short loc_7E987
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E987:				; CODE XREF: sub_768F0+8074j
					; sub_768F0+807Cj
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7E9D1
		cmp	[bp+var_40], 0
		jz	short loc_7E9D1
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7E9D1:				; CODE XREF: sub_768F0+80C1j
					; sub_768F0+80C8j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7EA52
		cmp	[bp+var_22], 0
		jz	short loc_7EA52
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7EA52:				; CODE XREF: sub_768F0+8142j
					; sub_768F0+8149j
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7EAA0:				; CODE XREF: sub_768F0+7CB5j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	0Dh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	3
		lea	ax, [bp+var_106]
		push	ax
		push	5
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	TriggeredAnimLayer_Construct_B068
		add	sp, 0Ah
		mov	word ptr [bp+var_10A+2], ax
		push	0
		push	0
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_10A], ax
		push	1
		push	0
		push	0
		lea	ax, [bp+var_50]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_10C], ax
		push	0
		push	0
		push	7
		push	12Ch
		push	12Ch
		push	46h ; 'F'
		push	73h ; 's'
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	ScaledMovingLayer_Construct_9544
		add	sp, 12h
		mov	word ptr [bp+var_110+2], ax
		push	2
		push	0
		push	8
		push	12Ch
		push	12Ch
		push	46h ; 'F'
		push	50h ; 'P'
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	ScaledMovingLayer_Construct_9544
		add	sp, 12h
		mov	word ptr [bp+var_110], ax
		push	3
		push	0
		push	7
		push	12Ch
		push	12Ch
		push	46h ; 'F'
		push	3Ch ; '<'
		lea	ax, [bp+var_106]
		push	ax
		push	0
		call	ScaledMovingLayer_Construct_9544
		add	sp, 12h
		mov	[bp+var_112], ax
		push	[bp+var_60]
		mov	al, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_11E+2],	0
		mov	byte ptr [bp+var_11A+2], 2
		mov	byte ptr [bp+var_11A+3], 0
		mov	[bp+var_116], 0
		mov	[bp+var_126], 0
		mov	byte ptr [bp+var_122], 2
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_122+2],	0
		mov	[bp+var_132+2],	0
		mov	byte ptr [bp+var_12C], 2
		mov	byte ptr [bp+var_12C+1], 0
		mov	[bp+var_12C+2],	0
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136], 2
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_136+2],	0
		mov	[bp+var_C40], 0
		mov	[bp+var_C3C], 2
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		mov	word ptr [bp+var_C46+2], 0
		mov	[bp+var_C42], 0FFFFh
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A], 2
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		mov	[bp+var_C52], 0
		mov	[bp+var_C50], 0FFFFh
		mov	[bp+var_C5F+3],	0
		mov	byte ptr [bp+var_C5B+3], 2
		mov	byte ptr [bp+var_C57], 0
		mov	[bp+var_C57+1],	0
		mov	word ptr [bp-0C60h], 0
		mov	word ptr [bp+var_C5F+1], 0FFFFh
		mov	[bp+var_C6A], 0
		mov	[bp+var_C66], 2
		mov	[bp+var_C65], 0
		mov	[bp+var_C64], 0
		mov	[bp+var_C6E], 0
		mov	[bp+var_C6C], 0FFFFh
		cmp	[bp+var_B], 0
		jnz	short loc_7ED0B
		jmp	loc_7EDF7
; ���������������������������������������������������������������������������

loc_7ED0B:				; CODE XREF: sub_768F0+8416j
		push	3
		lea	ax, [bp+var_11E+2]
		push	ax
		push	2Fh ; '/'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_11E+2]
		push	ax
		lea	ax, [bp+var_C46+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_126]
		push	ax
		push	30h ; '0'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_126]
		push	ax
		lea	ax, [bp+var_C52]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_132+2]
		push	ax
		push	54h ; 'T'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C60h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_132+2]
		push	ax
		lea	ax, [bp-0C60h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	3
		lea	ax, [bp+var_13A]
		push	ax
		push	54h ; 'T'
		lea	ax, [bp+var_3E0]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C6E]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_13A]
		push	ax
		lea	ax, [bp+var_C6E]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_7EDF7:				; CODE XREF: sub_768F0+8418j
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_10C]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10A+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_110+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_110]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_112]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_10A]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [bp+var_13E+2], 0
		jmp	loc_7F0D3
; ���������������������������������������������������������������������������

loc_7EE7B:				; CODE XREF: sub_768F0+87FEj
		inc	word ptr [bp+var_13E+2]
		cmp	word ptr [bp+var_13E+2], 0Dh
		jnz	short loc_7EED9
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 1
		cmp	[bp+var_B], 0
		jz	short loc_7EED9
		mov	ax, word_48F00
		mov	word ptr [bp+var_13E], ax
		mov	[bp+var_140], 0
		cmp	word ptr [bp+var_C46+2], 0
		jz	short loc_7EED9
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_140]
		push	word ptr [bp+var_13E]
		push	[bp+var_C42]
		mov	bx, word ptr [bp+var_C46+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7EED9:				; CODE XREF: sub_768F0+8594j
					; sub_768F0+85A3j ...
		cmp	word ptr [bp+var_13E+2], 0Eh
		jnz	short loc_7EEE9
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 2

loc_7EEE9:				; CODE XREF: sub_768F0+85EEj
		cmp	word ptr [bp+var_13E+2], 0Fh
		jnz	short loc_7EEF9
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 1

loc_7EEF9:				; CODE XREF: sub_768F0+85FEj
		cmp	word ptr [bp+var_13E+2], 10h
		jnz	short loc_7EF09
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 3

loc_7EF09:				; CODE XREF: sub_768F0+860Ej
		cmp	word ptr [bp+var_13E+2], 11h
		jnz	short loc_7EF19
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 0

loc_7EF19:				; CODE XREF: sub_768F0+861Ej
		cmp	word ptr [bp+var_13E+2], 13h
		jnz	short loc_7EF6A
		cmp	[bp+var_B], 0
		jz	short loc_7EF6A
		mov	ax, word_48F4A
		mov	word ptr [bp+var_144+2], ax
		mov	word ptr [bp+var_144], 0
		cmp	word ptr [bp-0C60h], 0
		jz	short loc_7EF6A
		push	word ptr [bp+var_C5F+1]
		mov	bx, [bp-0C60h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_144]
		push	word ptr [bp+var_144+2]
		push	word ptr [bp+var_C5F+1]
		mov	bx, [bp-0C60h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7EF6A:				; CODE XREF: sub_768F0+862Ej
					; sub_768F0+8634j ...
		cmp	word ptr [bp+var_13E+2], 1Ah
		jnz	short loc_7EFC4
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 1
		cmp	[bp+var_B], 0
		jz	short loc_7EFC4
		mov	ax, word_48F02
		mov	word ptr [bp+var_148+2], ax
		mov	word ptr [bp+var_148], 0
		cmp	[bp+var_C52], 0
		jz	short loc_7EFC4
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_148]
		push	word ptr [bp+var_148+2]
		push	[bp+var_C50]
		mov	bx, [bp+var_C52]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7EFC4:				; CODE XREF: sub_768F0+867Fj
					; sub_768F0+868Ej ...
		cmp	word ptr [bp+var_13E+2], 1Bh
		jnz	short loc_7EFD4
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 2

loc_7EFD4:				; CODE XREF: sub_768F0+86D9j
		cmp	word ptr [bp+var_13E+2], 1Ch
		jnz	short loc_7EFE4
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 1

loc_7EFE4:				; CODE XREF: sub_768F0+86E9j
		cmp	word ptr [bp+var_13E+2], 1Dh
		jnz	short loc_7EFF4
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 4

loc_7EFF4:				; CODE XREF: sub_768F0+86F9j
		cmp	word ptr [bp+var_13E+2], 1Eh
		jnz	short loc_7F004
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 1

loc_7F004:				; CODE XREF: sub_768F0+8709j
		cmp	word ptr [bp+var_13E+2], 1Fh
		jnz	short loc_7F014
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 5

loc_7F014:				; CODE XREF: sub_768F0+8719j
		cmp	word ptr [bp+var_13E+2], 20h ; ' '
		jnz	short loc_7F024
		mov	bx, word ptr [bp+var_10A+2]
		mov	word ptr [bx+1Bh], 0

loc_7F024:				; CODE XREF: sub_768F0+8729j
		cmp	word ptr [bp+var_13E+2], 22h ; '"'
		jnz	short loc_7F075
		cmp	[bp+var_B], 0
		jz	short loc_7F075
		mov	ax, word_48F4A
		mov	[bp+var_14A], ax
		mov	[bp+var_14C], 0
		cmp	word ptr [bp-0C60h], 0
		jz	short loc_7F075
		push	word ptr [bp+var_C5F+1]
		mov	bx, [bp-0C60h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_14C]
		push	[bp+var_14A]
		push	word ptr [bp+var_C5F+1]
		mov	bx, [bp-0C60h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_7F075:				; CODE XREF: sub_768F0+8739j
					; sub_768F0+873Fj ...
		mov	ax, word ptr [bp+var_13E+2]
		mov	bx, 5
		cwd
		idiv	bx
		mov	word ptr [bp+var_150+2], dx
		mov	bx, word ptr [bp+var_110+2]
		mov	ax, word ptr [bp+var_150+2]
		mov	[bx+1Bh], ax
		mov	ax, word ptr [bp+var_13E+2]
		add	ax, 3
		mov	bx, 5
		cwd
		idiv	bx
		mov	word ptr [bp+var_150], dx
		mov	bx, word ptr [bp+var_110]
		mov	ax, word ptr [bp+var_150]
		mov	[bx+1Bh], ax
		mov	ax, word ptr [bp+var_13E+2]
		add	ax, 4
		mov	bx, 5
		cwd
		idiv	bx
		mov	[bp+var_152], dx
		mov	bx, [bp+var_112]
		mov	ax, [bp+var_152]
		mov	[bx+1Bh], ax
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7F0D3:				; CODE XREF: sub_768F0+8588j
		cmp	[bp+var_C19], 3Ch ; '<'
		jnb	short loc_7F0E1
		cmp	[bp+var_C17], 0
		jz	short loc_7F0E6

loc_7F0E1:				; CODE XREF: sub_768F0+87E8j
		mov	ax, 1
		jmp	short loc_7F0E8
; ���������������������������������������������������������������������������

loc_7F0E6:				; CODE XREF: sub_768F0+87EFj
		xor	ax, ax

loc_7F0E8:				; CODE XREF: sub_768F0+87F4j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7F0F1
		jmp	loc_7EE7B
; ���������������������������������������������������������������������������

loc_7F0F1:				; CODE XREF: sub_768F0+87FCj
		lea	ax, [bp+var_C6E]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C65], 0
		jz	short loc_7F126
		cmp	[bp+var_C6A], 0
		jz	short loc_7F126
		push	0
		mov	al, [bp+var_C66]
		push	ax
		lea	ax, [bp+var_C6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F126:				; CODE XREF: sub_768F0+8813j
					; sub_768F0+881Bj
		mov	[bp+var_C6A], 0
		mov	[bp+var_C65], 0
		mov	[bp+var_C64], 0
		lea	ax, [bp-0C60h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_C57], 0
		jz	short loc_7F172
		cmp	[bp+var_C5F+3],	0
		jz	short loc_7F172
		push	0
		mov	al, byte ptr [bp+var_C5B+3]
		push	ax
		lea	ax, [bp+var_C5F+3]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F172:				; CODE XREF: sub_768F0+885Fj
					; sub_768F0+8867j
		mov	[bp+var_C5F+3],	0
		mov	byte ptr [bp+var_C57], 0
		mov	[bp+var_C57+1],	0
		lea	ax, [bp+var_C52]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_C4A+1], 0
		jz	short loc_7F1BE
		cmp	[bp+var_C4E], 0
		jz	short loc_7F1BE
		push	0
		mov	al, byte ptr [bp+var_C4A]
		push	ax
		lea	ax, [bp+var_C4E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F1BE:				; CODE XREF: sub_768F0+88ABj
					; sub_768F0+88B3j
		mov	[bp+var_C4E], 0
		mov	byte ptr [bp+var_C4A+1], 0
		mov	dword ptr [bp-0C48h], 0
		lea	ax, [bp+var_C46+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C3B], 0
		jz	short loc_7F20A
		cmp	[bp+var_C40], 0
		jz	short loc_7F20A
		push	0
		mov	al, [bp+var_C3C]
		push	ax
		lea	ax, [bp+var_C40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F20A:				; CODE XREF: sub_768F0+88F7j
					; sub_768F0+88FFj
		mov	[bp+var_C40], 0
		mov	[bp+var_C3B], 0
		mov	[bp+var_C3A], 0
		cmp	byte ptr [bp+var_136+1], 0
		jz	short loc_7F249
		cmp	[bp+var_13A], 0
		jz	short loc_7F249
		push	0
		mov	al, byte ptr [bp+var_136]
		push	ax
		lea	ax, [bp+var_13A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F249:				; CODE XREF: sub_768F0+8936j
					; sub_768F0+893Ej
		mov	[bp+var_13A], 0
		mov	byte ptr [bp+var_136+1], 0
		mov	[bp+var_136+2],	0
		cmp	byte ptr [bp+var_12C+1], 0
		jz	short loc_7F288
		cmp	[bp+var_132+2],	0
		jz	short loc_7F288
		push	0
		mov	al, byte ptr [bp+var_12C]
		push	ax
		lea	ax, [bp+var_132+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F288:				; CODE XREF: sub_768F0+8975j
					; sub_768F0+897Dj
		mov	[bp+var_132+2],	0
		mov	byte ptr [bp+var_12C+1], 0
		mov	[bp+var_12C+2],	0
		cmp	byte ptr [bp+var_122+1], 0
		jz	short loc_7F2C7
		cmp	[bp+var_126], 0
		jz	short loc_7F2C7
		push	0
		mov	al, byte ptr [bp+var_122]
		push	ax
		lea	ax, [bp+var_126]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F2C7:				; CODE XREF: sub_768F0+89B4j
					; sub_768F0+89BCj
		mov	[bp+var_126], 0
		mov	byte ptr [bp+var_122+1], 0
		mov	[bp+var_122+2],	0
		cmp	byte ptr [bp+var_11A+3], 0
		jz	short loc_7F306
		cmp	[bp+var_11E+2],	0
		jz	short loc_7F306
		push	0
		mov	al, byte ptr [bp+var_11A+2]
		push	ax
		lea	ax, [bp+var_11E+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F306:				; CODE XREF: sub_768F0+89F3j
					; sub_768F0+89FBj
		mov	[bp+var_11E+2],	0
		mov	byte ptr [bp+var_11A+3], 0
		mov	[bp+var_116], 0
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_7F354
		cmp	[bp+var_106], 0
		jz	short loc_7F354
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F354:				; CODE XREF: sub_768F0+8A41j
					; sub_768F0+8A49j
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_7F393
		cmp	[bp+var_FC], 0
		jz	short loc_7F393
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F393:				; CODE XREF: sub_768F0+8A80j
					; sub_768F0+8A88j
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7F3B4
		jmp	loc_7F8AC
; ���������������������������������������������������������������������������

loc_7F3B4:				; CODE XREF: sub_768F0+8ABFj
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7F3EB
		cmp	[bp+var_E8], 0
		jz	short loc_7F3EB
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F3EB:				; CODE XREF: sub_768F0+8AD8j
					; sub_768F0+8AE0j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7F439
		cmp	[bp+var_D8], 0
		jz	short loc_7F439
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F439:				; CODE XREF: sub_768F0+8B26j
					; sub_768F0+8B2Ej
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7F487
		cmp	[bp+var_C8], 0
		jz	short loc_7F487
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F487:				; CODE XREF: sub_768F0+8B74j
					; sub_768F0+8B7Cj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7F4D5
		cmp	[bp+var_B8], 0
		jz	short loc_7F4D5
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F4D5:				; CODE XREF: sub_768F0+8BC2j
					; sub_768F0+8BCAj
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7F514
		cmp	[bp+var_AE], 0
		jz	short loc_7F514
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F514:				; CODE XREF: sub_768F0+8C01j
					; sub_768F0+8C09j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7F562
		cmp	[bp+var_9E], 0
		jz	short loc_7F562
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F562:				; CODE XREF: sub_768F0+8C4Fj
					; sub_768F0+8C57j
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7F5A1
		cmp	[bp+var_94], 0
		jz	short loc_7F5A1
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F5A1:				; CODE XREF: sub_768F0+8C8Ej
					; sub_768F0+8C96j
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7F5ED
		cmp	[bp+var_84], 0
		jz	short loc_7F5ED
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F5ED:				; CODE XREF: sub_768F0+8CDBj
					; sub_768F0+8CE3j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_7F626
		cmp	[bp+var_7A], 0
		jz	short loc_7F626
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F626:				; CODE XREF: sub_768F0+8D16j
					; sub_768F0+8D1Dj
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_7F66C
		cmp	[bp+var_6A], 0
		jz	short loc_7F66C
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F66C:				; CODE XREF: sub_768F0+8D5Cj
					; sub_768F0+8D63j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_7F6B2
		cmp	[bp+var_5A], 0
		jz	short loc_7F6B2
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F6B2:				; CODE XREF: sub_768F0+8DA2j
					; sub_768F0+8DA9j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_7F6EA
		cmp	[bp+var_50], 0
		jz	short loc_7F6EA
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F6EA:				; CODE XREF: sub_768F0+8DDAj
					; sub_768F0+8DE1j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_7F747
		cmp	[bp+var_C04], 0
		jz	short loc_7F747
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F747:				; CODE XREF: sub_768F0+8E34j
					; sub_768F0+8E3Cj
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_7F793
		cmp	[bp+var_3EA], 0
		jz	short loc_7F793
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F793:				; CODE XREF: sub_768F0+8E80j
					; sub_768F0+8E88j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_7F7DD
		cmp	[bp+var_40], 0
		jz	short loc_7F7DD
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F7DD:				; CODE XREF: sub_768F0+8ECDj
					; sub_768F0+8ED4j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_7F85E
		cmp	[bp+var_22], 0
		jz	short loc_7F85E
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7F85E:				; CODE XREF: sub_768F0+8F4Ej
					; sub_768F0+8F55j
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_7F8AC:				; CODE XREF: sub_768F0+8AC1j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	20EAh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_7A]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	[bp+var_8A]
		mov	al, [bp+var_88]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EE]
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		cmp	[bp+var_A], 0
		jnz	short loc_7F9B0
		jmp	loc_7FAB0
; ���������������������������������������������������������������������������

loc_7F9B0:				; CODE XREF: sub_768F0+90BBj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106], 2
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		push	1
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_10A]
		push	ax
		push	word ptr [bp+var_100]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_10C], 0
		jmp	short loc_7FA1B
; ���������������������������������������������������������������������������

loc_7FA0A:				; CODE XREF: sub_768F0+9130j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_7FA1B:				; CODE XREF: sub_768F0+9118j
		cmp	[bp+var_10C], 3
		jl	short loc_7FA0A
		jmp	short loc_7FA3E
; ���������������������������������������������������������������������������

loc_7FA24:				; CODE XREF: sub_768F0+915Cj
		jmp	short loc_7FA31
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7FA31
		jmp	short loc_7FA4E
; ���������������������������������������������������������������������������

loc_7FA31:				; CODE XREF: sub_768F0:loc_7FA24j
					; sub_768F0+913Dj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7FA3E:				; CODE XREF: sub_768F0+9132j
		push	word ptr [bp+var_100]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_7FA24

loc_7FA4E:				; CODE XREF: sub_768F0+913Fj
		mov	[bp+var_10C], 0
		jmp	short loc_7FA67
; ���������������������������������������������������������������������������

loc_7FA56:				; CODE XREF: sub_768F0+917Cj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_7FA67:				; CODE XREF: sub_768F0+9164j
		cmp	[bp+var_10C], 2
		jl	short loc_7FA56
		cmp	byte ptr [bp+var_106+1], 0
		jz	short loc_7FA96
		cmp	[bp+var_10A], 0
		jz	short loc_7FA96
		push	0
		mov	al, byte ptr [bp+var_106]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FA96:				; CODE XREF: sub_768F0+9183j
					; sub_768F0+918Bj
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		jmp	loc_7FD42
; ���������������������������������������������������������������������������

loc_7FAB0:				; CODE XREF: sub_768F0+90BDj
		push	0B7h ; '�'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 23h	; '#'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7FBEB
; ���������������������������������������������������������������������������

loc_7FAE3:				; CODE XREF: sub_768F0+9315j
		mov	ax, [bp+var_C19]
		mov	[bp+var_102], ax
		mov	ax, si
		add	ax, 7
		cmp	ax, [bp+var_102]
		jnz	short loc_7FB04
		push	0FFFFh
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_7FB04:				; CODE XREF: sub_768F0+9204j
		mov	ax, si
		add	ax, 8
		cmp	ax, [bp+var_102]
		jnz	short loc_7FB1E
		push	20F0h
		push	word ptr [bp+var_100]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7FB1E:				; CODE XREF: sub_768F0+921Dj
		mov	ax, si
		add	ax, 9
		cmp	ax, [bp+var_102]
		jnz	short loc_7FB44
		mov	ax, [bp+var_8]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7FB44:				; CODE XREF: sub_768F0+9237j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_7FB8F
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7FB8F:				; CODE XREF: sub_768F0+925Bj
		jmp	short loc_7FBDE
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7FBDE
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7FC08
; ���������������������������������������������������������������������������

loc_7FBDE:				; CODE XREF: sub_768F0:loc_7FB8Fj
					; sub_768F0+92A8j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7FBEB:				; CODE XREF: sub_768F0+91F0j
		cmp	[bp+var_C19], di
		jnb	short loc_7FBF8
		cmp	[bp+var_C17], 0
		jz	short loc_7FBFD

loc_7FBF8:				; CODE XREF: sub_768F0+92FFj
		mov	ax, 1
		jmp	short loc_7FBFF
; ���������������������������������������������������������������������������

loc_7FBFD:				; CODE XREF: sub_768F0+9306j
		xor	ax, ax

loc_7FBFF:				; CODE XREF: sub_768F0+930Bj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7FC08
		jmp	loc_7FAE3
; ���������������������������������������������������������������������������

loc_7FC08:				; CODE XREF: sub_768F0+92ECj
					; sub_768F0+9313j
		push	21h ; '!'
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_4], 32h	; '2'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_7FD25
; ���������������������������������������������������������������������������

loc_7FC36:				; CODE XREF: sub_768F0+944Fj
		mov	ax, [bp+var_C19]
		mov	[bp+var_102], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_7FC58
		push	20F9h
		push	word ptr [bp+var_100]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_7FC58:				; CODE XREF: sub_768F0+9357j
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_7FC7E
		mov	ax, [bp+var_8]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_7FC7E:				; CODE XREF: sub_768F0+9371j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_7FCC9
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_7FCC9:				; CODE XREF: sub_768F0+9395j
		jmp	short loc_7FD18
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_7FD18
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_7FD42
; ���������������������������������������������������������������������������

loc_7FD18:				; CODE XREF: sub_768F0:loc_7FCC9j
					; sub_768F0+93E2j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_7FD25:				; CODE XREF: sub_768F0+9343j
		cmp	[bp+var_C19], di
		jnb	short loc_7FD32
		cmp	[bp+var_C17], 0
		jz	short loc_7FD37

loc_7FD32:				; CODE XREF: sub_768F0+9439j
		mov	ax, 1
		jmp	short loc_7FD39
; ���������������������������������������������������������������������������

loc_7FD37:				; CODE XREF: sub_768F0+9440j
		xor	ax, ax

loc_7FD39:				; CODE XREF: sub_768F0+9445j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7FD42
		jmp	loc_7FC36
; ���������������������������������������������������������������������������

loc_7FD42:				; CODE XREF: sub_768F0+91BDj
					; sub_768F0+9426j ...
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_F7], 0
		jz	short loc_7FD79
		cmp	[bp+var_FC], 0
		jz	short loc_7FD79
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FD79:				; CODE XREF: sub_768F0+9466j
					; sub_768F0+946Ej
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_7FD9A
		jmp	loc_80292
; ���������������������������������������������������������������������������

loc_7FD9A:				; CODE XREF: sub_768F0+94A5j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_7FDD1
		cmp	[bp+var_E8], 0
		jz	short loc_7FDD1
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FDD1:				; CODE XREF: sub_768F0+94BEj
					; sub_768F0+94C6j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_7FE1F
		cmp	[bp+var_D8], 0
		jz	short loc_7FE1F
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FE1F:				; CODE XREF: sub_768F0+950Cj
					; sub_768F0+9514j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_7FE6D
		cmp	[bp+var_C8], 0
		jz	short loc_7FE6D
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FE6D:				; CODE XREF: sub_768F0+955Aj
					; sub_768F0+9562j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_7FEBB
		cmp	[bp+var_B8], 0
		jz	short loc_7FEBB
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FEBB:				; CODE XREF: sub_768F0+95A8j
					; sub_768F0+95B0j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_7FEFA
		cmp	[bp+var_AE], 0
		jz	short loc_7FEFA
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FEFA:				; CODE XREF: sub_768F0+95E7j
					; sub_768F0+95EFj
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_7FF48
		cmp	[bp+var_9E], 0
		jz	short loc_7FF48
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FF48:				; CODE XREF: sub_768F0+9635j
					; sub_768F0+963Dj
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_7FF87
		cmp	[bp+var_94], 0
		jz	short loc_7FF87
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FF87:				; CODE XREF: sub_768F0+9674j
					; sub_768F0+967Cj
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_7FFD3
		cmp	[bp+var_84], 0
		jz	short loc_7FFD3
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_7FFD3:				; CODE XREF: sub_768F0+96C1j
					; sub_768F0+96C9j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_8000C
		cmp	[bp+var_7A], 0
		jz	short loc_8000C
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8000C:				; CODE XREF: sub_768F0+96FCj
					; sub_768F0+9703j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_80052
		cmp	[bp+var_6A], 0
		jz	short loc_80052
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80052:				; CODE XREF: sub_768F0+9742j
					; sub_768F0+9749j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_80098
		cmp	[bp+var_5A], 0
		jz	short loc_80098
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80098:				; CODE XREF: sub_768F0+9788j
					; sub_768F0+978Fj
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_800D0
		cmp	[bp+var_50], 0
		jz	short loc_800D0
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_800D0:				; CODE XREF: sub_768F0+97C0j
					; sub_768F0+97C7j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_8012D
		cmp	[bp+var_C04], 0
		jz	short loc_8012D
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8012D:				; CODE XREF: sub_768F0+981Aj
					; sub_768F0+9822j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_80179
		cmp	[bp+var_3EA], 0
		jz	short loc_80179
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80179:				; CODE XREF: sub_768F0+9866j
					; sub_768F0+986Ej
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_801C3
		cmp	[bp+var_40], 0
		jz	short loc_801C3
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_801C3:				; CODE XREF: sub_768F0+98B3j
					; sub_768F0+98BAj
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_80244
		cmp	[bp+var_22], 0
		jz	short loc_80244
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80244:				; CODE XREF: sub_768F0+9934j
					; sub_768F0+993Bj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_80292:				; CODE XREF: sub_768F0+94A7j
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	210Bh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_94]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_100+2], ax
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_100], ax
		push	[bp+var_A4]
		mov	al, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_EE]
		mov	al, [bp+var_EC]
		push	ax
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp+var_100+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_100]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	1Bh
		push	word ptr [bp+var_100]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		cmp	[bp+var_A], 0
		jnz	short loc_80397
		jmp	loc_80497
; ���������������������������������������������������������������������������

loc_80397:				; CODE XREF: sub_768F0+9AA2j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106], 2
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		push	6
		lea	ax, [bp+var_368]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_10A]
		push	ax
		push	word ptr [bp+var_100]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	[bp+var_10C], 0
		jmp	short loc_80402
; ���������������������������������������������������������������������������

loc_803F1:				; CODE XREF: sub_768F0+9B17j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_80402:				; CODE XREF: sub_768F0+9AFFj
		cmp	[bp+var_10C], 3
		jl	short loc_803F1
		jmp	short loc_80425
; ���������������������������������������������������������������������������

loc_8040B:				; CODE XREF: sub_768F0+9B43j
		jmp	short loc_80418
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_80418
		jmp	short loc_80435
; ���������������������������������������������������������������������������

loc_80418:				; CODE XREF: sub_768F0:loc_8040Bj
					; sub_768F0+9B24j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_80425:				; CODE XREF: sub_768F0+9B19j
		push	word ptr [bp+var_100]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_8040B

loc_80435:				; CODE XREF: sub_768F0+9B26j
		mov	[bp+var_10C], 0
		jmp	short loc_8044E
; ���������������������������������������������������������������������������

loc_8043D:				; CODE XREF: sub_768F0+9B63j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	[bp+var_10C]

loc_8044E:				; CODE XREF: sub_768F0+9B4Bj
		cmp	[bp+var_10C], 2
		jl	short loc_8043D
		cmp	byte ptr [bp+var_106+1], 0
		jz	short loc_8047D
		cmp	[bp+var_10A], 0
		jz	short loc_8047D
		push	0
		mov	al, byte ptr [bp+var_106]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8047D:				; CODE XREF: sub_768F0+9B6Aj
					; sub_768F0+9B72j
		mov	[bp+var_10A], 0
		mov	byte ptr [bp+var_106+1], 0
		mov	[bp+var_106+2],	0
		jmp	loc_806FF
; ���������������������������������������������������������������������������

loc_80497:				; CODE XREF: sub_768F0+9AA4j
		push	7Dh ; '}'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_4], 2Dh	; '-'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_805B8
; ���������������������������������������������������������������������������

loc_804C9:				; CODE XREF: sub_768F0+9CE2j
		mov	ax, [bp+var_C19]
		mov	[bp+var_102], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_804EB
		push	210Fh
		push	word ptr [bp+var_100]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_804EB:				; CODE XREF: sub_768F0+9BEAj
		mov	ax, si
		add	ax, 3
		cmp	ax, [bp+var_102]
		jnz	short loc_80511
		mov	ax, [bp+var_8]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_80511:				; CODE XREF: sub_768F0+9C04j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_8055C
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_8055C:				; CODE XREF: sub_768F0+9C28j
		jmp	short loc_805AB
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_805AB
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_805D5
; ���������������������������������������������������������������������������

loc_805AB:				; CODE XREF: sub_768F0:loc_8055Cj
					; sub_768F0+9C75j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_805B8:				; CODE XREF: sub_768F0+9BD6j
		cmp	[bp+var_C19], di
		jnb	short loc_805C5
		cmp	[bp+var_C17], 0
		jz	short loc_805CA

loc_805C5:				; CODE XREF: sub_768F0+9CCCj
		mov	ax, 1
		jmp	short loc_805CC
; ���������������������������������������������������������������������������

loc_805CA:				; CODE XREF: sub_768F0+9CD3j
		xor	ax, ax

loc_805CC:				; CODE XREF: sub_768F0+9CD8j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_805D5
		jmp	loc_804C9
; ���������������������������������������������������������������������������

loc_805D5:				; CODE XREF: sub_768F0+9CB9j
					; sub_768F0+9CE0j
		mov	[bp+var_4], 4Bh	; 'K'
		mov	si, [bp+var_C19]
		mov	ax, [bp+var_4]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_806E2
; ���������������������������������������������������������������������������

loc_805F5:				; CODE XREF: sub_768F0+9E0Cj
		mov	ax, [bp+var_C19]
		mov	[bp+var_102], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_80617
		push	2120h
		push	word ptr [bp+var_100]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_80617:				; CODE XREF: sub_768F0+9D16j
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp+var_102]
		jnz	short loc_8063B
		mov	ax, [bp+var_8]
		shl	ax, 4
		mov	dx, [bp+var_6]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_8063B:				; CODE XREF: sub_768F0+9D30j
		mov	ax, di
		dec	ax
		cmp	ax, [bp+var_102]
		jnz	short loc_80686
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_80686:				; CODE XREF: sub_768F0+9D52j
		jmp	short loc_806D5
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_806D5
		mov	word ptr [bp-0C4Eh], 11BCh
		mov	word ptr [bp-0C4Eh], 11C8h
		mov	word ptr [bp-0C4Eh], 11D8h
		mov	word ptr [bp-0C4Eh], 11E8h
		mov	word ptr [bp-0C4Eh], 11FCh
		lea	ax, [bp-1FEh]
		push	ax
		push	0
		push	word ptr [bp-1E1h]
		push	word ptr [bp-1E3h]
		push	word ptr [bp-1E5h]
		push	word ptr [bp-1E7h]
		lea	ax, [bp-0C4Eh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_806FF
; ���������������������������������������������������������������������������

loc_806D5:				; CODE XREF: sub_768F0:loc_80686j
					; sub_768F0+9D9Fj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_806E2:				; CODE XREF: sub_768F0+9D02j
		cmp	[bp+var_C19], di
		jnb	short loc_806EF
		cmp	[bp+var_C17], 0
		jz	short loc_806F4

loc_806EF:				; CODE XREF: sub_768F0+9DF6j
		mov	ax, 1
		jmp	short loc_806F6
; ���������������������������������������������������������������������������

loc_806F4:				; CODE XREF: sub_768F0+9DFDj
		xor	ax, ax

loc_806F6:				; CODE XREF: sub_768F0+9E02j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_806FF
		jmp	loc_805F5
; ���������������������������������������������������������������������������

loc_806FF:				; CODE XREF: sub_768F0+9BA4j
					; sub_768F0+9DE3j ...
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	[bp+var_F7], 0
		jz	short loc_8074D
		cmp	[bp+var_FC], 0
		jz	short loc_8074D
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8074D:				; CODE XREF: sub_768F0+9E3Aj
					; sub_768F0+9E42j
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		cmp	byte_495FC, 0
		jnz	short loc_8076E
		jmp	loc_80C66
; ���������������������������������������������������������������������������

loc_8076E:				; CODE XREF: sub_768F0+9E79j
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_807A5
		cmp	[bp+var_E8], 0
		jz	short loc_807A5
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_807A5:				; CODE XREF: sub_768F0+9E92j
					; sub_768F0+9E9Aj
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_807F3
		cmp	[bp+var_D8], 0
		jz	short loc_807F3
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_807F3:				; CODE XREF: sub_768F0+9EE0j
					; sub_768F0+9EE8j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_80841
		cmp	[bp+var_C8], 0
		jz	short loc_80841
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80841:				; CODE XREF: sub_768F0+9F2Ej
					; sub_768F0+9F36j
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_8088F
		cmp	[bp+var_B8], 0
		jz	short loc_8088F
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8088F:				; CODE XREF: sub_768F0+9F7Cj
					; sub_768F0+9F84j
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_808CE
		cmp	[bp+var_AE], 0
		jz	short loc_808CE
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_808CE:				; CODE XREF: sub_768F0+9FBBj
					; sub_768F0+9FC3j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_8091C
		cmp	[bp+var_9E], 0
		jz	short loc_8091C
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8091C:				; CODE XREF: sub_768F0+A009j
					; sub_768F0+A011j
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_8095B
		cmp	[bp+var_94], 0
		jz	short loc_8095B
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8095B:				; CODE XREF: sub_768F0+A048j
					; sub_768F0+A050j
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_809A7
		cmp	[bp+var_84], 0
		jz	short loc_809A7
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_809A7:				; CODE XREF: sub_768F0+A095j
					; sub_768F0+A09Dj
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_809E0
		cmp	[bp+var_7A], 0
		jz	short loc_809E0
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_809E0:				; CODE XREF: sub_768F0+A0D0j
					; sub_768F0+A0D7j
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_80A26
		cmp	[bp+var_6A], 0
		jz	short loc_80A26
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80A26:				; CODE XREF: sub_768F0+A116j
					; sub_768F0+A11Dj
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_80A6C
		cmp	[bp+var_5A], 0
		jz	short loc_80A6C
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80A6C:				; CODE XREF: sub_768F0+A15Cj
					; sub_768F0+A163j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_80AA4
		cmp	[bp+var_50], 0
		jz	short loc_80AA4
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80AA4:				; CODE XREF: sub_768F0+A194j
					; sub_768F0+A19Bj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_80B01
		cmp	[bp+var_C04], 0
		jz	short loc_80B01
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80B01:				; CODE XREF: sub_768F0+A1EEj
					; sub_768F0+A1F6j
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_80B4D
		cmp	[bp+var_3EA], 0
		jz	short loc_80B4D
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80B4D:				; CODE XREF: sub_768F0+A23Aj
					; sub_768F0+A242j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_80B97
		cmp	[bp+var_40], 0
		jz	short loc_80B97
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80B97:				; CODE XREF: sub_768F0+A287j
					; sub_768F0+A28Ej
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_80C18
		cmp	[bp+var_22], 0
		jz	short loc_80C18
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80C18:				; CODE XREF: sub_768F0+A308j
					; sub_768F0+A30Fj
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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

loc_80C66:				; CODE XREF: sub_768F0+9E7Bj
		mov	[bp+var_FC], 0
		mov	[bp+var_F8], 2
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	3
		lea	ax, [bp+var_FC]
		push	ax
		push	1Fh
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102], 2
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		push	2
		lea	ax, [bp+var_106]
		push	ax
		push	20h ; ' '
		lea	ax, [bp+var_278]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp+var_10A+1], 0
		lea	ax, [bp+var_106]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp+var_1B8]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	1
		push	0
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_110+2], ax
		push	word ptr [bp+var_110+2]
		lea	ax, [bp+var_C36]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	bx, word ptr [bp+var_110+2]
		mov	word ptr [bx+1Bh], 1
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	[bp+var_10C]
		mov	al, byte ptr [bp+var_10A]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0AEh ; '�'
		push	[bp+var_1EC]
		mov	bx, [bp+var_1EC]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		push	213Dh
		lea	ax, [bp+var_200]
		push	ax
		call	sub_C8F5
		add	sp, 4
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		jmp	short loc_80DCE
; ���������������������������������������������������������������������������

loc_80DB4:				; CODE XREF: sub_768F0+A4F7j
		jmp	short loc_80DC1
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_80DC1
		jmp	short loc_80DE9
; ���������������������������������������������������������������������������

loc_80DC1:				; CODE XREF: sub_768F0:loc_80DB4j
					; sub_768F0+A4CDj
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_80DCE:				; CODE XREF: sub_768F0+A4C2j
		cmp	[bp+var_C19], 0Fh
		jnb	short loc_80DDC
		cmp	[bp+var_C17], 0
		jz	short loc_80DE1

loc_80DDC:				; CODE XREF: sub_768F0+A4E3j
		mov	ax, 1
		jmp	short loc_80DE3
; ���������������������������������������������������������������������������

loc_80DE1:				; CODE XREF: sub_768F0+A4EAj
		xor	ax, ax

loc_80DE3:				; CODE XREF: sub_768F0+A4EFj
		mov	ah, 0
		or	ax, ax
		jz	short loc_80DB4

loc_80DE9:				; CODE XREF: sub_768F0+A4CFj
		mov	[bp+var_C42], 11BCh
		mov	[bp+var_C42], 11C8h
		mov	[bp+var_C42], 11D8h
		mov	[bp+var_C42], 11E8h
		mov	[bp+var_C42], 11FCh
		lea	ax, [bp+var_1FE]
		push	ax
		push	0
		push	[bp+var_1E1]
		push	[bp+var_1E3]
		push	[bp+var_1E5]
		push	[bp+var_1E7]
		lea	ax, [bp+var_C42]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	[bp+var_C19], 0
		jmp	short loc_80E69
; ���������������������������������������������������������������������������

loc_80E33:				; CODE XREF: sub_768F0+A592j
		mov	ax, [bp+var_C19]
		mov	word ptr [bp+var_110], ax
		mov	ax, word ptr [bp+var_110]
		inc	ax
		mov	[bp+var_112], ax
		mov	bx, word ptr [bp+var_110+2]
		mov	ax, [bp+var_112]
		mov	[bx+1Bh], ax
		jmp	short loc_80E5C
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_80E5C
		jmp	short loc_80E84
; ���������������������������������������������������������������������������

loc_80E5C:				; CODE XREF: sub_768F0+A55Fj
					; sub_768F0+A568j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_80E69:				; CODE XREF: sub_768F0+A541j
		cmp	[bp+var_C19], 26h ; '&'
		jnb	short loc_80E77
		cmp	[bp+var_C17], 0
		jz	short loc_80E7C

loc_80E77:				; CODE XREF: sub_768F0+A57Ej
		mov	ax, 1
		jmp	short loc_80E7E
; ���������������������������������������������������������������������������

loc_80E7C:				; CODE XREF: sub_768F0+A585j
		xor	ax, ax

loc_80E7E:				; CODE XREF: sub_768F0+A58Aj
		mov	ah, 0
		or	ax, ax
		jz	short loc_80E33

loc_80E84:				; CODE XREF: sub_768F0+A56Aj
		mov	[bp+var_C19], 0
		jmp	short loc_80EA6
; ���������������������������������������������������������������������������

loc_80E8C:				; CODE XREF: sub_768F0+A5CFj
		jmp	short loc_80E99
; ���������������������������������������������������������������������������
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_80E99
		jmp	short loc_80EC1
; ���������������������������������������������������������������������������

loc_80E99:				; CODE XREF: sub_768F0:loc_80E8Cj
					; sub_768F0+A5A5j
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_80EA6:				; CODE XREF: sub_768F0+A59Aj
		cmp	[bp+var_C19], 8
		jnb	short loc_80EB4
		cmp	[bp+var_C17], 0
		jz	short loc_80EB9

loc_80EB4:				; CODE XREF: sub_768F0+A5BBj
		mov	ax, 1
		jmp	short loc_80EBB
; ���������������������������������������������������������������������������

loc_80EB9:				; CODE XREF: sub_768F0+A5C2j
		xor	ax, ax

loc_80EBB:				; CODE XREF: sub_768F0+A5C7j
		mov	ah, 0
		or	ax, ax
		jz	short loc_80E8C

loc_80EC1:				; CODE XREF: sub_768F0+A5A7j
		push	0
		lea	ax, [bp+var_C36]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_10C]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_102+1], 0
		jz	short loc_80F07
		cmp	[bp+var_106], 0
		jz	short loc_80F07
		push	0
		mov	al, byte ptr [bp+var_102]
		push	ax
		lea	ax, [bp+var_106]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80F07:				; CODE XREF: sub_768F0+A5F4j
					; sub_768F0+A5FCj
		mov	[bp+var_106], 0
		mov	byte ptr [bp+var_102+1], 0
		mov	[bp+var_100], 0
		cmp	[bp+var_F7], 0
		jz	short loc_80F46
		cmp	[bp+var_FC], 0
		jz	short loc_80F46
		push	0
		mov	al, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80F46:				; CODE XREF: sub_768F0+A633j
					; sub_768F0+A63Bj
		mov	[bp+var_FC], 0
		mov	[bp+var_F7], 0
		mov	[bp+var_F6], 0
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	2
		lea	ax, [bp+var_EE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_E3], 0
		jz	short loc_80FAB
		cmp	[bp+var_E8], 0
		jz	short loc_80FAB
		push	0
		mov	al, [bp+var_E4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80FAB:				; CODE XREF: sub_768F0+A698j
					; sub_768F0+A6A0j
		mov	[bp+var_E8], 0
		mov	[bp+var_E3], 0
		mov	[bp+var_E2], 0
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_D3], 0
		jz	short loc_80FF9
		cmp	[bp+var_D8], 0
		jz	short loc_80FF9
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_80FF9:				; CODE XREF: sub_768F0+A6E6j
					; sub_768F0+A6EEj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_C3], 0
		jz	short loc_81047
		cmp	[bp+var_C8], 0
		jz	short loc_81047
		push	0
		mov	al, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81047:				; CODE XREF: sub_768F0+A734j
					; sub_768F0+A73Cj
		mov	[bp+var_C8], 0
		mov	[bp+var_C3], 0
		mov	[bp+var_C2], 0
		push	2
		lea	ax, [bp+var_BE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_B3], 0
		jz	short loc_81095
		cmp	[bp+var_B8], 0
		jz	short loc_81095
		push	0
		mov	al, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81095:				; CODE XREF: sub_768F0+A782j
					; sub_768F0+A78Aj
		mov	[bp+var_B8], 0
		mov	[bp+var_B3], 0
		mov	[bp+var_B2], 0
		cmp	[bp+var_A9], 0
		jz	short loc_810D4
		cmp	[bp+var_AE], 0
		jz	short loc_810D4
		push	0
		mov	al, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_810D4:				; CODE XREF: sub_768F0+A7C1j
					; sub_768F0+A7C9j
		mov	[bp+var_AE], 0
		mov	[bp+var_A9], 0
		mov	[bp+var_A8], 0
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_99], 0
		jz	short loc_81122
		cmp	[bp+var_9E], 0
		jz	short loc_81122
		push	0
		mov	al, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81122:				; CODE XREF: sub_768F0+A80Fj
					; sub_768F0+A817j
		mov	[bp+var_9E], 0
		mov	[bp+var_99], 0
		mov	[bp+var_98], 0
		cmp	[bp+var_8F], 0
		jz	short loc_81161
		cmp	[bp+var_94], 0
		jz	short loc_81161
		push	0
		mov	al, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81161:				; CODE XREF: sub_768F0+A84Ej
					; sub_768F0+A856j
		mov	[bp+var_94], 0
		mov	[bp+var_8F], 0
		mov	[bp+var_8E], 0
		push	2
		lea	ax, [bp+var_8A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7F], 0
		jz	short loc_811AD
		cmp	[bp+var_84], 0
		jz	short loc_811AD
		push	0
		mov	al, [bp+var_80]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_811AD:				; CODE XREF: sub_768F0+A89Bj
					; sub_768F0+A8A3j
		mov	[bp+var_84], 0
		mov	[bp+var_7F], 0
		mov	[bp+var_7E], 0
		cmp	[bp+var_75], 0
		jz	short loc_811E6
		cmp	[bp+var_7A], 0
		jz	short loc_811E6
		push	0
		mov	al, [bp+var_76]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_811E6:				; CODE XREF: sub_768F0+A8D6j
					; sub_768F0+A8DDj
		mov	[bp+var_7A], 0
		mov	[bp+var_75], 0
		mov	[bp+var_74], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_65], 0
		jz	short loc_8122C
		cmp	[bp+var_6A], 0
		jz	short loc_8122C
		push	0
		mov	al, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8122C:				; CODE XREF: sub_768F0+A91Cj
					; sub_768F0+A923j
		mov	[bp+var_6A], 0
		mov	[bp+var_65], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_55], 0
		jz	short loc_81272
		cmp	[bp+var_5A], 0
		jz	short loc_81272
		push	0
		mov	al, [bp+var_56]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81272:				; CODE XREF: sub_768F0+A962j
					; sub_768F0+A969j
		mov	[bp+var_5A], 0
		mov	[bp+var_55], 0
		mov	[bp+var_54], 0
		cmp	[bp+var_4B], 0
		jz	short loc_812AA
		cmp	[bp+var_50], 0
		jz	short loc_812AA
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_812AA:				; CODE XREF: sub_768F0+A99Aj
					; sub_768F0+A9A1j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	2
		lea	ax, [bp+var_46]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		mov	[bp+var_C14], 185Fh
		lea	ax, [bp+var_C14]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BFF], 0
		jz	short loc_81307
		cmp	[bp+var_C04], 0
		jz	short loc_81307
		push	0
		mov	al, [bp+var_C00]
		push	ax
		lea	ax, [bp+var_C04]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81307:				; CODE XREF: sub_768F0+A9F4j
					; sub_768F0+A9FCj
		mov	[bp+var_C04], 0
		mov	[bp+var_BFF], 0
		mov	[bp+var_BFE], 0
		lea	ax, [bp+var_3EE]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3E5], 0
		jz	short loc_81353
		cmp	[bp+var_3EA], 0
		jz	short loc_81353
		push	0
		mov	al, [bp+var_3E6]
		push	ax
		lea	ax, [bp+var_3EA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_81353:				; CODE XREF: sub_768F0+AA40j
					; sub_768F0+AA48j
		mov	[bp+var_3EA], 0
		mov	[bp+var_3E5], 0
		mov	[bp+var_3E4], 0
		push	2
		lea	ax, [bp+var_3E0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_3B], 0
		jz	short loc_8139D
		cmp	[bp+var_40], 0
		jz	short loc_8139D
		push	0
		mov	al, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8139D:				; CODE XREF: sub_768F0+AA8Dj
					; sub_768F0+AA94j
		mov	[bp+var_40], 0
		mov	[bp+var_3B], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, [bp+var_368]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2F0]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_278]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		lea	ax, [bp+var_1FE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_8141E
		cmp	[bp+var_22], 0
		jz	short loc_8141E
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_8141E:				; CODE XREF: sub_768F0+AB0Ej
					; sub_768F0+AB15j
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_1C6]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B8]
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
sub_768F0	endp

ovr200		ends
