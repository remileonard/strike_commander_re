ovr207		segment	para public 'OVERLAY' use16
		assume cs:ovr207
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_A3C30	proc far		; CODE XREF: sub_425C0J

var_D4A		= word ptr -0D4Ah
var_D40		= word ptr -0D40h
var_D0E		= word ptr -0D0Eh
var_CE3		= dword	ptr -0CE3h
var_CDE		= word ptr -0CDEh
var_CDB		= dword	ptr -0CDBh
var_CCE		= dword	ptr -0CCEh
var_CCA		= dword	ptr -0CCAh
var_CB1		= dword	ptr -0CB1h
var_CAD		= dword	ptr -0CADh
var_CA9		= dword	ptr -0CA9h
var_CA2		= word ptr -0CA2h
var_CA0		= word ptr -0CA0h
var_C9C		= word ptr -0C9Ch
var_C98		= dword	ptr -0C98h
var_C94		= word ptr -0C94h
var_C92		= dword	ptr -0C92h
var_C8E		= byte ptr -0C8Eh
var_C8D		= byte ptr -0C8Dh
var_C8C		= dword	ptr -0C8Ch
var_C88		= word ptr -0C88h
var_C84		= word ptr -0C84h
var_C82		= byte ptr -0C82h
var_C7E		= word ptr -0C7Eh
var_C74		= word ptr -0C74h
var_C72		= word ptr -0C72h
var_C70		= dword	ptr -0C70h
var_C6C		= byte ptr -0C6Ch
var_C6B		= word ptr -0C6Bh
var_C69		= byte ptr -0C69h
var_C66		= word ptr -0C66h
var_C64		= word ptr -0C64h
var_C50		= byte ptr -0C50h
var_C4D		= word ptr -0C4Dh
var_C4B		= word ptr -0C4Bh
var_C49		= word ptr -0C49h
var_C47		= word ptr -0C47h
var_C44		= word ptr -0C44h
var_C2C		= word ptr -0C2Ch
var_C2A		= word ptr -0C2Ah
var_C18		= word ptr -0C18h
var_C13		= word ptr -0C13h
var_C11		= word ptr -0C11h
var_C0F		= word ptr -0C0Fh
var_C0D		= word ptr -0C0Dh
var_C0A		= word ptr -0C0Ah
var_BF2		= word ptr -0BF2h
var_BF0		= word ptr -0BF0h
var_BE2		= dword	ptr -0BE2h
var_BDE		= byte ptr -0BDEh
var_BDD		= byte ptr -0BDDh
var_BDC		= dword	ptr -0BDCh
var_3D5		= dword	ptr -3D5h
var_3D1		= dword	ptr -3D1h
var_3CC		= word ptr -3CCh
var_3CA		= word ptr -3CAh
var_3C8		= dword	ptr -3C8h
var_3C4		= byte ptr -3C4h
var_3C3		= byte ptr -3C3h
var_3C2		= dword	ptr -3C2h
var_3BE		= word ptr -3BEh
var_346		= word ptr -346h
var_2CE		= word ptr -2CEh
var_256		= word ptr -256h
var_254		= word ptr -254h
var_252		= word ptr -252h
var_250		= word ptr -250h
var_24E		= word ptr -24Eh
var_24C		= word ptr -24Ch
var_248		= word ptr -248h
var_246		= word ptr -246h
var_244		= word ptr -244h
var_242		= word ptr -242h
var_240		= word ptr -240h
var_23E		= word ptr -23Eh
var_23A		= word ptr -23Ah
var_1EA		= word ptr -1EAh
var_1BE		= word ptr -1BEh
var_194		= word ptr -194h
var_16A		= dword	ptr -16Ah
var_166		= word ptr -166h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= word ptr -154h
var_152		= dword	ptr -152h
var_14E		= word ptr -14Eh
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= word ptr -13Ch
var_13A		= dword	ptr -13Ah
var_136		= word ptr -136h
var_134		= word ptr -134h
var_132		= word ptr -132h
var_130		= word ptr -130h
var_12E		= word ptr -12Eh
var_12C		= word ptr -12Ch
var_12A		= word ptr -12Ah
var_128		= word ptr -128h
var_126		= word ptr -126h
var_124		= word ptr -124h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= byte ptr -11Ah
var_119		= byte ptr -119h
var_118		= dword	ptr -118h
var_114		= word ptr -114h
var_112		= word ptr -112h
var_110		= word ptr -110h
var_10E		= word ptr -10Eh
var_10C		= word ptr -10Ch
var_10A		= word ptr -10Ah
var_108		= word ptr -108h
var_106		= word ptr -106h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= byte ptr -0FCh
var_FB		= byte ptr -0FBh
var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= byte ptr -0F2h
var_F1		= byte ptr -0F1h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= byte ptr -0E8h
var_E7		= byte ptr -0E7h
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= byte ptr -0DEh
var_DD		= byte ptr -0DDh
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= byte ptr -0D4h
var_D3		= byte ptr -0D3h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= byte ptr -0CAh
var_C9		= byte ptr -0C9h
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
var_66		= word ptr -66h
var_64		= byte ptr -64h
var_63		= word ptr -63h
var_60		= dword	ptr -60h
var_5C		= byte ptr -5Ch
var_5B		= byte ptr -5Bh
var_5A		= dword	ptr -5Ah
var_56		= word ptr -56h
var_54		= byte ptr -54h
var_53		= word ptr -53h
var_50		= dword	ptr -50h
var_4C		= byte ptr -4Ch
var_4B		= byte ptr -4Bh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword	ptr -36h
var_32		= byte ptr -32h
var_30		= dword	ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_1C		= word ptr -1Ch
var_18		= word ptr -18h
var_15		= byte ptr -15h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0D40h
		push	si
		push	di
		mov	[bp+var_1], 0
		push	2630h
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2631h
		lea	ax, [bp+var_1BE]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2632h
		lea	ax, [bp+var_1EA]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_4], 2633h
		mov	[bp+var_6], 2636h
		mov	[bp+var_8], 2638h
		mov	[bp+var_A], 263Ah
		mov	[bp+var_10], 0
		push	0C8h ; '�'
		push	12h
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	byte_495FC, 0
		mov	[bp+var_13], 0
		mov	[bp+var_14], 0
		mov	[bp+var_15], 0
		cmp	word_4684B, 0
		jz	short loc_A3CB3
		mov	[bp+var_14], 1

loc_A3CB3:				; CODE XREF: sub_A3C30+7Dj
		mov	ax, word_46F46
		mov	[bp+var_18], ax
		mov	[bp+var_248], 0
		mov	[bp+var_246], 0
		push	[bp+var_18]
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	[bp+var_256], 0
		mov	[bp+var_254], 0
		mov	[bp+var_252], 0
		mov	[bp+var_250], 0
		mov	[bp+var_24E], 13Fh
		mov	[bp+var_24C], 9Dh ; '�'
		push	0
		lea	ax, [bp+var_256]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_244], 0
		mov	[bp+var_242], 18h
		mov	[bp+var_240], 13Fh
		mov	[bp+var_23E], 97h ; '�'
		mov	byte ptr [bp+var_26], 0
		mov	byte ptr [bp+var_26+1],	0
		mov	[bp+var_24], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_38 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid33voc ; "mid33voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+var_14], 0
		jz	short loc_A3DD1
		push	ds
		lea	ax, [bp+var_23A]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_A3DD1
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_346]
		push	ax
		mov	bx, [bp+var_346]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_A3DD5
; ���������������������������������������������������������������������������

loc_A3DD1:				; CODE XREF: sub_A3C30+175j
					; sub_A3C30+187j
		mov	[bp+var_14], 0

loc_A3DD5:				; CODE XREF: sub_A3C30+19Fj
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		mov	al, byte_46848
		mov	[bp+var_32], al
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp+var_32]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_A3E15
		cmp	ax, 2
		jnz	short loc_A3E12
		jmp	loc_A3F81
; ���������������������������������������������������������������������������

loc_A3E12:				; CODE XREF: sub_A3C30+1DDj
		jmp	loc_A40EC
; ���������������������������������������������������������������������������

loc_A3E15:				; CODE XREF: sub_A3C30+1D8j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_23A]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_A3E43
		jmp	loc_A3F40
; ���������������������������������������������������������������������������

loc_A3E43:				; CODE XREF: sub_A3C30+20Ej
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_3BE]
		push	ax
		mov	bx, [bp+var_3BE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_39 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_D0E]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_D0E], 556h
		mov	[bp+var_CAD], 100h
		mov	[bp+var_CB1], 0
		mov	[bp+var_D0E], 56Eh
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_D0E]
		push	ax
		mov	bx, [bp+var_D0E]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	di, 1
		jmp	short loc_A3F08
; ���������������������������������������������������������������������������

loc_A3EF2:				; CODE XREF: sub_A3C30+2DBj
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	di

loc_A3F08:				; CODE XREF: sub_A3C30+2C0j
		cmp	di, 6Ah	; 'j'
		jle	short loc_A3EF2
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_15], 1
		mov	[bp+var_D0E], 56Eh
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_D0E]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_A3F40:				; CODE XREF: sub_A3C30+210j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_23A]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_A3F7E
		mov	[bp+var_13], 1
		mov	al, [bp+var_15]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3F7E
		mov	word_48F76, 5Ah	; 'Z'

loc_A3F7E:				; CODE XREF: sub_A3C30+339j
					; sub_A3C30+346j
		jmp	loc_A40EC
; ���������������������������������������������������������������������������

loc_A3F81:				; CODE XREF: sub_A3C30+1DFj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_23A]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_A3FAF
		jmp	loc_A40AC
; ���������������������������������������������������������������������������

loc_A3FAF:				; CODE XREF: sub_A3C30+37Aj
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_3BE]
		push	ax
		mov	bx, [bp+var_3BE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_40 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_D0E]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_D0E], 556h
		mov	[bp+var_CAD], 100h
		mov	[bp+var_CB1], 0
		mov	[bp+var_D0E], 56Eh
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_D0E]
		push	ax
		mov	bx, [bp+var_D0E]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	di, 1
		jmp	short loc_A4074
; ���������������������������������������������������������������������������

loc_A405E:				; CODE XREF: sub_A3C30+447j
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	di

loc_A4074:				; CODE XREF: sub_A3C30+42Cj
		cmp	di, 6Ah	; 'j'
		jle	short loc_A405E
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_15], 1
		mov	[bp+var_D0E], 56Eh
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_D0E]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_A40AC:				; CODE XREF: sub_A3C30+37Cj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_23A]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_A40EA
		mov	[bp+var_13], 1
		mov	al, [bp+var_15]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A40EA
		mov	word_48F76, 0FFh

loc_A40EA:				; CODE XREF: sub_A3C30+4A5j
					; sub_A3C30+4B2j
		jmp	short $+2

loc_A40EC:				; CODE XREF: sub_A3C30:loc_A3E12j
					; sub_A3C30:loc_A3F7Ej
		cmp	[bp+var_15], 0
		jnz	short loc_A40F5
		jmp	loc_A420C
; ���������������������������������������������������������������������������

loc_A40F5:				; CODE XREF: sub_A3C30+4C0j
		mov	[bp+var_C70], 0
		mov	[bp+var_C6C], 2
		mov	byte ptr [bp+var_C6B], 0
		mov	dword ptr [bp+var_C6B+1], 0
		mov	[bp+var_C74], 0
		mov	[bp+var_C72], 0FFFFh
		push	word_46849
		lea	ax, [bp+var_C74]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		push	3
		lea	ax, [bp+var_140+2]
		push	ax
		push	4Ch ; 'L'
		lea	ax, [bp+var_3BE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp+var_140+2]
		push	ax
		lea	ax, [bp+var_C74]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp+var_C74]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_A41A9
		cmp	[bp+var_140+2],	0
		jz	short loc_A41A9
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A41A9:				; CODE XREF: sub_A3C30+556j
					; sub_A3C30+55Ej
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		lea	ax, [bp+var_C74]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp+var_C6B], 0
		jz	short loc_A41F5
		cmp	[bp+var_C70], 0
		jz	short loc_A41F5
		push	0
		mov	al, [bp+var_C6C]
		push	ax
		lea	ax, [bp+var_C70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A41F5:				; CODE XREF: sub_A3C30+5A2j
					; sub_A3C30+5AAj
		mov	[bp+var_C70], 0
		mov	byte ptr [bp+var_C6B], 0
		mov	dword ptr [bp+var_C6B+1], 0

loc_A420C:				; CODE XREF: sub_A3C30+4C2j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C4], 2
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		mov	[bp+var_3CC], 0
		mov	[bp+var_3CA], 0FFFFh
		cmp	[bp+var_13], 0
		jz	short loc_A42AD
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_CDE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	[bp+var_14], 0
		jz	short loc_A425B
		mov	byte ptr [bp+var_136+1], 12h
		jmp	short loc_A4260
; ���������������������������������������������������������������������������

loc_A425B:				; CODE XREF: sub_A3C30+622j
		mov	byte ptr [bp+var_136+1], 11h

loc_A4260:				; CODE XREF: sub_A3C30+629j
		push	3
		lea	ax, [bp+var_30]
		push	ax
		mov	al, byte ptr [bp+var_136+1]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_CDE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_3CC]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_3CC]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp+var_CDE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_A42AD:				; CODE XREF: sub_A3C30+608j
		mov	[bp+var_BF2], 185Fh
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDE], 2
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		mov	[bp+var_BF0], 0
		mov	[bp+var_BF2], 186Fh
		xor	eax, eax
		mov	[bp+var_3D5], eax
		mov	[bp+var_3D1], eax
		cmp	[bp+var_14], 0
		jz	short loc_A4302
		push	word_4684B
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_A46DA
; ���������������������������������������������������������������������������

loc_A4302:				; CODE XREF: sub_A3C30+6BCj
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_41 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_D0E]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_D0E], 556h
		mov	[bp+var_CAD], 100h
		mov	[bp+var_CB1], 0
		mov	[bp+var_D0E], 56Eh
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_D0E]
		push	ax
		mov	bx, [bp+var_D0E]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3333474Dh
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		xor	di, di
		jmp	short loc_A43D3
; ���������������������������������������������������������������������������

loc_A438A:				; CODE XREF: sub_A3C30+7A6j
		push	1
		push	large 54584554h
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp+var_C9C]
		mov	[bp+var_136], ax
		movsx	eax, [bp+var_136]
		push	eax
		push	ds
		mov	ax, [bp+var_12]
		imul	di
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_C98]
		mov	[bp+var_CA9], eax
		inc	di

loc_A43D3:				; CODE XREF: sub_A3C30+758j
		cmp	di, 12h
		jl	short loc_A438A
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A4423
		push	[bp+arg_4]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_A44BE
; ���������������������������������������������������������������������������

loc_A4423:				; CODE XREF: sub_A3C30+7C2j
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A4460
		push	[bp+arg_0]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_A44BE
; ���������������������������������������������������������������������������

loc_A4460:				; CODE XREF: sub_A3C30+800j
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A449D
		push	[bp+arg_2]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_A44BE
; ���������������������������������������������������������������������������

loc_A449D:				; CODE XREF: sub_A3C30+83Dj
		mov	ax, [bp+var_12]
		shl	ax, 1
		add	ax, [bp+var_12]
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_A44BE:				; CODE XREF: sub_A3C30+7F0j
					; sub_A3C30+82Ej ...
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A4515
		push	[bp+var_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_0]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_A45D8
; ���������������������������������������������������������������������������

loc_A4515:				; CODE XREF: sub_A3C30+89Bj
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A456B
		push	[bp+var_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_A45D8
; ���������������������������������������������������������������������������

loc_A456B:				; CODE XREF: sub_A3C30+8F2j
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A45C1
		push	[bp+var_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_A45D8
; ���������������������������������������������������������������������������

loc_A45C1:				; CODE XREF: sub_A3C30+948j
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_A45D8:				; CODE XREF: sub_A3C30+8E2j
					; sub_A3C30+939j ...
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A4618
		push	[bp+arg_4]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_A46B8
; ���������������������������������������������������������������������������

loc_A4618:				; CODE XREF: sub_A3C30+9B5j
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A4657
		push	[bp+arg_0]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_A46B8
; ���������������������������������������������������������������������������

loc_A4657:				; CODE XREF: sub_A3C30+9F5j
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A4696
		push	[bp+arg_2]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_A46B8
; ���������������������������������������������������������������������������

loc_A4696:				; CODE XREF: sub_A3C30+A34j
		mov	ax, [bp+var_12]
		mov	dx, 11h
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_A46B8:				; CODE XREF: sub_A3C30+9E5j
					; sub_A3C30+A25j ...
		mov	[bp+var_D0E], 56Eh
		lea	ax, [bp+var_D0E]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_D0E]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_A46DA:				; CODE XREF: sub_A3C30+6CFj
		push	[bp+arg_4]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A471B
		push	[bp+var_A]
		lea	ax, [bp+var_1EA]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_4]
		lea	ax, [bp+var_1EA]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_A]
		lea	ax, [bp+var_1EA]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_A474B
; ���������������������������������������������������������������������������

loc_A471B:				; CODE XREF: sub_A3C30+AB7j
		push	[bp+var_A]
		lea	ax, [bp+var_1EA]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	2669h
		lea	ax, [bp+var_1EA]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_A]
		lea	ax, [bp+var_1EA]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_A474B:				; CODE XREF: sub_A3C30+AE9j
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		push	ax
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		pop	dx
		add	dx, ax
		inc	dx
		cmp	dx, 15h
		jbe	short loc_A476F
		mov	[bp+var_1], 1

loc_A476F:				; CODE XREF: sub_A3C30+B39j
		push	[bp+arg_0]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_A47DD
		push	[bp+arg_0]
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_A47BB
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_A47A9
		mov	[bp+var_1], 0
		jmp	short loc_A47B9
; ���������������������������������������������������������������������������

loc_A47A9:				; CODE XREF: sub_A3C30+B71j
		push	[bp+arg_2]
		lea	ax, [bp+var_1BE]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_A47B9:				; CODE XREF: sub_A3C30+B77j
		jmp	short loc_A47DB
; ���������������������������������������������������������������������������

loc_A47BB:				; CODE XREF: sub_A3C30+B62j
		push	[bp+var_8]
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_A47DB:				; CODE XREF: sub_A3C30:loc_A47B9j
		jmp	short loc_A47F1
; ���������������������������������������������������������������������������

loc_A47DD:				; CODE XREF: sub_A3C30+B4Cj
		mov	[bp+var_1], 0
		push	[bp+arg_2]
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_A47F1:				; CODE XREF: sub_A3C30:loc_A47DBj
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_A4812
		push	2671h
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_A4812:				; CODE XREF: sub_A3C30+BD0j
		mov	[bp+var_3C], 0
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	3
		lea	ax, [bp+var_3C]
		push	ax
		push	2Ah ; '*'
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_46], 0
		mov	[bp+var_42], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	3
		lea	ax, [bp+var_46]
		push	ax
		push	2Ch ; ','
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_50], 0
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	0
		push	2
		lea	ax, [bp+var_50]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	[bp+var_53], 0
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_60], 0
		mov	[bp+var_5C], 2
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		push	25h ; '%'
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_63], 0
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	[bp+var_70], 0
		mov	[bp+var_6C], 2
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		push	2Bh ; '+'
		lea	ax, [bp+var_2CE]
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
		push	2Dh ; '-'
		lea	ax, [bp+var_2CE]
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
		push	28h ; '('
		lea	ax, [bp+var_2CE]
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
		push	29h ; ')'
		lea	ax, [bp+var_2CE]
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
		push	1Dh
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_BA], 0
		mov	[bp+var_B6], 2
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		push	3
		lea	ax, [bp+var_BA]
		push	ax
		push	21h ; '!'
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_C4], 0
		mov	[bp+var_C0], 2
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		push	3
		lea	ax, [bp+var_C4]
		push	ax
		push	22h ; '"'
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_CE], 0
		mov	[bp+var_CA], 2
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		push	3
		lea	ax, [bp+var_CE]
		push	ax
		push	23h ; '#'
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_D8], 0
		mov	[bp+var_D4], 2
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		push	3
		lea	ax, [bp+var_D8]
		push	ax
		push	267Fh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_E2], 0
		mov	[bp+var_DE], 2
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		push	3
		lea	ax, [bp+var_E2]
		push	ax
		push	2685h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_EC], 0
		mov	[bp+var_E8], 2
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		push	3
		lea	ax, [bp+var_EC]
		push	ax
		push	2689h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_F6], 0
		mov	[bp+var_F2], 2
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		push	3
		lea	ax, [bp+var_F6]
		push	ax
		push	268Eh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	[bp+var_100], 0
		mov	[bp+var_FC], 2
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aConvfont_1 ; "convfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_104+2], dx
		mov	word ptr [bp+var_104], ax
		mov	eax, [bp+var_104]
		mov	[bp+var_100], eax
		mov	[bp+var_FC], 2
		mov	[bp+var_FB], 1
		mov	[bp+var_FA], 0
		lea	ax, [bp+var_100]
		push	ax
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_10C], 0
		mov	[bp+var_10A], 98h ; '�'
		mov	[bp+var_108], 13Fh
		mov	[bp+var_106], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp+var_10E], ax
		lea	ax, [bp+var_C0A]
		push	ax
		push	[bp+var_10E]
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_C2C], 1218h
		mov	ax, [bp+var_10A]
		mov	[bp+var_110], ax
		mov	ax, [bp+var_108]
		mov	[bp+var_112], ax
		mov	ax, [bp+var_106]
		mov	[bp+var_114], ax
		mov	ax, [bp+var_10C]
		mov	[bp+var_C13], ax
		mov	ax, [bp+var_110]
		mov	[bp+var_C11], ax
		mov	ax, [bp+var_112]
		mov	[bp+var_C0F], ax
		mov	ax, [bp+var_114]
		mov	[bp+var_C0D], ax
		push	0
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_11E], 0
		mov	[bp+var_11A], 2
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aGravfont ; "gravfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_23A]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_122+2], dx
		mov	word ptr [bp+var_122], ax
		mov	eax, [bp+var_122]
		mov	[bp+var_11E], eax
		mov	[bp+var_11A], 2
		mov	[bp+var_119], 1
		mov	[bp+var_118], 0
		lea	ax, [bp+var_11E]
		push	ax
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_12A], 5Eh ; '^'
		mov	[bp+var_128], 40h ; '@'
		mov	[bp+var_126], 87h ; '�'
		mov	[bp+var_124], 14h
		lea	ax, [bp+var_C44]
		push	ax
		lea	ax, [bp+var_256]
		push	ax
		lea	ax, [bp+var_C66]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_C66], 1218h
		mov	ax, [bp+var_128]
		mov	[bp+var_12C], ax
		mov	ax, [bp+var_126]
		mov	[bp+var_12E], ax
		mov	ax, [bp+var_124]
		mov	[bp+var_130], ax
		mov	ax, [bp+var_12A]
		mov	[bp+var_C4D], ax
		mov	ax, [bp+var_12C]
		mov	[bp+var_C4B], ax
		mov	ax, [bp+var_12E]
		mov	[bp+var_C49], ax
		mov	ax, [bp+var_130]
		mov	[bp+var_C47], ax
		mov	[bp+var_C50], 2
		cmp	byte_495FC, 0
		jnz	short loc_A4D89
		jmp	loc_A53A7
