ovr190		segment	para public 'OVERLAY' use16
		assume cs:ovr190
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_552E0	proc far		; CODE XREF: sub_42124J sub_55BDC+7Fp

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	16h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_55305
		jmp	loc_5541B
; ���������������������������������������������������������������������������

loc_55305:				; CODE XREF: sub_552E0+20j
		mov	bx, [bp+var_6]
		mov	word ptr [bx], 5CEh
		mov	bx, [bp+var_6]
		mov	word ptr [bx+2], 0
		mov	bx, [bp+var_6]
		mov	word ptr [bx], 0EC7h
		mov	bx, [bp+var_6]
		mov	dword ptr [bx+4], 0
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+8], 2
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+9], 0
		mov	bx, [bp+var_6]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_6]
		mov	si, [bp+var_4]
		mov	ax, [si]
		mov	[bx+0Eh], ax
		mov	bx, [bp+var_6]
		mov	si, [bp+var_4]
		mov	ax, [si+2]
		mov	[bx+10h], ax
		mov	bx, [bp+var_6]
		mov	si, [bp+var_4]
		mov	ax, [si+4]
		mov	[bx+12h], ax
		mov	bx, [bp+var_6]
		mov	si, [bp+var_4]
		mov	ax, [si+6]
		mov	[bx+14h], ax
		mov	bx, [bp+var_6]
		mov	ax, [bx+12h]
		mov	bx, [bp+var_6]
		sub	ax, [bx+0Eh]
		inc	ax
		mov	bx, [bp+var_6]
		mov	dx, [bx+14h]
		mov	bx, [bp+var_6]
		sub	dx, [bx+10h]
		inc	dx
		imul	dx
		movsx	eax, ax
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	2
		push	large [bp+var_E]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	bx, [bp+var_6]
		mov	eax, [bp+var_12]
		mov	[bx+4],	eax
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+8], 2
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+9], 1
		mov	bx, [bp+var_6]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_6]
		mov	eax, [bp+var_E]
		mov	[bx+0Ah], eax
		mov	ax, [bp+var_6]
		add	ax, 0Eh
		push	ax
		push	0
		mov	bx, [bp+var_6]
		mov	al, [bx+8]
		push	ax
		mov	bx, [bp+var_6]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegionVariant_33ABC
		add	sp, 8
		mov	ax, [bp+var_6]
		jmp	short loc_5541E
; ���������������������������������������������������������������������������

loc_5541B:				; CODE XREF: sub_552E0+22j
		mov	ax, [bp+var_6]

loc_5541E:				; CODE XREF: sub_552E0+139j
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	di
		call	sub_2FDCC
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_552E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_55431	proc far		; CODE XREF: sub_42129J sub_55C7B+Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+2]
		or	di, di
		jz	short loc_55479
		mov	ax, di
		add	ax, 0Eh
		push	ax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegion_334A0
		add	sp, 8
		push	0
		push	word ptr [si+2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6

loc_55479:				; CODE XREF: sub_55431+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_55431	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5547D	proc far		; CODE XREF: sub_42160J sub_597B2+69p

var_1CA		= word ptr -1CAh
var_17A		= dword	ptr -17Ah
var_176		= byte ptr -176h
var_175		= byte ptr -175h
var_174		= dword	ptr -174h
var_170		= word ptr -170h
var_158		= word ptr -158h
var_148		= word ptr -148h
var_146		= word ptr -146h
var_144		= word ptr -144h
var_140		= word ptr -140h
var_13E		= word ptr -13Eh
var_13C		= word ptr -13Ch
var_13A		= word ptr -13Ah
var_138		= word ptr -138h
var_136		= word ptr -136h
var_132		= word ptr -132h
var_BA		= word ptr -0BAh
var_69		= byte ptr -69h
var_68		= dword	ptr -68h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_5F		= byte ptr -5Fh
var_5E		= dword	ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_55		= byte ptr -55h
var_54		= dword	ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4B		= byte ptr -4Bh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_43		= byte ptr -43h
var_42		= byte ptr -42h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_11		= word ptr -11h
var_E		= dword	ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1CAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	1
		push	0CCBh
		lea	ax, [bp+var_132]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	[bp+var_140], 0
		mov	[bp+var_13E], 0
		mov	[bp+var_13C], 0
		mov	[bp+var_13A], 0
		mov	[bp+var_138], 13Fh
		mov	[bp+var_136], 0C7h ; '�'
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp+var_140]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, [bp+var_E]
		push	ax
		push	7
		lea	ax, [bp+var_132]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_11], 0
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
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
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, [bp+var_24]
		push	ax
		push	6
		lea	ax, [bp+var_132]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	3
		lea	ax, [bp+var_2E]
		push	ax
		push	1
		lea	ax, [bp+var_132]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset unk_43D0B
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_BA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_BA]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_32+2],	dx
		mov	word ptr [bp+var_32], ax
		mov	eax, [bp+var_32]
		mov	[si+1Eh], eax
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 1
		mov	dword ptr [si+24h], 0
		mov	[bp+var_3C], 0
		mov	[bp+var_38], 2
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aBwfont	; "bwfont"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_BA]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_BA]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_40+2],	dx
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], 2
		mov	[bp+var_37], 1
		mov	[bp+var_36], 0
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_148], 1
		mov	[bp+var_146], 0
		mov	[bp+var_144], 3
		lea	ax, [bp+var_158]
		push	ax
		push	word_46F46
		call	sub_11233
		add	sp, 4
		mov	word ptr [si+28h], 0

loc_556A3:				; CODE XREF: sub_5547D+60Cj
		push	0
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_46F44
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_2A]
		push	ax
		push	word ptr [bp+var_2E+2]
		push	word ptr [bp+var_2E]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	3
		push	4
		push	word_46F44
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		push	word_46F46
		push	word_46F44
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4
		push	2Ah ; '*'
		push	134h
		push	99h ; '�'
		push	6
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_46], ax
		mov	bx, [bp+var_46]
		mov	eax, [bx]
		mov	[bp+var_4A], eax
		mov	bx, [bp+var_46]
		mov	al, [bx+4]
		mov	[bp+var_4B], al
		mov	eax, [bp+var_4A]
		mov	[bp+var_17A], eax
		mov	al, [bp+var_4B]
		mov	[bp+var_176], al
		mov	[bp+var_175], 0
		mov	[bp+var_174], 0
		mov	bx, [bp+var_46]
		mov	eax, [bx+6]
		mov	[bp+var_174], eax
		mov	[bp+var_170], 0
		mov	[bp+var_4E], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_50], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5578D
		jmp	loc_55817
; ���������������������������������������������������������������������������

loc_5578D:				; CODE XREF: sub_5547D+30Bj
		push	0Ch
		push	88h ; '�'
		push	9
		push	10h
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_50]
		mov	eax, [bx]
		mov	[bp+var_54], eax
		mov	bx, [bp+var_50]
		mov	al, [bx+4]
		mov	[bp+var_55], al
		mov	eax, [bp+var_54]
		mov	[di+1Eh], eax
		mov	al, [bp+var_55]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_50]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 1
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_4E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 2
		mov	ax, di
		jmp	short loc_55819
; ���������������������������������������������������������������������������

loc_55817:				; CODE XREF: sub_5547D+30Dj
		mov	ax, di

loc_55819:				; CODE XREF: sub_5547D+398j
		push	ax
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_58], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5A], ax
		or	ax, ax
		jnz	short loc_55845
		jmp	loc_55903
; ���������������������������������������������������������������������������

loc_55845:				; CODE XREF: sub_5547D+3C3j
		push	0Ch
		push	88h ; '�'
		push	9
		push	9Bh ; '�'
		push	[bp+var_5A]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_5A]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_5A]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_5A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_5A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_58]
		mov	eax, [bx]
		mov	[bp+var_5E], eax
		mov	bx, [bp+var_58]
		mov	al, [bx+4]
		mov	[bp+var_5F], al
		mov	bx, [bp+var_5A]
		mov	eax, [bp+var_5E]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_5A]
		mov	al, [bp+var_5F]
		mov	[bx+22h], al
		mov	bx, [bp+var_5A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_5A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_58]
		mov	eax, [bx+6]
		mov	bx, [bp+var_5A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+28h], 3
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_4E]
		mov	bx, [bp+var_5A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Ch], 1
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Eh], 4
		mov	ax, [bp+var_5A]
		jmp	short loc_55906
; ���������������������������������������������������������������������������

loc_55903:				; CODE XREF: sub_5547D+3C5j
		mov	ax, [bp+var_5A]

loc_55906:				; CODE XREF: sub_5547D+484j
		push	ax
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_62], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_64], ax
		or	ax, ax
		jnz	short loc_55932
		jmp	loc_559EF
; ���������������������������������������������������������������������������

loc_55932:				; CODE XREF: sub_5547D+4B0j
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	9Bh ; '�'
		push	[bp+var_64]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_64]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_64]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_64]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_64]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_62]
		mov	eax, [bx]
		mov	[bp+var_68], eax
		mov	bx, [bp+var_62]
		mov	al, [bx+4]
		mov	[bp+var_69], al
		mov	bx, [bp+var_64]
		mov	eax, [bp+var_68]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_64]
		mov	al, [bp+var_69]
		mov	[bx+22h], al
		mov	bx, [bp+var_64]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_64]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_62]
		mov	eax, [bx+6]
		mov	bx, [bp+var_64]
		mov	[bx+24h], eax
		mov	bx, [bp+var_64]
		mov	word ptr [bx+28h], 5
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_4E]
		mov	bx, [bp+var_64]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Eh], 6
		mov	ax, [bp+var_64]
		jmp	short loc_559F2
; ���������������������������������������������������������������������������

loc_559EF:				; CODE XREF: sub_5547D+4B2j
		mov	ax, [bp+var_64]

loc_559F2:				; CODE XREF: sub_5547D+570j
		push	ax
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_55A1E
; ���������������������������������������������������������������������������

loc_55A0F:				; CODE XREF: sub_5547D+5A5j
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_55A1E:				; CODE XREF: sub_5547D+590j
		cmp	[bp+var_4E], 0
		jz	short loc_55A0F
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_DFCA
		add	sp, 2
		cmp	[bp+var_4E], 0FFFFh
		jnz	short loc_55A4E
		mov	[bp+var_42], 1
		push	2
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_DC89
		add	sp, 4
		jmp	short loc_55A8C
; ���������������������������������������������������������������������������
		jmp	short loc_55A74
; ���������������������������������������������������������������������������

loc_55A4E:				; CODE XREF: sub_5547D+5B8j
		mov	ax, [bp+var_4E]
		mov	[si+28h], ax
		cmp	word ptr [si+28h], 1
		jnz	short loc_55A68
		push	si
		nop
		push	cs
		call	near ptr sub_58E2A
		add	sp, 2
		mov	[bp+var_42], al
		jmp	short loc_55A74
; ���������������������������������������������������������������������������

loc_55A68:				; CODE XREF: sub_5547D+5DBj
		push	si
		nop
		push	cs
		call	near ptr sub_58E74
		add	sp, 2
		mov	[bp+var_42], al

loc_55A74:				; CODE XREF: sub_5547D+5CFj
					; sub_5547D+5E9j
		push	2
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_42], 0
		jnz	short loc_55A8C
		jmp	loc_556A3
; ���������������������������������������������������������������������������

loc_55A8C:				; CODE XREF: sub_5547D+5CDj
					; sub_5547D+60Aj
		cmp	[bp+var_42], 2
		jnz	short loc_55A97
		mov	ax, 1
		jmp	short loc_55A99
; ���������������������������������������������������������������������������

loc_55A97:				; CODE XREF: sub_5547D+613j
		xor	ax, ax

loc_55A99:				; CODE XREF: sub_5547D+618j
		mov	[bp+var_43], al
		push	2
		lea	ax, [bp+var_158]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_37], 0
		jz	short loc_55ACF
		cmp	[bp+var_3C], 0
		jz	short loc_55ACF
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_55ACF:				; CODE XREF: sub_5547D+632j
					; sub_5547D+639j
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_29], 0
		jz	short loc_55B07
		cmp	[bp+var_2E], 0
		jz	short loc_55B07
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_55B07:				; CODE XREF: sub_5547D+66Aj
					; sub_5547D+671j
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		cmp	[bp+var_1F], 0
		jz	short loc_55B3F
		cmp	[bp+var_24], 0
		jz	short loc_55B3F
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_55B3F:				; CODE XREF: sub_5547D+6A2j
					; sub_5547D+6A9j
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_9], 0
		jz	short loc_55B93
		cmp	[bp+var_E], 0
		jz	short loc_55B93
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_55B93:				; CODE XREF: sub_5547D+6F6j
					; sub_5547D+6FDj
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp+var_140]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_132]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		mov	al, [bp+var_43]
		pop	di
		pop	si
		leave
		retf
sub_5547D	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_55BDC	proc far		; CODE XREF: sub_42156J sub_55C92+21p	...

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
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
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	[bp+var_4], di
		push	[bp+arg_6]
		call	sub_112C4
		add	sp, 2
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_6], dx
		push	word_45B52
		mov	bx, word_45B52
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		add	sp, 2
		mov	dx, di
		add	dx, ax
		add	dx, 3
		mov	[bp+var_8], dx
		mov	ax, [bp+var_2]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_12]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_16]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_A], ax
		lea	ax, [bp+var_10]
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr sub_552E0
		add	sp, 4
		push	word_45B54
		push	0FFh
		push	[bp+arg_6]
		push	di
		push	[bp+arg_2]
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		pop	di
		pop	si
		leave
		retf
sub_55BDC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_55C7B	proc far		; CODE XREF: sub_4215BJ sub_55C92+632p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr sub_55431
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_55C7B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_55C92	proc far		; CODE XREF: sub_42147J
					; sub_56B04+14AAp ...