; ���������������������������������������������������������������������������

loc_A4D89:				; CODE XREF: sub_A3C30+1154j
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A4DCD
		cmp	[bp+var_11E], 0
		jz	short loc_A4DCD
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4DCD:				; CODE XREF: sub_A3C30+117Aj
					; sub_A3C30+1182j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A4E28
		cmp	[bp+var_100], 0
		jz	short loc_A4E28
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4E28:				; CODE XREF: sub_A3C30+11D5j
					; sub_A3C30+11DDj
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A4E67
		cmp	[bp+var_F6], 0
		jz	short loc_A4E67
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4E67:				; CODE XREF: sub_A3C30+1214j
					; sub_A3C30+121Cj
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A4EA6
		cmp	[bp+var_EC], 0
		jz	short loc_A4EA6
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4EA6:				; CODE XREF: sub_A3C30+1253j
					; sub_A3C30+125Bj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A4EE5
		cmp	[bp+var_E2], 0
		jz	short loc_A4EE5
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4EE5:				; CODE XREF: sub_A3C30+1292j
					; sub_A3C30+129Aj
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A4F24
		cmp	[bp+var_D8], 0
		jz	short loc_A4F24
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4F24:				; CODE XREF: sub_A3C30+12D1j
					; sub_A3C30+12D9j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A4F63
		cmp	[bp+var_CE], 0
		jz	short loc_A4F63
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4F63:				; CODE XREF: sub_A3C30+1310j
					; sub_A3C30+1318j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A4FA2
		cmp	[bp+var_C4], 0
		jz	short loc_A4FA2
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4FA2:				; CODE XREF: sub_A3C30+134Fj
					; sub_A3C30+1357j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A4FE1
		cmp	[bp+var_BA], 0
		jz	short loc_A4FE1
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A4FE1:				; CODE XREF: sub_A3C30+138Ej
					; sub_A3C30+1396j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A5020
		cmp	[bp+var_B0], 0
		jz	short loc_A5020
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5020:				; CODE XREF: sub_A3C30+13CDj
					; sub_A3C30+13D5j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A506E
		cmp	[bp+var_A0], 0
		jz	short loc_A506E
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A506E:				; CODE XREF: sub_A3C30+141Bj
					; sub_A3C30+1423j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A50BC
		cmp	[bp+var_90], 0
		jz	short loc_A50BC
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A50BC:				; CODE XREF: sub_A3C30+1469j
					; sub_A3C30+1471j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A5106
		cmp	[bp+var_80], 0
		jz	short loc_A5106
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5106:				; CODE XREF: sub_A3C30+14B6j
					; sub_A3C30+14BDj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A514C
		cmp	[bp+var_70], 0
		jz	short loc_A514C
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A514C:				; CODE XREF: sub_A3C30+14FCj
					; sub_A3C30+1503j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A5192
		cmp	[bp+var_60], 0
		jz	short loc_A5192
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5192:				; CODE XREF: sub_A3C30+1542j
					; sub_A3C30+1549j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A51D8
		cmp	[bp+var_50], 0
		jz	short loc_A51D8
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A51D8:				; CODE XREF: sub_A3C30+1588j
					; sub_A3C30+158Fj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A5210
		cmp	[bp+var_46], 0
		jz	short loc_A5210
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5210:				; CODE XREF: sub_A3C30+15C0j
					; sub_A3C30+15C7j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A5248
		cmp	[bp+var_3C], 0
		jz	short loc_A5248
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5248:				; CODE XREF: sub_A3C30+15F8j
					; sub_A3C30+15FFj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A5297
		cmp	[bp+var_BE2], 0
		jz	short loc_A5297
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5297:				; CODE XREF: sub_A3C30+1644j
					; sub_A3C30+164Cj
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A52E3
		cmp	[bp+var_3C8], 0
		jz	short loc_A52E3
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A52E3:				; CODE XREF: sub_A3C30+1690j
					; sub_A3C30+1698j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A532D
		cmp	[bp+var_30], 0
		jz	short loc_A532D
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A532D:				; CODE XREF: sub_A3C30+16DDj
					; sub_A3C30+16E4j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A53A7:				; CODE XREF: sub_A3C30+1156j
		cmp	[bp+var_13], 0
		jz	short loc_A53F1
		mov	ax, word_48F76
		mov	[bp+var_132], ax
		mov	[bp+var_134], 0
		cmp	[bp+var_3CC], 0
		jz	short loc_A53F1
		push	[bp+var_3CA]
		mov	bx, [bp+var_3CC]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	[bp+var_134]
		push	[bp+var_132]
		push	[bp+var_3CA]
		mov	bx, [bp+var_3CC]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_A53F1:				; CODE XREF: sub_A3C30+177Bj
					; sub_A3C30+178Fj
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_136], ax
		push	0
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_13A+2], ax
		push	0
		push	0
		lea	ax, [bp+var_C4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_13A], ax
		push	0
		push	0
		lea	ax, [bp+var_CE]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_13C], ax
		push	[bp+var_66]
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_136]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_13A]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_13C]
		lea	ax, [bp+var_C88]
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
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	[bp+var_66]
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		cmp	[bp+var_14], 0
		jnz	short loc_A5555
		jmp	loc_A565D
; ���������������������������������������������������������������������������

loc_A5555:				; CODE XREF: sub_A3C30+1920j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_148+2],	0
		mov	byte ptr [bp+var_144+2], 2
		mov	byte ptr [bp+var_144+3], 0
		mov	[bp+var_140], 0
		push	2
		lea	ax, [bp+var_148+2]
		push	ax
		push	0
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_A55B8
; ���������������������������������������������������������������������������

loc_A55AA:				; CODE XREF: sub_A3C30+198Bj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_A55B8:				; CODE XREF: sub_A3C30+1978j
		cmp	di, 4
		jl	short loc_A55AA
		push	0FFFFh
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_A55E6
; ���������������������������������������������������������������������������

loc_A55CE:				; CODE XREF: sub_A3C30+19C5j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A55D9
		jmp	short loc_A55F7
; ���������������������������������������������������������������������������

loc_A55D9:				; CODE XREF: sub_A3C30+19A5j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A55E6:				; CODE XREF: sub_A3C30+199Cj
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_A55CE

loc_A55F7:				; CODE XREF: sub_A3C30+19A7j
		xor	di, di
		jmp	short loc_A5609
; ���������������������������������������������������������������������������

loc_A55FB:				; CODE XREF: sub_A3C30+19DCj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_A5609:				; CODE XREF: sub_A3C30+19C9j
		cmp	di, 4
		jl	short loc_A55FB
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_144+3], 0
		jz	short loc_A5643
		cmp	[bp+var_148+2],	0
		jz	short loc_A5643
		push	0
		mov	al, byte ptr [bp+var_144+2]
		push	ax
		lea	ax, [bp+var_148+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5643:				; CODE XREF: sub_A3C30+19F0j
					; sub_A3C30+19F8j
		mov	[bp+var_148+2],	0
		mov	byte ptr [bp+var_144+3], 0
		mov	[bp+var_140], 0
		jmp	loc_A5EB8
; ���������������������������������������������������������������������������

loc_A565D:				; CODE XREF: sub_A3C30+1922j
		push	0
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0Ch
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_E], 35h	; '5'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A575D
; ���������������������������������������������������������������������������

loc_A569C:				; CODE XREF: sub_A3C30+1B4Aj
		mov	di, [bp+var_C6B]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_A56B9
		push	[bp+var_10]
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A56B9:				; CODE XREF: sub_A3C30+1A77j
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A5703
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A5703:				; CODE XREF: sub_A3C30+1A8Fj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A5750
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A577D
; ���������������������������������������������������������������������������

loc_A5750:				; CODE XREF: sub_A3C30+1ADAj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A575D:				; CODE XREF: sub_A3C30+1A69j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_A576D
		cmp	[bp+var_C69], 0
		jz	short loc_A5772

loc_A576D:				; CODE XREF: sub_A3C30+1B34j
		mov	ax, 1
		jmp	short loc_A5774
; ���������������������������������������������������������������������������

loc_A5772:				; CODE XREF: sub_A3C30+1B3Bj
		xor	ax, ax

loc_A5774:				; CODE XREF: sub_A3C30+1B40j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A577D
		jmp	loc_A569C
; ���������������������������������������������������������������������������

loc_A577D:				; CODE XREF: sub_A3C30+1B1Ej
					; sub_A3C30+1B48j
		cmp	byte_495FC, 0
		jnz	short loc_A5787
		jmp	loc_A5DB4
; ���������������������������������������������������������������������������

loc_A5787:				; CODE XREF: sub_A3C30+1B52j
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A57DA
		cmp	[bp+var_11E], 0
		jz	short loc_A57DA
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A57DA:				; CODE XREF: sub_A3C30+1B87j
					; sub_A3C30+1B8Fj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A5835
		cmp	[bp+var_100], 0
		jz	short loc_A5835
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5835:				; CODE XREF: sub_A3C30+1BE2j
					; sub_A3C30+1BEAj
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A5874
		cmp	[bp+var_F6], 0
		jz	short loc_A5874
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5874:				; CODE XREF: sub_A3C30+1C21j
					; sub_A3C30+1C29j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A58B3
		cmp	[bp+var_EC], 0
		jz	short loc_A58B3
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A58B3:				; CODE XREF: sub_A3C30+1C60j
					; sub_A3C30+1C68j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A58F2
		cmp	[bp+var_E2], 0
		jz	short loc_A58F2
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A58F2:				; CODE XREF: sub_A3C30+1C9Fj
					; sub_A3C30+1CA7j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A5931
		cmp	[bp+var_D8], 0
		jz	short loc_A5931
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5931:				; CODE XREF: sub_A3C30+1CDEj
					; sub_A3C30+1CE6j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A5970
		cmp	[bp+var_CE], 0
		jz	short loc_A5970
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5970:				; CODE XREF: sub_A3C30+1D1Dj
					; sub_A3C30+1D25j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A59AF
		cmp	[bp+var_C4], 0
		jz	short loc_A59AF
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A59AF:				; CODE XREF: sub_A3C30+1D5Cj
					; sub_A3C30+1D64j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A59EE
		cmp	[bp+var_BA], 0
		jz	short loc_A59EE
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A59EE:				; CODE XREF: sub_A3C30+1D9Bj
					; sub_A3C30+1DA3j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A5A2D
		cmp	[bp+var_B0], 0
		jz	short loc_A5A2D
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5A2D:				; CODE XREF: sub_A3C30+1DDAj
					; sub_A3C30+1DE2j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A5A7B
		cmp	[bp+var_A0], 0
		jz	short loc_A5A7B
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5A7B:				; CODE XREF: sub_A3C30+1E28j
					; sub_A3C30+1E30j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A5AC9
		cmp	[bp+var_90], 0
		jz	short loc_A5AC9
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5AC9:				; CODE XREF: sub_A3C30+1E76j
					; sub_A3C30+1E7Ej
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A5B13
		cmp	[bp+var_80], 0
		jz	short loc_A5B13
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5B13:				; CODE XREF: sub_A3C30+1EC3j
					; sub_A3C30+1ECAj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A5B59
		cmp	[bp+var_70], 0
		jz	short loc_A5B59
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5B59:				; CODE XREF: sub_A3C30+1F09j
					; sub_A3C30+1F10j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A5B9F
		cmp	[bp+var_60], 0
		jz	short loc_A5B9F
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5B9F:				; CODE XREF: sub_A3C30+1F4Fj
					; sub_A3C30+1F56j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A5BE5
		cmp	[bp+var_50], 0
		jz	short loc_A5BE5
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5BE5:				; CODE XREF: sub_A3C30+1F95j
					; sub_A3C30+1F9Cj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A5C1D
		cmp	[bp+var_46], 0
		jz	short loc_A5C1D
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5C1D:				; CODE XREF: sub_A3C30+1FCDj
					; sub_A3C30+1FD4j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A5C55
		cmp	[bp+var_3C], 0
		jz	short loc_A5C55
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5C55:				; CODE XREF: sub_A3C30+2005j
					; sub_A3C30+200Cj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A5CA4
		cmp	[bp+var_BE2], 0
		jz	short loc_A5CA4
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5CA4:				; CODE XREF: sub_A3C30+2051j
					; sub_A3C30+2059j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A5CF0
		cmp	[bp+var_3C8], 0
		jz	short loc_A5CF0
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5CF0:				; CODE XREF: sub_A3C30+209Dj
					; sub_A3C30+20A5j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A5D3A
		cmp	[bp+var_30], 0
		jz	short loc_A5D3A
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5D3A:				; CODE XREF: sub_A3C30+20EAj
					; sub_A3C30+20F1j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A5DB4:				; CODE XREF: sub_A3C30+1B54j
		mov	[bp+var_E], 3Dh	; '='
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A5E98
; ���������������������������������������������������������������������������

loc_A5DD5:				; CODE XREF: sub_A3C30+2285j
		mov	di, [bp+var_C6B]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_A5DF4
		mov	ax, [bp+var_10]
		add	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A5DF4:				; CODE XREF: sub_A3C30+21AEj
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A5E3E
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A5E3E:				; CODE XREF: sub_A3C30+21CAj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A5E8B
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A5EB8
; ���������������������������������������������������������������������������

loc_A5E8B:				; CODE XREF: sub_A3C30+2215j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A5E98:				; CODE XREF: sub_A3C30+21A2j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_A5EA8
		cmp	[bp+var_C69], 0
		jz	short loc_A5EAD

loc_A5EA8:				; CODE XREF: sub_A3C30+226Fj
		mov	ax, 1
		jmp	short loc_A5EAF
; ���������������������������������������������������������������������������

loc_A5EAD:				; CODE XREF: sub_A3C30+2276j
		xor	ax, ax

loc_A5EAF:				; CODE XREF: sub_A3C30+227Bj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A5EB8
		jmp	loc_A5DD5
; ���������������������������������������������������������������������������

loc_A5EB8:				; CODE XREF: sub_A3C30+1A2Aj
					; sub_A3C30+2259j ...
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_A5ED1
		jmp	loc_A64EF
; ���������������������������������������������������������������������������

loc_A5ED1:				; CODE XREF: sub_A3C30+229Cj
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A5F15
		cmp	[bp+var_11E], 0
		jz	short loc_A5F15
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5F15:				; CODE XREF: sub_A3C30+22C2j
					; sub_A3C30+22CAj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A5F70
		cmp	[bp+var_100], 0
		jz	short loc_A5F70
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5F70:				; CODE XREF: sub_A3C30+231Dj
					; sub_A3C30+2325j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A5FAF
		cmp	[bp+var_F6], 0
		jz	short loc_A5FAF
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5FAF:				; CODE XREF: sub_A3C30+235Cj
					; sub_A3C30+2364j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A5FEE
		cmp	[bp+var_EC], 0
		jz	short loc_A5FEE
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A5FEE:				; CODE XREF: sub_A3C30+239Bj
					; sub_A3C30+23A3j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A602D
		cmp	[bp+var_E2], 0
		jz	short loc_A602D
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A602D:				; CODE XREF: sub_A3C30+23DAj
					; sub_A3C30+23E2j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A606C
		cmp	[bp+var_D8], 0
		jz	short loc_A606C
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A606C:				; CODE XREF: sub_A3C30+2419j
					; sub_A3C30+2421j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A60AB
		cmp	[bp+var_CE], 0
		jz	short loc_A60AB
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A60AB:				; CODE XREF: sub_A3C30+2458j
					; sub_A3C30+2460j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A60EA
		cmp	[bp+var_C4], 0
		jz	short loc_A60EA
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A60EA:				; CODE XREF: sub_A3C30+2497j
					; sub_A3C30+249Fj
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A6129
		cmp	[bp+var_BA], 0
		jz	short loc_A6129
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6129:				; CODE XREF: sub_A3C30+24D6j
					; sub_A3C30+24DEj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A6168
		cmp	[bp+var_B0], 0
		jz	short loc_A6168
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6168:				; CODE XREF: sub_A3C30+2515j
					; sub_A3C30+251Dj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A61B6
		cmp	[bp+var_A0], 0
		jz	short loc_A61B6
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A61B6:				; CODE XREF: sub_A3C30+2563j
					; sub_A3C30+256Bj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A6204
		cmp	[bp+var_90], 0
		jz	short loc_A6204
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6204:				; CODE XREF: sub_A3C30+25B1j
					; sub_A3C30+25B9j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A624E
		cmp	[bp+var_80], 0
		jz	short loc_A624E
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A624E:				; CODE XREF: sub_A3C30+25FEj
					; sub_A3C30+2605j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A6294
		cmp	[bp+var_70], 0
		jz	short loc_A6294
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6294:				; CODE XREF: sub_A3C30+2644j
					; sub_A3C30+264Bj
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A62DA
		cmp	[bp+var_60], 0
		jz	short loc_A62DA
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A62DA:				; CODE XREF: sub_A3C30+268Aj
					; sub_A3C30+2691j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A6320
		cmp	[bp+var_50], 0
		jz	short loc_A6320
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6320:				; CODE XREF: sub_A3C30+26D0j
					; sub_A3C30+26D7j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A6358
		cmp	[bp+var_46], 0
		jz	short loc_A6358
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6358:				; CODE XREF: sub_A3C30+2708j
					; sub_A3C30+270Fj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A6390
		cmp	[bp+var_3C], 0
		jz	short loc_A6390
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6390:				; CODE XREF: sub_A3C30+2740j
					; sub_A3C30+2747j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A63DF
		cmp	[bp+var_BE2], 0
		jz	short loc_A63DF
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A63DF:				; CODE XREF: sub_A3C30+278Cj
					; sub_A3C30+2794j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A642B
		cmp	[bp+var_3C8], 0
		jz	short loc_A642B
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A642B:				; CODE XREF: sub_A3C30+27D8j
					; sub_A3C30+27E0j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A6475
		cmp	[bp+var_30], 0
		jz	short loc_A6475
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6475:				; CODE XREF: sub_A3C30+2825j
					; sub_A3C30+282Cj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A64EF:				; CODE XREF: sub_A3C30+229Ej
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		push	3
		lea	ax, [bp+var_140+2]
		push	ax
		push	20h ; ' '
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		push	3
		lea	ax, [bp+var_148]
		push	ax
		push	27h ; '''
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_140+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_14C+2], ax
		cmp	[bp+var_1], 0
		jz	short loc_A659B
		mov	word ptr [bp+var_14C], 0
		mov	[bp+var_14E], 7
		mov	word ptr [bp+var_152+2], 0Eh
		jmp	short loc_A65AD
; ���������������������������������������������������������������������������

loc_A659B:				; CODE XREF: sub_A3C30+2955j
		mov	word ptr [bp+var_14C], 4
		mov	[bp+var_14E], 0Bh
		mov	word ptr [bp+var_152+2], 0

loc_A65AD:				; CODE XREF: sub_A3C30+2969j
		push	word ptr [bp+var_14C]
		push	0
		lea	ax, [bp+var_C66]
		push	ax
		push	0
		call	sub_ACF1
		add	sp, 8
		mov	word ptr [bp+var_152], ax
		push	[bp+var_14E]
		push	0
		lea	ax, [bp+var_C66]
		push	ax
		push	0
		call	sub_ACF1
		add	sp, 8
		mov	[bp+var_154], ax
		push	word ptr [bp+var_152+2]
		push	0
		lea	ax, [bp+var_C66]
		push	ax
		push	0
		call	sub_ACF1
		add	sp, 8
		mov	word ptr [bp+var_158+2], ax
		push	word ptr [bp+var_14C+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_1], 0
		jz	short loc_A6677
		lea	ax, [bp+var_194]
		push	ax
		push	word ptr [bp+var_152]
		call	sub_ADB7
		add	sp, 4
		lea	ax, [bp+var_1BE]
		push	ax
		push	[bp+var_154]
		call	sub_ADB7
		add	sp, 4
		lea	ax, [bp+var_1EA]
		push	ax
		push	word ptr [bp+var_158+2]
		call	sub_ADB7
		add	sp, 4
		push	word ptr [bp+var_152]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_154]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_158+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_A66D5
; ���������������������������������������������������������������������������

loc_A6677:				; CODE XREF: sub_A3C30+29DDj
		lea	ax, [bp+var_194]
		push	ax
		push	word ptr [bp+var_152]
		call	sub_ADB7
		add	sp, 4
		lea	ax, [bp+var_1EA]
		push	ax
		push	[bp+var_154]
		call	sub_ADB7
		add	sp, 4
		push	word ptr [bp+var_152]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_154]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	word ptr [bp+var_158+2], 0
		jz	short loc_A66D5
		push	3
		push	word ptr [bp+var_158+2]
		mov	bx, word ptr [bp+var_158+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_A66D5:				; CODE XREF: sub_A3C30+2A45j
					; sub_A3C30+2A90j
		push	[bp+var_A6]
		mov	al, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_A6]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_A671B
		jmp	loc_A700F
; ���������������������������������������������������������������������������

loc_A671B:				; CODE XREF: sub_A3C30+2AE6j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C], 2
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15C+2],	0
		push	2
		lea	ax, [bp+var_160]
		push	ax
		push	1
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_A677E
; ���������������������������������������������������������������������������

loc_A6770:				; CODE XREF: sub_A3C30+2B51j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_A677E:				; CODE XREF: sub_A3C30+2B3Ej
		cmp	di, 2
		jl	short loc_A6770
		push	0FFFFh
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_A67AC
; ���������������������������������������������������������������������������

loc_A6794:				; CODE XREF: sub_A3C30+2B8Bj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A679F
		jmp	short loc_A67BD
; ���������������������������������������������������������������������������

loc_A679F:				; CODE XREF: sub_A3C30+2B6Bj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A67AC:				; CODE XREF: sub_A3C30+2B62j
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_A6794

loc_A67BD:				; CODE XREF: sub_A3C30+2B6Dj
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte_495FC, 0
		jnz	short loc_A67D4
		jmp	loc_A6EBE
; ���������������������������������������������������������������������������

loc_A67D4:				; CODE XREF: sub_A3C30+2B9Fj
		cmp	byte ptr [bp+var_15C+1], 0
		jz	short loc_A67FC
		cmp	[bp+var_160], 0
		jz	short loc_A67FC
		push	0
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A67FC:				; CODE XREF: sub_A3C30+2BA9j
					; sub_A3C30+2BB1j
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15C+2],	0
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_A684A
		cmp	[bp+var_148], 0
		jz	short loc_A684A
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A684A:				; CODE XREF: sub_A3C30+2BF7j
					; sub_A3C30+2BFFj
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_A6889
		cmp	[bp+var_140+2],	0
		jz	short loc_A6889
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6889:				; CODE XREF: sub_A3C30+2C36j
					; sub_A3C30+2C3Ej
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A68E4
		cmp	[bp+var_11E], 0
		jz	short loc_A68E4
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A68E4:				; CODE XREF: sub_A3C30+2C91j
					; sub_A3C30+2C99j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A693F
		cmp	[bp+var_100], 0
		jz	short loc_A693F
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A693F:				; CODE XREF: sub_A3C30+2CECj
					; sub_A3C30+2CF4j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A697E
		cmp	[bp+var_F6], 0
		jz	short loc_A697E
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A697E:				; CODE XREF: sub_A3C30+2D2Bj
					; sub_A3C30+2D33j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A69BD
		cmp	[bp+var_EC], 0
		jz	short loc_A69BD
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A69BD:				; CODE XREF: sub_A3C30+2D6Aj
					; sub_A3C30+2D72j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A69FC
		cmp	[bp+var_E2], 0
		jz	short loc_A69FC
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A69FC:				; CODE XREF: sub_A3C30+2DA9j
					; sub_A3C30+2DB1j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A6A3B
		cmp	[bp+var_D8], 0
		jz	short loc_A6A3B
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6A3B:				; CODE XREF: sub_A3C30+2DE8j
					; sub_A3C30+2DF0j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A6A7A
		cmp	[bp+var_CE], 0
		jz	short loc_A6A7A
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6A7A:				; CODE XREF: sub_A3C30+2E27j
					; sub_A3C30+2E2Fj
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A6AB9
		cmp	[bp+var_C4], 0
		jz	short loc_A6AB9
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6AB9:				; CODE XREF: sub_A3C30+2E66j
					; sub_A3C30+2E6Ej
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A6AF8
		cmp	[bp+var_BA], 0
		jz	short loc_A6AF8
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6AF8:				; CODE XREF: sub_A3C30+2EA5j
					; sub_A3C30+2EADj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A6B37
		cmp	[bp+var_B0], 0
		jz	short loc_A6B37
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6B37:				; CODE XREF: sub_A3C30+2EE4j
					; sub_A3C30+2EECj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A6B85
		cmp	[bp+var_A0], 0
		jz	short loc_A6B85
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6B85:				; CODE XREF: sub_A3C30+2F32j
					; sub_A3C30+2F3Aj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A6BD3
		cmp	[bp+var_90], 0
		jz	short loc_A6BD3
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6BD3:				; CODE XREF: sub_A3C30+2F80j
					; sub_A3C30+2F88j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A6C1D
		cmp	[bp+var_80], 0
		jz	short loc_A6C1D
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6C1D:				; CODE XREF: sub_A3C30+2FCDj
					; sub_A3C30+2FD4j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A6C63
		cmp	[bp+var_70], 0
		jz	short loc_A6C63
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6C63:				; CODE XREF: sub_A3C30+3013j
					; sub_A3C30+301Aj
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A6CA9
		cmp	[bp+var_60], 0
		jz	short loc_A6CA9
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6CA9:				; CODE XREF: sub_A3C30+3059j
					; sub_A3C30+3060j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A6CEF
		cmp	[bp+var_50], 0
		jz	short loc_A6CEF
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6CEF:				; CODE XREF: sub_A3C30+309Fj
					; sub_A3C30+30A6j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A6D27
		cmp	[bp+var_46], 0
		jz	short loc_A6D27
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6D27:				; CODE XREF: sub_A3C30+30D7j
					; sub_A3C30+30DEj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A6D5F
		cmp	[bp+var_3C], 0
		jz	short loc_A6D5F
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6D5F:				; CODE XREF: sub_A3C30+310Fj
					; sub_A3C30+3116j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A6DAE
		cmp	[bp+var_BE2], 0
		jz	short loc_A6DAE
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6DAE:				; CODE XREF: sub_A3C30+315Bj
					; sub_A3C30+3163j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A6DFA
		cmp	[bp+var_3C8], 0
		jz	short loc_A6DFA
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6DFA:				; CODE XREF: sub_A3C30+31A7j
					; sub_A3C30+31AFj
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A6E44
		cmp	[bp+var_30], 0
		jz	short loc_A6E44
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6E44:				; CODE XREF: sub_A3C30+31F4j
					; sub_A3C30+31FBj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A6EBE:				; CODE XREF: sub_A3C30+2BA1j
		xor	di, di
		jmp	short loc_A6ED0
; ���������������������������������������������������������������������������

loc_A6EC2:				; CODE XREF: sub_A3C30+32A3j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_A6ED0:				; CODE XREF: sub_A3C30+3290j
		cmp	di, 4
		jl	short loc_A6EC2
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166], 2
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_16A]
		push	ax
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_A6F2B
; ���������������������������������������������������������������������������

loc_A6F1D:				; CODE XREF: sub_A3C30+32FEj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_A6F2B:				; CODE XREF: sub_A3C30+32EBj
		cmp	di, 4
		jl	short loc_A6F1D
		push	0FFFFh
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_A6F59
; ���������������������������������������������������������������������������

loc_A6F41:				; CODE XREF: sub_A3C30+3338j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A6F4C
		jmp	short loc_A6F6A
; ���������������������������������������������������������������������������

loc_A6F4C:				; CODE XREF: sub_A3C30+3318j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A6F59:				; CODE XREF: sub_A3C30+330Fj
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_A6F41

loc_A6F6A:				; CODE XREF: sub_A3C30+331Aj
		xor	di, di
		jmp	short loc_A6F7C
; ���������������������������������������������������������������������������

loc_A6F6E:				; CODE XREF: sub_A3C30+334Fj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_A6F7C:				; CODE XREF: sub_A3C30+333Cj
		cmp	di, 4
		jl	short loc_A6F6E
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_166+1], 0
		jz	short loc_A6FB6
		cmp	[bp+var_16A], 0
		jz	short loc_A6FB6
		push	0
		mov	al, byte ptr [bp+var_166]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6FB6:				; CODE XREF: sub_A3C30+3363j
					; sub_A3C30+336Bj
		mov	[bp+var_16A], 0
		mov	byte ptr [bp+var_166+1], 0
		mov	[bp+var_164], 0
		cmp	byte ptr [bp+var_15C+1], 0
		jz	short loc_A6FF5
		cmp	[bp+var_160], 0
		jz	short loc_A6FF5
		push	0
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A6FF5:				; CODE XREF: sub_A3C30+33A2j
					; sub_A3C30+33AAj
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15C+2],	0
		jmp	loc_A78F6
; ���������������������������������������������������������������������������

loc_A700F:				; CODE XREF: sub_A3C30+2AE8j
		push	0
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0FEh ; '�'
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_E], 42h	; 'B'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A7118
; ���������������������������������������������������������������������������

loc_A704F:				; CODE XREF: sub_A3C30+3505j
		mov	di, [bp+var_C6B]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_A7074
		mov	ax, [bp+var_12]
		shl	ax, 1
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A7074:				; CODE XREF: sub_A3C30+342Aj
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A70BE
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A70BE:				; CODE XREF: sub_A3C30+344Aj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A710B
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A7138
; ���������������������������������������������������������������������������

loc_A710B:				; CODE XREF: sub_A3C30+3495j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A7118:				; CODE XREF: sub_A3C30+341Cj
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_A7128
		cmp	[bp+var_C69], 0
		jz	short loc_A712D

loc_A7128:				; CODE XREF: sub_A3C30+34EFj
		mov	ax, 1
		jmp	short loc_A712F
; ���������������������������������������������������������������������������

loc_A712D:				; CODE XREF: sub_A3C30+34F6j
		xor	ax, ax

loc_A712F:				; CODE XREF: sub_A3C30+34FBj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A7138
		jmp	loc_A704F
; ���������������������������������������������������������������������������

loc_A7138:				; CODE XREF: sub_A3C30+34D9j
					; sub_A3C30+3503j
		cmp	byte_495FC, 0
		jnz	short loc_A7142
		jmp	loc_A77ED
; ���������������������������������������������������������������������������

loc_A7142:				; CODE XREF: sub_A3C30+350Dj
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_A7179
		cmp	[bp+var_148], 0
		jz	short loc_A7179
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7179:				; CODE XREF: sub_A3C30+3526j
					; sub_A3C30+352Ej
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_A71B8
		cmp	[bp+var_140+2],	0
		jz	short loc_A71B8
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A71B8:				; CODE XREF: sub_A3C30+3565j
					; sub_A3C30+356Dj
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A7213
		cmp	[bp+var_11E], 0
		jz	short loc_A7213
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7213:				; CODE XREF: sub_A3C30+35C0j
					; sub_A3C30+35C8j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A726E
		cmp	[bp+var_100], 0
		jz	short loc_A726E
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A726E:				; CODE XREF: sub_A3C30+361Bj
					; sub_A3C30+3623j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A72AD
		cmp	[bp+var_F6], 0
		jz	short loc_A72AD
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A72AD:				; CODE XREF: sub_A3C30+365Aj
					; sub_A3C30+3662j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A72EC
		cmp	[bp+var_EC], 0
		jz	short loc_A72EC
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A72EC:				; CODE XREF: sub_A3C30+3699j
					; sub_A3C30+36A1j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A732B
		cmp	[bp+var_E2], 0
		jz	short loc_A732B
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A732B:				; CODE XREF: sub_A3C30+36D8j
					; sub_A3C30+36E0j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A736A
		cmp	[bp+var_D8], 0
		jz	short loc_A736A
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A736A:				; CODE XREF: sub_A3C30+3717j
					; sub_A3C30+371Fj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A73A9
		cmp	[bp+var_CE], 0
		jz	short loc_A73A9
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A73A9:				; CODE XREF: sub_A3C30+3756j
					; sub_A3C30+375Ej
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A73E8
		cmp	[bp+var_C4], 0
		jz	short loc_A73E8
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A73E8:				; CODE XREF: sub_A3C30+3795j
					; sub_A3C30+379Dj
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A7427
		cmp	[bp+var_BA], 0
		jz	short loc_A7427
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7427:				; CODE XREF: sub_A3C30+37D4j
					; sub_A3C30+37DCj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A7466
		cmp	[bp+var_B0], 0
		jz	short loc_A7466
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7466:				; CODE XREF: sub_A3C30+3813j
					; sub_A3C30+381Bj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A74B4
		cmp	[bp+var_A0], 0
		jz	short loc_A74B4
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A74B4:				; CODE XREF: sub_A3C30+3861j
					; sub_A3C30+3869j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A7502
		cmp	[bp+var_90], 0
		jz	short loc_A7502
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7502:				; CODE XREF: sub_A3C30+38AFj
					; sub_A3C30+38B7j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A754C
		cmp	[bp+var_80], 0
		jz	short loc_A754C
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A754C:				; CODE XREF: sub_A3C30+38FCj
					; sub_A3C30+3903j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A7592
		cmp	[bp+var_70], 0
		jz	short loc_A7592
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7592:				; CODE XREF: sub_A3C30+3942j
					; sub_A3C30+3949j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A75D8
		cmp	[bp+var_60], 0
		jz	short loc_A75D8
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A75D8:				; CODE XREF: sub_A3C30+3988j
					; sub_A3C30+398Fj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A761E
		cmp	[bp+var_50], 0
		jz	short loc_A761E
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A761E:				; CODE XREF: sub_A3C30+39CEj
					; sub_A3C30+39D5j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A7656
		cmp	[bp+var_46], 0
		jz	short loc_A7656
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7656:				; CODE XREF: sub_A3C30+3A06j
					; sub_A3C30+3A0Dj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A768E
		cmp	[bp+var_3C], 0
		jz	short loc_A768E
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A768E:				; CODE XREF: sub_A3C30+3A3Ej
					; sub_A3C30+3A45j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A76DD
		cmp	[bp+var_BE2], 0
		jz	short loc_A76DD
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A76DD:				; CODE XREF: sub_A3C30+3A8Aj
					; sub_A3C30+3A92j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A7729
		cmp	[bp+var_3C8], 0
		jz	short loc_A7729
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7729:				; CODE XREF: sub_A3C30+3AD6j
					; sub_A3C30+3ADEj
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A7773
		cmp	[bp+var_30], 0
		jz	short loc_A7773
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7773:				; CODE XREF: sub_A3C30+3B23j
					; sub_A3C30+3B2Aj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A77ED:				; CODE XREF: sub_A3C30+350Fj
		mov	[bp+var_E], 46h	; 'F'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A78D6
; ���������������������������������������������������������������������������

loc_A780E:				; CODE XREF: sub_A3C30+3CC3j
		mov	di, [bp+var_C6B]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_A7832
		mov	ax, [bp+var_12]
		shl	ax, 2
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A7832:				; CODE XREF: sub_A3C30+3BE7j
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_A787C
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A787C:				; CODE XREF: sub_A3C30+3C08j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A78C9
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A78F6
; ���������������������������������������������������������������������������

loc_A78C9:				; CODE XREF: sub_A3C30+3C53j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A78D6:				; CODE XREF: sub_A3C30+3BDBj
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_A78E6
		cmp	[bp+var_C69], 0
		jz	short loc_A78EB

loc_A78E6:				; CODE XREF: sub_A3C30+3CADj
		mov	ax, 1
		jmp	short loc_A78ED
; ���������������������������������������������������������������������������

loc_A78EB:				; CODE XREF: sub_A3C30+3CB4j
		xor	ax, ax

loc_A78ED:				; CODE XREF: sub_A3C30+3CB9j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A78F6
		jmp	loc_A780E
; ���������������������������������������������������������������������������

loc_A78F6:				; CODE XREF: sub_A3C30+33DCj
					; sub_A3C30+3C97j ...
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_A792D
		cmp	[bp+var_148], 0
		jz	short loc_A792D
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A792D:				; CODE XREF: sub_A3C30+3CDAj
					; sub_A3C30+3CE2j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_A796C
		cmp	[bp+var_140+2],	0
		jz	short loc_A796C
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A796C:				; CODE XREF: sub_A3C30+3D19j
					; sub_A3C30+3D21j
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		cmp	byte_495FC, 0
		jnz	short loc_A798D
		jmp	loc_A7FAB
; ���������������������������������������������������������������������������

loc_A798D:				; CODE XREF: sub_A3C30+3D58j
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A79D1
		cmp	[bp+var_11E], 0
		jz	short loc_A79D1
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A79D1:				; CODE XREF: sub_A3C30+3D7Ej
					; sub_A3C30+3D86j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A7A2C
		cmp	[bp+var_100], 0
		jz	short loc_A7A2C
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7A2C:				; CODE XREF: sub_A3C30+3DD9j
					; sub_A3C30+3DE1j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A7A6B
		cmp	[bp+var_F6], 0
		jz	short loc_A7A6B
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7A6B:				; CODE XREF: sub_A3C30+3E18j
					; sub_A3C30+3E20j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A7AAA
		cmp	[bp+var_EC], 0
		jz	short loc_A7AAA
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7AAA:				; CODE XREF: sub_A3C30+3E57j
					; sub_A3C30+3E5Fj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A7AE9
		cmp	[bp+var_E2], 0
		jz	short loc_A7AE9
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7AE9:				; CODE XREF: sub_A3C30+3E96j
					; sub_A3C30+3E9Ej
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A7B28
		cmp	[bp+var_D8], 0
		jz	short loc_A7B28
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7B28:				; CODE XREF: sub_A3C30+3ED5j
					; sub_A3C30+3EDDj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A7B67
		cmp	[bp+var_CE], 0
		jz	short loc_A7B67
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7B67:				; CODE XREF: sub_A3C30+3F14j
					; sub_A3C30+3F1Cj
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A7BA6
		cmp	[bp+var_C4], 0
		jz	short loc_A7BA6
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7BA6:				; CODE XREF: sub_A3C30+3F53j
					; sub_A3C30+3F5Bj
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A7BE5
		cmp	[bp+var_BA], 0
		jz	short loc_A7BE5
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7BE5:				; CODE XREF: sub_A3C30+3F92j
					; sub_A3C30+3F9Aj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A7C24
		cmp	[bp+var_B0], 0
		jz	short loc_A7C24
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7C24:				; CODE XREF: sub_A3C30+3FD1j
					; sub_A3C30+3FD9j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A7C72
		cmp	[bp+var_A0], 0
		jz	short loc_A7C72
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7C72:				; CODE XREF: sub_A3C30+401Fj
					; sub_A3C30+4027j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A7CC0
		cmp	[bp+var_90], 0
		jz	short loc_A7CC0
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7CC0:				; CODE XREF: sub_A3C30+406Dj
					; sub_A3C30+4075j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A7D0A
		cmp	[bp+var_80], 0
		jz	short loc_A7D0A
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7D0A:				; CODE XREF: sub_A3C30+40BAj
					; sub_A3C30+40C1j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A7D50
		cmp	[bp+var_70], 0
		jz	short loc_A7D50
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7D50:				; CODE XREF: sub_A3C30+4100j
					; sub_A3C30+4107j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A7D96
		cmp	[bp+var_60], 0
		jz	short loc_A7D96
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7D96:				; CODE XREF: sub_A3C30+4146j
					; sub_A3C30+414Dj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A7DDC
		cmp	[bp+var_50], 0
		jz	short loc_A7DDC
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7DDC:				; CODE XREF: sub_A3C30+418Cj
					; sub_A3C30+4193j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A7E14
		cmp	[bp+var_46], 0
		jz	short loc_A7E14
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7E14:				; CODE XREF: sub_A3C30+41C4j
					; sub_A3C30+41CBj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A7E4C
		cmp	[bp+var_3C], 0
		jz	short loc_A7E4C
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7E4C:				; CODE XREF: sub_A3C30+41FCj
					; sub_A3C30+4203j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A7E9B
		cmp	[bp+var_BE2], 0
		jz	short loc_A7E9B
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7E9B:				; CODE XREF: sub_A3C30+4248j
					; sub_A3C30+4250j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A7EE7
		cmp	[bp+var_3C8], 0
		jz	short loc_A7EE7
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7EE7:				; CODE XREF: sub_A3C30+4294j
					; sub_A3C30+429Cj
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A7F31
		cmp	[bp+var_30], 0
		jz	short loc_A7F31
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A7F31:				; CODE XREF: sub_A3C30+42E1j
					; sub_A3C30+42E8j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A7FAB:				; CODE XREF: sub_A3C30+3D5Aj
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_136], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	di, ax
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_136]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_A808F
		jmp	loc_A8888
; ���������������������������������������������������������������������������

loc_A808F:				; CODE XREF: sub_A3C30+445Aj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C], 2
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		push	2
		lea	ax, [bp+var_140]
		push	ax
		push	3
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_140]
		push	ax
		push	di
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_144+2], 0
		jmp	loc_A8195
; ���������������������������������������������������������������������������

loc_A80E7:				; CODE XREF: sub_A3C30+4572j
		cmp	word ptr [bp+var_144+2], 5
		jnz	short loc_A80F9
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A80F9:				; CODE XREF: sub_A3C30+44BCj
		cmp	word ptr [bp+var_144+2], 6
		jnz	short loc_A810B
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A810B:				; CODE XREF: sub_A3C30+44CEj
		cmp	word ptr [bp+var_144+2], 9
		jnz	short loc_A811D
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A811D:				; CODE XREF: sub_A3C30+44E0j
		cmp	word ptr [bp+var_144+2], 0Ah
		jnz	short loc_A812F
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A812F:				; CODE XREF: sub_A3C30+44F2j
		cmp	word ptr [bp+var_144+2], 0Fh
		jnz	short loc_A8141
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A8141:				; CODE XREF: sub_A3C30+4504j
		cmp	word ptr [bp+var_144+2], 10h
		jnz	short loc_A8153
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A8153:				; CODE XREF: sub_A3C30+4516j
		cmp	word ptr [bp+var_144+2], 13h
		jnz	short loc_A8165
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A8165:				; CODE XREF: sub_A3C30+4528j
		mov	ax, word ptr [bp+var_144+2]
		inc	word ptr [bp+var_144+2]
		cmp	ax, 14h
		jnz	short loc_A817D
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A817D:				; CODE XREF: sub_A3C30+4540j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A8188
		jmp	short loc_A81A5
; ���������������������������������������������������������������������������

loc_A8188:				; CODE XREF: sub_A3C30+4554j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A8195:				; CODE XREF: sub_A3C30+44B4j
		push	di
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_A81A5
		jmp	loc_A80E7
; ���������������������������������������������������������������������������

loc_A81A5:				; CODE XREF: sub_A3C30+4556j
					; sub_A3C30+4570j
		cmp	byte_495FC, 0
		jnz	short loc_A81AF
		jmp	loc_A881B
; ���������������������������������������������������������������������������

loc_A81AF:				; CODE XREF: sub_A3C30+457Aj
		cmp	byte ptr [bp+var_13C+1], 0
		jz	short loc_A81D7
		cmp	[bp+var_140], 0
		jz	short loc_A81D7
		push	0
		mov	al, byte ptr [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A81D7:				; CODE XREF: sub_A3C30+4584j
					; sub_A3C30+458Cj
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A8241
		cmp	[bp+var_11E], 0
		jz	short loc_A8241
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8241:				; CODE XREF: sub_A3C30+45EEj
					; sub_A3C30+45F6j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A829C
		cmp	[bp+var_100], 0
		jz	short loc_A829C
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A829C:				; CODE XREF: sub_A3C30+4649j
					; sub_A3C30+4651j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A82DB
		cmp	[bp+var_F6], 0
		jz	short loc_A82DB
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A82DB:				; CODE XREF: sub_A3C30+4688j
					; sub_A3C30+4690j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A831A
		cmp	[bp+var_EC], 0
		jz	short loc_A831A
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A831A:				; CODE XREF: sub_A3C30+46C7j
					; sub_A3C30+46CFj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A8359
		cmp	[bp+var_E2], 0
		jz	short loc_A8359
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8359:				; CODE XREF: sub_A3C30+4706j
					; sub_A3C30+470Ej
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A8398
		cmp	[bp+var_D8], 0
		jz	short loc_A8398
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8398:				; CODE XREF: sub_A3C30+4745j
					; sub_A3C30+474Dj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A83D7
		cmp	[bp+var_CE], 0
		jz	short loc_A83D7
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A83D7:				; CODE XREF: sub_A3C30+4784j
					; sub_A3C30+478Cj
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A8416
		cmp	[bp+var_C4], 0
		jz	short loc_A8416
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8416:				; CODE XREF: sub_A3C30+47C3j
					; sub_A3C30+47CBj
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A8455
		cmp	[bp+var_BA], 0
		jz	short loc_A8455
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8455:				; CODE XREF: sub_A3C30+4802j
					; sub_A3C30+480Aj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A8494
		cmp	[bp+var_B0], 0
		jz	short loc_A8494
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8494:				; CODE XREF: sub_A3C30+4841j
					; sub_A3C30+4849j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A84E2
		cmp	[bp+var_A0], 0
		jz	short loc_A84E2
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A84E2:				; CODE XREF: sub_A3C30+488Fj
					; sub_A3C30+4897j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A8530
		cmp	[bp+var_90], 0
		jz	short loc_A8530
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8530:				; CODE XREF: sub_A3C30+48DDj
					; sub_A3C30+48E5j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A857A
		cmp	[bp+var_80], 0
		jz	short loc_A857A
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A857A:				; CODE XREF: sub_A3C30+492Aj
					; sub_A3C30+4931j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A85C0
		cmp	[bp+var_70], 0
		jz	short loc_A85C0
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A85C0:				; CODE XREF: sub_A3C30+4970j
					; sub_A3C30+4977j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A8606
		cmp	[bp+var_60], 0
		jz	short loc_A8606
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8606:				; CODE XREF: sub_A3C30+49B6j
					; sub_A3C30+49BDj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A864C
		cmp	[bp+var_50], 0
		jz	short loc_A864C
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A864C:				; CODE XREF: sub_A3C30+49FCj
					; sub_A3C30+4A03j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A8684
		cmp	[bp+var_46], 0
		jz	short loc_A8684
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8684:				; CODE XREF: sub_A3C30+4A34j
					; sub_A3C30+4A3Bj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A86BC
		cmp	[bp+var_3C], 0
		jz	short loc_A86BC
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A86BC:				; CODE XREF: sub_A3C30+4A6Cj
					; sub_A3C30+4A73j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A870B
		cmp	[bp+var_BE2], 0
		jz	short loc_A870B
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A870B:				; CODE XREF: sub_A3C30+4AB8j
					; sub_A3C30+4AC0j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A8757
		cmp	[bp+var_3C8], 0
		jz	short loc_A8757
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8757:				; CODE XREF: sub_A3C30+4B04j
					; sub_A3C30+4B0Cj
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A87A1
		cmp	[bp+var_30], 0
		jz	short loc_A87A1
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A87A1:				; CODE XREF: sub_A3C30+4B51j
					; sub_A3C30+4B58j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A881B:				; CODE XREF: sub_A3C30+457Cj
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp+var_144+2], 0
		jmp	short loc_A883F
; ���������������������������������������������������������������������������

loc_A882E:				; CODE XREF: sub_A3C30+4C14j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_144+2]

loc_A883F:				; CODE XREF: sub_A3C30+4BFCj
		cmp	word ptr [bp+var_144+2], 8
		jl	short loc_A882E
		cmp	byte ptr [bp+var_13C+1], 0
		jz	short loc_A886E
		cmp	[bp+var_140], 0
		jz	short loc_A886E
		push	0
		mov	al, byte ptr [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A886E:				; CODE XREF: sub_A3C30+4C1Bj
					; sub_A3C30+4C23j
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		jmp	loc_A9995
; ���������������������������������������������������������������������������

loc_A8888:				; CODE XREF: sub_A3C30+445Cj
		push	0FEh ; '�'
		push	[bp+var_C18]
		mov	bx, [bp+var_C18]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 30h	; '0'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A89FF
; ���������������������������������������������������������������������������

loc_A88BC:				; CODE XREF: sub_A3C30+4DECj
		mov	ax, [bp+var_C6B]
		mov	word ptr [bp+var_13A+2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A88EA
		mov	ax, [bp+var_12]
		mov	dx, 5
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A88EA:				; CODE XREF: sub_A3C30+4C9Dj
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A8901
		push	26A7h
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_A8901:				; CODE XREF: sub_A3C30+4CC3j
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A8917
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A8917:				; CODE XREF: sub_A3C30+4CDAj
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A892D
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A892D:				; CODE XREF: sub_A3C30+4CF0j
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A8943
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A8943:				; CODE XREF: sub_A3C30+4D06j
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A8959
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A8959:				; CODE XREF: sub_A3C30+4D1Cj
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A89A5
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A89A5:				; CODE XREF: sub_A3C30+4D31j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A89F2
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A8A1F
; ���������������������������������������������������������������������������

loc_A89F2:				; CODE XREF: sub_A3C30+4D7Cj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A89FF:				; CODE XREF: sub_A3C30+4C89j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_A8A0F
		cmp	[bp+var_C69], 0
		jz	short loc_A8A14

loc_A8A0F:				; CODE XREF: sub_A3C30+4DD6j
		mov	ax, 1
		jmp	short loc_A8A16
; ���������������������������������������������������������������������������

loc_A8A14:				; CODE XREF: sub_A3C30+4DDDj
		xor	ax, ax

loc_A8A16:				; CODE XREF: sub_A3C30+4DE2j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A8A1F
		jmp	loc_A88BC
; ���������������������������������������������������������������������������

loc_A8A1F:				; CODE XREF: sub_A3C30+4DC0j
					; sub_A3C30+4DEAj
		cmp	byte_495FC, 0
		jnz	short loc_A8A29
		jmp	loc_A9056
; ���������������������������������������������������������������������������

loc_A8A29:				; CODE XREF: sub_A3C30+4DF4j
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A8A7C
		cmp	[bp+var_11E], 0
		jz	short loc_A8A7C
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8A7C:				; CODE XREF: sub_A3C30+4E29j
					; sub_A3C30+4E31j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A8AD7
		cmp	[bp+var_100], 0
		jz	short loc_A8AD7
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8AD7:				; CODE XREF: sub_A3C30+4E84j
					; sub_A3C30+4E8Cj
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A8B16
		cmp	[bp+var_F6], 0
		jz	short loc_A8B16
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8B16:				; CODE XREF: sub_A3C30+4EC3j
					; sub_A3C30+4ECBj
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A8B55
		cmp	[bp+var_EC], 0
		jz	short loc_A8B55
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8B55:				; CODE XREF: sub_A3C30+4F02j
					; sub_A3C30+4F0Aj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A8B94
		cmp	[bp+var_E2], 0
		jz	short loc_A8B94
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8B94:				; CODE XREF: sub_A3C30+4F41j
					; sub_A3C30+4F49j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A8BD3
		cmp	[bp+var_D8], 0
		jz	short loc_A8BD3
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8BD3:				; CODE XREF: sub_A3C30+4F80j
					; sub_A3C30+4F88j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A8C12
		cmp	[bp+var_CE], 0
		jz	short loc_A8C12
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8C12:				; CODE XREF: sub_A3C30+4FBFj
					; sub_A3C30+4FC7j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A8C51
		cmp	[bp+var_C4], 0
		jz	short loc_A8C51
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8C51:				; CODE XREF: sub_A3C30+4FFEj
					; sub_A3C30+5006j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A8C90
		cmp	[bp+var_BA], 0
		jz	short loc_A8C90
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8C90:				; CODE XREF: sub_A3C30+503Dj
					; sub_A3C30+5045j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A8CCF
		cmp	[bp+var_B0], 0
		jz	short loc_A8CCF
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8CCF:				; CODE XREF: sub_A3C30+507Cj
					; sub_A3C30+5084j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A8D1D
		cmp	[bp+var_A0], 0
		jz	short loc_A8D1D
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8D1D:				; CODE XREF: sub_A3C30+50CAj
					; sub_A3C30+50D2j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A8D6B
		cmp	[bp+var_90], 0
		jz	short loc_A8D6B
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8D6B:				; CODE XREF: sub_A3C30+5118j
					; sub_A3C30+5120j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A8DB5
		cmp	[bp+var_80], 0
		jz	short loc_A8DB5
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8DB5:				; CODE XREF: sub_A3C30+5165j
					; sub_A3C30+516Cj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A8DFB
		cmp	[bp+var_70], 0
		jz	short loc_A8DFB
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8DFB:				; CODE XREF: sub_A3C30+51ABj
					; sub_A3C30+51B2j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A8E41
		cmp	[bp+var_60], 0
		jz	short loc_A8E41
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8E41:				; CODE XREF: sub_A3C30+51F1j
					; sub_A3C30+51F8j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A8E87
		cmp	[bp+var_50], 0
		jz	short loc_A8E87
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8E87:				; CODE XREF: sub_A3C30+5237j
					; sub_A3C30+523Ej
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A8EBF
		cmp	[bp+var_46], 0
		jz	short loc_A8EBF
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8EBF:				; CODE XREF: sub_A3C30+526Fj
					; sub_A3C30+5276j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A8EF7
		cmp	[bp+var_3C], 0
		jz	short loc_A8EF7
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8EF7:				; CODE XREF: sub_A3C30+52A7j
					; sub_A3C30+52AEj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A8F46
		cmp	[bp+var_BE2], 0
		jz	short loc_A8F46
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8F46:				; CODE XREF: sub_A3C30+52F3j
					; sub_A3C30+52FBj
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A8F92
		cmp	[bp+var_3C8], 0
		jz	short loc_A8F92
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8F92:				; CODE XREF: sub_A3C30+533Fj
					; sub_A3C30+5347j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A8FDC
		cmp	[bp+var_30], 0
		jz	short loc_A8FDC
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A8FDC:				; CODE XREF: sub_A3C30+538Cj
					; sub_A3C30+5393j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A9056:				; CODE XREF: sub_A3C30+4DF6j
		mov	[bp+var_E], 2Ch	; ','
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A91BA
; ���������������������������������������������������������������������������

loc_A9077:				; CODE XREF: sub_A3C30+55A7j
		mov	ax, [bp+var_C6B]
		mov	word ptr [bp+var_13A+2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A90A5
		mov	ax, [bp+var_12]
		mov	dx, 6
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A90A5:				; CODE XREF: sub_A3C30+5458j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A90BC
		push	26BAh
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_A90BC:				; CODE XREF: sub_A3C30+547Ej
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A90D2
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A90D2:				; CODE XREF: sub_A3C30+5495j
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A90E8
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A90E8:				; CODE XREF: sub_A3C30+54ABj
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A90FE
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A90FE:				; CODE XREF: sub_A3C30+54C1j
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A9114
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A9114:				; CODE XREF: sub_A3C30+54D7j
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A9160
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A9160:				; CODE XREF: sub_A3C30+54ECj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A91AD
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A91DA
; ���������������������������������������������������������������������������

loc_A91AD:				; CODE XREF: sub_A3C30+5537j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A91BA:				; CODE XREF: sub_A3C30+5444j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_A91CA
		cmp	[bp+var_C69], 0
		jz	short loc_A91CF

loc_A91CA:				; CODE XREF: sub_A3C30+5591j
		mov	ax, 1
		jmp	short loc_A91D1
; ���������������������������������������������������������������������������

loc_A91CF:				; CODE XREF: sub_A3C30+5598j
		xor	ax, ax

loc_A91D1:				; CODE XREF: sub_A3C30+559Dj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A91DA
		jmp	loc_A9077
; ���������������������������������������������������������������������������

loc_A91DA:				; CODE XREF: sub_A3C30+557Bj
					; sub_A3C30+55A5j
		cmp	byte_495FC, 0
		jnz	short loc_A91E4
		jmp	loc_A9811
; ���������������������������������������������������������������������������

loc_A91E4:				; CODE XREF: sub_A3C30+55AFj
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A9237
		cmp	[bp+var_11E], 0
		jz	short loc_A9237
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9237:				; CODE XREF: sub_A3C30+55E4j
					; sub_A3C30+55ECj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A9292
		cmp	[bp+var_100], 0
		jz	short loc_A9292
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9292:				; CODE XREF: sub_A3C30+563Fj
					; sub_A3C30+5647j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A92D1
		cmp	[bp+var_F6], 0
		jz	short loc_A92D1
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A92D1:				; CODE XREF: sub_A3C30+567Ej
					; sub_A3C30+5686j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A9310
		cmp	[bp+var_EC], 0
		jz	short loc_A9310
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9310:				; CODE XREF: sub_A3C30+56BDj
					; sub_A3C30+56C5j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A934F
		cmp	[bp+var_E2], 0
		jz	short loc_A934F
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A934F:				; CODE XREF: sub_A3C30+56FCj
					; sub_A3C30+5704j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A938E
		cmp	[bp+var_D8], 0
		jz	short loc_A938E
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A938E:				; CODE XREF: sub_A3C30+573Bj
					; sub_A3C30+5743j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A93CD
		cmp	[bp+var_CE], 0
		jz	short loc_A93CD
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A93CD:				; CODE XREF: sub_A3C30+577Aj
					; sub_A3C30+5782j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A940C
		cmp	[bp+var_C4], 0
		jz	short loc_A940C
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A940C:				; CODE XREF: sub_A3C30+57B9j
					; sub_A3C30+57C1j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A944B
		cmp	[bp+var_BA], 0
		jz	short loc_A944B
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A944B:				; CODE XREF: sub_A3C30+57F8j
					; sub_A3C30+5800j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A948A
		cmp	[bp+var_B0], 0
		jz	short loc_A948A
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A948A:				; CODE XREF: sub_A3C30+5837j
					; sub_A3C30+583Fj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A94D8
		cmp	[bp+var_A0], 0
		jz	short loc_A94D8
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A94D8:				; CODE XREF: sub_A3C30+5885j
					; sub_A3C30+588Dj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A9526
		cmp	[bp+var_90], 0
		jz	short loc_A9526
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9526:				; CODE XREF: sub_A3C30+58D3j
					; sub_A3C30+58DBj
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A9570
		cmp	[bp+var_80], 0
		jz	short loc_A9570
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9570:				; CODE XREF: sub_A3C30+5920j
					; sub_A3C30+5927j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A95B6
		cmp	[bp+var_70], 0
		jz	short loc_A95B6
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A95B6:				; CODE XREF: sub_A3C30+5966j
					; sub_A3C30+596Dj
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A95FC
		cmp	[bp+var_60], 0
		jz	short loc_A95FC
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A95FC:				; CODE XREF: sub_A3C30+59ACj
					; sub_A3C30+59B3j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A9642
		cmp	[bp+var_50], 0
		jz	short loc_A9642
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9642:				; CODE XREF: sub_A3C30+59F2j
					; sub_A3C30+59F9j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A967A
		cmp	[bp+var_46], 0
		jz	short loc_A967A
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A967A:				; CODE XREF: sub_A3C30+5A2Aj
					; sub_A3C30+5A31j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A96B2
		cmp	[bp+var_3C], 0
		jz	short loc_A96B2
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A96B2:				; CODE XREF: sub_A3C30+5A62j
					; sub_A3C30+5A69j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A9701
		cmp	[bp+var_BE2], 0
		jz	short loc_A9701
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9701:				; CODE XREF: sub_A3C30+5AAEj
					; sub_A3C30+5AB6j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A974D
		cmp	[bp+var_3C8], 0
		jz	short loc_A974D
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A974D:				; CODE XREF: sub_A3C30+5AFAj
					; sub_A3C30+5B02j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A9797
		cmp	[bp+var_30], 0
		jz	short loc_A9797
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9797:				; CODE XREF: sub_A3C30+5B47j
					; sub_A3C30+5B4Ej
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A9811:				; CODE XREF: sub_A3C30+55B1j
		mov	[bp+var_E], 26h	; '&'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_A9975
; ���������������������������������������������������������������������������

loc_A9832:				; CODE XREF: sub_A3C30+5D62j
		mov	ax, [bp+var_C6B]
		mov	word ptr [bp+var_13A+2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A9860
		mov	ax, [bp+var_12]
		mov	dx, 7
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_A9860:				; CODE XREF: sub_A3C30+5C13j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A9877
		push	26CAh
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_A9877:				; CODE XREF: sub_A3C30+5C39j
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A988D
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A988D:				; CODE XREF: sub_A3C30+5C50j
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A98A3
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A98A3:				; CODE XREF: sub_A3C30+5C66j
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A98B9
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A98B9:				; CODE XREF: sub_A3C30+5C7Cj
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A98CF
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_A98CF:				; CODE XREF: sub_A3C30+5C92j
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_A991B
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_A991B:				; CODE XREF: sub_A3C30+5CA7j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_A9968
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_A9995
; ���������������������������������������������������������������������������

loc_A9968:				; CODE XREF: sub_A3C30+5CF2j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_A9975:				; CODE XREF: sub_A3C30+5BFFj
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_A9985
		cmp	[bp+var_C69], 0
		jz	short loc_A998A

loc_A9985:				; CODE XREF: sub_A3C30+5D4Cj
		mov	ax, 1
		jmp	short loc_A998C
; ���������������������������������������������������������������������������

loc_A998A:				; CODE XREF: sub_A3C30+5D53j
		xor	ax, ax

loc_A998C:				; CODE XREF: sub_A3C30+5D58j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A9995
		jmp	loc_A9832
; ���������������������������������������������������������������������������

loc_A9995:				; CODE XREF: sub_A3C30+4C55j
					; sub_A3C30+5D36j ...
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_A99AE
		jmp	loc_A9FCC
; ���������������������������������������������������������������������������

loc_A99AE:				; CODE XREF: sub_A3C30+5D79j
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_A99F2
		cmp	[bp+var_11E], 0
		jz	short loc_A99F2
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A99F2:				; CODE XREF: sub_A3C30+5D9Fj
					; sub_A3C30+5DA7j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_A9A4D
		cmp	[bp+var_100], 0
		jz	short loc_A9A4D
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9A4D:				; CODE XREF: sub_A3C30+5DFAj
					; sub_A3C30+5E02j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_A9A8C
		cmp	[bp+var_F6], 0
		jz	short loc_A9A8C
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9A8C:				; CODE XREF: sub_A3C30+5E39j
					; sub_A3C30+5E41j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_A9ACB
		cmp	[bp+var_EC], 0
		jz	short loc_A9ACB
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9ACB:				; CODE XREF: sub_A3C30+5E78j
					; sub_A3C30+5E80j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_A9B0A
		cmp	[bp+var_E2], 0
		jz	short loc_A9B0A
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9B0A:				; CODE XREF: sub_A3C30+5EB7j
					; sub_A3C30+5EBFj
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_A9B49
		cmp	[bp+var_D8], 0
		jz	short loc_A9B49
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9B49:				; CODE XREF: sub_A3C30+5EF6j
					; sub_A3C30+5EFEj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_A9B88
		cmp	[bp+var_CE], 0
		jz	short loc_A9B88
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9B88:				; CODE XREF: sub_A3C30+5F35j
					; sub_A3C30+5F3Dj
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_A9BC7
		cmp	[bp+var_C4], 0
		jz	short loc_A9BC7
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9BC7:				; CODE XREF: sub_A3C30+5F74j
					; sub_A3C30+5F7Cj
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_A9C06
		cmp	[bp+var_BA], 0
		jz	short loc_A9C06
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9C06:				; CODE XREF: sub_A3C30+5FB3j
					; sub_A3C30+5FBBj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_A9C45
		cmp	[bp+var_B0], 0
		jz	short loc_A9C45
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9C45:				; CODE XREF: sub_A3C30+5FF2j
					; sub_A3C30+5FFAj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_A9C93
		cmp	[bp+var_A0], 0
		jz	short loc_A9C93
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9C93:				; CODE XREF: sub_A3C30+6040j
					; sub_A3C30+6048j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_A9CE1
		cmp	[bp+var_90], 0
		jz	short loc_A9CE1
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9CE1:				; CODE XREF: sub_A3C30+608Ej
					; sub_A3C30+6096j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_A9D2B
		cmp	[bp+var_80], 0
		jz	short loc_A9D2B
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9D2B:				; CODE XREF: sub_A3C30+60DBj
					; sub_A3C30+60E2j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_A9D71
		cmp	[bp+var_70], 0
		jz	short loc_A9D71
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9D71:				; CODE XREF: sub_A3C30+6121j
					; sub_A3C30+6128j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_A9DB7
		cmp	[bp+var_60], 0
		jz	short loc_A9DB7
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9DB7:				; CODE XREF: sub_A3C30+6167j
					; sub_A3C30+616Ej
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_A9DFD
		cmp	[bp+var_50], 0
		jz	short loc_A9DFD
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9DFD:				; CODE XREF: sub_A3C30+61ADj
					; sub_A3C30+61B4j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_A9E35
		cmp	[bp+var_46], 0
		jz	short loc_A9E35
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9E35:				; CODE XREF: sub_A3C30+61E5j
					; sub_A3C30+61ECj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_A9E6D
		cmp	[bp+var_3C], 0
		jz	short loc_A9E6D
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9E6D:				; CODE XREF: sub_A3C30+621Dj
					; sub_A3C30+6224j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_A9EBC
		cmp	[bp+var_BE2], 0
		jz	short loc_A9EBC
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9EBC:				; CODE XREF: sub_A3C30+6269j
					; sub_A3C30+6271j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_A9F08
		cmp	[bp+var_3C8], 0
		jz	short loc_A9F08
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9F08:				; CODE XREF: sub_A3C30+62B5j
					; sub_A3C30+62BDj
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A9F52
		cmp	[bp+var_30], 0
		jz	short loc_A9F52
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A9F52:				; CODE XREF: sub_A3C30+6302j
					; sub_A3C30+6309j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A9FCC:				; CODE XREF: sub_A3C30+5D7Bj
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_136], ax
		push	80h ; '�'
		push	0A4h ; '�'
		lea	ax, [bp+var_EC]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_13A+2], ax
		push	1Fh
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_136]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_AA09C
		jmp	loc_AA1E2
; ���������������������������������������������������������������������������

loc_AA09C:				; CODE XREF: sub_A3C30+6467j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_144+2],	0
		mov	byte ptr [bp+var_140+2], 2
		mov	byte ptr [bp+var_140+3], 0
		mov	dword ptr [bp+var_13C],	0
		push	2
		lea	ax, [bp+var_144+2]
		push	ax
		push	4
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_144+2]
		push	ax
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_AA0FF
; ���������������������������������������������������������������������������

loc_AA0F1:				; CODE XREF: sub_A3C30+64D2j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_AA0FF:				; CODE XREF: sub_A3C30+64BFj
		cmp	di, 8
		jl	short loc_AA0F1
		push	0FFFFh
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	short loc_AA16B
; ���������������������������������������������������������������������������

loc_AA117:				; CODE XREF: sub_A3C30+654Aj
		cmp	di, 7
		jnz	short loc_AA12A
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AA12A:				; CODE XREF: sub_A3C30+64EAj
		cmp	di, 8
		jnz	short loc_AA13D
		push	15h
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AA13D:				; CODE XREF: sub_A3C30+64FDj
		mov	ax, di
		inc	di
		cmp	ax, 11h
		jnz	short loc_AA153
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AA153:				; CODE XREF: sub_A3C30+6513j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AA15E
		jmp	short loc_AA17C
; ���������������������������������������������������������������������������

loc_AA15E:				; CODE XREF: sub_A3C30+652Aj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AA16B:				; CODE XREF: sub_A3C30+64E5j
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_AA117

loc_AA17C:				; CODE XREF: sub_A3C30+652Cj
		xor	di, di
		jmp	short loc_AA18E
; ���������������������������������������������������������������������������

loc_AA180:				; CODE XREF: sub_A3C30+6561j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_AA18E:				; CODE XREF: sub_A3C30+654Ej
		cmp	di, 0Ch
		jl	short loc_AA180
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp+var_140+3], 0
		jz	short loc_AA1C8
		cmp	[bp+var_144+2],	0
		jz	short loc_AA1C8
		push	0
		mov	al, byte ptr [bp+var_140+2]
		push	ax
		lea	ax, [bp+var_144+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA1C8:				; CODE XREF: sub_A3C30+6575j
					; sub_A3C30+657Dj
		mov	[bp+var_144+2],	0
		mov	byte ptr [bp+var_140+3], 0
		mov	dword ptr [bp+var_13C],	0
		jmp	loc_AA301
; ���������������������������������������������������������������������������

loc_AA1E2:				; CODE XREF: sub_A3C30+6469j
		push	0FEh ; '�'
		push	[bp+var_C18]
		mov	bx, [bp+var_C18]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 28h	; '('
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_AA2E1
; ���������������������������������������������������������������������������

loc_AA216:				; CODE XREF: sub_A3C30+66CEj
		mov	di, [bp+var_C6B]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_AA23A
		mov	ax, [bp+var_12]
		shl	ax, 3
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_AA23A:				; CODE XREF: sub_A3C30+65EFj
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_AA251
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AA251:				; CODE XREF: sub_A3C30+6611j
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_AA268
		push	15h
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AA268:				; CODE XREF: sub_A3C30+6628j
		mov	ax, si
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_AA27F
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AA27F:				; CODE XREF: sub_A3C30+663Fj
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_AA2C9
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_AA2C9:				; CODE XREF: sub_A3C30+6655j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AA2D4
		jmp	short loc_AA301
; ���������������������������������������������������������������������������

loc_AA2D4:				; CODE XREF: sub_A3C30+66A0j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AA2E1:				; CODE XREF: sub_A3C30+65E3j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_AA2F1
		cmp	[bp+var_C69], 0
		jz	short loc_AA2F6

loc_AA2F1:				; CODE XREF: sub_A3C30+66B8j
		mov	ax, 1
		jmp	short loc_AA2F8
; ���������������������������������������������������������������������������

loc_AA2F6:				; CODE XREF: sub_A3C30+66BFj
		xor	ax, ax

loc_AA2F8:				; CODE XREF: sub_A3C30+66C4j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AA301
		jmp	loc_AA216
; ���������������������������������������������������������������������������

loc_AA301:				; CODE XREF: sub_A3C30+65AFj
					; sub_A3C30+66A2j ...
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_AA31A
		jmp	loc_AA938
; ���������������������������������������������������������������������������

loc_AA31A:				; CODE XREF: sub_A3C30+66E5j
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_AA35E
		cmp	[bp+var_11E], 0
		jz	short loc_AA35E
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA35E:				; CODE XREF: sub_A3C30+670Bj
					; sub_A3C30+6713j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_AA3B9
		cmp	[bp+var_100], 0
		jz	short loc_AA3B9
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA3B9:				; CODE XREF: sub_A3C30+6766j
					; sub_A3C30+676Ej
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_AA3F8
		cmp	[bp+var_F6], 0
		jz	short loc_AA3F8
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA3F8:				; CODE XREF: sub_A3C30+67A5j
					; sub_A3C30+67ADj
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_AA437
		cmp	[bp+var_EC], 0
		jz	short loc_AA437
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA437:				; CODE XREF: sub_A3C30+67E4j
					; sub_A3C30+67ECj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_AA476
		cmp	[bp+var_E2], 0
		jz	short loc_AA476
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA476:				; CODE XREF: sub_A3C30+6823j
					; sub_A3C30+682Bj
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_AA4B5
		cmp	[bp+var_D8], 0
		jz	short loc_AA4B5
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA4B5:				; CODE XREF: sub_A3C30+6862j
					; sub_A3C30+686Aj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_AA4F4
		cmp	[bp+var_CE], 0
		jz	short loc_AA4F4
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA4F4:				; CODE XREF: sub_A3C30+68A1j
					; sub_A3C30+68A9j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_AA533
		cmp	[bp+var_C4], 0
		jz	short loc_AA533
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA533:				; CODE XREF: sub_A3C30+68E0j
					; sub_A3C30+68E8j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_AA572
		cmp	[bp+var_BA], 0
		jz	short loc_AA572
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA572:				; CODE XREF: sub_A3C30+691Fj
					; sub_A3C30+6927j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_AA5B1
		cmp	[bp+var_B0], 0
		jz	short loc_AA5B1
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA5B1:				; CODE XREF: sub_A3C30+695Ej
					; sub_A3C30+6966j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_AA5FF
		cmp	[bp+var_A0], 0
		jz	short loc_AA5FF
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA5FF:				; CODE XREF: sub_A3C30+69ACj
					; sub_A3C30+69B4j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AA64D
		cmp	[bp+var_90], 0
		jz	short loc_AA64D
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA64D:				; CODE XREF: sub_A3C30+69FAj
					; sub_A3C30+6A02j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AA697
		cmp	[bp+var_80], 0
		jz	short loc_AA697
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA697:				; CODE XREF: sub_A3C30+6A47j
					; sub_A3C30+6A4Ej
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AA6DD
		cmp	[bp+var_70], 0
		jz	short loc_AA6DD
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA6DD:				; CODE XREF: sub_A3C30+6A8Dj
					; sub_A3C30+6A94j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AA723
		cmp	[bp+var_60], 0
		jz	short loc_AA723
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA723:				; CODE XREF: sub_A3C30+6AD3j
					; sub_A3C30+6ADAj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AA769
		cmp	[bp+var_50], 0
		jz	short loc_AA769
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA769:				; CODE XREF: sub_A3C30+6B19j
					; sub_A3C30+6B20j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AA7A1
		cmp	[bp+var_46], 0
		jz	short loc_AA7A1
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA7A1:				; CODE XREF: sub_A3C30+6B51j
					; sub_A3C30+6B58j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AA7D9
		cmp	[bp+var_3C], 0
		jz	short loc_AA7D9
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA7D9:				; CODE XREF: sub_A3C30+6B89j
					; sub_A3C30+6B90j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AA828
		cmp	[bp+var_BE2], 0
		jz	short loc_AA828
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA828:				; CODE XREF: sub_A3C30+6BD5j
					; sub_A3C30+6BDDj
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AA874
		cmp	[bp+var_3C8], 0
		jz	short loc_AA874
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA874:				; CODE XREF: sub_A3C30+6C21j
					; sub_A3C30+6C29j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AA8BE
		cmp	[bp+var_30], 0
		jz	short loc_AA8BE
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AA8BE:				; CODE XREF: sub_A3C30+6C6Ej
					; sub_A3C30+6C75j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AA938:				; CODE XREF: sub_A3C30+66E7j
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_136], ax
		push	80h ; '�'
		push	0FFh
		lea	ax, [bp+var_F6]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_13A+2], ax
		push	80h ; '�'
		push	5Fh ; '_'
		lea	ax, [bp+var_D8]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [bp+var_13A], ax
		push	13h
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	13h
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_136]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_13A]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_AAA42
		jmp	loc_AB261
; ���������������������������������������������������������������������������

loc_AAA42:				; CODE XREF: sub_A3C30+6E0Dj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140], 2
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_140+2],	0
		push	2
		lea	ax, [bp+var_144]
		push	ax
		push	5
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_144]
		push	ax
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_AAAA5
; ���������������������������������������������������������������������������

loc_AAA97:				; CODE XREF: sub_A3C30+6E78j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_AAAA5:				; CODE XREF: sub_A3C30+6E65j
		cmp	di, 4
		jl	short loc_AAA97
		push	0FFFFh
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_83FE
		add	sp, 4
		xor	di, di
		jmp	loc_AAB71
; ���������������������������������������������������������������������������

loc_AAABE:				; CODE XREF: sub_A3C30+6F52j
		cmp	di, 7
		jnz	short loc_AAAD1
		push	0Ch
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAAD1:				; CODE XREF: sub_A3C30+6E91j
		cmp	di, 8
		jnz	short loc_AAAE4
		push	15h
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAAE4:				; CODE XREF: sub_A3C30+6EA4j
		cmp	di, 9
		jnz	short loc_AAAF7
		push	0FFFFh
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAAF7:				; CODE XREF: sub_A3C30+6EB7j
		cmp	di, 10h
		jnz	short loc_AAB0A
		push	0Ch
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAB0A:				; CODE XREF: sub_A3C30+6ECAj
		cmp	di, 12h
		jnz	short loc_AAB1D
		push	15h
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAB1D:				; CODE XREF: sub_A3C30+6EDDj
		cmp	di, 2
		jnz	short loc_AAB30
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAB30:				; CODE XREF: sub_A3C30+6EF0j
		cmp	di, 3
		jnz	short loc_AAB43
		push	15h
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAB43:				; CODE XREF: sub_A3C30+6F03j
		mov	ax, di
		inc	di
		cmp	ax, 16h
		jnz	short loc_AAB59
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AAB59:				; CODE XREF: sub_A3C30+6F19j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AAB64
		jmp	short loc_AAB85
; ���������������������������������������������������������������������������

loc_AAB64:				; CODE XREF: sub_A3C30+6F30j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AAB71:				; CODE XREF: sub_A3C30+6E8Bj
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jz	short loc_AAB85
		jmp	loc_AAABE
; ���������������������������������������������������������������������������

loc_AAB85:				; CODE XREF: sub_A3C30+6F32j
					; sub_A3C30+6F50j
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte_495FC, 0
		jnz	short loc_AAB9C
		jmp	loc_AB208
; ���������������������������������������������������������������������������

loc_AAB9C:				; CODE XREF: sub_A3C30+6F67j
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_AABC4
		cmp	[bp+var_144], 0
		jz	short loc_AABC4
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AABC4:				; CODE XREF: sub_A3C30+6F71j
					; sub_A3C30+6F79j
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_140+2],	0
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_AAC2E
		cmp	[bp+var_11E], 0
		jz	short loc_AAC2E
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAC2E:				; CODE XREF: sub_A3C30+6FDBj
					; sub_A3C30+6FE3j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_AAC89
		cmp	[bp+var_100], 0
		jz	short loc_AAC89
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAC89:				; CODE XREF: sub_A3C30+7036j
					; sub_A3C30+703Ej
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_AACC8
		cmp	[bp+var_F6], 0
		jz	short loc_AACC8
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AACC8:				; CODE XREF: sub_A3C30+7075j
					; sub_A3C30+707Dj
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_AAD07
		cmp	[bp+var_EC], 0
		jz	short loc_AAD07
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAD07:				; CODE XREF: sub_A3C30+70B4j
					; sub_A3C30+70BCj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_AAD46
		cmp	[bp+var_E2], 0
		jz	short loc_AAD46
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAD46:				; CODE XREF: sub_A3C30+70F3j
					; sub_A3C30+70FBj
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_AAD85
		cmp	[bp+var_D8], 0
		jz	short loc_AAD85
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAD85:				; CODE XREF: sub_A3C30+7132j
					; sub_A3C30+713Aj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_AADC4
		cmp	[bp+var_CE], 0
		jz	short loc_AADC4
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AADC4:				; CODE XREF: sub_A3C30+7171j
					; sub_A3C30+7179j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_AAE03
		cmp	[bp+var_C4], 0
		jz	short loc_AAE03
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAE03:				; CODE XREF: sub_A3C30+71B0j
					; sub_A3C30+71B8j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_AAE42
		cmp	[bp+var_BA], 0
		jz	short loc_AAE42
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAE42:				; CODE XREF: sub_A3C30+71EFj
					; sub_A3C30+71F7j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_AAE81
		cmp	[bp+var_B0], 0
		jz	short loc_AAE81
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAE81:				; CODE XREF: sub_A3C30+722Ej
					; sub_A3C30+7236j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_AAECF
		cmp	[bp+var_A0], 0
		jz	short loc_AAECF
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAECF:				; CODE XREF: sub_A3C30+727Cj
					; sub_A3C30+7284j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AAF1D
		cmp	[bp+var_90], 0
		jz	short loc_AAF1D
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAF1D:				; CODE XREF: sub_A3C30+72CAj
					; sub_A3C30+72D2j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AAF67
		cmp	[bp+var_80], 0
		jz	short loc_AAF67
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAF67:				; CODE XREF: sub_A3C30+7317j
					; sub_A3C30+731Ej
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AAFAD
		cmp	[bp+var_70], 0
		jz	short loc_AAFAD
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAFAD:				; CODE XREF: sub_A3C30+735Dj
					; sub_A3C30+7364j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AAFF3
		cmp	[bp+var_60], 0
		jz	short loc_AAFF3
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AAFF3:				; CODE XREF: sub_A3C30+73A3j
					; sub_A3C30+73AAj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AB039
		cmp	[bp+var_50], 0
		jz	short loc_AB039
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB039:				; CODE XREF: sub_A3C30+73E9j
					; sub_A3C30+73F0j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AB071
		cmp	[bp+var_46], 0
		jz	short loc_AB071
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB071:				; CODE XREF: sub_A3C30+7421j
					; sub_A3C30+7428j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AB0A9
		cmp	[bp+var_3C], 0
		jz	short loc_AB0A9
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB0A9:				; CODE XREF: sub_A3C30+7459j
					; sub_A3C30+7460j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AB0F8
		cmp	[bp+var_BE2], 0
		jz	short loc_AB0F8
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB0F8:				; CODE XREF: sub_A3C30+74A5j
					; sub_A3C30+74ADj
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AB144
		cmp	[bp+var_3C8], 0
		jz	short loc_AB144
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB144:				; CODE XREF: sub_A3C30+74F1j
					; sub_A3C30+74F9j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AB18E
		cmp	[bp+var_30], 0
		jz	short loc_AB18E
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB18E:				; CODE XREF: sub_A3C30+753Ej
					; sub_A3C30+7545j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AB208:				; CODE XREF: sub_A3C30+6F69j
		xor	di, di
		jmp	short loc_AB21A
; ���������������������������������������������������������������������������

loc_AB20C:				; CODE XREF: sub_A3C30+75EDj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_AB21A:				; CODE XREF: sub_A3C30+75DAj
		cmp	di, 8
		jl	short loc_AB20C
		cmp	byte ptr [bp+var_140+1], 0
		jz	short loc_AB247
		cmp	[bp+var_144], 0
		jz	short loc_AB247
		push	0
		mov	al, byte ptr [bp+var_140]
		push	ax
		lea	ax, [bp+var_144]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB247:				; CODE XREF: sub_A3C30+75F4j
					; sub_A3C30+75FCj
		mov	[bp+var_144], 0
		mov	byte ptr [bp+var_140+1], 0
		mov	[bp+var_140+2],	0
		jmp	loc_AB439
; ���������������������������������������������������������������������������

loc_AB261:				; CODE XREF: sub_A3C30+6E0Fj
		push	0FEh ; '�'
		push	[bp+var_C18]
		mov	bx, [bp+var_C18]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 47h	; 'G'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_AB419
; ���������������������������������������������������������������������������

loc_AB295:				; CODE XREF: sub_A3C30+7806j
		mov	di, [bp+var_C6B]
		mov	ax, si
		add	ax, 2
		cmp	ax, di
		jnz	short loc_AB2BD
		mov	ax, [bp+var_12]
		mov	dx, 9
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_AB2BD:				; CODE XREF: sub_A3C30+7670j
		mov	ax, si
		add	ax, 11h
		cmp	ax, di
		jnz	short loc_AB2D4
		push	0Ch
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB2D4:				; CODE XREF: sub_A3C30+7694j
		mov	ax, si
		add	ax, 12h
		cmp	ax, di
		jnz	short loc_AB2EB
		push	15h
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB2EB:				; CODE XREF: sub_A3C30+76ABj
		mov	ax, si
		add	ax, 13h
		cmp	ax, di
		jnz	short loc_AB302
		push	0FFFFh
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB302:				; CODE XREF: sub_A3C30+76C2j
		mov	ax, si
		add	ax, 1Ah
		cmp	ax, di
		jnz	short loc_AB319
		push	0Ch
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB319:				; CODE XREF: sub_A3C30+76D9j
		mov	ax, si
		add	ax, 1Ch
		cmp	ax, di
		jnz	short loc_AB330
		push	15h
		push	word ptr [bp+var_13A]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB330:				; CODE XREF: sub_A3C30+76F0j
		mov	ax, si
		add	ax, 7
		cmp	ax, di
		jnz	short loc_AB347
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB347:				; CODE XREF: sub_A3C30+7707j
		mov	ax, si
		add	ax, 8
		cmp	ax, di
		jnz	short loc_AB35E
		push	15h
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB35E:				; CODE XREF: sub_A3C30+771Ej
		mov	ax, si
		add	ax, 20h	; ' '
		cmp	ax, di
		jnz	short loc_AB375
		push	0Ch
		push	word ptr [bp+var_13A+2]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AB375:				; CODE XREF: sub_A3C30+7735j
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_AB3BF
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_AB3BF:				; CODE XREF: sub_A3C30+774Bj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AB40C
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_AB439
; ���������������������������������������������������������������������������

loc_AB40C:				; CODE XREF: sub_A3C30+7796j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AB419:				; CODE XREF: sub_A3C30+7662j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_AB429
		cmp	[bp+var_C69], 0
		jz	short loc_AB42E

loc_AB429:				; CODE XREF: sub_A3C30+77F0j
		mov	ax, 1
		jmp	short loc_AB430
; ���������������������������������������������������������������������������

loc_AB42E:				; CODE XREF: sub_A3C30+77F7j
		xor	ax, ax

loc_AB430:				; CODE XREF: sub_A3C30+77FCj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AB439
		jmp	loc_AB295
; ���������������������������������������������������������������������������

loc_AB439:				; CODE XREF: sub_A3C30+762Ej
					; sub_A3C30+77DAj ...
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_AB452
		jmp	loc_ABA70
; ���������������������������������������������������������������������������

loc_AB452:				; CODE XREF: sub_A3C30+781Dj
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_AB496
		cmp	[bp+var_11E], 0
		jz	short loc_AB496
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB496:				; CODE XREF: sub_A3C30+7843j
					; sub_A3C30+784Bj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_AB4F1
		cmp	[bp+var_100], 0
		jz	short loc_AB4F1
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB4F1:				; CODE XREF: sub_A3C30+789Ej
					; sub_A3C30+78A6j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_AB530
		cmp	[bp+var_F6], 0
		jz	short loc_AB530
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB530:				; CODE XREF: sub_A3C30+78DDj
					; sub_A3C30+78E5j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_AB56F
		cmp	[bp+var_EC], 0
		jz	short loc_AB56F
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB56F:				; CODE XREF: sub_A3C30+791Cj
					; sub_A3C30+7924j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_AB5AE
		cmp	[bp+var_E2], 0
		jz	short loc_AB5AE
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB5AE:				; CODE XREF: sub_A3C30+795Bj
					; sub_A3C30+7963j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_AB5ED
		cmp	[bp+var_D8], 0
		jz	short loc_AB5ED
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB5ED:				; CODE XREF: sub_A3C30+799Aj
					; sub_A3C30+79A2j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_AB62C
		cmp	[bp+var_CE], 0
		jz	short loc_AB62C
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB62C:				; CODE XREF: sub_A3C30+79D9j
					; sub_A3C30+79E1j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_AB66B
		cmp	[bp+var_C4], 0
		jz	short loc_AB66B
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB66B:				; CODE XREF: sub_A3C30+7A18j
					; sub_A3C30+7A20j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_AB6AA
		cmp	[bp+var_BA], 0
		jz	short loc_AB6AA
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB6AA:				; CODE XREF: sub_A3C30+7A57j
					; sub_A3C30+7A5Fj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_AB6E9
		cmp	[bp+var_B0], 0
		jz	short loc_AB6E9
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB6E9:				; CODE XREF: sub_A3C30+7A96j
					; sub_A3C30+7A9Ej
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_AB737
		cmp	[bp+var_A0], 0
		jz	short loc_AB737
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB737:				; CODE XREF: sub_A3C30+7AE4j
					; sub_A3C30+7AECj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AB785
		cmp	[bp+var_90], 0
		jz	short loc_AB785
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB785:				; CODE XREF: sub_A3C30+7B32j
					; sub_A3C30+7B3Aj
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AB7CF
		cmp	[bp+var_80], 0
		jz	short loc_AB7CF
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB7CF:				; CODE XREF: sub_A3C30+7B7Fj
					; sub_A3C30+7B86j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AB815
		cmp	[bp+var_70], 0
		jz	short loc_AB815
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB815:				; CODE XREF: sub_A3C30+7BC5j
					; sub_A3C30+7BCCj
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AB85B
		cmp	[bp+var_60], 0
		jz	short loc_AB85B
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB85B:				; CODE XREF: sub_A3C30+7C0Bj
					; sub_A3C30+7C12j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AB8A1
		cmp	[bp+var_50], 0
		jz	short loc_AB8A1
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB8A1:				; CODE XREF: sub_A3C30+7C51j
					; sub_A3C30+7C58j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AB8D9
		cmp	[bp+var_46], 0
		jz	short loc_AB8D9
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB8D9:				; CODE XREF: sub_A3C30+7C89j
					; sub_A3C30+7C90j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AB911
		cmp	[bp+var_3C], 0
		jz	short loc_AB911
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB911:				; CODE XREF: sub_A3C30+7CC1j
					; sub_A3C30+7CC8j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AB960
		cmp	[bp+var_BE2], 0
		jz	short loc_AB960
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB960:				; CODE XREF: sub_A3C30+7D0Dj
					; sub_A3C30+7D15j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AB9AC
		cmp	[bp+var_3C8], 0
		jz	short loc_AB9AC
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB9AC:				; CODE XREF: sub_A3C30+7D59j
					; sub_A3C30+7D61j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AB9F6
		cmp	[bp+var_30], 0
		jz	short loc_AB9F6
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AB9F6:				; CODE XREF: sub_A3C30+7DA6j
					; sub_A3C30+7DADj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_ABA70:				; CODE XREF: sub_A3C30+781Fj
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		push	3
		lea	ax, [bp+var_140+2]
		push	ax
		push	1Eh
		lea	ax, [bp+var_2CE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_140+2]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_140], ax
		sub	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_D4A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	[bp+var_96]
		mov	al, [bp+var_94]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		lea	ax, [bp+var_D4A]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		call	sub_CBAB
		add	sp, 6
		push	word ptr [bp+var_140]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_14], 0
		jnz	short loc_ABB22
		jmp	loc_AC2DF
; ���������������������������������������������������������������������������

loc_ABB22:				; CODE XREF: sub_A3C30+7EEDj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+2], 2
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	2
		lea	ax, [bp+var_14C+2]
		push	ax
		push	6
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_14C+2]
		push	ax
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_7D11
		add	sp, 4
		xor	di, di
		jmp	short loc_ABB85
; ���������������������������������������������������������������������������

loc_ABB77:				; CODE XREF: sub_A3C30+7F58j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_ABB85:				; CODE XREF: sub_A3C30+7F45j
		cmp	di, 4
		jl	short loc_ABB77
		push	0FFFFh
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_83FE
		add	sp, 4
		jmp	short loc_ABBB3
; ���������������������������������������������������������������������������

loc_ABB9B:				; CODE XREF: sub_A3C30+7F92j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_ABBA6
		jmp	short loc_ABBC4
; ���������������������������������������������������������������������������

loc_ABBA6:				; CODE XREF: sub_A3C30+7F72j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_ABBB3:				; CODE XREF: sub_A3C30+7F69j
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_IsPlaying_8500
		add	sp, 2
		or	al, al
		jnz	short loc_ABB9B

loc_ABBC4:				; CODE XREF: sub_A3C30+7F74j
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte_495FC, 0
		jnz	short loc_ABBDB
		jmp	loc_AC286
; ���������������������������������������������������������������������������

loc_ABBDB:				; CODE XREF: sub_A3C30+7FA6j
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_ABC03
		cmp	[bp+var_14C+2],	0
		jz	short loc_ABC03
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABC03:				; CODE XREF: sub_A3C30+7FB0j
					; sub_A3C30+7FB8j
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_ABC51
		cmp	[bp+var_140+2],	0
		jz	short loc_ABC51
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABC51:				; CODE XREF: sub_A3C30+7FFEj
					; sub_A3C30+8006j
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_ABCAC
		cmp	[bp+var_11E], 0
		jz	short loc_ABCAC
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABCAC:				; CODE XREF: sub_A3C30+8059j
					; sub_A3C30+8061j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_ABD07
		cmp	[bp+var_100], 0
		jz	short loc_ABD07
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABD07:				; CODE XREF: sub_A3C30+80B4j
					; sub_A3C30+80BCj
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_ABD46
		cmp	[bp+var_F6], 0
		jz	short loc_ABD46
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABD46:				; CODE XREF: sub_A3C30+80F3j
					; sub_A3C30+80FBj
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_ABD85
		cmp	[bp+var_EC], 0
		jz	short loc_ABD85
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABD85:				; CODE XREF: sub_A3C30+8132j
					; sub_A3C30+813Aj
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_ABDC4
		cmp	[bp+var_E2], 0
		jz	short loc_ABDC4
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABDC4:				; CODE XREF: sub_A3C30+8171j
					; sub_A3C30+8179j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_ABE03
		cmp	[bp+var_D8], 0
		jz	short loc_ABE03
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABE03:				; CODE XREF: sub_A3C30+81B0j
					; sub_A3C30+81B8j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_ABE42
		cmp	[bp+var_CE], 0
		jz	short loc_ABE42
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABE42:				; CODE XREF: sub_A3C30+81EFj
					; sub_A3C30+81F7j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_ABE81
		cmp	[bp+var_C4], 0
		jz	short loc_ABE81
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABE81:				; CODE XREF: sub_A3C30+822Ej
					; sub_A3C30+8236j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_ABEC0
		cmp	[bp+var_BA], 0
		jz	short loc_ABEC0
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABEC0:				; CODE XREF: sub_A3C30+826Dj
					; sub_A3C30+8275j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_ABEFF
		cmp	[bp+var_B0], 0
		jz	short loc_ABEFF
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABEFF:				; CODE XREF: sub_A3C30+82ACj
					; sub_A3C30+82B4j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_ABF4D
		cmp	[bp+var_A0], 0
		jz	short loc_ABF4D
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABF4D:				; CODE XREF: sub_A3C30+82FAj
					; sub_A3C30+8302j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_ABF9B
		cmp	[bp+var_90], 0
		jz	short loc_ABF9B
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABF9B:				; CODE XREF: sub_A3C30+8348j
					; sub_A3C30+8350j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_ABFE5
		cmp	[bp+var_80], 0
		jz	short loc_ABFE5
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ABFE5:				; CODE XREF: sub_A3C30+8395j
					; sub_A3C30+839Cj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AC02B
		cmp	[bp+var_70], 0
		jz	short loc_AC02B
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC02B:				; CODE XREF: sub_A3C30+83DBj
					; sub_A3C30+83E2j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AC071
		cmp	[bp+var_60], 0
		jz	short loc_AC071
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC071:				; CODE XREF: sub_A3C30+8421j
					; sub_A3C30+8428j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AC0B7
		cmp	[bp+var_50], 0
		jz	short loc_AC0B7
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC0B7:				; CODE XREF: sub_A3C30+8467j
					; sub_A3C30+846Ej
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AC0EF
		cmp	[bp+var_46], 0
		jz	short loc_AC0EF
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC0EF:				; CODE XREF: sub_A3C30+849Fj
					; sub_A3C30+84A6j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AC127
		cmp	[bp+var_3C], 0
		jz	short loc_AC127
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC127:				; CODE XREF: sub_A3C30+84D7j
					; sub_A3C30+84DEj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AC176
		cmp	[bp+var_BE2], 0
		jz	short loc_AC176
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC176:				; CODE XREF: sub_A3C30+8523j
					; sub_A3C30+852Bj
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AC1C2
		cmp	[bp+var_3C8], 0
		jz	short loc_AC1C2
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC1C2:				; CODE XREF: sub_A3C30+856Fj
					; sub_A3C30+8577j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AC20C
		cmp	[bp+var_30], 0
		jz	short loc_AC20C
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC20C:				; CODE XREF: sub_A3C30+85BCj
					; sub_A3C30+85C3j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AC286:				; CODE XREF: sub_A3C30+7FA8j
		xor	di, di
		jmp	short loc_AC298
; ���������������������������������������������������������������������������

loc_AC28A:				; CODE XREF: sub_A3C30+866Bj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	di

loc_AC298:				; CODE XREF: sub_A3C30+8658j
		cmp	di, 8
		jl	short loc_AC28A
		cmp	byte ptr [bp+var_148+3], 0
		jz	short loc_AC2C5
		cmp	[bp+var_14C+2],	0
		jz	short loc_AC2C5
		push	0
		mov	al, byte ptr [bp+var_148+2]
		push	ax
		lea	ax, [bp+var_14C+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC2C5:				; CODE XREF: sub_A3C30+8672j
					; sub_A3C30+867Aj
		mov	[bp+var_14C+2],	0
		mov	byte ptr [bp+var_148+3], 0
		mov	[bp+var_144], 0
		jmp	loc_ACB8B
; ���������������������������������������������������������������������������

loc_AC2DF:				; CODE XREF: sub_A3C30+7EEFj
		push	0
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	4Fh ; 'O'
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+var_E], 38h	; '8'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_AC3EA
; ���������������������������������������������������������������������������

loc_AC31E:				; CODE XREF: sub_A3C30+87D7j
		mov	di, [bp+var_C6B]
		mov	ax, si
		add	ax, 3
		cmp	ax, di
		jnz	short loc_AC346
		mov	ax, [bp+var_12]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_AC346:				; CODE XREF: sub_A3C30+86F9j
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_AC390
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_AC390:				; CODE XREF: sub_A3C30+871Cj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AC3DD
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_AC40A
; ���������������������������������������������������������������������������

loc_AC3DD:				; CODE XREF: sub_A3C30+8767j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AC3EA:				; CODE XREF: sub_A3C30+86EBj
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_AC3FA
		cmp	[bp+var_C69], 0
		jz	short loc_AC3FF

loc_AC3FA:				; CODE XREF: sub_A3C30+87C1j
		mov	ax, 1
		jmp	short loc_AC401
; ���������������������������������������������������������������������������

loc_AC3FF:				; CODE XREF: sub_A3C30+87C8j
		xor	ax, ax

loc_AC401:				; CODE XREF: sub_A3C30+87CDj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC40A
		jmp	loc_AC31E
; ���������������������������������������������������������������������������

loc_AC40A:				; CODE XREF: sub_A3C30+87ABj
					; sub_A3C30+87D5j
		cmp	byte_495FC, 0
		jnz	short loc_AC414
		jmp	loc_ACA80
; ���������������������������������������������������������������������������

loc_AC414:				; CODE XREF: sub_A3C30+87DFj
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_AC44B
		cmp	[bp+var_140+2],	0
		jz	short loc_AC44B
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC44B:				; CODE XREF: sub_A3C30+87F8j
					; sub_A3C30+8800j
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_AC4A6
		cmp	[bp+var_11E], 0
		jz	short loc_AC4A6
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC4A6:				; CODE XREF: sub_A3C30+8853j
					; sub_A3C30+885Bj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_AC501
		cmp	[bp+var_100], 0
		jz	short loc_AC501
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC501:				; CODE XREF: sub_A3C30+88AEj
					; sub_A3C30+88B6j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_AC540
		cmp	[bp+var_F6], 0
		jz	short loc_AC540
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC540:				; CODE XREF: sub_A3C30+88EDj
					; sub_A3C30+88F5j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_AC57F
		cmp	[bp+var_EC], 0
		jz	short loc_AC57F
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC57F:				; CODE XREF: sub_A3C30+892Cj
					; sub_A3C30+8934j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_AC5BE
		cmp	[bp+var_E2], 0
		jz	short loc_AC5BE
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC5BE:				; CODE XREF: sub_A3C30+896Bj
					; sub_A3C30+8973j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_AC5FD
		cmp	[bp+var_D8], 0
		jz	short loc_AC5FD
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC5FD:				; CODE XREF: sub_A3C30+89AAj
					; sub_A3C30+89B2j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_AC63C
		cmp	[bp+var_CE], 0
		jz	short loc_AC63C
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC63C:				; CODE XREF: sub_A3C30+89E9j
					; sub_A3C30+89F1j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_AC67B
		cmp	[bp+var_C4], 0
		jz	short loc_AC67B
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC67B:				; CODE XREF: sub_A3C30+8A28j
					; sub_A3C30+8A30j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_AC6BA
		cmp	[bp+var_BA], 0
		jz	short loc_AC6BA
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC6BA:				; CODE XREF: sub_A3C30+8A67j
					; sub_A3C30+8A6Fj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_AC6F9
		cmp	[bp+var_B0], 0
		jz	short loc_AC6F9
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC6F9:				; CODE XREF: sub_A3C30+8AA6j
					; sub_A3C30+8AAEj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_AC747
		cmp	[bp+var_A0], 0
		jz	short loc_AC747
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC747:				; CODE XREF: sub_A3C30+8AF4j
					; sub_A3C30+8AFCj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AC795
		cmp	[bp+var_90], 0
		jz	short loc_AC795
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC795:				; CODE XREF: sub_A3C30+8B42j
					; sub_A3C30+8B4Aj
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AC7DF
		cmp	[bp+var_80], 0
		jz	short loc_AC7DF
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC7DF:				; CODE XREF: sub_A3C30+8B8Fj
					; sub_A3C30+8B96j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AC825
		cmp	[bp+var_70], 0
		jz	short loc_AC825
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC825:				; CODE XREF: sub_A3C30+8BD5j
					; sub_A3C30+8BDCj
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AC86B
		cmp	[bp+var_60], 0
		jz	short loc_AC86B
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC86B:				; CODE XREF: sub_A3C30+8C1Bj
					; sub_A3C30+8C22j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AC8B1
		cmp	[bp+var_50], 0
		jz	short loc_AC8B1
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC8B1:				; CODE XREF: sub_A3C30+8C61j
					; sub_A3C30+8C68j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AC8E9
		cmp	[bp+var_46], 0
		jz	short loc_AC8E9
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC8E9:				; CODE XREF: sub_A3C30+8C99j
					; sub_A3C30+8CA0j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AC921
		cmp	[bp+var_3C], 0
		jz	short loc_AC921
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC921:				; CODE XREF: sub_A3C30+8CD1j
					; sub_A3C30+8CD8j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AC970
		cmp	[bp+var_BE2], 0
		jz	short loc_AC970
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC970:				; CODE XREF: sub_A3C30+8D1Dj
					; sub_A3C30+8D25j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AC9BC
		cmp	[bp+var_3C8], 0
		jz	short loc_AC9BC
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AC9BC:				; CODE XREF: sub_A3C30+8D69j
					; sub_A3C30+8D71j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_ACA06
		cmp	[bp+var_30], 0
		jz	short loc_ACA06
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACA06:				; CODE XREF: sub_A3C30+8DB6j
					; sub_A3C30+8DBDj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_ACA80:				; CODE XREF: sub_A3C30+87E1j
		mov	[bp+var_E], 3Ch	; '<'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_ACB6B
; ���������������������������������������������������������������������������

loc_ACAA1:				; CODE XREF: sub_A3C30+8F58j
		mov	di, [bp+var_C6B]
		mov	ax, si
		inc	ax
		cmp	ax, di
		jnz	short loc_ACAC7
		mov	ax, [bp+var_12]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_ACAC7:				; CODE XREF: sub_A3C30+8E7Aj
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, di
		jnz	short loc_ACB11
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_ACB11:				; CODE XREF: sub_A3C30+8E9Dj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_ACB5E
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_ACB8B
; ���������������������������������������������������������������������������

loc_ACB5E:				; CODE XREF: sub_A3C30+8EE8j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_ACB6B:				; CODE XREF: sub_A3C30+8E6Ej
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_ACB7B
		cmp	[bp+var_C69], 0
		jz	short loc_ACB80

loc_ACB7B:				; CODE XREF: sub_A3C30+8F42j
		mov	ax, 1
		jmp	short loc_ACB82
; ���������������������������������������������������������������������������

loc_ACB80:				; CODE XREF: sub_A3C30+8F49j
		xor	ax, ax

loc_ACB82:				; CODE XREF: sub_A3C30+8F4Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ACB8B
		jmp	loc_ACAA1
; ���������������������������������������������������������������������������

loc_ACB8B:				; CODE XREF: sub_A3C30+86ACj
					; sub_A3C30+8F2Cj ...
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_ACBC2
		cmp	[bp+var_140+2],	0
		jz	short loc_ACBC2
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACBC2:				; CODE XREF: sub_A3C30+8F6Fj
					; sub_A3C30+8F77j
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		cmp	byte_495FC, 0
		jnz	short loc_ACBE3
		jmp	loc_AD201
; ���������������������������������������������������������������������������

loc_ACBE3:				; CODE XREF: sub_A3C30+8FAEj
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_ACC27
		cmp	[bp+var_11E], 0
		jz	short loc_ACC27
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACC27:				; CODE XREF: sub_A3C30+8FD4j
					; sub_A3C30+8FDCj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_ACC82
		cmp	[bp+var_100], 0
		jz	short loc_ACC82
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACC82:				; CODE XREF: sub_A3C30+902Fj
					; sub_A3C30+9037j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_ACCC1
		cmp	[bp+var_F6], 0
		jz	short loc_ACCC1
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACCC1:				; CODE XREF: sub_A3C30+906Ej
					; sub_A3C30+9076j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_ACD00
		cmp	[bp+var_EC], 0
		jz	short loc_ACD00
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACD00:				; CODE XREF: sub_A3C30+90ADj
					; sub_A3C30+90B5j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_ACD3F
		cmp	[bp+var_E2], 0
		jz	short loc_ACD3F
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACD3F:				; CODE XREF: sub_A3C30+90ECj
					; sub_A3C30+90F4j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_ACD7E
		cmp	[bp+var_D8], 0
		jz	short loc_ACD7E
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACD7E:				; CODE XREF: sub_A3C30+912Bj
					; sub_A3C30+9133j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_ACDBD
		cmp	[bp+var_CE], 0
		jz	short loc_ACDBD
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACDBD:				; CODE XREF: sub_A3C30+916Aj
					; sub_A3C30+9172j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_ACDFC
		cmp	[bp+var_C4], 0
		jz	short loc_ACDFC
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACDFC:				; CODE XREF: sub_A3C30+91A9j
					; sub_A3C30+91B1j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_ACE3B
		cmp	[bp+var_BA], 0
		jz	short loc_ACE3B
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACE3B:				; CODE XREF: sub_A3C30+91E8j
					; sub_A3C30+91F0j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_ACE7A
		cmp	[bp+var_B0], 0
		jz	short loc_ACE7A
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACE7A:				; CODE XREF: sub_A3C30+9227j
					; sub_A3C30+922Fj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_ACEC8
		cmp	[bp+var_A0], 0
		jz	short loc_ACEC8
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACEC8:				; CODE XREF: sub_A3C30+9275j
					; sub_A3C30+927Dj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_ACF16
		cmp	[bp+var_90], 0
		jz	short loc_ACF16
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACF16:				; CODE XREF: sub_A3C30+92C3j
					; sub_A3C30+92CBj
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_ACF60
		cmp	[bp+var_80], 0
		jz	short loc_ACF60
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACF60:				; CODE XREF: sub_A3C30+9310j
					; sub_A3C30+9317j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_ACFA6
		cmp	[bp+var_70], 0
		jz	short loc_ACFA6
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACFA6:				; CODE XREF: sub_A3C30+9356j
					; sub_A3C30+935Dj
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_ACFEC
		cmp	[bp+var_60], 0
		jz	short loc_ACFEC
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ACFEC:				; CODE XREF: sub_A3C30+939Cj
					; sub_A3C30+93A3j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AD032
		cmp	[bp+var_50], 0
		jz	short loc_AD032
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD032:				; CODE XREF: sub_A3C30+93E2j
					; sub_A3C30+93E9j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AD06A
		cmp	[bp+var_46], 0
		jz	short loc_AD06A
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD06A:				; CODE XREF: sub_A3C30+941Aj
					; sub_A3C30+9421j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AD0A2
		cmp	[bp+var_3C], 0
		jz	short loc_AD0A2
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD0A2:				; CODE XREF: sub_A3C30+9452j
					; sub_A3C30+9459j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AD0F1
		cmp	[bp+var_BE2], 0
		jz	short loc_AD0F1
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD0F1:				; CODE XREF: sub_A3C30+949Ej
					; sub_A3C30+94A6j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AD13D
		cmp	[bp+var_3C8], 0
		jz	short loc_AD13D
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD13D:				; CODE XREF: sub_A3C30+94EAj
					; sub_A3C30+94F2j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AD187
		cmp	[bp+var_30], 0
		jz	short loc_AD187
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD187:				; CODE XREF: sub_A3C30+9537j
					; sub_A3C30+953Ej
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AD201:				; CODE XREF: sub_A3C30+8FB0j
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_46]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_136], ax
		push	80h ; '�'
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh	; '�'
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	di, ax
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	[bp+var_136]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	di
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_86]
		mov	al, [bp+var_84]
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	[bp+var_14], 0
		jnz	short loc_AD2E5
		jmp	loc_AD431
; ���������������������������������������������������������������������������

loc_AD2E5:				; CODE XREF: sub_A3C30+96B0j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C], 2
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		push	2
		lea	ax, [bp+var_140]
		push	ax
		push	7
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp+var_140]
		push	ax
		push	di
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp+var_144+2], 0
		jmp	short loc_AD34D
; ���������������������������������������������������������������������������

loc_AD33C:				; CODE XREF: sub_A3C30+9722j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_144+2]

loc_AD34D:				; CODE XREF: sub_A3C30+970Aj
		cmp	word ptr [bp+var_144+2], 3
		jl	short loc_AD33C
		mov	word ptr [bp+var_144+2], 0
		jmp	short loc_AD3C2
; ���������������������������������������������������������������������������

loc_AD35C:				; CODE XREF: sub_A3C30+979Dj
		cmp	word ptr [bp+var_144+2], 5
		jnz	short loc_AD36E
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD36E:				; CODE XREF: sub_A3C30+9731j
		cmp	word ptr [bp+var_144+2], 6
		jnz	short loc_AD380
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD380:				; CODE XREF: sub_A3C30+9743j
		cmp	word ptr [bp+var_144+2], 9
		jnz	short loc_AD392
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD392:				; CODE XREF: sub_A3C30+9755j
		mov	ax, word ptr [bp+var_144+2]
		inc	word ptr [bp+var_144+2]
		cmp	ax, 0Ah
		jnz	short loc_AD3AA
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD3AA:				; CODE XREF: sub_A3C30+976Dj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AD3B5
		jmp	short loc_AD3CF
; ���������������������������������������������������������������������������

loc_AD3B5:				; CODE XREF: sub_A3C30+9781j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AD3C2:				; CODE XREF: sub_A3C30+972Aj
		push	di
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_AD35C

loc_AD3CF:				; CODE XREF: sub_A3C30+9783j
		mov	word ptr [bp+var_144+2], 0
		jmp	short loc_AD3E8
; ���������������������������������������������������������������������������

loc_AD3D7:				; CODE XREF: sub_A3C30+97BDj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp+var_144+2]

loc_AD3E8:				; CODE XREF: sub_A3C30+97A5j
		cmp	word ptr [bp+var_144+2], 2
		jl	short loc_AD3D7
		cmp	byte ptr [bp+var_13C+1], 0
		jz	short loc_AD417
		cmp	[bp+var_140], 0
		jz	short loc_AD417
		push	0
		mov	al, byte ptr [bp+var_13C]
		push	ax
		lea	ax, [bp+var_140]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD417:				; CODE XREF: sub_A3C30+97C4j
					; sub_A3C30+97CCj
		mov	[bp+var_140], 0
		mov	byte ptr [bp+var_13C+1], 0
		mov	[bp+var_13A], 0
		jmp	loc_AE456
; ���������������������������������������������������������������������������

loc_AD431:				; CODE XREF: sub_A3C30+96B2j
		push	0FEh ; '�'
		push	[bp+var_C18]
		mov	bx, [bp+var_C18]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], 2Dh	; '-'
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_AD52E
; ���������������������������������������������������������������������������

loc_AD465:				; CODE XREF: sub_A3C30+991Bj
		mov	ax, [bp+var_C6B]
		mov	word ptr [bp+var_13A+2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AD493
		mov	ax, [bp+var_12]
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_AD493:				; CODE XREF: sub_A3C30+9846j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AD4AA
		push	26D5h
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_AD4AA:				; CODE XREF: sub_A3C30+986Cj
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AD4C0
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD4C0:				; CODE XREF: sub_A3C30+9883j
		mov	ax, si
		add	ax, 10h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AD4D6
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD4D6:				; CODE XREF: sub_A3C30+9899j
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AD4EC
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD4EC:				; CODE XREF: sub_A3C30+98AFj
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AD502
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD502:				; CODE XREF: sub_A3C30+98C5j
		mov	ax, word ptr [bp+var_13A+2]
		cmp	ax, [bp+var_C]
		jnz	short loc_AD516
		push	0FFFFh
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AD516:				; CODE XREF: sub_A3C30+98D9j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AD521
		jmp	short loc_AD54E
; ���������������������������������������������������������������������������

loc_AD521:				; CODE XREF: sub_A3C30+98EDj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AD52E:				; CODE XREF: sub_A3C30+9832j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_AD53E
		cmp	[bp+var_C69], 0
		jz	short loc_AD543

loc_AD53E:				; CODE XREF: sub_A3C30+9905j
		mov	ax, 1
		jmp	short loc_AD545
; ���������������������������������������������������������������������������

loc_AD543:				; CODE XREF: sub_A3C30+990Cj
		xor	ax, ax

loc_AD545:				; CODE XREF: sub_A3C30+9911j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AD54E
		jmp	loc_AD465
; ���������������������������������������������������������������������������

loc_AD54E:				; CODE XREF: sub_A3C30+98EFj
					; sub_A3C30+9919j
		cmp	byte_495FC, 0
		jnz	short loc_AD558
		jmp	loc_ADB85
; ���������������������������������������������������������������������������

loc_AD558:				; CODE XREF: sub_A3C30+9923j
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_AD5AB
		cmp	[bp+var_11E], 0
		jz	short loc_AD5AB
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD5AB:				; CODE XREF: sub_A3C30+9958j
					; sub_A3C30+9960j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_AD606
		cmp	[bp+var_100], 0
		jz	short loc_AD606
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD606:				; CODE XREF: sub_A3C30+99B3j
					; sub_A3C30+99BBj
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_AD645
		cmp	[bp+var_F6], 0
		jz	short loc_AD645
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD645:				; CODE XREF: sub_A3C30+99F2j
					; sub_A3C30+99FAj
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_AD684
		cmp	[bp+var_EC], 0
		jz	short loc_AD684
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD684:				; CODE XREF: sub_A3C30+9A31j
					; sub_A3C30+9A39j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_AD6C3
		cmp	[bp+var_E2], 0
		jz	short loc_AD6C3
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD6C3:				; CODE XREF: sub_A3C30+9A70j
					; sub_A3C30+9A78j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_AD702
		cmp	[bp+var_D8], 0
		jz	short loc_AD702
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD702:				; CODE XREF: sub_A3C30+9AAFj
					; sub_A3C30+9AB7j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_AD741
		cmp	[bp+var_CE], 0
		jz	short loc_AD741
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD741:				; CODE XREF: sub_A3C30+9AEEj
					; sub_A3C30+9AF6j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_AD780
		cmp	[bp+var_C4], 0
		jz	short loc_AD780
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD780:				; CODE XREF: sub_A3C30+9B2Dj
					; sub_A3C30+9B35j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_AD7BF
		cmp	[bp+var_BA], 0
		jz	short loc_AD7BF
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD7BF:				; CODE XREF: sub_A3C30+9B6Cj
					; sub_A3C30+9B74j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_AD7FE
		cmp	[bp+var_B0], 0
		jz	short loc_AD7FE
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD7FE:				; CODE XREF: sub_A3C30+9BABj
					; sub_A3C30+9BB3j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_AD84C
		cmp	[bp+var_A0], 0
		jz	short loc_AD84C
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD84C:				; CODE XREF: sub_A3C30+9BF9j
					; sub_A3C30+9C01j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AD89A
		cmp	[bp+var_90], 0
		jz	short loc_AD89A
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD89A:				; CODE XREF: sub_A3C30+9C47j
					; sub_A3C30+9C4Fj
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AD8E4
		cmp	[bp+var_80], 0
		jz	short loc_AD8E4
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD8E4:				; CODE XREF: sub_A3C30+9C94j
					; sub_A3C30+9C9Bj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AD92A
		cmp	[bp+var_70], 0
		jz	short loc_AD92A
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD92A:				; CODE XREF: sub_A3C30+9CDAj
					; sub_A3C30+9CE1j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AD970
		cmp	[bp+var_60], 0
		jz	short loc_AD970
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD970:				; CODE XREF: sub_A3C30+9D20j
					; sub_A3C30+9D27j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AD9B6
		cmp	[bp+var_50], 0
		jz	short loc_AD9B6
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD9B6:				; CODE XREF: sub_A3C30+9D66j
					; sub_A3C30+9D6Dj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AD9EE
		cmp	[bp+var_46], 0
		jz	short loc_AD9EE
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AD9EE:				; CODE XREF: sub_A3C30+9D9Ej
					; sub_A3C30+9DA5j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_ADA26
		cmp	[bp+var_3C], 0
		jz	short loc_ADA26
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADA26:				; CODE XREF: sub_A3C30+9DD6j
					; sub_A3C30+9DDDj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_ADA75
		cmp	[bp+var_BE2], 0
		jz	short loc_ADA75
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADA75:				; CODE XREF: sub_A3C30+9E22j
					; sub_A3C30+9E2Aj
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_ADAC1
		cmp	[bp+var_3C8], 0
		jz	short loc_ADAC1
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADAC1:				; CODE XREF: sub_A3C30+9E6Ej
					; sub_A3C30+9E76j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_ADB0B
		cmp	[bp+var_30], 0
		jz	short loc_ADB0B
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADB0B:				; CODE XREF: sub_A3C30+9EBBj
					; sub_A3C30+9EC2j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_ADB85:				; CODE XREF: sub_A3C30+9925j
		mov	[bp+var_E], 28h	; '('
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_ADCBD
; ���������������������������������������������������������������������������

loc_ADBA6:				; CODE XREF: sub_A3C30+A0AAj
		mov	ax, [bp+var_C6B]
		mov	word ptr [bp+var_13A+2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_ADBD4
		mov	ax, [bp+var_12]
		mov	dx, 0Dh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_ADBD4:				; CODE XREF: sub_A3C30+9F87j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_ADBEB
		push	26DFh
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_ADBEB:				; CODE XREF: sub_A3C30+9FADj
		mov	ax, si
		add	ax, 13h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_ADC01
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_ADC01:				; CODE XREF: sub_A3C30+9FC4j
		mov	ax, si
		add	ax, 14h
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_ADC17
		push	13h
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_ADC17:				; CODE XREF: sub_A3C30+9FDAj
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_ADC63
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_ADC63:				; CODE XREF: sub_A3C30+9FEFj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_ADCB0
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_ADCDD
; ���������������������������������������������������������������������������

loc_ADCB0:				; CODE XREF: sub_A3C30+A03Aj
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_ADCBD:				; CODE XREF: sub_A3C30+9F73j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_ADCCD
		cmp	[bp+var_C69], 0
		jz	short loc_ADCD2

loc_ADCCD:				; CODE XREF: sub_A3C30+A094j
		mov	ax, 1
		jmp	short loc_ADCD4
; ���������������������������������������������������������������������������

loc_ADCD2:				; CODE XREF: sub_A3C30+A09Bj
		xor	ax, ax

loc_ADCD4:				; CODE XREF: sub_A3C30+A0A0j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ADCDD
		jmp	loc_ADBA6
; ���������������������������������������������������������������������������

loc_ADCDD:				; CODE XREF: sub_A3C30+A07Ej
					; sub_A3C30+A0A8j
		cmp	byte_495FC, 0
		jnz	short loc_ADCE7
		jmp	loc_AE314
; ���������������������������������������������������������������������������

loc_ADCE7:				; CODE XREF: sub_A3C30+A0B2j
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_ADD3A
		cmp	[bp+var_11E], 0
		jz	short loc_ADD3A
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADD3A:				; CODE XREF: sub_A3C30+A0E7j
					; sub_A3C30+A0EFj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_ADD95
		cmp	[bp+var_100], 0
		jz	short loc_ADD95
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADD95:				; CODE XREF: sub_A3C30+A142j
					; sub_A3C30+A14Aj
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_ADDD4
		cmp	[bp+var_F6], 0
		jz	short loc_ADDD4
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADDD4:				; CODE XREF: sub_A3C30+A181j
					; sub_A3C30+A189j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_ADE13
		cmp	[bp+var_EC], 0
		jz	short loc_ADE13
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADE13:				; CODE XREF: sub_A3C30+A1C0j
					; sub_A3C30+A1C8j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_ADE52
		cmp	[bp+var_E2], 0
		jz	short loc_ADE52
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADE52:				; CODE XREF: sub_A3C30+A1FFj
					; sub_A3C30+A207j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_ADE91
		cmp	[bp+var_D8], 0
		jz	short loc_ADE91
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADE91:				; CODE XREF: sub_A3C30+A23Ej
					; sub_A3C30+A246j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_ADED0
		cmp	[bp+var_CE], 0
		jz	short loc_ADED0
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADED0:				; CODE XREF: sub_A3C30+A27Dj
					; sub_A3C30+A285j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_ADF0F
		cmp	[bp+var_C4], 0
		jz	short loc_ADF0F
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADF0F:				; CODE XREF: sub_A3C30+A2BCj
					; sub_A3C30+A2C4j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_ADF4E
		cmp	[bp+var_BA], 0
		jz	short loc_ADF4E
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADF4E:				; CODE XREF: sub_A3C30+A2FBj
					; sub_A3C30+A303j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_ADF8D
		cmp	[bp+var_B0], 0
		jz	short loc_ADF8D
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADF8D:				; CODE XREF: sub_A3C30+A33Aj
					; sub_A3C30+A342j
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_ADFDB
		cmp	[bp+var_A0], 0
		jz	short loc_ADFDB
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_ADFDB:				; CODE XREF: sub_A3C30+A388j
					; sub_A3C30+A390j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AE029
		cmp	[bp+var_90], 0
		jz	short loc_AE029
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE029:				; CODE XREF: sub_A3C30+A3D6j
					; sub_A3C30+A3DEj
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AE073
		cmp	[bp+var_80], 0
		jz	short loc_AE073
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE073:				; CODE XREF: sub_A3C30+A423j
					; sub_A3C30+A42Aj
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AE0B9
		cmp	[bp+var_70], 0
		jz	short loc_AE0B9
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE0B9:				; CODE XREF: sub_A3C30+A469j
					; sub_A3C30+A470j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AE0FF
		cmp	[bp+var_60], 0
		jz	short loc_AE0FF
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE0FF:				; CODE XREF: sub_A3C30+A4AFj
					; sub_A3C30+A4B6j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AE145
		cmp	[bp+var_50], 0
		jz	short loc_AE145
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE145:				; CODE XREF: sub_A3C30+A4F5j
					; sub_A3C30+A4FCj
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AE17D
		cmp	[bp+var_46], 0
		jz	short loc_AE17D
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE17D:				; CODE XREF: sub_A3C30+A52Dj
					; sub_A3C30+A534j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AE1B5
		cmp	[bp+var_3C], 0
		jz	short loc_AE1B5
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE1B5:				; CODE XREF: sub_A3C30+A565j
					; sub_A3C30+A56Cj
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AE204
		cmp	[bp+var_BE2], 0
		jz	short loc_AE204
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE204:				; CODE XREF: sub_A3C30+A5B1j
					; sub_A3C30+A5B9j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AE250
		cmp	[bp+var_3C8], 0
		jz	short loc_AE250
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE250:				; CODE XREF: sub_A3C30+A5FDj
					; sub_A3C30+A605j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AE29A
		cmp	[bp+var_30], 0
		jz	short loc_AE29A
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE29A:				; CODE XREF: sub_A3C30+A64Aj
					; sub_A3C30+A651j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AE314:				; CODE XREF: sub_A3C30+A0B4j
		mov	[bp+var_E], 2Ch	; ','
		mov	si, [bp+var_C6B]
		mov	ax, [bp+var_E]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	[bp+var_C], dx
		jmp	loc_AE436
; ���������������������������������������������������������������������������

loc_AE335:				; CODE XREF: sub_A3C30+A823j
		mov	ax, [bp+var_C6B]
		mov	word ptr [bp+var_13A+2], ax
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AE363
		mov	ax, [bp+var_12]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_AE363:				; CODE XREF: sub_A3C30+A716j
		mov	ax, si
		add	ax, 3
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AE37A
		push	26E5h
		push	di
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_AE37A:				; CODE XREF: sub_A3C30+A73Cj
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AE390
		push	0Ch
		push	di
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_AE390:				; CODE XREF: sub_A3C30+A753j
		mov	ax, [bp+var_C]
		dec	ax
		cmp	ax, word ptr [bp+var_13A+2]
		jnz	short loc_AE3DC
		mov	[bp+var_C94], 11BCh
		mov	[bp+var_C94], 11C8h
		mov	[bp+var_C94], 11D8h
		mov	[bp+var_C94], 11E8h
		mov	[bp+var_C94], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_C94]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_AE3DC:				; CODE XREF: sub_A3C30+A768j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AE429
		mov	[bp+var_CA0], 11BCh
		mov	[bp+var_CA0], 11C8h
		mov	[bp+var_CA0], 11D8h
		mov	[bp+var_CA0], 11E8h
		mov	[bp+var_CA0], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA0]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_AE456
; ���������������������������������������������������������������������������

loc_AE429:				; CODE XREF: sub_A3C30+A7B3j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AE436:				; CODE XREF: sub_A3C30+A702j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_AE446
		cmp	[bp+var_C69], 0
		jz	short loc_AE44B

loc_AE446:				; CODE XREF: sub_A3C30+A80Dj
		mov	ax, 1
		jmp	short loc_AE44D
; ���������������������������������������������������������������������������

loc_AE44B:				; CODE XREF: sub_A3C30+A814j
		xor	ax, ax

loc_AE44D:				; CODE XREF: sub_A3C30+A819j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE456
		jmp	loc_AE335
; ���������������������������������������������������������������������������

loc_AE456:				; CODE XREF: sub_A3C30+97FEj
					; sub_A3C30+A7F7j ...
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jnz	short loc_AE46F
		jmp	loc_AEA8D
; ���������������������������������������������������������������������������

loc_AE46F:				; CODE XREF: sub_A3C30+A83Aj
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_AE4B3
		cmp	[bp+var_11E], 0
		jz	short loc_AE4B3
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE4B3:				; CODE XREF: sub_A3C30+A860j
					; sub_A3C30+A868j
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_AE50E
		cmp	[bp+var_100], 0
		jz	short loc_AE50E
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE50E:				; CODE XREF: sub_A3C30+A8BBj
					; sub_A3C30+A8C3j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_AE54D
		cmp	[bp+var_F6], 0
		jz	short loc_AE54D
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE54D:				; CODE XREF: sub_A3C30+A8FAj
					; sub_A3C30+A902j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_AE58C
		cmp	[bp+var_EC], 0
		jz	short loc_AE58C
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE58C:				; CODE XREF: sub_A3C30+A939j
					; sub_A3C30+A941j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_AE5CB
		cmp	[bp+var_E2], 0
		jz	short loc_AE5CB
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE5CB:				; CODE XREF: sub_A3C30+A978j
					; sub_A3C30+A980j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_AE60A
		cmp	[bp+var_D8], 0
		jz	short loc_AE60A
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE60A:				; CODE XREF: sub_A3C30+A9B7j
					; sub_A3C30+A9BFj
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_AE649
		cmp	[bp+var_CE], 0
		jz	short loc_AE649
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE649:				; CODE XREF: sub_A3C30+A9F6j
					; sub_A3C30+A9FEj
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_AE688
		cmp	[bp+var_C4], 0
		jz	short loc_AE688
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE688:				; CODE XREF: sub_A3C30+AA35j
					; sub_A3C30+AA3Dj
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_AE6C7
		cmp	[bp+var_BA], 0
		jz	short loc_AE6C7
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE6C7:				; CODE XREF: sub_A3C30+AA74j
					; sub_A3C30+AA7Cj
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_AE706
		cmp	[bp+var_B0], 0
		jz	short loc_AE706
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE706:				; CODE XREF: sub_A3C30+AAB3j
					; sub_A3C30+AABBj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_AE754
		cmp	[bp+var_A0], 0
		jz	short loc_AE754
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE754:				; CODE XREF: sub_A3C30+AB01j
					; sub_A3C30+AB09j
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AE7A2
		cmp	[bp+var_90], 0
		jz	short loc_AE7A2
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE7A2:				; CODE XREF: sub_A3C30+AB4Fj
					; sub_A3C30+AB57j
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AE7EC
		cmp	[bp+var_80], 0
		jz	short loc_AE7EC
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE7EC:				; CODE XREF: sub_A3C30+AB9Cj
					; sub_A3C30+ABA3j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AE832
		cmp	[bp+var_70], 0
		jz	short loc_AE832
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE832:				; CODE XREF: sub_A3C30+ABE2j
					; sub_A3C30+ABE9j
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AE878
		cmp	[bp+var_60], 0
		jz	short loc_AE878
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE878:				; CODE XREF: sub_A3C30+AC28j
					; sub_A3C30+AC2Fj
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AE8BE
		cmp	[bp+var_50], 0
		jz	short loc_AE8BE
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE8BE:				; CODE XREF: sub_A3C30+AC6Ej
					; sub_A3C30+AC75j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AE8F6
		cmp	[bp+var_46], 0
		jz	short loc_AE8F6
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE8F6:				; CODE XREF: sub_A3C30+ACA6j
					; sub_A3C30+ACADj
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AE92E
		cmp	[bp+var_3C], 0
		jz	short loc_AE92E
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE92E:				; CODE XREF: sub_A3C30+ACDEj
					; sub_A3C30+ACE5j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AE97D
		cmp	[bp+var_BE2], 0
		jz	short loc_AE97D
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE97D:				; CODE XREF: sub_A3C30+AD2Aj
					; sub_A3C30+AD32j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AE9C9
		cmp	[bp+var_3C8], 0
		jz	short loc_AE9C9
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AE9C9:				; CODE XREF: sub_A3C30+AD76j
					; sub_A3C30+AD7Ej
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AEA13
		cmp	[bp+var_30], 0
		jz	short loc_AEA13
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AEA13:				; CODE XREF: sub_A3C30+ADC3j
					; sub_A3C30+ADCAj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AEA8D:				; CODE XREF: sub_A3C30+A83Cj
		lea	ax, [bp+var_248]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp+var_3C]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_136], ax
		push	0
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_13A+2], ax
		push	0
		push	0
		lea	ax, [bp+var_C4]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_13A], ax
		push	0
		push	0
		lea	ax, [bp+var_CE]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp+var_13C], ax
		push	0FFE8h
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [bp+var_140+2], ax
		push	[bp+var_66]
		mov	al, [bp+var_64]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_76]
		mov	al, [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_136]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_140+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_13A+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp+var_13A]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_13C]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0Ch
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp+var_140], 0
		mov	word ptr [bp+var_144+2], 0
		mov	word ptr [bp+var_144], 1
		mov	word ptr [bp+var_148+2], 0
		mov	word ptr [bp+var_148], 0
		mov	[bp+var_C], 87h	; '�'
		mov	[bp+var_152], 0
		mov	byte ptr [bp+var_14E], 2
		mov	byte ptr [bp+var_14E+1], 0
		mov	[bp+var_14C], 0
		mov	[bp+var_C92], 0
		mov	[bp+var_C8E], 2
		mov	[bp+var_C8D], 0
		mov	[bp+var_C8C], 0
		mov	word ptr [bp+var_C98+2], 0
		mov	[bp+var_C94], 0FFFFh
		cmp	[bp+var_15], 0
		jnz	short loc_AEC4A
		jmp	loc_AECC9
; ���������������������������������������������������������������������������

loc_AEC4A:				; CODE XREF: sub_A3C30+B015j
		push	3
		lea	ax, [bp+var_152]
		push	ax
		push	4Ch ; 'L'
		lea	ax, [bp+var_3BE]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp+var_C98+2]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_C98+2]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F3A
		mov	[bp+var_154], ax
		mov	word ptr [bp+var_158+2], 0
		cmp	word ptr [bp+var_C98+2], 0
		jz	short loc_AECC9
		push	[bp+var_C94]
		mov	bx, word ptr [bp+var_C98+2]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp+var_158+2]
		push	[bp+var_154]
		push	[bp+var_C94]
		mov	bx, word ptr [bp+var_C98+2]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_AECC9:				; CODE XREF: sub_A3C30+B017j
					; sub_A3C30+B067j
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C], 2
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15C+2],	0
		cmp	[bp+var_14], 0
		jz	short loc_AED20
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		push	2
		lea	ax, [bp+var_160]
		push	ax
		push	8
		lea	ax, [bp+var_346]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_7D11
		add	sp, 4

loc_AED20:				; CODE XREF: sub_A3C30+B0B9j
		jmp	loc_AEF83
; ���������������������������������������������������������������������������

loc_AED23:				; CODE XREF: sub_A3C30+B370j
		mov	di, [bp+var_C6B]
		cmp	di, 1Eh
		jle	short loc_AED48
		cmp	di, 78h	; 'x'
		jge	short loc_AED48
		mov	ax, word ptr [bp+var_144]
		mov	word ptr [bp+var_164+2], ax
		inc	word ptr [bp+var_144]
		mov	bx, word ptr [bp+var_140+2]
		mov	ax, word ptr [bp+var_164+2]
		mov	[bx+1Bh], ax

loc_AED48:				; CODE XREF: sub_A3C30+B0FAj
					; sub_A3C30+B0FFj
		cmp	di, 5Ah	; 'Z'
		jnz	short loc_AED5C
		push	9
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_AED5C:				; CODE XREF: sub_A3C30+B11Bj
		cmp	di, 78h	; 'x'
		jnz	short loc_AED8C
		push	word ptr [bp+var_140+2]
		lea	ax, [bp+var_C88]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp+var_140+2], 0
		jz	short loc_AED8C
		push	3
		push	word ptr [bp+var_140+2]
		mov	bx, word ptr [bp+var_140+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_AED8C:				; CODE XREF: sub_A3C30+B12Fj
					; sub_A3C30+B147j
		mov	ax, word ptr [bp+var_148+2]
		add	ax, 6
		cmp	ax, di
		jnz	short loc_AEDBB
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AEDBB
		mov	ax, [bp+var_12]
		mov	dx, 0Fh
		imul	dx
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		lea	ax, [bp+var_C2C]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_AEDBB:				; CODE XREF: sub_A3C30+B165j
					; sub_A3C30+B16Ej
		mov	ax, word ptr [bp+var_148+2]
		add	ax, 5
		cmp	ax, di
		jge	short loc_AEDE8
		mov	ax, word ptr [bp+var_148+2]
		add	ax, 0Ah
		cmp	ax, di
		jle	short loc_AEDE8
		mov	ax, word ptr [bp+var_140]
		mov	word ptr [bp+var_164], ax
		inc	word ptr [bp+var_140]
		mov	bx, word ptr [bp+var_13A]
		mov	ax, word ptr [bp+var_164]
		mov	[bx+1Bh], ax

loc_AEDE8:				; CODE XREF: sub_A3C30+B194j
					; sub_A3C30+B19Fj
		mov	ax, word ptr [bp+var_148+2]
		add	ax, 0Dh
		cmp	ax, di
		jge	short loc_AEE15
		mov	ax, word ptr [bp+var_148+2]
		add	ax, 12h
		cmp	ax, di
		jle	short loc_AEE15
		mov	ax, word ptr [bp+var_144+2]
		mov	[bp+var_166], ax
		inc	word ptr [bp+var_144+2]
		mov	bx, [bp+var_13C]
		mov	ax, [bp+var_166]
		mov	[bx+1Bh], ax

loc_AEE15:				; CODE XREF: sub_A3C30+B1C1j
					; sub_A3C30+B1CCj
		mov	ax, word ptr [bp+var_148]
		add	ax, 8
		cmp	ax, di
		jnz	short loc_AEE35
		cmp	[bp+var_14], 0
		jz	short loc_AEE35
		push	0FFFFh
		lea	ax, [bp+var_BF2]
		push	ax
		call	sub_83FE
		add	sp, 4

loc_AEE35:				; CODE XREF: sub_A3C30+B1EEj
					; sub_A3C30+B1F4j
		mov	ax, word ptr [bp+var_148]
		add	ax, 1Bh
		cmp	ax, di
		jnz	short loc_AEE6A
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AEE6A
		mov	ax, [bp+var_12]
		shl	ax, 4
		mov	dx, [bp+var_10]
		add	dx, ax
		push	dx
		push	0A0h ; '�'
		push	4
		push	26EFh
		lea	ax, [bp+var_C2C]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah

loc_AEE6A:				; CODE XREF: sub_A3C30+B20Ej
					; sub_A3C30+B217j
		mov	ax, word ptr [bp+var_148]
		add	ax, 19h
		cmp	ax, di
		jge	short loc_AEE97
		mov	ax, word ptr [bp+var_148]
		add	ax, 1Eh
		cmp	ax, di
		jle	short loc_AEE97
		dec	word ptr [bp+var_140]
		mov	ax, word ptr [bp+var_140]
		mov	word ptr [bp+var_16A+2], ax
		mov	bx, word ptr [bp+var_13A]
		mov	ax, word ptr [bp+var_16A+2]
		mov	[bx+1Bh], ax

loc_AEE97:				; CODE XREF: sub_A3C30+B243j
					; sub_A3C30+B24Ej
		mov	ax, word ptr [bp+var_148]
		add	ax, 20h	; ' '
		cmp	ax, di
		jge	short loc_AEECA
		mov	ax, word ptr [bp+var_148]
		add	ax, 29h	; ')'
		cmp	ax, di
		jle	short loc_AEECA
		test	di, 1
		jz	short loc_AEECA
		dec	word ptr [bp+var_144+2]
		mov	ax, word ptr [bp+var_144+2]
		mov	word ptr [bp+var_16A], ax
		mov	bx, [bp+var_13C]
		mov	ax, word ptr [bp+var_16A]
		mov	[bx+1Bh], ax

loc_AEECA:				; CODE XREF: sub_A3C30+B270j
					; sub_A3C30+B27Bj ...
		mov	ax, word ptr [bp+var_148]
		add	ax, 3Ch	; '<'
		cmp	ax, di
		jnz	short loc_AEF20
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AEF20
		mov	[bp+var_CA2], 11BCh
		mov	[bp+var_CA2], 11C8h
		mov	[bp+var_CA2], 11D8h
		mov	[bp+var_CA2], 11E8h
		mov	[bp+var_CA2], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CA2]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_AEF20:				; CODE XREF: sub_A3C30+B2A3j
					; sub_A3C30+B2ACj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AEF76
		mov	al, [bp+var_14]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AEF74
		mov	word ptr [bp+var_CB1+3], 11BCh
		mov	word ptr [bp+var_CB1+3], 11C8h
		mov	word ptr [bp+var_CB1+3], 11D8h
		mov	word ptr [bp+var_CB1+3], 11E8h
		mov	word ptr [bp+var_CB1+3], 11FCh
		lea	ax, [bp+var_C2A]
		push	ax
		push	0
		push	[bp+var_C0D]
		push	[bp+var_C0F]
		push	[bp+var_C11]
		push	[bp+var_C13]
		lea	ax, [bp+var_CB1+3]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_AEF74:				; CODE XREF: sub_A3C30+B300j
		jmp	short loc_AEFA3
; ���������������������������������������������������������������������������

loc_AEF76:				; CODE XREF: sub_A3C30+B2F7j
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_AEF83:				; CODE XREF: sub_A3C30:loc_AED20j
		mov	ax, [bp+var_C6B]
		cmp	ax, [bp+var_C]
		jnb	short loc_AEF93
		cmp	[bp+var_C69], 0
		jz	short loc_AEF98

loc_AEF93:				; CODE XREF: sub_A3C30+B35Aj
		mov	ax, 1
		jmp	short loc_AEF9A
; ���������������������������������������������������������������������������

loc_AEF98:				; CODE XREF: sub_A3C30+B361j
		xor	ax, ax

loc_AEF9A:				; CODE XREF: sub_A3C30+B366j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AEFA3
		jmp	loc_AED23
; ���������������������������������������������������������������������������

loc_AEFA3:				; CODE XREF: sub_A3C30:loc_AEF74j
					; sub_A3C30+B36Ej
		cmp	[bp+var_14], 0
		jz	short loc_AEFB6
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2

loc_AEFB6:				; CODE XREF: sub_A3C30+B377j
		cmp	byte ptr [bp+var_15C+1], 0
		jz	short loc_AEFDE
		cmp	[bp+var_160], 0
		jz	short loc_AEFDE
		push	0
		mov	al, byte ptr [bp+var_15C]
		push	ax
		lea	ax, [bp+var_160]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AEFDE:				; CODE XREF: sub_A3C30+B38Bj
					; sub_A3C30+B393j
		mov	[bp+var_160], 0
		mov	byte ptr [bp+var_15C+1], 0
		mov	[bp+var_15C+2],	0
		lea	ax, [bp+var_C98+2]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_C8D], 0
		jz	short loc_AF02A
		cmp	[bp+var_C92], 0
		jz	short loc_AF02A
		push	0
		mov	al, [bp+var_C8E]
		push	ax
		lea	ax, [bp+var_C92]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF02A:				; CODE XREF: sub_A3C30+B3D7j
					; sub_A3C30+B3DFj
		mov	[bp+var_C92], 0
		mov	[bp+var_C8D], 0
		mov	[bp+var_C8C], 0
		cmp	byte ptr [bp+var_14E+1], 0
		jz	short loc_AF069
		cmp	[bp+var_152], 0
		jz	short loc_AF069
		push	0
		mov	al, byte ptr [bp+var_14E]
		push	ax
		lea	ax, [bp+var_152]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF069:				; CODE XREF: sub_A3C30+B416j
					; sub_A3C30+B41Ej
		mov	[bp+var_152], 0
		mov	byte ptr [bp+var_14E+1], 0
		mov	[bp+var_14C], 0
		push	0
		lea	ax, [bp+var_C88]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aCredits	; "credits"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_23A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_D40]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_D40], 556h
		mov	dword ptr [bp-0CDFh], 100h
		mov	[bp+var_CE3], 0
		mov	[bp+var_D40], 56Eh
		push	1
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		mov	bx, [bp+var_D40]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large [dword_4571E]
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large [dword_45723]
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large [dword_45728]
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	eax, [bp+var_CCE]
		mov	[bp+var_158], eax
		push	1
		push	0
		push	2
		push	large [bp+var_158]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_15C+2], dx
		mov	word ptr [bp+var_15C], ax
		mov	eax, [bp+var_15C]
		mov	[bp+var_148], eax
		mov	byte ptr [bp+var_144], 2
		mov	byte ptr [bp+var_144+1], 1
		mov	[bp+var_144+2],	0
		mov	eax, [bp-158h]
		mov	[bp+var_144+2],	eax
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		push	word ptr [bp+var_148+2]
		push	word ptr [bp+var_148]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		mov	eax, [bp+var_CCA]
		mov	[bp+var_CDB], eax
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		push	0
		push	large [dword_4572D]
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large [dword_45732]
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	eax, [bp+var_CCE]
		mov	[bp+var_160], eax
		push	1
		push	0
		push	2
		push	large [bp+var_160]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_164+2], dx
		mov	word ptr [bp+var_164], ax
		mov	eax, [bp+var_164]
		mov	[bp+var_140+2],	eax
		mov	byte ptr [bp+var_13A], 2
		mov	byte ptr [bp+var_13A+1], 1
		mov	[bp+var_13A+2],	0
		mov	eax, [bp+var_160]
		mov	[bp+var_13A+2],	eax
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		push	[bp+var_13C]
		push	word ptr [bp+var_140+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_D40], 56Eh
		lea	ax, [bp+var_D40]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_D40]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	byte ptr [bp+var_14C], 0
		mov	byte ptr [bp+var_14C+1], 0
		mov	byte ptr [bp+var_14C+2], 0
		mov	word ptr [bp+var_152+3], 0
		lea	ax, [bp+var_148]
		push	ax
		lea	ax, [bp+var_152]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	word ptr [bp+var_152]
		mov	al, byte ptr [bp+var_152+2]
		push	ax
		lea	ax, [bp+var_152]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	100h
		push	0
		lea	ax, [bp+var_15C+2]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	word ptr [bp+var_15C+2]
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_15C+2]
		push	ax
		call	Palette_FillRange_2CF08
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp+var_15C+2]
		mov	al, byte ptr [bp+var_158]
		push	ax
		lea	ax, [bp+var_15C+2]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		lea	ax, [bp+var_15C+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_140+2]
		push	ax
		lea	ax, [bp+var_C7E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		push	0
		push	word_46F44
		lea	ax, [bp+var_C98]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	ax, word_46F46
		mov	[bp+var_154], ax
		push	[bp+var_154]
		lea	ax, [bp+var_C98+2]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		lea	ax, [bp+var_C7E]
		mov	[bp+var_C84], ax
		mov	[bp+var_C82], 2
		push	61h ; 'a'
		push	0A0h ; '�'
		lea	ax, [bp+var_C98]
		push	ax
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		push	2717h
		lea	ax, [bp+var_C98]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeFromColor_2D165
		add	sp, 0Ah
		call	Input_Flush_CDDC
		xor	eax, eax
		mov	[bp+var_158], eax
		mov	[bp+var_15C], eax
		mov	[bp+var_158], 12Ch
		mov	eax, dword_47ABB
		mov	[bp+var_15C], eax
		mov	byte ptr [bp+var_160+3], 0
		jmp	short loc_AF46F
; ���������������������������������������������������������������������������

loc_AF424:				; CODE XREF: sub_A3C30+B85Bj
					; sub_A3C30+B862j
		mov	byte ptr [bp+var_160+3], 0
		cmp	[bp+var_13], 0
		jz	short loc_AF464
		cmp	[bp+var_3CC], 0
		jz	short loc_AF457
		push	[bp+var_3CA]
		mov	bx, [bp+var_3CC]
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_AF453
		mov	ax, 1
		jmp	short loc_AF455
; ���������������������������������������������������������������������������

loc_AF453:				; CODE XREF: sub_A3C30+B81Cj
		xor	ax, ax

loc_AF455:				; CODE XREF: sub_A3C30+B821j
		jmp	short loc_AF459
; ���������������������������������������������������������������������������

loc_AF457:				; CODE XREF: sub_A3C30+B804j
		mov	al, 1

loc_AF459:				; CODE XREF: sub_A3C30:loc_AF455j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AF464
		mov	byte ptr [bp+var_160+3], 1

loc_AF464:				; CODE XREF: sub_A3C30+B7FDj
					; sub_A3C30+B82Dj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_AF46F
		jmp	short loc_AF494
; ���������������������������������������������������������������������������

loc_AF46F:				; CODE XREF: sub_A3C30+B7F2j
					; sub_A3C30+B83Bj
		mov	eax, [bp+var_15C]
		add	eax, [bp+var_158]
		cmp	eax, dword_47ABB
		ja	short loc_AF485
		mov	ax, 1
		jmp	short loc_AF487
; ���������������������������������������������������������������������������

loc_AF485:				; CODE XREF: sub_A3C30+B84Ej
		xor	ax, ax

loc_AF487:				; CODE XREF: sub_A3C30+B853j
		mov	ah, 0
		or	ax, ax
		jz	short loc_AF424
		cmp	byte ptr [bp+var_160+3], 0
		jnz	short loc_AF424

loc_AF494:				; CODE XREF: sub_A3C30+B83Dj
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_14C]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		lea	ax, [bp+var_C98+2]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C7E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		push	2
		lea	ax, [bp+var_152]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_144+1], 0
		jz	short loc_AF50D
		cmp	[bp+var_148], 0
		jz	short loc_AF50D
		push	0
		mov	al, byte ptr [bp+var_144]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF50D:				; CODE XREF: sub_A3C30+B8BAj
					; sub_A3C30+B8C2j
		mov	[bp+var_148], 0
		mov	byte ptr [bp+var_144+1], 0
		mov	[bp+var_144+2],	0
		cmp	byte ptr [bp+var_13A+1], 0
		jz	short loc_AF54C
		cmp	[bp+var_140+2],	0
		jz	short loc_AF54C
		push	0
		mov	al, byte ptr [bp+var_13A]
		push	ax
		lea	ax, [bp+var_140+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF54C:				; CODE XREF: sub_A3C30+B8F9j
					; sub_A3C30+B901j
		mov	[bp+var_140+2],	0
		mov	byte ptr [bp+var_13A+1], 0
		mov	[bp+var_13A+2],	0
		lea	ax, [bp+var_C64]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C44]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_119], 0
		jz	short loc_AF5A7
		cmp	[bp+var_11E], 0
		jz	short loc_AF5A7
		push	0
		mov	al, [bp+var_11A]
		push	ax
		lea	ax, [bp+var_11E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF5A7:				; CODE XREF: sub_A3C30+B954j
					; sub_A3C30+B95Cj
		mov	[bp+var_11E], 0
		mov	[bp+var_119], 0
		mov	[bp+var_118], 0
		lea	ax, [bp+var_C2A]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_C0A]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_FB], 0
		jz	short loc_AF602
		cmp	[bp+var_100], 0
		jz	short loc_AF602
		push	0
		mov	al, [bp+var_FC]
		push	ax
		lea	ax, [bp+var_100]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF602:				; CODE XREF: sub_A3C30+B9AFj
					; sub_A3C30+B9B7j
		mov	[bp+var_100], 0
		mov	[bp+var_FB], 0
		mov	[bp+var_FA], 0
		cmp	[bp+var_F1], 0
		jz	short loc_AF641
		cmp	[bp+var_F6], 0
		jz	short loc_AF641
		push	0
		mov	al, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_F6]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF641:				; CODE XREF: sub_A3C30+B9EEj
					; sub_A3C30+B9F6j
		mov	[bp+var_F6], 0
		mov	[bp+var_F1], 0
		mov	[bp+var_F0], 0
		cmp	[bp+var_E7], 0
		jz	short loc_AF680
		cmp	[bp+var_EC], 0
		jz	short loc_AF680
		push	0
		mov	al, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF680:				; CODE XREF: sub_A3C30+BA2Dj
					; sub_A3C30+BA35j
		mov	[bp+var_EC], 0
		mov	[bp+var_E7], 0
		mov	[bp+var_E6], 0
		cmp	[bp+var_DD], 0
		jz	short loc_AF6BF
		cmp	[bp+var_E2], 0
		jz	short loc_AF6BF
		push	0
		mov	al, [bp+var_DE]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF6BF:				; CODE XREF: sub_A3C30+BA6Cj
					; sub_A3C30+BA74j
		mov	[bp+var_E2], 0
		mov	[bp+var_DD], 0
		mov	[bp+var_DC], 0
		cmp	[bp+var_D3], 0
		jz	short loc_AF6FE
		cmp	[bp+var_D8], 0
		jz	short loc_AF6FE
		push	0
		mov	al, [bp+var_D4]
		push	ax
		lea	ax, [bp+var_D8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF6FE:				; CODE XREF: sub_A3C30+BAABj
					; sub_A3C30+BAB3j
		mov	[bp+var_D8], 0
		mov	[bp+var_D3], 0
		mov	[bp+var_D2], 0
		cmp	[bp+var_C9], 0
		jz	short loc_AF73D
		cmp	[bp+var_CE], 0
		jz	short loc_AF73D
		push	0
		mov	al, [bp+var_CA]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF73D:				; CODE XREF: sub_A3C30+BAEAj
					; sub_A3C30+BAF2j
		mov	[bp+var_CE], 0
		mov	[bp+var_C9], 0
		mov	[bp+var_C8], 0
		cmp	[bp+var_BF], 0
		jz	short loc_AF77C
		cmp	[bp+var_C4], 0
		jz	short loc_AF77C
		push	0
		mov	al, [bp+var_C0]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF77C:				; CODE XREF: sub_A3C30+BB29j
					; sub_A3C30+BB31j
		mov	[bp+var_C4], 0
		mov	[bp+var_BF], 0
		mov	[bp+var_BE], 0
		cmp	[bp+var_B5], 0
		jz	short loc_AF7BB
		cmp	[bp+var_BA], 0
		jz	short loc_AF7BB
		push	0
		mov	al, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF7BB:				; CODE XREF: sub_A3C30+BB68j
					; sub_A3C30+BB70j
		mov	[bp+var_BA], 0
		mov	[bp+var_B5], 0
		mov	[bp+var_B4], 0
		cmp	[bp+var_AB], 0
		jz	short loc_AF7FA
		cmp	[bp+var_B0], 0
		jz	short loc_AF7FA
		push	0
		mov	al, [bp+var_AC]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF7FA:				; CODE XREF: sub_A3C30+BBA7j
					; sub_A3C30+BBAFj
		mov	[bp+var_B0], 0
		mov	[bp+var_AB], 0
		mov	[bp+var_AA], 0
		push	2
		lea	ax, [bp+var_A6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9B], 0
		jz	short loc_AF848
		cmp	[bp+var_A0], 0
		jz	short loc_AF848
		push	0
		mov	al, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF848:				; CODE XREF: sub_A3C30+BBF5j
					; sub_A3C30+BBFDj
		mov	[bp+var_A0], 0
		mov	[bp+var_9B], 0
		mov	[bp+var_9A], 0
		push	2
		lea	ax, [bp+var_96]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_8B], 0
		jz	short loc_AF896
		cmp	[bp+var_90], 0
		jz	short loc_AF896
		push	0
		mov	al, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF896:				; CODE XREF: sub_A3C30+BC43j
					; sub_A3C30+BC4Bj
		mov	[bp+var_90], 0
		mov	[bp+var_8B], 0
		mov	[bp+var_8A], 0
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7B], 0
		jz	short loc_AF8E0
		cmp	[bp+var_80], 0
		jz	short loc_AF8E0
		push	0
		mov	al, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF8E0:				; CODE XREF: sub_A3C30+BC90j
					; sub_A3C30+BC97j
		mov	[bp+var_80], 0
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		push	2
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_6B], 0
		jz	short loc_AF926
		cmp	[bp+var_70], 0
		jz	short loc_AF926
		push	0
		mov	al, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF926:				; CODE XREF: sub_A3C30+BCD6j
					; sub_A3C30+BCDDj
		mov	[bp+var_70], 0
		mov	[bp+var_6B], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_5B], 0
		jz	short loc_AF96C
		cmp	[bp+var_60], 0
		jz	short loc_AF96C
		push	0
		mov	al, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF96C:				; CODE XREF: sub_A3C30+BD1Cj
					; sub_A3C30+BD23j
		mov	[bp+var_60], 0
		mov	[bp+var_5B], 0
		mov	[bp+var_5A], 0
		push	2
		lea	ax, [bp+var_56]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_4B], 0
		jz	short loc_AF9B2
		cmp	[bp+var_50], 0
		jz	short loc_AF9B2
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF9B2:				; CODE XREF: sub_A3C30+BD62j
					; sub_A3C30+BD69j
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_AF9EA
		cmp	[bp+var_46], 0
		jz	short loc_AF9EA
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AF9EA:				; CODE XREF: sub_A3C30+BD9Aj
					; sub_A3C30+BDA1j
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		cmp	[bp+var_37], 0
		jz	short loc_AFA22
		cmp	[bp+var_3C], 0
		jz	short loc_AFA22
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AFA22:				; CODE XREF: sub_A3C30+BDD2j
					; sub_A3C30+BDD9j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		mov	[bp+var_BF2], 185Fh
		lea	ax, [bp+var_BF2]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	[bp+var_BDD], 0
		jz	short loc_AFA71
		cmp	[bp+var_BE2], 0
		jz	short loc_AFA71
		push	0
		mov	al, [bp+var_BDE]
		push	ax
		lea	ax, [bp+var_BE2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AFA71:				; CODE XREF: sub_A3C30+BE1Ej
					; sub_A3C30+BE26j
		mov	[bp+var_BE2], 0
		mov	[bp+var_BDD], 0
		mov	[bp+var_BDC], 0
		lea	ax, [bp+var_3CC]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	[bp+var_3C3], 0
		jz	short loc_AFABD
		cmp	[bp+var_3C8], 0
		jz	short loc_AFABD
		push	0
		mov	al, [bp+var_3C4]
		push	ax
		lea	ax, [bp+var_3C8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AFABD:				; CODE XREF: sub_A3C30+BE6Aj
					; sub_A3C30+BE72j
		mov	[bp+var_3C8], 0
		mov	[bp+var_3C3], 0
		mov	[bp+var_3C2], 0
		push	2
		lea	ax, [bp+var_3BE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_AFB07
		cmp	[bp+var_30], 0
		jz	short loc_AFB07
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_AFB07:				; CODE XREF: sub_A3C30+BEB7j
					; sub_A3C30+BEBEj
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	2
		lea	ax, [bp+var_346]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_2CE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_256]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_248]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_A3C30	endp

ovr207		ends