var_C6		= word ptr -0C6h
var_76		= dword	ptr -76h
var_72		= byte ptr -72h
var_71		= byte ptr -71h
var_70		= dword	ptr -70h
var_6C		= word ptr -6Ch
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_49		= byte ptr -49h
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3F		= byte ptr -3Fh
var_3E		= dword	ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_35		= byte ptr -35h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2B		= byte ptr -2Bh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0C6h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_55C9E:				; CODE XREF: sub_55C92+6C6j
		mov	[bp+var_4], 5
		mov	[bp+var_6], 67h	; 'g'
		push	0CF5h
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		push	0D00h
		call	sub_112C4
		add	sp, 2
		add	[bp+var_4], ax
		push	2Ah ; '*'
		push	134h
		push	99h ; '�'
		push	6
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		mov	bx, [bp+var_8]
		mov	al, [bx+4]
		mov	[bp+var_D], al
		mov	eax, [bp+var_C]
		mov	[bp+var_76], eax
		mov	al, [bp+var_D]
		mov	[bp+var_72], al
		mov	[bp+var_71], 0
		mov	[bp+var_70], 0
		mov	bx, [bp+var_8]
		mov	eax, [bx+6]
		mov	[bp+var_70], eax
		mov	[bp+var_6C], 44h ; 'D'
		mov	[bp+var_58], 0
		mov	[bp+var_56], 1
		mov	[bp+var_10], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_12], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_55D4F
		jmp	loc_55DD8
; ���������������������������������������������������������������������������

loc_55D4F:				; CODE XREF: sub_55C92+B8j
		push	0Ch
		push	41h ; 'A'
		push	9
		push	13h
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	[bp+var_16], eax
		mov	bx, [bp+var_12]
		mov	al, [bx+4]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	[di+1Eh], eax
		mov	al, [bp+var_17]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_12]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 45h ; 'E'
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 46h ; 'F'
		mov	ax, di
		jmp	short loc_55DDA
; ���������������������������������������������������������������������������

loc_55DD8:				; CODE XREF: sub_55C92+BAj
		mov	ax, di

loc_55DDA:				; CODE XREF: sub_55C92+144j
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1C], ax
		or	ax, ax
		jnz	short loc_55E06
		jmp	loc_55EC2
; ���������������������������������������������������������������������������

loc_55E06:				; CODE XREF: sub_55C92+16Fj
		push	0Ch
		push	41h ; 'A'
		push	9
		push	57h ; 'W'
		push	[bp+var_1C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	bx, [bp+var_1A]
		mov	al, [bx+4]
		mov	[bp+var_21], al
		mov	bx, [bp+var_1C]
		mov	eax, [bp+var_20]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_1C]
		mov	al, [bp+var_21]
		mov	[bx+22h], al
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1A]
		mov	eax, [bx+6]
		mov	bx, [bp+var_1C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+28h], 47h ; 'G'
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_1C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Eh], 48h ; 'H'
		mov	ax, [bp+var_1C]
		jmp	short loc_55EC5
; ���������������������������������������������������������������������������

loc_55EC2:				; CODE XREF: sub_55C92+171j
		mov	ax, [bp+var_1C]

loc_55EC5:				; CODE XREF: sub_55C92+22Ej
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_24], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_26], ax
		or	ax, ax
		jnz	short loc_55EF1
		jmp	loc_55FAE
; ���������������������������������������������������������������������������

loc_55EF1:				; CODE XREF: sub_55C92+25Aj
		push	0Ch
		push	41h ; 'A'
		push	9
		push	9Bh ; '�'
		push	[bp+var_26]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_24]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_24]
		mov	al, [bx+4]
		mov	[bp+var_2B], al
		mov	bx, [bp+var_26]
		mov	eax, [bp+var_2A]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_26]
		mov	al, [bp+var_2B]
		mov	[bx+22h], al
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_24]
		mov	eax, [bx+6]
		mov	bx, [bp+var_26]
		mov	[bx+24h], eax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+28h], 49h ; 'I'
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_26]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Eh], 4Ah ; 'J'
		mov	ax, [bp+var_26]
		jmp	short loc_55FB1
; ���������������������������������������������������������������������������

loc_55FAE:				; CODE XREF: sub_55C92+25Cj
		mov	ax, [bp+var_26]

loc_55FB1:				; CODE XREF: sub_55C92+31Aj
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_30], ax
		or	ax, ax
		jnz	short loc_55FDD
		jmp	loc_5609A
; ���������������������������������������������������������������������������

loc_55FDD:				; CODE XREF: sub_55C92+346j
		push	0Ch
		push	41h ; 'A'
		push	9
		push	0DFh ; '�'
		push	[bp+var_30]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2E]
		mov	eax, [bx]
		mov	[bp+var_34], eax
		mov	bx, [bp+var_2E]
		mov	al, [bx+4]
		mov	[bp+var_35], al
		mov	bx, [bp+var_30]
		mov	eax, [bp+var_34]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_30]
		mov	al, [bp+var_35]
		mov	[bx+22h], al
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2E]
		mov	eax, [bx+6]
		mov	bx, [bp+var_30]
		mov	[bx+24h], eax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+28h], 4Bh ; 'K'
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_30]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Eh], 4Ch ; 'L'
		mov	ax, [bp+var_30]
		jmp	short loc_5609D
; ���������������������������������������������������������������������������

loc_5609A:				; CODE XREF: sub_55C92+348j
		mov	ax, [bp+var_30]

loc_5609D:				; CODE XREF: sub_55C92+406j
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_38], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_3A], ax
		or	ax, ax
		jnz	short loc_560C9
		jmp	loc_56185
; ���������������������������������������������������������������������������

loc_560C9:				; CODE XREF: sub_55C92+432j
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	57h ; 'W'
		push	[bp+var_3A]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_3A]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_3A]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_3A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_3A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx]
		mov	[bp+var_3E], eax
		mov	bx, [bp+var_38]
		mov	al, [bx+4]
		mov	[bp+var_3F], al
		mov	bx, [bp+var_3A]
		mov	eax, [bp+var_3E]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_3A]
		mov	al, [bp+var_3F]
		mov	[bx+22h], al
		mov	bx, [bp+var_3A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_3A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx+6]
		mov	bx, [bp+var_3A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+28h], 4Dh ; 'M'
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_3A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Eh], 4Eh ; 'N'
		mov	ax, [bp+var_3A]
		jmp	short loc_56188
; ���������������������������������������������������������������������������

loc_56185:				; CODE XREF: sub_55C92+434j
		mov	ax, [bp+var_3A]

loc_56188:				; CODE XREF: sub_55C92+4F1j
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_42], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_44], ax
		or	ax, ax
		jnz	short loc_561B4
		jmp	loc_56271
; ���������������������������������������������������������������������������

loc_561B4:				; CODE XREF: sub_55C92+51Dj
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	9Bh ; '�'
		push	[bp+var_44]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_44]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_44]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_44]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_44]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_44]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_42]
		mov	eax, [bx]
		mov	[bp+var_48], eax
		mov	bx, [bp+var_42]
		mov	al, [bx+4]
		mov	[bp+var_49], al
		mov	bx, [bp+var_44]
		mov	eax, [bp+var_48]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_44]
		mov	al, [bp+var_49]
		mov	[bx+22h], al
		mov	bx, [bp+var_44]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_44]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_42]
		mov	eax, [bx+6]
		mov	bx, [bp+var_44]
		mov	[bx+24h], eax
		mov	bx, [bp+var_44]
		mov	word ptr [bx+28h], 4Fh ; 'O'
		mov	bx, [bp+var_44]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_44]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_44]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_44]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_44]
		mov	word ptr [bx+2Eh], 50h ; 'P'
		mov	ax, [bp+var_44]
		jmp	short loc_56274
; ���������������������������������������������������������������������������

loc_56271:				; CODE XREF: sub_55C92+51Fj
		mov	ax, [bp+var_44]

loc_56274:				; CODE XREF: sub_55C92+5DDj
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_562A0
; ���������������������������������������������������������������������������

loc_56291:				; CODE XREF: sub_55C92+612j
		push	1
		lea	ax, [bp+var_C6]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_562A0:				; CODE XREF: sub_55C92+5FDj
		cmp	[bp+var_10], 0
		jz	short loc_56291
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_DFCA
		add	sp, 2
		mov	ax, [bp+var_10]
		cmp	ax, 0FFFEh
		jz	short loc_562E7
		cmp	ax, 0FFFFh
		jz	short loc_562C2
		jmp	short loc_562FC
; ���������������������������������������������������������������������������

loc_562C2:				; CODE XREF: sub_55C92+62Cj
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_562E7:				; CODE XREF: sub_55C92+627j
		push	2
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_562FC:				; CODE XREF: sub_55C92+62Ej
		movsx	eax, [bp+var_10]
		imul	eax, 2710h
		add	eax, 0FFFFEC78h
		mov	[si], eax
		push	large dword ptr	[si]
		push	0D0Bh
		lea	ax, [bp+var_54]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_54]
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		jmp	short $+2
		push	si
		nop
		push	cs
		call	near ptr sub_584BD
		add	sp, 2
		mov	[bp+var_2], al
		push	2
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_5635B
		jmp	loc_55C9E
; ���������������������������������������������������������������������������

loc_5635B:				; CODE XREF: sub_55C92+6C4j
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_55C92	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_56366	proc far		; CODE XREF: sub_42138J sub_57FDA+48Dp ...

var_D0		= word ptr -0D0h
var_80		= dword	ptr -80h
var_7C		= byte ptr -7Ch
var_7B		= byte ptr -7Bh
var_7A		= dword	ptr -7Ah
var_76		= word ptr -76h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_4F		= byte ptr -4Fh
var_4E		= dword	ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3B		= byte ptr -3Bh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_27		= byte ptr -27h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D0h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_56372:				; CODE XREF: sub_56366+790j
		push	2Ah ; '*'
		push	134h
		push	99h ; '�'
		push	6
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		mov	[bp+var_9], al
		mov	eax, [bp+var_8]
		mov	[bp+var_80], eax
		mov	al, [bp+var_9]
		mov	[bp+var_7C], al
		mov	[bp+var_7B], 0
		mov	[bp+var_7A], 0
		mov	bx, [bp+var_4]
		mov	eax, [bx+6]
		mov	[bp+var_7A], eax
		mov	[bp+var_76], 7
		mov	[bp+var_C], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_563F0
		jmp	loc_56479
; ���������������������������������������������������������������������������

loc_563F0:				; CODE XREF: sub_56366+85j
		push	0Ch
		push	0Eh
		push	9
		push	71h ; 'q'
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	bx, [bp+var_E]
		mov	al, [bx+4]
		mov	[bp+var_13], al
		mov	eax, [bp+var_12]
		mov	[di+1Eh], eax
		mov	al, [bp+var_13]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 8
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 9
		mov	ax, di
		jmp	short loc_5647B
; ���������������������������������������������������������������������������

loc_56479:				; CODE XREF: sub_56366+87j
		mov	ax, di

loc_5647B:				; CODE XREF: sub_56366+111j
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_16], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18], ax
		or	ax, ax
		jnz	short loc_564A7
		jmp	loc_56564
; ���������������������������������������������������������������������������

loc_564A7:				; CODE XREF: sub_56366+13Cj
		push	0Ch
		push	0Eh
		push	9
		push	82h ; '�'
		push	[bp+var_18]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_16]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	bx, [bp+var_16]
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	bx, [bp+var_18]
		mov	eax, [bp+var_1C]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_18]
		mov	al, [bp+var_1D]
		mov	[bx+22h], al
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_16]
		mov	eax, [bx+6]
		mov	bx, [bp+var_18]
		mov	[bx+24h], eax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+28h], 0Ah
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_18]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Eh], 0Bh
		mov	ax, [bp+var_18]
		jmp	short loc_56567
; ���������������������������������������������������������������������������

loc_56564:				; CODE XREF: sub_56366+13Ej
		mov	ax, [bp+var_18]

loc_56567:				; CODE XREF: sub_56366+1FCj
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_20], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_22], ax
		or	ax, ax
		jnz	short loc_56593
		jmp	loc_56650
; ���������������������������������������������������������������������������

loc_56593:				; CODE XREF: sub_56366+228j
		push	0Ch
		push	0Eh
		push	9
		push	93h ; '�'
		push	[bp+var_22]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_22]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_22]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_22]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_22]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_26], eax
		mov	bx, [bp+var_20]
		mov	al, [bx+4]
		mov	[bp+var_27], al
		mov	bx, [bp+var_22]
		mov	eax, [bp+var_26]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_22]
		mov	al, [bp+var_27]
		mov	[bx+22h], al
		mov	bx, [bp+var_22]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_22]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx+6]
		mov	bx, [bp+var_22]
		mov	[bx+24h], eax
		mov	bx, [bp+var_22]
		mov	word ptr [bx+28h], 0Ch
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_22]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Eh], 0Dh
		mov	ax, [bp+var_22]
		jmp	short loc_56653
; ���������������������������������������������������������������������������

loc_56650:				; CODE XREF: sub_56366+22Aj
		mov	ax, [bp+var_22]

loc_56653:				; CODE XREF: sub_56366+2E8j
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2C], ax
		or	ax, ax
		jnz	short loc_5667F
		jmp	loc_5673C
; ���������������������������������������������������������������������������

loc_5667F:				; CODE XREF: sub_56366+314j
		push	0Ch
		push	0Eh
		push	9
		push	0A4h ; '�'
		push	[bp+var_2C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_2C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_2C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_2C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_2C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2A]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	bx, [bp+var_2A]
		mov	al, [bx+4]
		mov	[bp+var_31], al
		mov	bx, [bp+var_2C]
		mov	eax, [bp+var_30]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_2C]
		mov	al, [bp+var_31]
		mov	[bx+22h], al
		mov	bx, [bp+var_2C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_2C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2A]
		mov	eax, [bx+6]
		mov	bx, [bp+var_2C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+28h], 0Eh
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_2C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Eh], 0Fh
		mov	ax, [bp+var_2C]
		jmp	short loc_5673F
; ���������������������������������������������������������������������������

loc_5673C:				; CODE XREF: sub_56366+316j
		mov	ax, [bp+var_2C]

loc_5673F:				; CODE XREF: sub_56366+3D4j
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_34], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_36], ax
		or	ax, ax
		jnz	short loc_5676B
		jmp	loc_56828
; ���������������������������������������������������������������������������

loc_5676B:				; CODE XREF: sub_56366+400j
		push	0Ch
		push	0Eh
		push	9
		push	0B5h ; '�'
		push	[bp+var_36]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_36]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_36]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_36]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_36]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_36]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_34]
		mov	eax, [bx]
		mov	[bp+var_3A], eax
		mov	bx, [bp+var_34]
		mov	al, [bx+4]
		mov	[bp+var_3B], al
		mov	bx, [bp+var_36]
		mov	eax, [bp+var_3A]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_36]
		mov	al, [bp+var_3B]
		mov	[bx+22h], al
		mov	bx, [bp+var_36]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_36]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_34]
		mov	eax, [bx+6]
		mov	bx, [bp+var_36]
		mov	[bx+24h], eax
		mov	bx, [bp+var_36]
		mov	word ptr [bx+28h], 10h
		mov	bx, [bp+var_36]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_36]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_36]
		mov	word ptr [bx+2Ch], 5
		mov	bx, [bp+var_36]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_36]
		mov	word ptr [bx+2Eh], 11h
		mov	ax, [bp+var_36]
		jmp	short loc_5682B
; ���������������������������������������������������������������������������

loc_56828:				; CODE XREF: sub_56366+402j
		mov	ax, [bp+var_36]

loc_5682B:				; CODE XREF: sub_56366+4C0j
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_3E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_40], ax
		or	ax, ax
		jnz	short loc_56857
		jmp	loc_56913
; ���������������������������������������������������������������������������

loc_56857:				; CODE XREF: sub_56366+4ECj
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	57h ; 'W'
		push	[bp+var_40]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_40]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_40]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_40]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_40]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_3E]
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	bx, [bp+var_3E]
		mov	al, [bx+4]
		mov	[bp+var_45], al
		mov	bx, [bp+var_40]
		mov	eax, [bp+var_44]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_40]
		mov	al, [bp+var_45]
		mov	[bx+22h], al
		mov	bx, [bp+var_40]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_40]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_3E]
		mov	eax, [bx+6]
		mov	bx, [bp+var_40]
		mov	[bx+24h], eax
		mov	bx, [bp+var_40]
		mov	word ptr [bx+28h], 12h
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_40]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_40]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_40]
		mov	word ptr [bx+2Eh], 13h
		mov	ax, [bp+var_40]
		jmp	short loc_56916
; ���������������������������������������������������������������������������

loc_56913:				; CODE XREF: sub_56366+4EEj
		mov	ax, [bp+var_40]

loc_56916:				; CODE XREF: sub_56366+5ABj
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_48], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_4A], ax
		or	ax, ax
		jnz	short loc_56942
		jmp	loc_569FF
; ���������������������������������������������������������������������������

loc_56942:				; CODE XREF: sub_56366+5D7j
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	9Bh ; '�'
		push	[bp+var_4A]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_4A]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_4A]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_4A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_4A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx]
		mov	[bp+var_4E], eax
		mov	bx, [bp+var_48]
		mov	al, [bx+4]
		mov	[bp+var_4F], al
		mov	bx, [bp+var_4A]
		mov	eax, [bp+var_4E]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_4A]
		mov	al, [bp+var_4F]
		mov	[bx+22h], al
		mov	bx, [bp+var_4A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_4A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx+6]
		mov	bx, [bp+var_4A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+28h], 14h
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_4A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+2Eh], 15h
		mov	ax, [bp+var_4A]
		jmp	short loc_56A02
; ���������������������������������������������������������������������������

loc_569FF:				; CODE XREF: sub_56366+5D9j
		mov	ax, [bp+var_4A]

loc_56A02:				; CODE XREF: sub_56366+697j
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_56A2E
; ���������������������������������������������������������������������������

loc_56A1F:				; CODE XREF: sub_56366+6CCj
		push	1
		lea	ax, [bp+var_D0]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_56A2E:				; CODE XREF: sub_56366+6B7j
		cmp	[bp+var_C], 0
		jz	short loc_56A1F
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_DFCA
		add	sp, 2
		mov	ax, [bp+var_C]
		cmp	ax, 0FFFEh
		jz	short loc_56A76
		cmp	ax, 0FFFFh
		jz	short loc_56A50
		jmp	short loc_56A8B
; ���������������������������������������������������������������������������

loc_56A50:				; CODE XREF: sub_56366+6E6j
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		cmp	word ptr [si+16h], 0
		jz	short loc_56A61
		dec	word ptr [si+16h]

loc_56A61:				; CODE XREF: sub_56366+6F6j
		push	2
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_56A76:				; CODE XREF: sub_56366+6E1j
		push	2
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_56A8B:				; CODE XREF: sub_56366+6E8j
		mov	bx, [si+16h]
		shl	bx, 1
		mov	ax, [bp+var_C]
		mov	[bx+si+0Ch], ax
		mov	ax, [bp+var_C]
		add	[si+14h], ax
		push	[bp+var_C]
		push	0D15h
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		mov	[bp+var_5C], 14h
		mov	ax, [si+16h]
		mov	dx, 0Ch
		imul	dx
		add	ax, 43h	; 'C'
		mov	[bp+var_5E], ax
		lea	ax, [bp+var_5A]
		push	ax
		push	[bp+var_5E]
		push	[bp+var_5C]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		jmp	short $+2
		push	si
		nop
		push	cs
		call	near ptr sub_56B04
		add	sp, 2
		mov	[bp+var_2], al
		push	2
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_56AF9
		jmp	loc_56372
; ���������������������������������������������������������������������������

loc_56AF9:				; CODE XREF: sub_56366+78Ej
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_56366	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_56B04	proc far		; CODE XREF: sub_4213DJ sub_56366+772p

var_16E		= word ptr -16Eh
var_15A		= word ptr -15Ah
var_10A		= dword	ptr -10Ah
var_106		= byte ptr -106h
var_105		= byte ptr -105h
var_104		= dword	ptr -104h
var_100		= word ptr -100h
var_E8		= word ptr -0E8h
var_D8		= word ptr -0D8h
var_D6		= byte ptr -0D6h
var_D5		= byte ptr -0D5h
var_D4		= byte ptr -0D4h
var_D3		= byte ptr -0D3h
var_D2		= byte ptr -0D2h
var_D1		= byte ptr -0D1h
var_D0		= byte ptr -0D0h
var_CF		= byte ptr -0CFh
var_CE		= byte ptr -0CEh
var_CD		= byte ptr -0CDh
var_CC		= byte ptr -0CCh
var_CB		= byte ptr -0CBh
var_CA		= byte ptr -0CAh
var_C9		= byte ptr -0C9h
var_C8		= word ptr -0C8h
var_C6		= word ptr -0C6h
var_C3		= byte ptr -0C3h
var_C2		= dword	ptr -0C2h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_B9		= byte ptr -0B9h
var_B8		= dword	ptr -0B8h
var_B4		= word ptr -0B4h
var_B2		= word ptr -0B2h
var_AF		= byte ptr -0AFh
var_AE		= dword	ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A5		= byte ptr -0A5h
var_A4		= dword	ptr -0A4h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9B		= byte ptr -9Bh
var_9A		= dword	ptr -9Ah
var_96		= word ptr -96h
var_94		= word ptr -94h
var_91		= byte ptr -91h
var_90		= dword	ptr -90h
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_87		= byte ptr -87h
var_86		= dword	ptr -86h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7D		= byte ptr -7Dh
var_7C		= dword	ptr -7Ch
var_78		= word ptr -78h
var_76		= word ptr -76h
var_73		= byte ptr -73h
var_72		= dword	ptr -72h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_69		= byte ptr -69h
var_68		= dword	ptr -68h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_5F		= byte ptr -5Fh
var_5E		= dword	ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_55		= byte ptr -55h
var_54		= dword	ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4B		= byte ptr -4Bh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_41		= byte ptr -41h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_37		= byte ptr -37h
var_36		= dword	ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2D		= byte ptr -2Dh
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_56B26
; ���������������������������������������������������������������������������

loc_56B17:				; CODE XREF: sub_56B04+26j
		lea	ax, [bp+var_E8]
		mov	bx, [bp+var_4]
		add	bx, ax
		mov	byte ptr [bx], 0
		inc	[bp+var_4]

loc_56B26:				; CODE XREF: sub_56B04+11j
		cmp	[bp+var_4], 10h
		jl	short loc_56B17
		mov	[bp+var_8], 186A0h
		mov	[bp+var_4], 0
		jmp	short loc_56BB9
; ���������������������������������������������������������������������������

loc_56B3B:				; CODE XREF: sub_56B04+BDj
		mov	bx, [bp+var_4]
		shl	bx, 1
		mov	cx, [bx+si+0Ch]
		mov	bx, [bp+var_4]
		shl	bx, 1
		mov	di, [bx+si+6]
		or	cx, cx
		jz	short loc_56BB6
		cmp	byte ptr [bp+di+var_E8], 0
		jz	short loc_56B76
		movsx	eax, cx
		push	eax
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A9Eh]
		pop	edx
		imul	eax, edx
		sub	[bp+var_8], eax
		jmp	short loc_56BAC
; ���������������������������������������������������������������������������

loc_56B76:				; CODE XREF: sub_56B04+50j
		mov	ax, cx
		dec	ax
		movsx	eax, ax
		push	eax
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A9Eh]
		pop	edx
		imul	eax, edx
		push	eax
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A9Ah]
		pop	edx
		add	eax, edx
		sub	[bp+var_8], eax

loc_56BAC:				; CODE XREF: sub_56B04+70j
		mov	al, byte ptr [bp+di+var_E8]
		add	al, cl
		mov	byte ptr [bp+di+var_E8], al

loc_56BB6:				; CODE XREF: sub_56B04+49j
		inc	[bp+var_4]

loc_56BB9:				; CODE XREF: sub_56B04+35j
		mov	ax, [si+16h]
		cmp	ax, [bp+var_4]
		jle	short loc_56BC4
		jmp	loc_56B3B
; ���������������������������������������������������������������������������

loc_56BC4:				; CODE XREF: sub_56B04+BBj
		mov	[bp+var_4], 0
		jmp	loc_56C66
; ���������������������������������������������������������������������������

loc_56BCC:				; CODE XREF: sub_56B04+168j
		lea	ax, [bp+var_E8]
		mov	bx, [bp+var_4]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_56C01
		mov	bx, [si+16h]
		shl	bx, 1
		movsx	eax, word ptr [bx+si+0Ch]
		push	eax
		mov	ax, [bp+var_4]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A9Eh]
		pop	edx
		imul	eax, edx
		mov	[bp+var_C], eax
		jmp	short loc_56C3F
; ���������������������������������������������������������������������������

loc_56C01:				; CODE XREF: sub_56B04+D4j
		mov	bx, [si+16h]
		shl	bx, 1
		mov	ax, [bx+si+0Ch]
		dec	ax
		movsx	eax, ax
		push	eax
		mov	ax, [bp+var_4]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A9Eh]
		pop	edx
		imul	eax, edx
		push	eax
		mov	ax, [bp+var_4]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A9Ah]
		pop	edx
		add	eax, edx
		mov	[bp+var_C], eax

loc_56C3F:				; CODE XREF: sub_56B04+FBj
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jge	short loc_56C57
		lea	ax, [bp+var_D8]
		mov	bx, [bp+var_4]
		add	bx, ax
		mov	byte ptr [bx], 1
		jmp	short loc_56C63
; ���������������������������������������������������������������������������

loc_56C57:				; CODE XREF: sub_56B04+143j
		lea	ax, [bp+var_D8]
		mov	bx, [bp+var_4]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_56C63:				; CODE XREF: sub_56B04+151j
		inc	[bp+var_4]

loc_56C66:				; CODE XREF: sub_56B04+C5j
		cmp	[bp+var_4], 10h
		jge	short loc_56C6F
		jmp	loc_56BCC
; ���������������������������������������������������������������������������

loc_56C6F:				; CODE XREF: sub_56B04+166j
					; sub_56B04+14C8j
		push	4Fh ; 'O'
		push	134h
		push	74h ; 't'
		push	6
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	word ptr [bp+var_C+2], ax
		mov	bx, word ptr [bp+var_C+2]
		mov	eax, [bx]
		mov	[bp-0Eh], eax
		mov	bx, word ptr [bp+var_C+2]
		mov	al, [bx+4]
		mov	[bp+var_F], al
		mov	eax, [bp-0Eh]
		mov	[bp+var_10A], eax
		mov	al, [bp+var_F]
		mov	[bp+var_106], al
		mov	[bp+var_105], 0
		mov	[bp+var_104], 0
		mov	bx, word ptr [bp+var_C+2]
		mov	eax, [bx+6]
		mov	[bp+var_104], eax
		mov	[bp+var_100], 16h
		mov	[bp+var_12], 0
		cmp	byte ptr [bp+var_D8], 0
		jnz	short loc_56CDF
		jmp	loc_56D95
; ���������������������������������������������������������������������������

loc_56CDF:				; CODE XREF: sub_56B04+1D6j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_14], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_56CFC
		jmp	loc_56D85
; ���������������������������������������������������������������������������

loc_56CFC:				; CODE XREF: sub_56B04+1F3j
		push	0Ch
		push	41h ; 'A'
		push	7
		push	9
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		mov	bx, [bp+var_14]
		mov	al, [bx+4]
		mov	[bp+var_19], al
		mov	eax, [bp+var_18]
		mov	[di+1Eh], eax
		mov	al, [bp+var_19]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 17h
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 18h
		mov	ax, di
		jmp	short loc_56D87
; ���������������������������������������������������������������������������

loc_56D85:				; CODE XREF: sub_56B04+1F5j
		mov	ax, di

loc_56D87:				; CODE XREF: sub_56B04+27Fj
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_56D95:				; CODE XREF: sub_56B04+1D8j
		cmp	byte ptr [bp+var_D8+1],	0
		jnz	short loc_56D9F
		jmp	loc_56E8A
; ���������������������������������������������������������������������������

loc_56D9F:				; CODE XREF: sub_56B04+296j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1C], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1E], ax
		or	ax, ax
		jnz	short loc_56DBD
		jmp	loc_56E79
; ���������������������������������������������������������������������������

loc_56DBD:				; CODE XREF: sub_56B04+2B4j
		push	0Ch
		push	41h ; 'A'
		push	14h
		push	9
		push	[bp+var_1E]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_1E]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_1E]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_1E]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_1E]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1C]
		mov	eax, [bx]
		mov	[bp+var_22], eax
		mov	bx, [bp+var_1C]
		mov	al, [bx+4]
		mov	[bp+var_23], al
		mov	bx, [bp+var_1E]
		mov	eax, [bp+var_22]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_1E]
		mov	al, [bp+var_23]
		mov	[bx+22h], al
		mov	bx, [bp+var_1E]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_1E]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1C]
		mov	eax, [bx+6]
		mov	bx, [bp+var_1E]
		mov	[bx+24h], eax
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+28h], 19h
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_1E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+2Eh], 1Ah
		mov	ax, [bp+var_1E]
		jmp	short loc_56E7C
; ���������������������������������������������������������������������������

loc_56E79:				; CODE XREF: sub_56B04+2B6j
		mov	ax, [bp+var_1E]

loc_56E7C:				; CODE XREF: sub_56B04+373j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_56E8A:				; CODE XREF: sub_56B04+298j
		cmp	[bp+var_D6], 0
		jnz	short loc_56E94
		jmp	loc_56F7F
; ���������������������������������������������������������������������������

loc_56E94:				; CODE XREF: sub_56B04+38Bj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_26], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_28], ax
		or	ax, ax
		jnz	short loc_56EB2
		jmp	loc_56F6E
; ���������������������������������������������������������������������������

loc_56EB2:				; CODE XREF: sub_56B04+3A9j
		push	0Ch
		push	41h ; 'A'
		push	21h ; '!'
		push	9
		push	[bp+var_28]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_28]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_28]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_28]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_28]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_28]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		mov	[bp+var_2C], eax
		mov	bx, [bp+var_26]
		mov	al, [bx+4]
		mov	[bp+var_2D], al
		mov	bx, [bp+var_28]
		mov	eax, [bp+var_2C]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_28]
		mov	al, [bp+var_2D]
		mov	[bx+22h], al
		mov	bx, [bp+var_28]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_28]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_26]
		mov	eax, [bx+6]
		mov	bx, [bp+var_28]
		mov	[bx+24h], eax
		mov	bx, [bp+var_28]
		mov	word ptr [bx+28h], 1Bh
		mov	bx, [bp+var_28]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_28]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_28]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_28]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_28]
		mov	word ptr [bx+2Eh], 1Ch
		mov	ax, [bp+var_28]
		jmp	short loc_56F71
; ���������������������������������������������������������������������������

loc_56F6E:				; CODE XREF: sub_56B04+3ABj
		mov	ax, [bp+var_28]

loc_56F71:				; CODE XREF: sub_56B04+468j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_56F7F:				; CODE XREF: sub_56B04+38Dj
		cmp	[bp+var_D5], 0
		jnz	short loc_56F89
		jmp	loc_57074
; ���������������������������������������������������������������������������

loc_56F89:				; CODE XREF: sub_56B04+480j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_30], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_32], ax
		or	ax, ax
		jnz	short loc_56FA7
		jmp	loc_57063
; ���������������������������������������������������������������������������

loc_56FA7:				; CODE XREF: sub_56B04+49Ej
		push	0Ch
		push	41h ; 'A'
		push	2Eh ; '.'
		push	9
		push	[bp+var_32]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_32]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_32]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_32]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_32]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_30]
		mov	eax, [bx]
		mov	[bp+var_36], eax
		mov	bx, [bp+var_30]
		mov	al, [bx+4]
		mov	[bp+var_37], al
		mov	bx, [bp+var_32]
		mov	eax, [bp+var_36]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_32]
		mov	al, [bp+var_37]
		mov	[bx+22h], al
		mov	bx, [bp+var_32]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_32]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_30]
		mov	eax, [bx+6]
		mov	bx, [bp+var_32]
		mov	[bx+24h], eax
		mov	bx, [bp+var_32]
		mov	word ptr [bx+28h], 1Dh
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_32]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_32]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_32]
		mov	word ptr [bx+2Eh], 1Eh
		mov	ax, [bp+var_32]
		jmp	short loc_57066
; ���������������������������������������������������������������������������

loc_57063:				; CODE XREF: sub_56B04+4A0j
		mov	ax, [bp+var_32]

loc_57066:				; CODE XREF: sub_56B04+55Dj
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57074:				; CODE XREF: sub_56B04+482j
		cmp	[bp+var_D4], 0
		jnz	short loc_5707E
		jmp	loc_57169
; ���������������������������������������������������������������������������

loc_5707E:				; CODE XREF: sub_56B04+575j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_3A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_3C], ax
		or	ax, ax
		jnz	short loc_5709C
		jmp	loc_57158
; ���������������������������������������������������������������������������

loc_5709C:				; CODE XREF: sub_56B04+593j
		push	0Ch
		push	41h ; 'A'
		push	7
		push	4Dh ; 'M'
		push	[bp+var_3C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_3C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_3C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_3C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_3C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_3A]
		mov	eax, [bx]
		mov	[bp+var_40], eax
		mov	bx, [bp+var_3A]
		mov	al, [bx+4]
		mov	[bp+var_41], al
		mov	bx, [bp+var_3C]
		mov	eax, [bp+var_40]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_3C]
		mov	al, [bp+var_41]
		mov	[bx+22h], al
		mov	bx, [bp+var_3C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_3C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_3A]
		mov	eax, [bx+6]
		mov	bx, [bp+var_3C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+28h], 1Fh
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_3C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+2Ch], 5
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+2Eh], 20h ; ' '
		mov	ax, [bp+var_3C]
		jmp	short loc_5715B
; ���������������������������������������������������������������������������

loc_57158:				; CODE XREF: sub_56B04+595j
		mov	ax, [bp+var_3C]

loc_5715B:				; CODE XREF: sub_56B04+652j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57169:				; CODE XREF: sub_56B04+577j
		cmp	[bp+var_D3], 0
		jnz	short loc_57173
		jmp	loc_5725E
; ���������������������������������������������������������������������������

loc_57173:				; CODE XREF: sub_56B04+66Aj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_44], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_46], ax
		or	ax, ax
		jnz	short loc_57191
		jmp	loc_5724D
; ���������������������������������������������������������������������������

loc_57191:				; CODE XREF: sub_56B04+688j
		push	0Ch
		push	41h ; 'A'
		push	14h
		push	4Dh ; 'M'
		push	[bp+var_46]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_46]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_46]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_46]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_46]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_46]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_44]
		mov	eax, [bx]
		mov	[bp+var_4A], eax
		mov	bx, [bp+var_44]
		mov	al, [bx+4]
		mov	[bp+var_4B], al
		mov	bx, [bp+var_46]
		mov	eax, [bp+var_4A]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_46]
		mov	al, [bp+var_4B]
		mov	[bx+22h], al
		mov	bx, [bp+var_46]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_46]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_44]
		mov	eax, [bx+6]
		mov	bx, [bp+var_46]
		mov	[bx+24h], eax
		mov	bx, [bp+var_46]
		mov	word ptr [bx+28h], 21h ; '!'
		mov	bx, [bp+var_46]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_46]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_46]
		mov	word ptr [bx+2Ch], 6
		mov	bx, [bp+var_46]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_46]
		mov	word ptr [bx+2Eh], 22h ; '"'
		mov	ax, [bp+var_46]
		jmp	short loc_57250
; ���������������������������������������������������������������������������

loc_5724D:				; CODE XREF: sub_56B04+68Aj
		mov	ax, [bp+var_46]

loc_57250:				; CODE XREF: sub_56B04+747j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_5725E:				; CODE XREF: sub_56B04+66Cj
		cmp	[bp+var_D2], 0
		jnz	short loc_57268
		jmp	loc_57353
; ���������������������������������������������������������������������������

loc_57268:				; CODE XREF: sub_56B04+75Fj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_4E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_50], ax
		or	ax, ax
		jnz	short loc_57286
		jmp	loc_57342
; ���������������������������������������������������������������������������

loc_57286:				; CODE XREF: sub_56B04+77Dj
		push	0Ch
		push	41h ; 'A'
		push	21h ; '!'
		push	4Dh ; 'M'
		push	[bp+var_50]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_50]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_50]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_50]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_50]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_4E]
		mov	eax, [bx]
		mov	[bp+var_54], eax
		mov	bx, [bp+var_4E]
		mov	al, [bx+4]
		mov	[bp+var_55], al
		mov	bx, [bp+var_50]
		mov	eax, [bp+var_54]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_50]
		mov	al, [bp+var_55]
		mov	[bx+22h], al
		mov	bx, [bp+var_50]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_50]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_4E]
		mov	eax, [bx+6]
		mov	bx, [bp+var_50]
		mov	[bx+24h], eax
		mov	bx, [bp+var_50]
		mov	word ptr [bx+28h], 23h ; '#'
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_50]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_50]
		mov	word ptr [bx+2Ch], 7
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_50]
		mov	word ptr [bx+2Eh], 24h ; '$'
		mov	ax, [bp+var_50]
		jmp	short loc_57345
; ���������������������������������������������������������������������������

loc_57342:				; CODE XREF: sub_56B04+77Fj
		mov	ax, [bp+var_50]

loc_57345:				; CODE XREF: sub_56B04+83Cj
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57353:				; CODE XREF: sub_56B04+761j
		cmp	[bp+var_D1], 0
		jnz	short loc_5735D
		jmp	loc_57448
; ���������������������������������������������������������������������������

loc_5735D:				; CODE XREF: sub_56B04+854j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_58], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5A], ax
		or	ax, ax
		jnz	short loc_5737B
		jmp	loc_57437
; ���������������������������������������������������������������������������

loc_5737B:				; CODE XREF: sub_56B04+872j
		push	0Ch
		push	41h ; 'A'
		push	2Eh ; '.'
		push	4Dh ; 'M'
		push	[bp+var_5A]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_5A]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_5A]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_5A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_5A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_58]
		mov	eax, [bx]
		mov	[bp+var_5E], eax
		mov	bx, [bp+var_58]
		mov	al, [bx+4]
		mov	[bp+var_5F], al
		mov	bx, [bp+var_5A]
		mov	eax, [bp+var_5E]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_5A]
		mov	al, [bp+var_5F]
		mov	[bx+22h], al
		mov	bx, [bp+var_5A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_5A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_58]
		mov	eax, [bx+6]
		mov	bx, [bp+var_5A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+28h], 25h ; '%'
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_5A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Ch], 8
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Eh], 26h ; '&'
		mov	ax, [bp+var_5A]
		jmp	short loc_5743A
; ���������������������������������������������������������������������������

loc_57437:				; CODE XREF: sub_56B04+874j
		mov	ax, [bp+var_5A]

loc_5743A:				; CODE XREF: sub_56B04+931j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57448:				; CODE XREF: sub_56B04+856j
		cmp	[bp+var_D0], 0
		jnz	short loc_57452
		jmp	loc_5753E
; ���������������������������������������������������������������������������

loc_57452:				; CODE XREF: sub_56B04+949j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_62], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_64], ax
		or	ax, ax
		jnz	short loc_57470
		jmp	loc_5752D
; ���������������������������������������������������������������������������

loc_57470:				; CODE XREF: sub_56B04+967j
		push	0Ch
		push	41h ; 'A'
		push	7
		push	91h ; '�'
		push	[bp+var_64]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_64]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_64]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_64]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_64]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_62]
		mov	eax, [bx]
		mov	[bp+var_68], eax
		mov	bx, [bp+var_62]
		mov	al, [bx+4]
		mov	[bp+var_69], al
		mov	bx, [bp+var_64]
		mov	eax, [bp+var_68]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_64]
		mov	al, [bp+var_69]
		mov	[bx+22h], al
		mov	bx, [bp+var_64]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_64]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_62]
		mov	eax, [bx+6]
		mov	bx, [bp+var_64]
		mov	[bx+24h], eax
		mov	bx, [bp+var_64]
		mov	word ptr [bx+28h], 27h ; '''
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_64]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Ch], 9
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Eh], 28h ; '('
		mov	ax, [bp+var_64]
		jmp	short loc_57530
; ���������������������������������������������������������������������������

loc_5752D:				; CODE XREF: sub_56B04+969j
		mov	ax, [bp+var_64]

loc_57530:				; CODE XREF: sub_56B04+A27j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_5753E:				; CODE XREF: sub_56B04+94Bj
		cmp	[bp+var_CF], 0
		jnz	short loc_57548
		jmp	loc_57634
; ���������������������������������������������������������������������������

loc_57548:				; CODE XREF: sub_56B04+A3Fj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_6C], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_6E], ax
		or	ax, ax
		jnz	short loc_57566
		jmp	loc_57623
; ���������������������������������������������������������������������������

loc_57566:				; CODE XREF: sub_56B04+A5Dj
		push	0Ch
		push	41h ; 'A'
		push	14h
		push	91h ; '�'
		push	[bp+var_6E]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_6E]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_6E]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_6E]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_6E]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_6C]
		mov	eax, [bx]
		mov	[bp+var_72], eax
		mov	bx, [bp+var_6C]
		mov	al, [bx+4]
		mov	[bp+var_73], al
		mov	bx, [bp+var_6E]
		mov	eax, [bp+var_72]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_6E]
		mov	al, [bp+var_73]
		mov	[bx+22h], al
		mov	bx, [bp+var_6E]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_6E]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_6C]
		mov	eax, [bx+6]
		mov	bx, [bp+var_6E]
		mov	[bx+24h], eax
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+28h], 29h ; ')'
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_6E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+2Ch], 0Ah
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+2Eh], 2Ah ; '*'
		mov	ax, [bp+var_6E]
		jmp	short loc_57626
; ���������������������������������������������������������������������������

loc_57623:				; CODE XREF: sub_56B04+A5Fj
		mov	ax, [bp+var_6E]

loc_57626:				; CODE XREF: sub_56B04+B1Dj
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57634:				; CODE XREF: sub_56B04+A41j
		cmp	[bp+var_CE], 0
		jnz	short loc_5763E
		jmp	loc_5772A
; ���������������������������������������������������������������������������

loc_5763E:				; CODE XREF: sub_56B04+B35j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_76], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_78], ax
		or	ax, ax
		jnz	short loc_5765C
		jmp	loc_57719
; ���������������������������������������������������������������������������

loc_5765C:				; CODE XREF: sub_56B04+B53j
		push	0Ch
		push	41h ; 'A'
		push	21h ; '!'
		push	91h ; '�'
		push	[bp+var_78]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_76]
		mov	eax, [bx]
		mov	[bp+var_7C], eax
		mov	bx, [bp+var_76]
		mov	al, [bx+4]
		mov	[bp+var_7D], al
		mov	bx, [bp+var_78]
		mov	eax, [bp+var_7C]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_78]
		mov	al, [bp+var_7D]
		mov	[bx+22h], al
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_76]
		mov	eax, [bx+6]
		mov	bx, [bp+var_78]
		mov	[bx+24h], eax
		mov	bx, [bp+var_78]
		mov	word ptr [bx+28h], 2Bh ; '+'
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_78]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Ch], 0Bh
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Eh], 2Ch ; ','
		mov	ax, [bp+var_78]
		jmp	short loc_5771C
; ���������������������������������������������������������������������������

loc_57719:				; CODE XREF: sub_56B04+B55j
		mov	ax, [bp+var_78]

loc_5771C:				; CODE XREF: sub_56B04+C13j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_5772A:				; CODE XREF: sub_56B04+B37j
		cmp	[bp+var_CD], 0
		jnz	short loc_57734
		jmp	loc_57838
; ���������������������������������������������������������������������������

loc_57734:				; CODE XREF: sub_56B04+C2Bj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_80], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_82], ax
		or	ax, ax
		jnz	short loc_57753
		jmp	loc_57826
; ���������������������������������������������������������������������������

loc_57753:				; CODE XREF: sub_56B04+C4Aj
		push	0Ch
		push	41h ; 'A'
		push	2Eh ; '.'
		push	91h ; '�'
		push	[bp+var_82]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_82]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_82]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_82]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_82]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_82]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_80]
		mov	eax, [bx]
		mov	[bp+var_86], eax
		mov	bx, [bp+var_80]
		mov	al, [bx+4]
		mov	[bp+var_87], al
		mov	bx, [bp+var_82]
		mov	eax, [bp+var_86]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_82]
		mov	al, [bp+var_87]
		mov	[bx+22h], al
		mov	bx, [bp+var_82]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_82]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_80]
		mov	eax, [bx+6]
		mov	bx, [bp+var_82]
		mov	[bx+24h], eax
		mov	bx, [bp+var_82]
		mov	word ptr [bx+28h], 2Dh ; '-'
		mov	bx, [bp+var_82]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_82]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_82]
		mov	word ptr [bx+2Ch], 0Ch
		mov	bx, [bp+var_82]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_82]
		mov	word ptr [bx+2Eh], 2Eh ; '.'
		mov	ax, [bp+var_82]
		jmp	short loc_5782A
; ���������������������������������������������������������������������������

loc_57826:				; CODE XREF: sub_56B04+C4Cj
		mov	ax, [bp+var_82]

loc_5782A:				; CODE XREF: sub_56B04+D20j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57838:				; CODE XREF: sub_56B04+C2Dj
		cmp	[bp+var_CC], 0
		jnz	short loc_57842
		jmp	loc_5794A
; ���������������������������������������������������������������������������

loc_57842:				; CODE XREF: sub_56B04+D39j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_8A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_8C], ax
		or	ax, ax
		jnz	short loc_57862
		jmp	loc_57938
; ���������������������������������������������������������������������������

loc_57862:				; CODE XREF: sub_56B04+D59j
		push	0Ch
		push	41h ; 'A'
		push	7
		push	0EBh ; '�'
		push	[bp+var_8C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_8C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_8C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_8C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_8C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_8A]
		mov	eax, [bx]
		mov	[bp+var_90], eax
		mov	bx, [bp+var_8A]
		mov	al, [bx+4]
		mov	[bp+var_91], al
		mov	bx, [bp+var_8C]
		mov	eax, [bp+var_90]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_8C]
		mov	al, [bp+var_91]
		mov	[bx+22h], al
		mov	bx, [bp+var_8C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_8C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_8A]
		mov	eax, [bx+6]
		mov	bx, [bp+var_8C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+28h], 2Fh ; '/'
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_8C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+2Ch], 0Dh
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+2Eh], 30h ; '0'
		mov	ax, [bp+var_8C]
		jmp	short loc_5793C
; ���������������������������������������������������������������������������

loc_57938:				; CODE XREF: sub_56B04+D5Bj
		mov	ax, [bp+var_8C]

loc_5793C:				; CODE XREF: sub_56B04+E32j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_5794A:				; CODE XREF: sub_56B04+D3Bj
		cmp	[bp+var_CB], 0
		jnz	short loc_57954
		jmp	loc_57A5C
; ���������������������������������������������������������������������������

loc_57954:				; CODE XREF: sub_56B04+E4Bj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_94], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_96], ax
		or	ax, ax
		jnz	short loc_57974
		jmp	loc_57A4A
; ���������������������������������������������������������������������������

loc_57974:				; CODE XREF: sub_56B04+E6Bj
		push	0Ch
		push	41h ; 'A'
		push	14h
		push	0EBh ; '�'
		push	[bp+var_96]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_96]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_96]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_96]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_96]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_96]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_94]
		mov	eax, [bx]
		mov	[bp+var_9A], eax
		mov	bx, [bp+var_94]
		mov	al, [bx+4]
		mov	[bp+var_9B], al
		mov	bx, [bp+var_96]
		mov	eax, [bp+var_9A]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_96]
		mov	al, [bp+var_9B]
		mov	[bx+22h], al
		mov	bx, [bp+var_96]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_96]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_94]
		mov	eax, [bx+6]
		mov	bx, [bp+var_96]
		mov	[bx+24h], eax
		mov	bx, [bp+var_96]
		mov	word ptr [bx+28h], 31h ; '1'
		mov	bx, [bp+var_96]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_96]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_96]
		mov	word ptr [bx+2Ch], 0Eh
		mov	bx, [bp+var_96]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_96]
		mov	word ptr [bx+2Eh], 32h ; '2'
		mov	ax, [bp+var_96]
		jmp	short loc_57A4E
; ���������������������������������������������������������������������������

loc_57A4A:				; CODE XREF: sub_56B04+E6Dj
		mov	ax, [bp+var_96]

loc_57A4E:				; CODE XREF: sub_56B04+F44j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57A5C:				; CODE XREF: sub_56B04+E4Dj
		cmp	[bp+var_CA], 0
		jnz	short loc_57A66
		jmp	loc_57B6E
; ���������������������������������������������������������������������������

loc_57A66:				; CODE XREF: sub_56B04+F5Dj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_9E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A0], ax
		or	ax, ax
		jnz	short loc_57A86
		jmp	loc_57B5C
; ���������������������������������������������������������������������������

loc_57A86:				; CODE XREF: sub_56B04+F7Dj
		push	0Ch
		push	41h ; 'A'
		push	21h ; '!'
		push	0EBh ; '�'
		push	[bp+var_A0]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_A0]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_A0]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_A0]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A0]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_9E]
		mov	eax, [bx]
		mov	[bp+var_A4], eax
		mov	bx, [bp+var_9E]
		mov	al, [bx+4]
		mov	[bp+var_A5], al
		mov	bx, [bp+var_A0]
		mov	eax, [bp+var_A4]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_A0]
		mov	al, [bp+var_A5]
		mov	[bx+22h], al
		mov	bx, [bp+var_A0]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_A0]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_9E]
		mov	eax, [bx+6]
		mov	bx, [bp+var_A0]
		mov	[bx+24h], eax
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+28h], 33h ; '3'
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_A0]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+2Ch], 0Fh
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+2Eh], 34h ; '4'
		mov	ax, [bp+var_A0]
		jmp	short loc_57B60
; ���������������������������������������������������������������������������

loc_57B5C:				; CODE XREF: sub_56B04+F7Fj
		mov	ax, [bp+var_A0]

loc_57B60:				; CODE XREF: sub_56B04+1056j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57B6E:				; CODE XREF: sub_56B04+F5Fj
		cmp	[bp+var_C9], 0
		jnz	short loc_57B78
		jmp	loc_57C80
; ���������������������������������������������������������������������������

loc_57B78:				; CODE XREF: sub_56B04+106Fj
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_A8], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_AA], ax
		or	ax, ax
		jnz	short loc_57B98
		jmp	loc_57C6E
; ���������������������������������������������������������������������������

loc_57B98:				; CODE XREF: sub_56B04+108Fj
		push	0Ch
		push	41h ; 'A'
		push	2Eh ; '.'
		push	0EBh ; '�'
		push	[bp+var_AA]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_AA]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_AA]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_AA]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_AA]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_A8]
		mov	eax, [bx]
		mov	[bp+var_AE], eax
		mov	bx, [bp+var_A8]
		mov	al, [bx+4]
		mov	[bp+var_AF], al
		mov	bx, [bp+var_AA]
		mov	eax, [bp+var_AE]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_AA]
		mov	al, [bp+var_AF]
		mov	[bx+22h], al
		mov	bx, [bp+var_AA]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_AA]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_A8]
		mov	eax, [bx+6]
		mov	bx, [bp+var_AA]
		mov	[bx+24h], eax
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+28h], 35h ; '5'
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_AA]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+2Ch], 10h
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+2Eh], 36h ; '6'
		mov	ax, [bp+var_AA]
		jmp	short loc_57C72
; ���������������������������������������������������������������������������

loc_57C6E:				; CODE XREF: sub_56B04+1091j
		mov	ax, [bp+var_AA]

loc_57C72:				; CODE XREF: sub_56B04+1168j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6

loc_57C80:				; CODE XREF: sub_56B04+1071j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_B2], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_B4], ax
		or	ax, ax
		jnz	short loc_57CA0
		jmp	loc_57D75
; ���������������������������������������������������������������������������

loc_57CA0:				; CODE XREF: sub_56B04+1197j
		push	0Ch
		push	41h ; 'A'
		push	3Dh ; '='
		push	57h ; 'W'
		push	[bp+var_B4]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_B4]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_B4]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_B4]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_B4]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_B2]
		mov	eax, [bx]
		mov	[bp+var_B8], eax
		mov	bx, [bp+var_B2]
		mov	al, [bx+4]
		mov	[bp+var_B9], al
		mov	bx, [bp+var_B4]
		mov	eax, [bp+var_B8]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_B4]
		mov	al, [bp+var_B9]
		mov	[bx+22h], al
		mov	bx, [bp+var_B4]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_B4]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_B2]
		mov	eax, [bx+6]
		mov	bx, [bp+var_B4]
		mov	[bx+24h], eax
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+28h], 37h ; '7'
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_B4]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+2Eh], 38h ; '8'
		mov	ax, [bp+var_B4]
		jmp	short loc_57D79
; ���������������������������������������������������������������������������

loc_57D75:				; CODE XREF: sub_56B04+1199j
		mov	ax, [bp+var_B4]

loc_57D79:				; CODE XREF: sub_56B04+126Fj
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_BC], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_BE], ax
		or	ax, ax
		jnz	short loc_57DA7
		jmp	loc_57E7D
; ���������������������������������������������������������������������������

loc_57DA7:				; CODE XREF: sub_56B04+129Ej
		push	0Ch
		push	41h ; 'A'
		push	3Dh ; '='
		push	9Bh ; '�'
		push	[bp+var_BE]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_BE]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_BE]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_BE]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_BE]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_BC]
		mov	eax, [bx]
		mov	[bp+var_C2], eax
		mov	bx, [bp+var_BC]
		mov	al, [bx+4]
		mov	[bp+var_C3], al
		mov	bx, [bp+var_BE]
		mov	eax, [bp+var_C2]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_BE]
		mov	al, [bp+var_C3]
		mov	[bx+22h], al
		mov	bx, [bp+var_BE]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_BE]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_BC]
		mov	eax, [bx+6]
		mov	bx, [bp+var_BE]
		mov	[bx+24h], eax
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+28h], 39h ; '9'
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_BE]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+2Eh], 3Ah ; ':'
		mov	ax, [bp+var_BE]
		jmp	short loc_57E81
; ���������������������������������������������������������������������������

loc_57E7D:				; CODE XREF: sub_56B04+12A0j
		mov	ax, [bp+var_BE]

loc_57E81:				; CODE XREF: sub_56B04+1377j
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_57EAD
; ���������������������������������������������������������������������������

loc_57E9E:				; CODE XREF: sub_56B04+13ADj
		push	1
		lea	ax, [bp+var_15A]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_57EAD:				; CODE XREF: sub_56B04+1398j
		cmp	[bp+var_12], 0
		jz	short loc_57E9E
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_DFCA
		add	sp, 2
		mov	ax, [bp+var_12]
		cmp	ax, 0FFFEh
		jz	short loc_57F01
		cmp	ax, 0FFFFh
		jz	short loc_57ECF
		jmp	short loc_57F16
; ���������������������������������������������������������������������������

loc_57ECF:				; CODE XREF: sub_56B04+13C7j
		mov	bx, [si+16h]
		shl	bx, 1
		mov	ax, [bx+si+0Ch]
		sub	[si+14h], ax
		mov	bx, [si+16h]
		shl	bx, 1
		mov	word ptr [bx+si+0Ch], 0
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_57F01:				; CODE XREF: sub_56B04+13C2j
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_57F16:				; CODE XREF: sub_56B04+13C9j
		mov	bx, [si+16h]
		shl	bx, 1
		mov	ax, [bp+var_12]
		dec	ax
		mov	[bx+si+6], ax
		mov	ax, [bp+var_12]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		push	word ptr [bx+0A85h]
		lea	ax, [bp+var_16E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		cmp	word ptr [si+16h], 2
		jnz	short loc_57F53
		push	0D18h
		lea	ax, [bp+var_16E]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_57F53:				; CODE XREF: sub_56B04+143Dj
		mov	[bp+var_C6], 1Eh
		mov	ax, [si+16h]
		mov	dx, 0Ch
		imul	dx
		add	ax, 43h	; 'C'
		mov	[bp+var_C8], ax
		lea	ax, [bp+var_16E]
		push	ax
		push	[bp+var_C8]
		push	[bp+var_C6]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_112C4
		add	sp, 2
		add	[bp+var_C6], ax
		jmp	short $+2
		cmp	word ptr [si+16h], 2
		jge	short loc_57FAC
		push	[bp+var_C8]
		push	[bp+var_C6]
		push	si
		nop
		push	cs
		call	near ptr sub_57FDA
		add	sp, 6
		mov	[bp+var_2], al
		jmp	short loc_57FB7
; ���������������������������������������������������������������������������

loc_57FAC:				; CODE XREF: sub_56B04+1490j
		push	si
		push	cs
		call	near ptr sub_55C92
		add	sp, 2
		mov	[bp+var_2], al

loc_57FB7:				; CODE XREF: sub_56B04+14A6j
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_57FCF
		jmp	loc_56C6F
; ���������������������������������������������������������������������������

loc_57FCF:				; CODE XREF: sub_56B04+14C6j
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_56B04	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_57FDA	proc far		; CODE XREF: sub_42142J
					; sub_56B04+149Dp

var_A4		= word ptr -0A4h
var_54		= dword	ptr -54h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= dword	ptr -4Eh
var_4A		= word ptr -4Ah
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_27		= byte ptr -27h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_57FE6:				; CODE XREF: sub_57FDA+4CBj
		push	2Ah ; '*'
		push	134h
		push	99h ; '�'
		push	6
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		mov	[bp+var_9], al
		mov	eax, [bp+var_8]
		mov	[bp+var_54], eax
		mov	al, [bp+var_9]
		mov	[bp+var_50], al
		mov	[bp+var_4F], 0
		mov	[bp+var_4E], 0
		mov	bx, [bp+var_4]
		mov	eax, [bx+6]
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 3Bh ; ';'
		mov	[bp+var_C], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_58064
		jmp	loc_580ED
; ���������������������������������������������������������������������������

loc_58064:				; CODE XREF: sub_57FDA+85j
		push	0Ch
		push	41h ; 'A'
		push	9
		push	57h ; 'W'
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	bx, [bp+var_E]
		mov	al, [bx+4]
		mov	[bp+var_13], al
		mov	eax, [bp+var_12]
		mov	[di+1Eh], eax
		mov	al, [bp+var_13]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 3Ch ; '<'
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 3Dh ; '='
		mov	ax, di
		jmp	short loc_580EF
; ���������������������������������������������������������������������������

loc_580ED:				; CODE XREF: sub_57FDA+87j
		mov	ax, di

loc_580EF:				; CODE XREF: sub_57FDA+111j
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_16], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18], ax
		or	ax, ax
		jnz	short loc_5811B
		jmp	loc_581D8
; ���������������������������������������������������������������������������

loc_5811B:				; CODE XREF: sub_57FDA+13Cj
		push	0Ch
		push	41h ; 'A'
		push	9
		push	9Bh ; '�'
		push	[bp+var_18]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_16]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	bx, [bp+var_16]
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	bx, [bp+var_18]
		mov	eax, [bp+var_1C]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_18]
		mov	al, [bp+var_1D]
		mov	[bx+22h], al
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_18]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_16]
		mov	eax, [bx+6]
		mov	bx, [bp+var_18]
		mov	[bx+24h], eax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+28h], 3Eh ; '>'
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_18]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Eh], 3Fh ; '?'
		mov	ax, [bp+var_18]
		jmp	short loc_581DB
; ���������������������������������������������������������������������������

loc_581D8:				; CODE XREF: sub_57FDA+13Ej
		mov	ax, [bp+var_18]

loc_581DB:				; CODE XREF: sub_57FDA+1FCj
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_20], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_22], ax
		or	ax, ax
		jnz	short loc_58207
		jmp	loc_582C3
; ���������������������������������������������������������������������������

loc_58207:				; CODE XREF: sub_57FDA+228j
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	57h ; 'W'
		push	[bp+var_22]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_22]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_22]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_22]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_22]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_26], eax
		mov	bx, [bp+var_20]
		mov	al, [bx+4]
		mov	[bp+var_27], al
		mov	bx, [bp+var_22]
		mov	eax, [bp+var_26]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_22]
		mov	al, [bp+var_27]
		mov	[bx+22h], al
		mov	bx, [bp+var_22]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_22]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx+6]
		mov	bx, [bp+var_22]
		mov	[bx+24h], eax
		mov	bx, [bp+var_22]
		mov	word ptr [bx+28h], 40h ; '@'
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_22]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Eh], 41h ; 'A'
		mov	ax, [bp+var_22]
		jmp	short loc_582C6
; ���������������������������������������������������������������������������

loc_582C3:				; CODE XREF: sub_57FDA+22Aj
		mov	ax, [bp+var_22]

loc_582C6:				; CODE XREF: sub_57FDA+2E7j
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2C], ax
		or	ax, ax
		jnz	short loc_582F2
		jmp	loc_583AF
; ���������������������������������������������������������������������������

loc_582F2:				; CODE XREF: sub_57FDA+313j
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	9Bh ; '�'
		push	[bp+var_2C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_2C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_2C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_2C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_2C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2A]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	bx, [bp+var_2A]
		mov	al, [bx+4]
		mov	[bp+var_31], al
		mov	bx, [bp+var_2C]
		mov	eax, [bp+var_30]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_2C]
		mov	al, [bp+var_31]
		mov	[bx+22h], al
		mov	bx, [bp+var_2C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_2C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2A]
		mov	eax, [bx+6]
		mov	bx, [bp+var_2C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+28h], 42h ; 'B'
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_2C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Eh], 43h ; 'C'
		mov	ax, [bp+var_2C]
		jmp	short loc_583B2
; ���������������������������������������������������������������������������

loc_583AF:				; CODE XREF: sub_57FDA+315j
		mov	ax, [bp+var_2C]

loc_583B2:				; CODE XREF: sub_57FDA+3D3j
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_583DE
; ���������������������������������������������������������������������������

loc_583CF:				; CODE XREF: sub_57FDA+408j
		push	1
		lea	ax, [bp+var_A4]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_583DE:				; CODE XREF: sub_57FDA+3F3j
		cmp	[bp+var_C], 0
		jz	short loc_583CF
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_DFCA
		add	sp, 2
		mov	bx, [bp+var_C]
		sub	bx, 0FFFEh	; switch 5 cases
		cmp	bx, 4
		jbe	short loc_583FF
		jmp	loc_58490	; default
; ���������������������������������������������������������������������������

loc_583FF:				; CODE XREF: sub_57FDA+420j
		shl	bx, 1
		jmp	cs:off_584B3[bx] ; switch jump

loc_58406:				; DATA XREF: ovr190:off_584B3o
		push	si		; case -0x1
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_58423:				; CODE XREF: sub_57FDA+427j
					; DATA XREF: ovr190:off_584B3o
		push	2		; case -0x2
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_58438:				; CODE XREF: sub_57FDA+427j
					; DATA XREF: ovr190:off_584B3o
		cmp	word ptr [si+16h], 1 ; case 0x1
		jnz	short loc_58451
		push	0D1Ah
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		jmp	short loc_58462
; ���������������������������������������������������������������������������

loc_58451:				; CODE XREF: sub_57FDA+462j
		push	0D20h
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8

loc_58462:				; CODE XREF: sub_57FDA+475j
		inc	word ptr [si+16h]
		push	si
		push	cs
		call	near ptr sub_56366
		add	sp, 2
		mov	[bp+var_2], al
		jmp	short loc_58490	; default
; ���������������������������������������������������������������������������

loc_58472:				; CODE XREF: sub_57FDA+427j
					; DATA XREF: ovr190:off_584B3o
		push	0D22h		; case 0x2
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_55C92
		add	sp, 2
		mov	[bp+var_2], al
		jmp	short $+2

loc_58490:				; CODE XREF: sub_57FDA+422j
					; sub_57FDA+427j ...
		push	2		; default
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_584A8
		jmp	loc_57FE6
; ���������������������������������������������������������������������������

loc_584A8:				; CODE XREF: sub_57FDA+4C9j
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_57FDA	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_584B3	dw offset loc_58423	; DATA XREF: sub_57FDA+427r
		dw offset loc_58406	; jump table for switch	statement
		dw offset loc_58490
		dw offset loc_58438
		dw offset loc_58472

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_584BD	proc far		; CODE XREF: sub_4214CJ sub_55C92+6A8p

var_C6		= word ptr -0C6h
var_B2		= word ptr -0B2h
var_62		= dword	ptr -62h
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= dword	ptr -5Ch
var_58		= word ptr -58h
var_3F		= byte ptr -3Fh
var_3E		= dword	ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_35		= byte ptr -35h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2B		= byte ptr -2Bh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0C6h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_584C9:				; CODE XREF: sub_584BD+5D2j
		mov	[bp+var_4], 5
		mov	[bp+var_6], 73h	; 's'
		push	0D24h
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		push	0D43h
		call	sub_112C4
		add	sp, 2
		add	[bp+var_4], ax
		push	2Ah ; '*'
		push	134h
		push	99h ; '�'
		push	6
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		mov	bx, [bp+var_8]
		mov	al, [bx+4]
		mov	[bp+var_D], al
		mov	eax, [bp+var_C]
		mov	[bp+var_62], eax
		mov	al, [bp+var_D]
		mov	[bp+var_5E], al
		mov	[bp+var_5D], 0
		mov	[bp+var_5C], 0
		mov	bx, [bp+var_8]
		mov	eax, [bx+6]
		mov	[bp+var_5C], eax
		mov	[bp+var_58], 51h ; 'Q'
		mov	[bp+var_10], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_12], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_58570
		jmp	loc_585F9
; ���������������������������������������������������������������������������

loc_58570:				; CODE XREF: sub_584BD+AEj
		push	0Ch
		push	41h ; 'A'
		push	9
		push	36h ; '6'
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	[bp+var_16], eax
		mov	bx, [bp+var_12]
		mov	al, [bx+4]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	[di+1Eh], eax
		mov	al, [bp+var_17]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_12]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 52h ; 'R'
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 53h ; 'S'
		mov	ax, di
		jmp	short loc_585FB
; ���������������������������������������������������������������������������

loc_585F9:				; CODE XREF: sub_584BD+B0j
		mov	ax, di

loc_585FB:				; CODE XREF: sub_584BD+13Aj
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1C], ax
		or	ax, ax
		jnz	short loc_58627
		jmp	loc_586E3
; ���������������������������������������������������������������������������

loc_58627:				; CODE XREF: sub_584BD+165j
		push	0Ch
		push	41h ; 'A'
		push	9
		push	7Ah ; 'z'
		push	[bp+var_1C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	bx, [bp+var_1A]
		mov	al, [bx+4]
		mov	[bp+var_21], al
		mov	bx, [bp+var_1C]
		mov	eax, [bp+var_20]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_1C]
		mov	al, [bp+var_21]
		mov	[bx+22h], al
		mov	bx, [bp+var_1C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_1C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1A]
		mov	eax, [bx+6]
		mov	bx, [bp+var_1C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+28h], 54h ; 'T'
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_1C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Eh], 55h ; 'U'
		mov	ax, [bp+var_1C]
		jmp	short loc_586E6
; ���������������������������������������������������������������������������

loc_586E3:				; CODE XREF: sub_584BD+167j
		mov	ax, [bp+var_1C]

loc_586E6:				; CODE XREF: sub_584BD+224j
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_24], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_26], ax
		or	ax, ax
		jnz	short loc_58712
		jmp	loc_587CF
; ���������������������������������������������������������������������������

loc_58712:				; CODE XREF: sub_584BD+250j
		push	0Ch
		push	41h ; 'A'
		push	9
		push	0BEh ; '�'
		push	[bp+var_26]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_24]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_24]
		mov	al, [bx+4]
		mov	[bp+var_2B], al
		mov	bx, [bp+var_26]
		mov	eax, [bp+var_2A]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_26]
		mov	al, [bp+var_2B]
		mov	[bx+22h], al
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_26]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_24]
		mov	eax, [bx+6]
		mov	bx, [bp+var_26]
		mov	[bx+24h], eax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+28h], 56h ; 'V'
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_26]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Eh], 57h ; 'W'
		mov	ax, [bp+var_26]
		jmp	short loc_587D2
; ���������������������������������������������������������������������������

loc_587CF:				; CODE XREF: sub_584BD+252j
		mov	ax, [bp+var_26]

loc_587D2:				; CODE XREF: sub_584BD+310j
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_30], ax
		or	ax, ax
		jnz	short loc_587FE
		jmp	loc_588BA
; ���������������������������������������������������������������������������

loc_587FE:				; CODE XREF: sub_584BD+33Cj
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	57h ; 'W'
		push	[bp+var_30]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2E]
		mov	eax, [bx]
		mov	[bp+var_34], eax
		mov	bx, [bp+var_2E]
		mov	al, [bx+4]
		mov	[bp+var_35], al
		mov	bx, [bp+var_30]
		mov	eax, [bp+var_34]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_30]
		mov	al, [bp+var_35]
		mov	[bx+22h], al
		mov	bx, [bp+var_30]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_30]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_2E]
		mov	eax, [bx+6]
		mov	bx, [bp+var_30]
		mov	[bx+24h], eax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+28h], 58h ; 'X'
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_30]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Eh], 59h ; 'Y'
		mov	ax, [bp+var_30]
		jmp	short loc_588BD
; ���������������������������������������������������������������������������

loc_588BA:				; CODE XREF: sub_584BD+33Ej
		mov	ax, [bp+var_30]

loc_588BD:				; CODE XREF: sub_584BD+3FBj
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_38], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_3A], ax
		or	ax, ax
		jnz	short loc_588E9
		jmp	loc_589A6
; ���������������������������������������������������������������������������

loc_588E9:				; CODE XREF: sub_584BD+427j
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	9Bh ; '�'
		push	[bp+var_3A]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_3A]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_3A]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_3A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_3A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx]
		mov	[bp+var_3E], eax
		mov	bx, [bp+var_38]
		mov	al, [bx+4]
		mov	[bp+var_3F], al
		mov	bx, [bp+var_3A]
		mov	eax, [bp+var_3E]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_3A]
		mov	al, [bp+var_3F]
		mov	[bx+22h], al
		mov	bx, [bp+var_3A]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_3A]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx+6]
		mov	bx, [bp+var_3A]
		mov	[bx+24h], eax
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+28h], 5Ah ; 'Z'
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_3A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Eh], 5Bh ; '['
		mov	ax, [bp+var_3A]
		jmp	short loc_589A9
; ���������������������������������������������������������������������������

loc_589A6:				; CODE XREF: sub_584BD+429j
		mov	ax, [bp+var_3A]

loc_589A9:				; CODE XREF: sub_584BD+4E7j
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_589D5
; ���������������������������������������������������������������������������

loc_589C6:				; CODE XREF: sub_584BD+51Cj
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_589D5:				; CODE XREF: sub_584BD+507j
		cmp	[bp+var_10], 0
		jz	short loc_589C6
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_DFCA
		add	sp, 2
		mov	ax, [bp+var_10]
		cmp	ax, 0FFFEh
		jz	short loc_58A24
		cmp	ax, 0FFFFh
		jz	short loc_589F7
		jmp	short loc_58A39
; ���������������������������������������������������������������������������

loc_589F7:				; CODE XREF: sub_584BD+536j
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_58A24:				; CODE XREF: sub_584BD+531j
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_58A39:				; CODE XREF: sub_584BD+538j
		mov	ax, [bp+var_10]
		dec	ax
		mov	[si+12h], ax
		mov	bx, [si+12h]
		shl	bx, 1
		push	word ptr [bx+0B84h]
		push	0D62h
		lea	ax, [bp+var_C6]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_C6]
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_55BDC
		add	sp, 8
		jmp	short $+2
		push	si
		nop
		push	cs
		call	near ptr sub_58A9D
		add	sp, 2
		mov	[bp+var_2], al
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_DC89
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_58A92
		jmp	loc_584C9
; ���������������������������������������������������������������������������

loc_58A92:				; CODE XREF: sub_584BD+5D0j
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_584BD	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_58A9D	proc far		; CODE XREF: sub_42151J sub_584BD+5B4p ...

var_98		= word ptr -98h
var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword	ptr -42h
var_3E		= word ptr -3Eh
var_25		= byte ptr -25h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1B		= byte ptr -1Bh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 98h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	2Ah ; '*'
		push	134h
		push	99h ; '�'
		push	6
		lea	ax, [bp+var_98]
		push	ax
		call	sub_DAEB
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_6], eax
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		mov	[bp+var_7], al
		mov	eax, [bp+var_6]
		mov	[bp+var_48], eax
		mov	al, [bp+var_7]
		mov	[bp+var_44], al
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx+6]
		mov	[bp+var_42], eax
		mov	[bp+var_3E], 5Ch ; '\'
		mov	[bp+var_A], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_C], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_58B27
		jmp	loc_58BB0
; ���������������������������������������������������������������������������

loc_58B27:				; CODE XREF: sub_58A9D+85j
		push	0Ch
		push	41h ; 'A'
		push	9
		push	79h ; 'y'
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 7A8h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	bx, [bp+var_C]
		mov	al, [bx+4]
		mov	[bp+var_11], al
		mov	eax, [bp+var_10]
		mov	[di+1Eh], eax
		mov	al, [bp+var_11]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_C]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 5Dh ; ']'
		mov	word ptr [di+0Eh], 7DCh
		lea	ax, [bp+var_A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 810h
		mov	word ptr [di+2Eh], 5Eh ; '^'
		mov	ax, di
		jmp	short loc_58BB2
; ���������������������������������������������������������������������������

loc_58BB0:				; CODE XREF: sub_58A9D+87j
		mov	ax, di

loc_58BB2:				; CODE XREF: sub_58A9D+111j
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_14], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_16], ax
		or	ax, ax
		jnz	short loc_58BDE
		jmp	loc_58C9A
; ���������������������������������������������������������������������������

loc_58BDE:				; CODE XREF: sub_58A9D+13Cj
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	57h ; 'W'
		push	[bp+var_16]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_16]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_16]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_16]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_16]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_16]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		mov	bx, [bp+var_14]
		mov	al, [bx+4]
		mov	[bp+var_1B], al
		mov	bx, [bp+var_16]
		mov	eax, [bp+var_1A]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_16]
		mov	al, [bp+var_1B]
		mov	[bx+22h], al
		mov	bx, [bp+var_16]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_16]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_14]
		mov	eax, [bx+6]
		mov	bx, [bp+var_16]
		mov	[bx+24h], eax
		mov	bx, [bp+var_16]
		mov	word ptr [bx+28h], 5Fh ; '_'
		mov	bx, [bp+var_16]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_A]
		mov	bx, [bp+var_16]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_16]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_16]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_16]
		mov	word ptr [bx+2Eh], 60h ; '`'
		mov	ax, [bp+var_16]
		jmp	short loc_58C9D
; ���������������������������������������������������������������������������

loc_58C9A:				; CODE XREF: sub_58A9D+13Ej
		mov	ax, [bp+var_16]

loc_58C9D:				; CODE XREF: sub_58A9D+1FBj
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_20], ax
		or	ax, ax
		jnz	short loc_58CC9
		jmp	loc_58D86
; ���������������������������������������������������������������������������

loc_58CC9:				; CODE XREF: sub_58A9D+227j
		push	0Ch
		push	41h ; 'A'
		push	18h
		push	9Bh ; '�'
		push	[bp+var_20]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_24], eax
		mov	bx, [bp+var_1E]
		mov	al, [bx+4]
		mov	[bp+var_25], al
		mov	bx, [bp+var_20]
		mov	eax, [bp+var_24]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_20]
		mov	al, [bp+var_25]
		mov	[bx+22h], al
		mov	bx, [bp+var_20]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_20]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_1E]
		mov	eax, [bx+6]
		mov	bx, [bp+var_20]
		mov	[bx+24h], eax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+28h], 61h ; 'a'
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 7DCh
		lea	ax, [bp+var_A]
		mov	bx, [bp+var_20]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_20]
		mov	word ptr [bx+2Eh], 62h ; 'b'
		mov	ax, [bp+var_20]
		jmp	short loc_58D89
; ���������������������������������������������������������������������������

loc_58D86:				; CODE XREF: sub_58A9D+229j
		mov	ax, [bp+var_20]

loc_58D89:				; CODE XREF: sub_58A9D+2E7j
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	sub_E1FF
		add	sp, 6
		lea	ax, [bp+var_98]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_58DB5
; ���������������������������������������������������������������������������

loc_58DA6:				; CODE XREF: sub_58A9D+31Cj
		push	1
		lea	ax, [bp+var_98]
		push	ax
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_58DB5:				; CODE XREF: sub_58A9D+307j
		cmp	[bp+var_A], 0
		jz	short loc_58DA6
		lea	ax, [bp+var_98]
		push	ax
		call	sub_DFCA
		add	sp, 2
		mov	ax, [bp+var_A]
		cmp	ax, 0FFFEh
		jz	short loc_58DFC
		cmp	ax, 0FFFFh
		jz	short loc_58DD7
		jmp	short loc_58E11
; ���������������������������������������������������������������������������

loc_58DD7:				; CODE XREF: sub_58A9D+336j
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_55C7B
		add	sp, 2
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_58DFC:				; CODE XREF: sub_58A9D+331j
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_58E11:				; CODE XREF: sub_58A9D+338j
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	sub_DC89
		add	sp, 4
		mov	al, 2
		pop	di
		pop	si
		leave
		retf
sub_58A9D	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_58E2A	proc far		; CODE XREF: sub_42133J sub_5547D+5E0p

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word_45B54
		push	0FFh
		push	0D6Dh
		push	2Bh ; '+'
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	word_45B54
		push	0FFh
		push	0D8Fh
		push	37h ; '7'
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_56366
		add	sp, 2
		mov	[bp+var_2], al
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_58E2A	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_58E74	proc far		; CODE XREF: sub_4212EJ sub_5547D+5EEp

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word_45B54
		push	0FFh
		push	0DB4h
		push	2Bh ; '+'
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	word_45B54
		push	0FFh
		push	0DD4h
		push	37h ; '7'
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	word_45B54
		push	0FFh
		push	0DF8h
		push	43h ; 'C'
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	word_45B54
		push	0FFh
		push	0E1Bh
		push	4Fh ; 'O'
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_58A9D
		add	sp, 2
		mov	[bp+var_2], al
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_58E74	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_58EEA	proc far		; CODE XREF: sub_42165J sub_597B2+D1p

var_250		= word ptr -250h
var_24E		= word ptr -24Eh
var_246		= byte ptr -246h
var_244		= word ptr -244h
var_23E		= word ptr -23Eh
var_236		= word ptr -236h
var_234		= byte ptr -234h
var_233		= dword	ptr -233h
var_22F		= dword	ptr -22Fh
var_22B		= dword	ptr -22Bh
var_227		= word ptr -227h
var_225		= word ptr -225h
var_223		= dword	ptr -223h
var_21F		= dword	ptr -21Fh
var_21B		= dword	ptr -21Bh
var_217		= dword	ptr -217h
var_212		= word ptr -212h
var_1F5		= dword	ptr -1F5h
var_1F1		= dword	ptr -1F1h
var_1ED		= dword	ptr -1EDh
var_1E9		= word ptr -1E9h
var_1D4		= word ptr -1D4h
var_177		= dword	ptr -177h
var_173		= dword	ptr -173h
var_16F		= dword	ptr -16Fh
var_167		= byte ptr -167h
var_15E		= dword	ptr -15Eh
var_12C		= word ptr -12Ch
var_DC		= word ptr -0DCh
var_7F		= dword	ptr -7Fh
var_7B		= dword	ptr -7Bh
var_77		= dword	ptr -77h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 250h
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_DC], 556h
		mov	[bp+var_7B], 100h
		mov	[bp+var_7F], 0
		mov	[bp+var_DC], 56Eh
		mov	[bp+var_60], 0
		xor	ax, ax
		mov	[bp+var_62], ax
		movsx	eax, ax
		mov	[bp+var_77], eax
		mov	[bp+var_DC], 67Bh
		push	0
		push	0E34h
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ReadDispatch_3B57E
		add	sp, 6
		mov	al, 0
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aTemplate ; "template"
		push	ds
		push	offset a____DataMissio ; "..\\..\\data\\missions\\"
		lea	ax, [bp+var_12C]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_1D4]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_1D4], 556h
		mov	[bp+var_173], 100h
		mov	[bp+var_177], 0
		mov	[bp+var_1D4], 56Eh
		push	1
		lea	ax, [bp+var_12C]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		mov	bx, [bp+var_1D4]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1D4]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	large 0
		push	large [dword_43E69]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_3C730
		add	sp, 0Ah
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_3C7C6
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		push	large [dword_43E6E]
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_3CBF6
		add	sp, 8
		push	large 0
		push	large [dword_43E73]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	0
		push	large [dword_43E78]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_3CA4F
		add	sp, 4
		cmp	word ptr [si+28h], 1
		jz	short loc_5902F
		jmp	loc_590B2
; ���������������������������������������������������������������������������

loc_5902F:				; CODE XREF: sub_58EEA+140j
		mov	byte ptr [bp+var_244], 53h ; 'S'
		push	0E5Dh
		lea	ax, [bp+var_244+1]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_24], 0FEFE3000h
		mov	eax, [bp+var_24]
		mov	[bp+var_223], eax
		mov	[bp+var_28], 1F40000h
		mov	eax, [bp+var_28]
		mov	[bp+var_21F], eax
		mov	eax, [si]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		shl	eax, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_21B], eax
		mov	[bp+var_34], 0AFC800h
		mov	eax, [bp+var_34]
		mov	[bp+var_217], eax
		push	large [bp+var_77]
		push	large 31h ; '1'
		push	ss
		lea	ax, [bp+var_244]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 31h ; '1'

loc_590B2:				; CODE XREF: sub_58EEA+142j
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		lea	ax, [bp+var_1D4]
		push	ax
		push	large [dword_43E8C]
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_3CBF6
		add	sp, 8
		push	large 0
		push	large [dword_43E91]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	0
		push	large [dword_43E96]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_3CA4F
		add	sp, 4
		mov	ax, [si+14h]
		mov	[bp+var_2], ax
		push	large [bp+var_77]
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 2
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large [dword_43E9B]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	0
		push	large [dword_43EA0]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		push	large 9
		lea	ax, [bp+var_1D4]
		push	ax
		call	sub_3C5D6
		add	sp, 6
		mov	[bp+var_4], ax
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_3CA4F
		add	sp, 4
		cmp	word ptr [si+28h], 1
		jz	short loc_591B7
		jmp	loc_59236
; ���������������������������������������������������������������������������

loc_591B7:				; CODE XREF: sub_58EEA+2C8j
		mov	word ptr [bp+var_24+2],	0
		jmp	short loc_59230
; ���������������������������������������������������������������������������

loc_591BE:				; CODE XREF: sub_58EEA+34Aj
		mov	bx, word ptr [bp+var_24+2]
		shl	bx, 1
		mov	ax, [bx+si+6]
		mov	word ptr [bp+var_24], ax
		xor	di, di
		jmp	short loc_59223
; ���������������������������������������������������������������������������

loc_591CD:				; CODE XREF: sub_58EEA+341j
		mov	ax, word ptr [bp+var_24]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+0AA2h], 0
		jz	short loc_591F5
		mov	bx, [si+12h]
		shl	bx, 1
		push	word ptr [bx+0B84h]
		lea	ax, [bp+var_30+2]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_59204
; ���������������������������������������������������������������������������

loc_591F5:				; CODE XREF: sub_58EEA+2F2j
		push	0E85h
		lea	ax, [bp+var_30+2]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_59204:				; CODE XREF: sub_58EEA+309j
		push	large [bp+var_77]
		push	large 9
		push	ss
		lea	ax, [bp+var_30+2]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 9
		inc	di

loc_59223:				; CODE XREF: sub_58EEA+2E1j
		mov	bx, word ptr [bp+var_24+2]
		shl	bx, 1
		cmp	[bx+si+0Ch], di
		jg	short loc_591CD
		inc	word ptr [bp+var_24+2]

loc_59230:				; CODE XREF: sub_58EEA+2D2j
		cmp	word ptr [bp+var_24+2],	3
		jl	short loc_591BE

loc_59236:				; CODE XREF: sub_58EEA+2CAj
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large [dword_43EAC]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	0
		push	large [dword_43EB1]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		push	large 3Eh ; '>'
		lea	ax, [bp+var_1D4]
		push	ax
		call	sub_3C5D6
		add	sp, 6
		mov	[bp+var_6], ax
		push	large 3Eh ; '>'
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	[bp+var_A], 0FEE2D800h
		mov	eax, [bp+var_A]
		mov	[bp+var_1F5], eax
		mov	[bp+var_E], 1F40000h
		mov	eax, [bp+var_E]
		mov	[bp+var_1F1], eax
		mov	eax, [si]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	edx, eax
		mov	ecx, dword_46456
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_1ED], eax
		mov	[bp+var_1E9], 5Ah ; 'Z'
		push	large [bp+var_77]
		push	large 3Eh ; '>'
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 3Eh ; '>'
		mov	[bp+var_20], 1
		jmp	short loc_59369
; ���������������������������������������������������������������������������

loc_59331:				; CODE XREF: sub_58EEA+485j
		push	large 3Eh ; '>'
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		push	large [bp+var_77]
		push	large 3Eh ; '>'
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 3Eh ; '>'
		inc	[bp+var_20]

loc_59369:				; CODE XREF: sub_58EEA+445j
		mov	ax, [bp+var_20]
		cmp	ax, [bp+var_6]
		jl	short loc_59331
		cmp	word ptr [si+28h], 1
		jz	short loc_5937A
		jmp	loc_594DC
; ���������������������������������������������������������������������������

loc_5937A:				; CODE XREF: sub_58EEA+48Bj
		mov	ax, [bp+var_4]
		mov	word ptr [bp+var_24+2],	ax
		mov	[bp+var_28+2], 0FF198800h
		mov	[bp+var_2C+2], 1F40000h
		mov	eax, [bp+var_12]
		mov	[bp+var_30+2], eax
		mov	word ptr [bp+var_30], 0
		jmp	loc_594D3
; ���������������������������������������������������������������������������

loc_593A0:				; CODE XREF: sub_58EEA+5EFj
		mov	word ptr [bp+var_34+2],	0
		jmp	loc_594B8
; ���������������������������������������������������������������������������

loc_593A8:				; CODE XREF: sub_58EEA+5DBj
		mov	bx, word ptr [bp+var_30]
		shl	bx, 1
		mov	di, [bx+si+6]
		mov	ax, word ptr [bp+var_24+2]
		mov	[bp+var_250], ax
		push	8
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		push	word ptr [bx+0A96h]
		lea	ax, [bp+var_24E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_246], 0
		push	8
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		push	word ptr [bx+0A98h]
		lea	ax, [bp+var_23E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_236], 0FFFFh
		mov	[bp+var_234], 0
		mov	eax, [bp+var_28+2]
		mov	[bp+var_233], eax
		mov	eax, [bp+var_2C+2]
		mov	[bp+var_22F], eax
		mov	eax, [bp+var_30+2]
		mov	[bp+var_22B], eax
		mov	[bp+var_227], 10Eh
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+0AA2h], 0
		jz	short loc_59438
		mov	[bp+var_225], 0C8h ; '�'
		jmp	short loc_5943E
; ���������������������������������������������������������������������������

loc_59438:				; CODE XREF: sub_58EEA+544j
		mov	[bp+var_225], 64h ; 'd'

loc_5943E:				; CODE XREF: sub_58EEA+54Cj
		mov	byte ptr [bp+var_223], 0FFh
		mov	word ptr [bp+var_223+1], 0FFFFh
		mov	word ptr [bp+var_223+3], 0
		mov	word ptr [bp+var_21F+1], 0
		mov	word ptr [bp+var_21F+3], 0
		mov	word ptr [bp+var_21B+1], 0FFFFh
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+0AA2h], 0
		jz	short loc_59479
		mov	word ptr [bp+var_21B+3], 1
		jmp	short loc_5947F
; ���������������������������������������������������������������������������

loc_59479:				; CODE XREF: sub_58EEA+585j
		mov	word ptr [bp+var_21B+3], 2

loc_5947F:				; CODE XREF: sub_58EEA+58Dj
		mov	word ptr [bp+var_217+1], 3
		mov	word ptr [bp+var_217+3], 0FFFFh
		push	large [bp+var_77]
		push	large 3Eh ; '>'
		push	ss
		lea	ax, [bp+var_250]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 3Eh ; '>'
		add	[bp+var_2C+2], 12C00h
		inc	word ptr [bp+var_24+2]
		inc	word ptr [bp+var_34+2]

loc_594B8:				; CODE XREF: sub_58EEA+4BBj
		mov	bx, word ptr [bp+var_30]
		shl	bx, 1
		mov	ax, [bx+si+0Ch]
		cmp	ax, word ptr [bp+var_34+2]
		jle	short loc_594C8
		jmp	loc_593A8
; ���������������������������������������������������������������������������

loc_594C8:				; CODE XREF: sub_58EEA+5D9j
		add	[bp+var_28+2], 1F400h
		inc	word ptr [bp+var_30]

loc_594D3:				; CODE XREF: sub_58EEA+4B3j
		cmp	word ptr [bp+var_30], 3
		jge	short loc_594DC
		jmp	loc_593A0
; ���������������������������������������������������������������������������

loc_594DC:				; CODE XREF: sub_58EEA+48Dj
					; sub_58EEA+5EDj
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large [dword_43EB6]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	0
		push	large [dword_43EBB]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_3CA4F
		add	sp, 4
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large [dword_43EC0]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	0
		push	large [dword_43EC5]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_3CA4F
		add	sp, 4
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large [dword_43ECA]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_3C730
		add	sp, 0Ah
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_3C7C6
		add	sp, 2
		push	0
		push	large [dword_43ECF]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperB_3CAA2
		add	sp, 4
		cmp	word ptr [si+28h], 1
		jz	short loc_595F7
		jmp	loc_596DF
; ���������������������������������������������������������������������������

loc_595F7:				; CODE XREF: sub_58EEA+708j
		push	large 0
		push	large [dword_43ED4]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		mov	byte ptr [bp+var_22B+1], 1
		mov	word ptr [bp+var_22B+2], 0Dh
		mov	[bp+var_227], 0FFFFh
		mov	[bp+var_225], 0FFFFh
		mov	word ptr [bp+var_223], 0FFFFh
		mov	byte ptr [bp+var_223+2], 0
		mov	word ptr [bp+var_223+3], 0
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_21F+1],	eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_21B+1],	eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		mov	[bp+var_217+1],	eax
		push	large [bp+var_77]
		push	large 18h
		push	ss
		lea	ax, [bp+var_22B+1]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 18h
		mov	ax, [bp+var_6]
		mov	word ptr [bp+var_30+2],	ax
		mov	word ptr [bp+var_30], 0
		jmp	short loc_596CC
; ���������������������������������������������������������������������������

loc_59693:				; CODE XREF: sub_58EEA+7E6j
		xor	di, di
		jmp	short loc_596BF
; ���������������������������������������������������������������������������

loc_59697:				; CODE XREF: sub_58EEA+7DDj
		mov	ax, word ptr [bp+var_30+2]
		mov	word ptr [bp+var_34+2],	ax
		inc	word ptr [bp+var_30+2]
		push	large [bp+var_77]
		push	large 2
		push	ss
		lea	ax, [bp+var_34+2]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	[bp+var_77], 2
		inc	di

loc_596BF:				; CODE XREF: sub_58EEA+7ABj
		mov	bx, word ptr [bp+var_30]
		shl	bx, 1
		cmp	[bx+si+0Ch], di
		jg	short loc_59697
		inc	word ptr [bp+var_30]

loc_596CC:				; CODE XREF: sub_58EEA+7A7j
		cmp	word ptr [bp+var_30], 3
		jl	short loc_59693
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2

loc_596DF:				; CODE XREF: sub_58EEA+70Aj
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_SeekAndRelease_3C857
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		push	large 0
		push	large [dword_43ED9]
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	0
		push	large [dword_43EDE]
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_3CA4F
		add	sp, 4
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_3C848
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_SeekAndRelease_3C857
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		mov	[bp+var_1D4], 56Eh
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	[bp+var_DC], 56Eh
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_58EEA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_597B2	proc far		; CODE XREF: sub_4211FJ

var_7C		= word ptr -7Ch
var_64		= word ptr -64h
var_5E		= dword	ptr -5Eh
var_5A		= byte ptr -5Ah
var_59		= byte ptr -59h
var_58		= dword	ptr -58h
var_52		= word ptr -52h
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		mov	si, [bp+arg_0]
		mov	byte_43BAA, 1
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		cmp	byte_46848, 2
		jnz	short loc_597F8
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh

loc_597F8:				; CODE XREF: sub_597B2+2Cj
		push	1Ch
		lea	ax, [bp+var_52]
		push	ax
		call	Speech_LoadBank_28D24
		add	sp, 4
		mov	[bp+var_1], 0
		lea	ax, [bp+var_7C]
		push	ax
		nop
		push	cs
		call	near ptr sub_598FC
		add	sp, 2
		lea	ax, [bp+var_7C]
		push	ax
		push	cs
		call	near ptr sub_5547D
		add	sp, 2
		mov	[bp+var_1], al
		call	TextScrollDisplayB_ApplyHelperD_3F784
		cmp	[bp+var_1], 0
		jz	short loc_59889
		mov	word ptr [si+261h], 6
		mov	word ptr [si+263h], 6
		mov	word ptr [si+265h], 0Ch
		mov	word ptr [si+267h], 0Ch
		mov	word ptr [si+269h], 18h
		mov	word ptr [si+26Bh], 18h
		mov	word ptr [si+26Dh], 4
		mov	word ptr [si+26Fh], 8
		mov	word ptr [si+271h], 6
		mov	byte ptr [si+0FCh], 0Bh
		push	0
		push	si
		call	sub_420A4
		add	sp, 4
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_59889
		lea	ax, [bp+var_7C]
		push	ax
		push	cs
		call	near ptr sub_58EEA
		add	sp, 2

loc_59889:				; CODE XREF: sub_597B2+7Bj
					; sub_597B2+CAj
		mov	byte_43BAA, 0
		call	sub_28D49
		mov	al, [bp+var_1]
		mov	[bp+var_2], al
		cmp	[bp+var_59], 0
		jz	short loc_598BD
		cmp	[bp+var_5E], 0
		jz	short loc_598BD
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_598BD:				; CODE XREF: sub_597B2+EBj
					; sub_597B2+F2j
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		mov	[bp+var_64], 0EC3h
		lea	ax, [bp+var_64]
		push	ax
		call	sub_2FEE0
		add	sp, 2
		mov	[bp+var_64], 2BDh
		lea	ax, [bp+var_64]
		push	ax
		call	sub_2FEE0
		add	sp, 2
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_597B2	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_598FC	proc far		; CODE XREF: sub_4211AJ sub_597B2+5Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_59918
		push	2Ah ; '*'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_59975

loc_59918:				; CODE XREF: sub_598FC+Aj
		mov	word ptr [si+18h], 2BDh
		xor	ax, ax
		mov	[si+1Ch], ax
		mov	[si+1Ah], ax
		mov	word ptr [si+18h], 0EC3h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	word ptr [si+28h], 0
		mov	dword ptr [si],	1388h
		mov	word ptr [si+4], 0
		mov	word ptr [si+12h], 0
		mov	word ptr [si+16h], 0
		mov	word ptr [si+14h], 0
		xor	di, di
		jmp	short loc_59970
; ���������������������������������������������������������������������������

loc_59966:				; CODE XREF: sub_598FC+77j
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+0Ch], 0
		inc	di

loc_59970:				; CODE XREF: sub_598FC+68j
		cmp	di, 3
		jl	short loc_59966

loc_59975:				; CODE XREF: sub_598FC+1Aj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_598FC	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5997F	proc far		; CODE XREF: sub_42115J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_599B7
		mov	word ptr [si], 0EC3h
		push	si
		call	sub_2FEE0
		add	sp, 2
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_599B7
		push	si
		call	sub_308
		add	sp, 2

loc_599B7:				; CODE XREF: sub_5997F+Dj
					; sub_5997F+2Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_5997F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_599BB	proc far		; CODE XREF: sub_42110J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_59A17
		mov	word ptr [si], 0EC7h
		cmp	byte ptr [si+9], 0
		jz	short loc_599F4
		cmp	dword ptr [si+4], 0
		jz	short loc_599F4
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_599F4:				; CODE XREF: sub_599BB+17j
					; sub_599BB+1Ej
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1
		jz	short loc_59A17
		push	si
		call	sub_308
		add	sp, 2

loc_59A17:				; CODE XREF: sub_599BB+Dj
					; sub_599BB+51j
		pop	di
		pop	si
		pop	bp
		retf
sub_599BB	endp

ovr190		ends
