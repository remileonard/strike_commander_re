ovr194		segment	para public 'OVERLAY' use16
		assume cs:ovr194
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C630		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
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
		jnz	short loc_5C655
		jmp	loc_5C76B

loc_5C655:
		mov	bx, [bp+var_6]
		mov	word ptr [bx], 4F8h
		mov	bx, [bp+var_6]
		mov	word ptr [bx+2], 0
		mov	bx, [bp+var_6]
		mov	word ptr [bx], 0E95h
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
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	bx, [bp+var_6]
		mov	eax, [bp+var_12]
		mov	[bx+4], eax
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
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	sub_392F6
		add	sp, 8
		mov	ax, [bp+var_6]
		jmp	short loc_5C76E

loc_5C76B:
		mov	ax, [bp+var_6]

loc_5C76E:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	di
		call	sub_365EE
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5C630		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C781		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+2]
		or	di, di
		jz	short loc_5C7C9
		mov	ax, di
		add	ax, 0Eh
		push	ax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	sub_38CDA
		add	sp, 8
		push	0
		push	word ptr [si+2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6

loc_5C7C9:
		pop	di
		pop	si
		pop	bp
		retf
sub_5C781		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C7CD		proc far

var_1CA		= word ptr -1CAh
var_17A		= dword ptr -17Ah
var_176		= byte ptr -176h
var_175		= byte ptr -175h
var_174		= dword ptr -174h
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
var_68		= dword ptr -68h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_5F		= byte ptr -5Fh
var_5E		= dword ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_55		= byte ptr -55h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4B		= byte ptr -4Bh
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_43		= byte ptr -43h
var_42		= byte ptr -42h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_11		= word ptr -11h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1CAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	1
		push	0C99h
		lea	ax, [bp+var_132]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_140], 0
		mov	[bp+var_13E], 0
		mov	[bp+var_13C], 0
		mov	[bp+var_13A], 0
		mov	[bp+var_138], 13Fh
		mov	[bp+var_136], 0C7h
		push	0
		lea	ax, [bp+var_140]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_140]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		push	2
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	7
		lea	ax, [bp+var_132]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_11], 0
		lea	ax, word ptr [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6
		lea	ax, [bp+var_132]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	3
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	1
		lea	ax, [bp+var_132]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	ds
		push	offset aShp
		push	ds
		push	offset aTm
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_BA]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_32+2], dx
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
		push	offset aShp
		push	ds
		push	offset aBwfont
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_BA]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_BA]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_40+2], dx
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], 2
		mov	[bp+var_37], 1
		mov	[bp+var_36], 0
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, [bp+var_158]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[bp+var_148], 1
		mov	[bp+var_146], 0
		mov	[bp+var_144], 3
		lea	ax, [bp+var_158]
		push	ax
		push	word_4D36E
		call	sub_15DB7
		add	sp, 4
		mov	word ptr [si+28h], 0

loc_5C9F3:
		push	0
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_4D36C
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	0
		push	0
		mov	al, [bp+var_2A]
		push	ax
		push	word ptr [bp+var_2E+2]
		push	word ptr [bp+var_2E]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	3
		push	4
		push	word_4D36C
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	word_4D36E
		push	word_4D36C
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		push	2Ah
		push	134h
		push	99h
		push	6
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_12431
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
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5CADD
		jmp	loc_5CB67

loc_5CADD:
		push	0Ch
		push	88h
		push	9
		push	10h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_4E]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 2
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 2
		mov	ax, di
		jmp	short loc_5CB69

loc_5CB67:
		mov	ax, di

loc_5CB69:
		push	ax
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_58], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5A], ax
		or	ax, ax
		jnz	short loc_5CB95
		jmp	loc_5CC53

loc_5CB95:
		push	0Ch
		push	88h
		push	9
		push	9Bh
		push	[bp+var_5A]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_4E]
		mov	bx, [bp+var_5A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Ch], 1
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Eh], 4
		mov	ax, [bp+var_5A]
		jmp	short loc_5CC56

loc_5CC53:
		mov	ax, [bp+var_5A]

loc_5CC56:
		push	ax
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_62], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_64], ax
		or	ax, ax
		jnz	short loc_5CC82
		jmp	loc_5CD3F

loc_5CC82:
		push	0Ch
		push	41h
		push	18h
		push	9Bh
		push	[bp+var_64]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_4E]
		mov	bx, [bp+var_64]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Eh], 6
		mov	ax, [bp+var_64]
		jmp	short loc_5CD42

loc_5CD3F:
		mov	ax, [bp+var_64]

loc_5CD42:
		push	ax
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_5CD6E

loc_5CD5F:
		push	1
		lea	ax, [bp+var_1CA]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_5CD6E:
		cmp	[bp+var_4E], 0
		jz	short loc_5CD5F
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_12910
		add	sp, 2
		cmp	[bp+var_4E], 0FFFFh
		jnz	short loc_5CD9E
		mov	[bp+var_42], 1
		push	2
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_125CF
		add	sp, 4
		jmp	short loc_5CDDC
		jmp	short loc_5CDC4

loc_5CD9E:
		mov	ax, [bp+var_4E]
		mov	[si+28h], ax
		cmp	word ptr [si+28h], 1
		jnz	short loc_5CDB8
		push	si
		nop
		push	cs
		call	near ptr sub_60174
		add	sp, 2
		mov	[bp+var_42], al
		jmp	short loc_5CDC4

loc_5CDB8:
		push	si
		nop
		push	cs
		call	near ptr sub_601BE
		add	sp, 2
		mov	[bp+var_42], al

loc_5CDC4:
		push	2
		lea	ax, [bp+var_1CA]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_42], 0
		jnz	short loc_5CDDC
		jmp	loc_5C9F3

loc_5CDDC:
		cmp	[bp+var_42], 2
		jnz	short loc_5CDE7
		mov	ax, 1
		jmp	short loc_5CDE9

loc_5CDE7:
		xor	ax, ax

loc_5CDE9:
		mov	[bp+var_43], al
		push	2
		lea	ax, [bp+var_158]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_37], 0
		jz	short loc_5CE1F
		cmp	[bp+var_3C], 0
		jz	short loc_5CE1F
		push	0
		mov	al, [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5CE1F

loc_5CE1F:
		mov	[bp+var_3C], 0
		mov	[bp+var_37], 0
		mov	[bp+var_36], 0
		cmp	[bp+var_29], 0
		jz	short loc_5CE57
		cmp	[bp+var_2E], 0
		jz	short loc_5CE57
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5CE57

loc_5CE57:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		cmp	[bp+var_1F], 0
		jz	short loc_5CE8F
		cmp	[bp+var_24], 0
		jz	short loc_5CE8F
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5CE8F

loc_5CE8F:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		lea	ax, [bp+var_1A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_9], 0
		jz	short loc_5CEDF
		cmp	[bp+var_E], 0
		jz	short loc_5CEDF
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5CEDF

loc_5CEDF:
		mov	[bp+var_E], 0
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_140]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_132]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	al, [bp+var_43]
		pop	di
		pop	si
		leave
		retf
sub_5C7CD		endp

; START OF FUNCTION CHUNK FOR sub_5C7CD
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5C7CD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CF26		proc far

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
		call	sub_15E48
		add	sp, 2
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_6], dx
		push	word_4BD02
		mov	bx, word_4BD02
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
		call	near ptr sub_5C630
		add	sp, 4
		push	word_4BD04
		push	0FFh
		push	[bp+arg_6]
		push	di
		push	[bp+arg_2]
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		pop	di
		pop	si
		leave
		retf
sub_5CF26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CFC5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr sub_5C781
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_5CFC5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CFDC		proc far

var_C6		= word ptr -0C6h
var_76		= dword ptr -76h
var_72		= byte ptr -72h
var_71		= byte ptr -71h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_49		= byte ptr -49h
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3F		= byte ptr -3Fh
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
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

loc_5CFE8:
		mov	[bp+var_4], 5
		mov	[bp+var_6], 67h
		push	0CC3h
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_5CF26
		add	sp, 8
		push	0CCEh
		call	sub_15E48
		add	sp, 2
		add	[bp+var_4], ax
		push	2Ah
		push	134h
		push	99h
		push	6
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12431
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
		mov	[bp+var_6C], 44h
		mov	[bp+var_58], 0
		mov	[bp+var_56], 1
		mov	[bp+var_10], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_12], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5D099
		jmp	loc_5D122

loc_5D099:
		push	0Ch
		push	41h
		push	9
		push	13h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+28h], 45h
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 46h
		mov	ax, di
		jmp	short loc_5D124

loc_5D122:
		mov	ax, di

loc_5D124:
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1A], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1C], ax
		or	ax, ax
		jnz	short loc_5D150
		jmp	loc_5D20C

loc_5D150:
		push	0Ch
		push	41h
		push	9
		push	57h
		push	[bp+var_1C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 47h
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_1C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Eh], 48h
		mov	ax, [bp+var_1C]
		jmp	short loc_5D20F

loc_5D20C:
		mov	ax, [bp+var_1C]

loc_5D20F:
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_24], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_26], ax
		or	ax, ax
		jnz	short loc_5D23B
		jmp	loc_5D2F8

loc_5D23B:
		push	0Ch
		push	41h
		push	9
		push	9Bh
		push	[bp+var_26]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 49h
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_26]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Eh], 4Ah
		mov	ax, [bp+var_26]
		jmp	short loc_5D2FB

loc_5D2F8:
		mov	ax, [bp+var_26]

loc_5D2FB:
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_30], ax
		or	ax, ax
		jnz	short loc_5D327
		jmp	loc_5D3E4

loc_5D327:
		push	0Ch
		push	41h
		push	9
		push	0DFh
		push	[bp+var_30]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 4Bh
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_30]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Eh], 4Ch
		mov	ax, [bp+var_30]
		jmp	short loc_5D3E7

loc_5D3E4:
		mov	ax, [bp+var_30]

loc_5D3E7:
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_38], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_3A], ax
		or	ax, ax
		jnz	short loc_5D413
		jmp	loc_5D4CF

loc_5D413:
		push	0Ch
		push	41h
		push	18h
		push	57h
		push	[bp+var_3A]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 4Dh
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_3A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Eh], 4Eh
		mov	ax, [bp+var_3A]
		jmp	short loc_5D4D2

loc_5D4CF:
		mov	ax, [bp+var_3A]

loc_5D4D2:
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_42], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_44], ax
		or	ax, ax
		jnz	short loc_5D4FE
		jmp	loc_5D5BB

loc_5D4FE:
		push	0Ch
		push	41h
		push	18h
		push	9Bh
		push	[bp+var_44]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_44]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 4Fh
		mov	bx, [bp+var_44]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_44]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_44]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_44]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_44]
		mov	word ptr [bx+2Eh], 50h
		mov	ax, [bp+var_44]
		jmp	short loc_5D5BE

loc_5D5BB:
		mov	ax, [bp+var_44]

loc_5D5BE:
		push	ax
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_5D5EA

loc_5D5DB:
		push	1
		lea	ax, [bp+var_C6]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_5D5EA:
		cmp	[bp+var_10], 0
		jz	short loc_5D5DB
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_12910
		add	sp, 2
		mov	ax, [bp+var_10]
		cmp	ax, 0FFFEh
		jz	short loc_5D631
		cmp	ax, 0FFFFh
		jz	short loc_5D60C
		jmp	short loc_5D646

loc_5D60C:
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	2
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_5D631:
		push	2
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_5D646:
		movsx	eax, [bp+var_10]
		imul	eax, eax, 2710h
		add	eax, 0FFFFEC78h
		mov	[si], eax
		push	large [si]
		push	0CD9h
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
		call	near ptr sub_5CF26
		add	sp, 8
		jmp	short loc_5D681

loc_5D681:
		push	si
		nop
		push	cs
		call	near ptr sub_5F807
		add	sp, 2
		mov	[bp+var_2], al
		push	2
		lea	ax, [bp+var_C6]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_5D6A5
		jmp	loc_5CFE8

loc_5D6A5:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_5CFDC		endp

; START OF FUNCTION CHUNK FOR sub_5CFDC
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5CFDC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D6B0		proc far

var_D0		= word ptr -0D0h
var_80		= dword ptr -80h
var_7C		= byte ptr -7Ch
var_7B		= byte ptr -7Bh
var_7A		= dword ptr -7Ah
var_76		= word ptr -76h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D0h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_5D6BC:
		push	2Ah
		push	134h
		push	99h
		push	6
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12431
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
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5D73A
		jmp	loc_5D7C3

loc_5D73A:
		push	0Ch
		push	0Eh
		push	9
		push	71h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 9
		mov	ax, di
		jmp	short loc_5D7C5

loc_5D7C3:
		mov	ax, di

loc_5D7C5:
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_16], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18], ax
		or	ax, ax
		jnz	short loc_5D7F1
		jmp	loc_5D8AE

loc_5D7F1:
		push	0Ch
		push	0Eh
		push	9
		push	82h
		push	[bp+var_18]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_18]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Eh], 0Bh
		mov	ax, [bp+var_18]
		jmp	short loc_5D8B1

loc_5D8AE:
		mov	ax, [bp+var_18]

loc_5D8B1:
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_20], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_22], ax
		or	ax, ax
		jnz	short loc_5D8DD
		jmp	loc_5D99A

loc_5D8DD:
		push	0Ch
		push	0Eh
		push	9
		push	93h
		push	[bp+var_22]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_22]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Eh], 0Dh
		mov	ax, [bp+var_22]
		jmp	short loc_5D99D

loc_5D99A:
		mov	ax, [bp+var_22]

loc_5D99D:
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2A], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2C], ax
		or	ax, ax
		jnz	short loc_5D9C9
		jmp	loc_5DA86

loc_5D9C9:
		push	0Ch
		push	0Eh
		push	9
		push	0A4h
		push	[bp+var_2C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_2C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Eh], 0Fh
		mov	ax, [bp+var_2C]
		jmp	short loc_5DA89

loc_5DA86:
		mov	ax, [bp+var_2C]

loc_5DA89:
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_34], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_36], ax
		or	ax, ax
		jnz	short loc_5DAB5
		jmp	loc_5DB72

loc_5DAB5:
		push	0Ch
		push	0Eh
		push	9
		push	0B5h
		push	[bp+var_36]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_36]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_36]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_36]
		mov	word ptr [bx+2Ch], 5
		mov	bx, [bp+var_36]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_36]
		mov	word ptr [bx+2Eh], 11h
		mov	ax, [bp+var_36]
		jmp	short loc_5DB75

loc_5DB72:
		mov	ax, [bp+var_36]

loc_5DB75:
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_3E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_40], ax
		or	ax, ax
		jnz	short loc_5DBA1
		jmp	loc_5DC5D

loc_5DBA1:
		push	0Ch
		push	41h
		push	18h
		push	57h
		push	[bp+var_40]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_40]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_40]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_40]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_40]
		mov	word ptr [bx+2Eh], 13h
		mov	ax, [bp+var_40]
		jmp	short loc_5DC60

loc_5DC5D:
		mov	ax, [bp+var_40]

loc_5DC60:
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_48], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_4A], ax
		or	ax, ax
		jnz	short loc_5DC8C
		jmp	loc_5DD49

loc_5DC8C:
		push	0Ch
		push	41h
		push	18h
		push	9Bh
		push	[bp+var_4A]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_4A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_4A]
		mov	word ptr [bx+2Eh], 15h
		mov	ax, [bp+var_4A]
		jmp	short loc_5DD4C

loc_5DD49:
		mov	ax, [bp+var_4A]

loc_5DD4C:
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_5DD78

loc_5DD69:
		push	1
		lea	ax, [bp+var_D0]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_5DD78:
		cmp	[bp+var_C], 0
		jz	short loc_5DD69
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_12910
		add	sp, 2
		mov	ax, [bp+var_C]
		cmp	ax, 0FFFEh
		jz	short loc_5DDC0
		cmp	ax, 0FFFFh
		jz	short loc_5DD9A
		jmp	short loc_5DDD5

loc_5DD9A:
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		cmp	word ptr [si+16h], 0
		jz	short loc_5DDAB
		dec	word ptr [si+16h]

loc_5DDAB:
		push	2
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_5DDC0:
		push	2
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_5DDD5:
		mov	bx, [si+16h]
		shl	bx, 1
		mov	ax, [bp+var_C]
		mov	[bx+si+0Ch], ax
		mov	ax, [bp+var_C]
		add	[si+14h], ax
		push	[bp+var_C]
		push	0CE3h
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		mov	[bp+var_5C], 14h
		mov	ax, [si+16h]
		mov	dx, 0Ch
		imul	dx
		add	ax, 43h
		mov	[bp+var_5E], ax
		lea	ax, [bp+var_5A]
		push	ax
		push	[bp+var_5E]
		push	[bp+var_5C]
		push	si
		push	cs
		call	near ptr sub_5CF26
		add	sp, 8
		jmp	short loc_5DE1F

loc_5DE1F:
		push	si
		nop
		push	cs
		call	near ptr sub_5DE4E
		add	sp, 2
		mov	[bp+var_2], al
		push	2
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_5DE43
		jmp	loc_5D6BC

loc_5DE43:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_5D6B0		endp

; START OF FUNCTION CHUNK FOR sub_5D6B0
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5D6B0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5DE4E		proc far

var_16E		= word ptr -16Eh
var_15A		= word ptr -15Ah
var_10A		= dword ptr -10Ah
var_106		= byte ptr -106h
var_105		= byte ptr -105h
var_104		= dword ptr -104h
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
var_C2		= dword ptr -0C2h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_B9		= byte ptr -0B9h
var_B8		= dword ptr -0B8h
var_B4		= word ptr -0B4h
var_B2		= word ptr -0B2h
var_AF		= byte ptr -0AFh
var_AE		= dword ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A5		= byte ptr -0A5h
var_A4		= dword ptr -0A4h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9B		= byte ptr -9Bh
var_9A		= dword ptr -9Ah
var_96		= word ptr -96h
var_94		= word ptr -94h
var_91		= byte ptr -91h
var_90		= dword ptr -90h
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_87		= byte ptr -87h
var_86		= dword ptr -86h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7D		= byte ptr -7Dh
var_7C		= dword ptr -7Ch
var_78		= word ptr -78h
var_76		= word ptr -76h
var_73		= byte ptr -73h
var_72		= dword ptr -72h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_69		= byte ptr -69h
var_68		= dword ptr -68h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_5F		= byte ptr -5Fh
var_5E		= dword ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_55		= byte ptr -55h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4B		= byte ptr -4Bh
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_37		= byte ptr -37h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2D		= byte ptr -2Dh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
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
		jmp	short loc_5DE70

loc_5DE61:
		lea	ax, [bp+var_E8]
		mov	bx, [bp+var_4]
		add	bx, ax
		mov	byte ptr [bx], 0
		inc	[bp+var_4]

loc_5DE70:
		cmp	[bp+var_4], 10h
		jl	short loc_5DE61
		mov	[bp+var_8], 186A0h
		mov	[bp+var_4], 0
		jmp	short loc_5DF03

loc_5DE85:
		mov	bx, [bp+var_4]
		shl	bx, 1
		mov	cx, [bx+si+0Ch]
		mov	bx, [bp+var_4]
		shl	bx, 1
		mov	di, [bx+si+6]
		or	cx, cx
		jz	short loc_5DF00
		cmp	byte ptr [bp+di+var_E8], 0
		jz	short loc_5DEC0
		movsx	eax, cx
		push	eax
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A6Ch]
		pop	edx
		imul	eax, edx
		sub	[bp+var_8], eax
		jmp	short loc_5DEF6

loc_5DEC0:
		mov	ax, cx
		dec	ax
		movsx	eax, ax
		push	eax
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A6Ch]
		pop	edx
		imul	eax, edx
		push	eax
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A68h]
		pop	edx
		add	eax, edx
		sub	[bp+var_8], eax

loc_5DEF6:
		mov	al, byte ptr [bp+di+var_E8]
		add	al, cl
		mov	byte ptr [bp+di+var_E8], al

loc_5DF00:
		inc	[bp+var_4]

loc_5DF03:
		mov	ax, [si+16h]
		cmp	ax, [bp+var_4]
		jle	short loc_5DF0E
		jmp	loc_5DE85

loc_5DF0E:
		mov	[bp+var_4], 0
		jmp	loc_5DFB0

loc_5DF16:
		lea	ax, [bp+var_E8]
		mov	bx, [bp+var_4]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_5DF4B
		mov	bx, [si+16h]
		shl	bx, 1
		movsx	eax, word ptr [bx+si+0Ch]
		push	eax
		mov	ax, [bp+var_4]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A6Ch]
		pop	edx
		imul	eax, edx
		mov	[bp+var_C], eax
		jmp	short loc_5DF89

loc_5DF4B:
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
		mov	eax, [bx+0A6Ch]
		pop	edx
		imul	eax, edx
		push	eax
		mov	ax, [bp+var_4]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		mov	eax, [bx+0A68h]
		pop	edx
		add	eax, edx
		mov	[bp+var_C], eax

loc_5DF89:
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jge	short loc_5DFA1
		lea	ax, [bp+var_D8]
		mov	bx, [bp+var_4]
		add	bx, ax
		mov	byte ptr [bx], 1
		jmp	short loc_5DFAD

loc_5DFA1:
		lea	ax, [bp+var_D8]
		mov	bx, [bp+var_4]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_5DFAD:
		inc	[bp+var_4]

loc_5DFB0:
		cmp	[bp+var_4], 10h
		jge	short loc_5DFB9
		jmp	loc_5DF16

loc_5DFB9:
		push	4Fh
		push	134h
		push	74h
		push	6
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12431
		add	sp, 0Ah
		mov	ax, si
		add	ax, 1Eh
		mov	word ptr [bp+var_C+2], ax
		mov	bx, word ptr [bp+var_C+2]
		mov	eax, [bx]
		mov	[bp+var_E], eax
		mov	bx, word ptr [bp+var_C+2]
		mov	al, [bx+4]
		mov	[bp+var_F], al
		mov	eax, [bp+var_E]
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
		jnz	short loc_5E029
		jmp	loc_5E0DF

loc_5E029:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_14], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5E046
		jmp	loc_5E0CF

loc_5E046:
		push	0Ch
		push	41h
		push	7
		push	9
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 18h
		mov	ax, di
		jmp	short loc_5E0D1

loc_5E0CF:
		mov	ax, di

loc_5E0D1:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E0DF:
		cmp	byte ptr [bp+var_D8+1], 0
		jnz	short loc_5E0E9
		jmp	loc_5E1D4

loc_5E0E9:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1C], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1E], ax
		or	ax, ax
		jnz	short loc_5E107
		jmp	loc_5E1C3

loc_5E107:
		push	0Ch
		push	41h
		push	14h
		push	9
		push	[bp+var_1E]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_1E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_1E]
		mov	word ptr [bx+2Eh], 1Ah
		mov	ax, [bp+var_1E]
		jmp	short loc_5E1C6

loc_5E1C3:
		mov	ax, [bp+var_1E]

loc_5E1C6:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E1D4:
		cmp	[bp+var_D6], 0
		jnz	short loc_5E1DE
		jmp	loc_5E2C9

loc_5E1DE:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_26], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_28], ax
		or	ax, ax
		jnz	short loc_5E1FC
		jmp	loc_5E2B8

loc_5E1FC:
		push	0Ch
		push	41h
		push	21h
		push	9
		push	[bp+var_28]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_28]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_28]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_28]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_28]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_28]
		mov	word ptr [bx+2Eh], 1Ch
		mov	ax, [bp+var_28]
		jmp	short loc_5E2BB

loc_5E2B8:
		mov	ax, [bp+var_28]

loc_5E2BB:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E2C9:
		cmp	[bp+var_D5], 0
		jnz	short loc_5E2D3
		jmp	loc_5E3BE

loc_5E2D3:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_30], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_32], ax
		or	ax, ax
		jnz	short loc_5E2F1
		jmp	loc_5E3AD

loc_5E2F1:
		push	0Ch
		push	41h
		push	2Eh
		push	9
		push	[bp+var_32]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_32]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_32]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_32]
		mov	word ptr [bx+2Eh], 1Eh
		mov	ax, [bp+var_32]
		jmp	short loc_5E3B0

loc_5E3AD:
		mov	ax, [bp+var_32]

loc_5E3B0:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E3BE:
		cmp	[bp+var_D4], 0
		jnz	short loc_5E3C8
		jmp	loc_5E4B3

loc_5E3C8:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_3A], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_3C], ax
		or	ax, ax
		jnz	short loc_5E3E6
		jmp	loc_5E4A2

loc_5E3E6:
		push	0Ch
		push	41h
		push	7
		push	4Dh
		push	[bp+var_3C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_3C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+2Ch], 5
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+2Eh], 20h
		mov	ax, [bp+var_3C]
		jmp	short loc_5E4A5

loc_5E4A2:
		mov	ax, [bp+var_3C]

loc_5E4A5:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E4B3:
		cmp	[bp+var_D3], 0
		jnz	short loc_5E4BD
		jmp	loc_5E5A8

loc_5E4BD:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_44], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_46], ax
		or	ax, ax
		jnz	short loc_5E4DB
		jmp	loc_5E597

loc_5E4DB:
		push	0Ch
		push	41h
		push	14h
		push	4Dh
		push	[bp+var_46]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_46]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 21h
		mov	bx, [bp+var_46]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_46]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_46]
		mov	word ptr [bx+2Ch], 6
		mov	bx, [bp+var_46]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_46]
		mov	word ptr [bx+2Eh], 22h
		mov	ax, [bp+var_46]
		jmp	short loc_5E59A

loc_5E597:
		mov	ax, [bp+var_46]

loc_5E59A:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E5A8:
		cmp	[bp+var_D2], 0
		jnz	short loc_5E5B2
		jmp	loc_5E69D

loc_5E5B2:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_4E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_50], ax
		or	ax, ax
		jnz	short loc_5E5D0
		jmp	loc_5E68C

loc_5E5D0:
		push	0Ch
		push	41h
		push	21h
		push	4Dh
		push	[bp+var_50]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 23h
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_50]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_50]
		mov	word ptr [bx+2Ch], 7
		mov	bx, [bp+var_50]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_50]
		mov	word ptr [bx+2Eh], 24h
		mov	ax, [bp+var_50]
		jmp	short loc_5E68F

loc_5E68C:
		mov	ax, [bp+var_50]

loc_5E68F:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E69D:
		cmp	[bp+var_D1], 0
		jnz	short loc_5E6A7
		jmp	loc_5E792

loc_5E6A7:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_58], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_5A], ax
		or	ax, ax
		jnz	short loc_5E6C5
		jmp	loc_5E781

loc_5E6C5:
		push	0Ch
		push	41h
		push	2Eh
		push	4Dh
		push	[bp+var_5A]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 25h
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_5A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Ch], 8
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_5A]
		mov	word ptr [bx+2Eh], 26h
		mov	ax, [bp+var_5A]
		jmp	short loc_5E784

loc_5E781:
		mov	ax, [bp+var_5A]

loc_5E784:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E792:
		cmp	[bp+var_D0], 0
		jnz	short loc_5E79C
		jmp	loc_5E888

loc_5E79C:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_62], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_64], ax
		or	ax, ax
		jnz	short loc_5E7BA
		jmp	loc_5E877

loc_5E7BA:
		push	0Ch
		push	41h
		push	7
		push	91h
		push	[bp+var_64]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 27h
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_64]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Ch], 9
		mov	bx, [bp+var_64]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_64]
		mov	word ptr [bx+2Eh], 28h
		mov	ax, [bp+var_64]
		jmp	short loc_5E87A

loc_5E877:
		mov	ax, [bp+var_64]

loc_5E87A:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E888:
		cmp	[bp+var_CF], 0
		jnz	short loc_5E892
		jmp	loc_5E97E

loc_5E892:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_6C], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_6E], ax
		or	ax, ax
		jnz	short loc_5E8B0
		jmp	loc_5E96D

loc_5E8B0:
		push	0Ch
		push	41h
		push	14h
		push	91h
		push	[bp+var_6E]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 29h
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_6E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+2Ch], 0Ah
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_6E]
		mov	word ptr [bx+2Eh], 2Ah
		mov	ax, [bp+var_6E]
		jmp	short loc_5E970

loc_5E96D:
		mov	ax, [bp+var_6E]

loc_5E970:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5E97E:
		cmp	[bp+var_CE], 0
		jnz	short loc_5E988
		jmp	loc_5EA74

loc_5E988:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_76], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_78], ax
		or	ax, ax
		jnz	short loc_5E9A6
		jmp	loc_5EA63

loc_5E9A6:
		push	0Ch
		push	41h
		push	21h
		push	91h
		push	[bp+var_78]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 2Bh
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_78]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Ch], 0Bh
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Eh], 2Ch
		mov	ax, [bp+var_78]
		jmp	short loc_5EA66

loc_5EA63:
		mov	ax, [bp+var_78]

loc_5EA66:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5EA74:
		cmp	[bp+var_CD], 0
		jnz	short loc_5EA7E
		jmp	loc_5EB82

loc_5EA7E:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_80], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_82], ax
		or	ax, ax
		jnz	short loc_5EA9D
		jmp	loc_5EB70

loc_5EA9D:
		push	0Ch
		push	41h
		push	2Eh
		push	91h
		push	[bp+var_82]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_82]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 2Dh
		mov	bx, [bp+var_82]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_82]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_82]
		mov	word ptr [bx+2Ch], 0Ch
		mov	bx, [bp+var_82]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_82]
		mov	word ptr [bx+2Eh], 2Eh
		mov	ax, [bp+var_82]
		jmp	short loc_5EB74

loc_5EB70:
		mov	ax, [bp+var_82]

loc_5EB74:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5EB82:
		cmp	[bp+var_CC], 0
		jnz	short loc_5EB8C
		jmp	loc_5EC94

loc_5EB8C:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_8A], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_8C], ax
		or	ax, ax
		jnz	short loc_5EBAC
		jmp	loc_5EC82

loc_5EBAC:
		push	0Ch
		push	41h
		push	7
		push	0EBh
		push	[bp+var_8C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 2Fh
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_8C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+2Ch], 0Dh
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_8C]
		mov	word ptr [bx+2Eh], 30h
		mov	ax, [bp+var_8C]
		jmp	short loc_5EC86

loc_5EC82:
		mov	ax, [bp+var_8C]

loc_5EC86:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5EC94:
		cmp	[bp+var_CB], 0
		jnz	short loc_5EC9E
		jmp	loc_5EDA6

loc_5EC9E:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_94], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_96], ax
		or	ax, ax
		jnz	short loc_5ECBE
		jmp	loc_5ED94

loc_5ECBE:
		push	0Ch
		push	41h
		push	14h
		push	0EBh
		push	[bp+var_96]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_96]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 31h
		mov	bx, [bp+var_96]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_96]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_96]
		mov	word ptr [bx+2Ch], 0Eh
		mov	bx, [bp+var_96]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_96]
		mov	word ptr [bx+2Eh], 32h
		mov	ax, [bp+var_96]
		jmp	short loc_5ED98

loc_5ED94:
		mov	ax, [bp+var_96]

loc_5ED98:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5EDA6:
		cmp	[bp+var_CA], 0
		jnz	short loc_5EDB0
		jmp	loc_5EEB8

loc_5EDB0:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_9E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A0], ax
		or	ax, ax
		jnz	short loc_5EDD0
		jmp	loc_5EEA6

loc_5EDD0:
		push	0Ch
		push	41h
		push	21h
		push	0EBh
		push	[bp+var_A0]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 33h
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_A0]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+2Ch], 0Fh
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_A0]
		mov	word ptr [bx+2Eh], 34h
		mov	ax, [bp+var_A0]
		jmp	short loc_5EEAA

loc_5EEA6:
		mov	ax, [bp+var_A0]

loc_5EEAA:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5EEB8:
		cmp	[bp+var_C9], 0
		jnz	short loc_5EEC2
		jmp	loc_5EFCA

loc_5EEC2:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_A8], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_AA], ax
		or	ax, ax
		jnz	short loc_5EEE2
		jmp	loc_5EFB8

loc_5EEE2:
		push	0Ch
		push	41h
		push	2Eh
		push	0EBh
		push	[bp+var_AA]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 35h
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_AA]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+2Ch], 10h
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_AA]
		mov	word ptr [bx+2Eh], 36h
		mov	ax, [bp+var_AA]
		jmp	short loc_5EFBC

loc_5EFB8:
		mov	ax, [bp+var_AA]

loc_5EFBC:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6

loc_5EFCA:
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_B2], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_B4], ax
		or	ax, ax
		jnz	short loc_5EFEA
		jmp	loc_5F0BF

loc_5EFEA:
		push	0Ch
		push	41h
		push	3Dh
		push	57h
		push	[bp+var_B4]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 37h
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_B4]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_B4]
		mov	word ptr [bx+2Eh], 38h
		mov	ax, [bp+var_B4]
		jmp	short loc_5F0C3

loc_5F0BF:
		mov	ax, [bp+var_B4]

loc_5F0C3:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_BC], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_BE], ax
		or	ax, ax
		jnz	short loc_5F0F1
		jmp	loc_5F1C7

loc_5F0F1:
		push	0Ch
		push	41h
		push	3Dh
		push	9Bh
		push	[bp+var_BE]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 39h
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_12]
		mov	bx, [bp+var_BE]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_BE]
		mov	word ptr [bx+2Eh], 3Ah
		mov	ax, [bp+var_BE]
		jmp	short loc_5F1CB

loc_5F1C7:
		mov	ax, [bp+var_BE]

loc_5F1CB:
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_5F1F7

loc_5F1E8:
		push	1
		lea	ax, [bp+var_15A]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_5F1F7:
		cmp	[bp+var_12], 0
		jz	short loc_5F1E8
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_12910
		add	sp, 2
		mov	ax, [bp+var_12]
		cmp	ax, 0FFFEh
		jz	short loc_5F24B
		cmp	ax, 0FFFFh
		jz	short loc_5F219
		jmp	short loc_5F260

loc_5F219:
		mov	bx, [si+16h]
		shl	bx, 1
		mov	ax, [bx+si+0Ch]
		sub	[si+14h], ax
		mov	bx, [si+16h]
		shl	bx, 1
		mov	word ptr [bx+si+0Ch], 0
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_5F24B:
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_5F260:
		mov	bx, [si+16h]
		shl	bx, 1
		mov	ax, [bp+var_12]
		dec	ax
		mov	[bx+si+6], ax
		mov	ax, [bp+var_12]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		push	word ptr [bx+0A53h]
		lea	ax, [bp+var_16E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		cmp	word ptr [si+16h], 2
		jnz	short loc_5F29D
		push	0CE6h
		lea	ax, [bp+var_16E]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_5F29D:
		mov	[bp+var_C6], 1Eh
		mov	ax, [si+16h]
		mov	dx, 0Ch
		imul	dx
		add	ax, 43h
		mov	[bp+var_C8], ax
		lea	ax, [bp+var_16E]
		push	ax
		push	[bp+var_C8]
		push	[bp+var_C6]
		push	si
		push	cs
		call	near ptr sub_5CF26
		add	sp, 8
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_15E48
		add	sp, 2
		add	[bp+var_C6], ax
		jmp	short loc_5F2DA

loc_5F2DA:
		cmp	word ptr [si+16h], 2
		jge	short loc_5F2F6
		push	[bp+var_C8]
		push	[bp+var_C6]
		push	si
		nop
		push	cs
		call	near ptr sub_5F324
		add	sp, 6
		mov	[bp+var_2], al
		jmp	short loc_5F301

loc_5F2F6:
		push	si
		push	cs
		call	near ptr sub_5CFDC
		add	sp, 2
		mov	[bp+var_2], al

loc_5F301:
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_5F319
		jmp	loc_5DFB9

loc_5F319:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_5DE4E		endp

; START OF FUNCTION CHUNK FOR sub_5DE4E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5DE4E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F324		proc far

var_A4		= word ptr -0A4h
var_54		= dword ptr -54h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= dword ptr -8
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

loc_5F330:
		push	2Ah
		push	134h
		push	99h
		push	6
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_12431
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
		mov	[bp+var_4A], 3Bh
		mov	[bp+var_C], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5F3AE
		jmp	loc_5F437

loc_5F3AE:
		push	0Ch
		push	41h
		push	9
		push	57h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+28h], 3Ch
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 3Dh
		mov	ax, di
		jmp	short loc_5F439

loc_5F437:
		mov	ax, di

loc_5F439:
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_16], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_18], ax
		or	ax, ax
		jnz	short loc_5F465
		jmp	loc_5F522

loc_5F465:
		push	0Ch
		push	41h
		push	9
		push	9Bh
		push	[bp+var_18]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 3Eh
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_18]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_18]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_18]
		mov	word ptr [bx+2Eh], 3Fh
		mov	ax, [bp+var_18]
		jmp	short loc_5F525

loc_5F522:
		mov	ax, [bp+var_18]

loc_5F525:
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_20], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_22], ax
		or	ax, ax
		jnz	short loc_5F551
		jmp	loc_5F60D

loc_5F551:
		push	0Ch
		push	41h
		push	18h
		push	57h
		push	[bp+var_22]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 40h
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_22]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_22]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_22]
		mov	word ptr [bx+2Eh], 41h
		mov	ax, [bp+var_22]
		jmp	short loc_5F610

loc_5F60D:
		mov	ax, [bp+var_22]

loc_5F610:
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2A], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2C], ax
		or	ax, ax
		jnz	short loc_5F63C
		jmp	loc_5F6F9

loc_5F63C:
		push	0Ch
		push	41h
		push	18h
		push	9Bh
		push	[bp+var_2C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 42h
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_C]
		mov	bx, [bp+var_2C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+2Eh], 43h
		mov	ax, [bp+var_2C]
		jmp	short loc_5F6FC

loc_5F6F9:
		mov	ax, [bp+var_2C]

loc_5F6FC:
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_5F728

loc_5F719:
		push	1
		lea	ax, [bp+var_A4]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_5F728:
		cmp	[bp+var_C], 0
		jz	short loc_5F719
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_12910
		add	sp, 2
		mov	bx, [bp+var_C]
		sub	bx, 0FFFEh
		cmp	bx, 4
		jbe	short loc_5F749
		jmp	loc_5F7DA

loc_5F749:
		shl	bx, 1
		jmp	cs:off_5F7FD[bx]	; switch jump

loc_5F750:
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_5F76D:
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_5F782:
		cmp	word ptr [si+16h], 1
		jnz	short loc_5F79B
		push	0CE8h
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_5CF26
		add	sp, 8
		jmp	short loc_5F7AC

loc_5F79B:
		push	0CEEh
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_5CF26
		add	sp, 8

loc_5F7AC:
		inc	word ptr [si+16h]
		push	si
		push	cs
		call	near ptr sub_5D6B0
		add	sp, 2
		mov	[bp+var_2], al
		jmp	short loc_5F7DA

loc_5F7BC:
		push	0CF0h
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_5CF26
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_5CFDC
		add	sp, 2
		mov	[bp+var_2], al
		jmp	short loc_5F7DA

loc_5F7DA:
		push	2
		lea	ax, [bp+var_A4]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_5F7F2
		jmp	loc_5F330

loc_5F7F2:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_5F324		endp

; START OF FUNCTION CHUNK FOR sub_5F324
		pop	di
		pop	si
		leave
		retf
off_5F7FD	dw offset loc_5F76D
		dw offset loc_5F750
		dw offset loc_5F7DA
		dw offset loc_5F782
		dw offset loc_5F7BC
; END OF FUNCTION CHUNK FOR sub_5F324

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F807		proc far

var_C6		= word ptr -0C6h
var_B2		= word ptr -0B2h
var_62		= dword ptr -62h
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= dword ptr -5Ch
var_58		= word ptr -58h
var_3F		= byte ptr -3Fh
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
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

loc_5F813:
		mov	[bp+var_4], 5
		mov	[bp+var_6], 73h
		push	0CF2h
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_5CF26
		add	sp, 8
		push	0D11h
		call	sub_15E48
		add	sp, 2
		add	[bp+var_4], ax
		push	2Ah
		push	134h
		push	99h
		push	6
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_12431
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
		mov	[bp+var_58], 51h
		mov	[bp+var_10], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_12], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5F8BA
		jmp	loc_5F943

loc_5F8BA:
		push	0Ch
		push	41h
		push	9
		push	36h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+28h], 52h
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 53h
		mov	ax, di
		jmp	short loc_5F945

loc_5F943:
		mov	ax, di

loc_5F945:
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1A], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_1C], ax
		or	ax, ax
		jnz	short loc_5F971
		jmp	loc_5FA2D

loc_5F971:
		push	0Ch
		push	41h
		push	9
		push	7Ah
		push	[bp+var_1C]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 54h
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_1C]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+2Eh], 55h
		mov	ax, [bp+var_1C]
		jmp	short loc_5FA30

loc_5FA2D:
		mov	ax, [bp+var_1C]

loc_5FA30:
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_24], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_26], ax
		or	ax, ax
		jnz	short loc_5FA5C
		jmp	loc_5FB19

loc_5FA5C:
		push	0Ch
		push	41h
		push	9
		push	0BEh
		push	[bp+var_26]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 56h
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_26]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Ch], 3
		mov	bx, [bp+var_26]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_26]
		mov	word ptr [bx+2Eh], 57h
		mov	ax, [bp+var_26]
		jmp	short loc_5FB1C

loc_5FB19:
		mov	ax, [bp+var_26]

loc_5FB1C:
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_30], ax
		or	ax, ax
		jnz	short loc_5FB48
		jmp	loc_5FC04

loc_5FB48:
		push	0Ch
		push	41h
		push	18h
		push	57h
		push	[bp+var_30]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 58h
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_30]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_30]
		mov	word ptr [bx+2Eh], 59h
		mov	ax, [bp+var_30]
		jmp	short loc_5FC07

loc_5FC04:
		mov	ax, [bp+var_30]

loc_5FC07:
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_38], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_3A], ax
		or	ax, ax
		jnz	short loc_5FC33
		jmp	loc_5FCF0

loc_5FC33:
		push	0Ch
		push	41h
		push	18h
		push	9Bh
		push	[bp+var_3A]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 5Ah
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_10]
		mov	bx, [bp+var_3A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_3A]
		mov	word ptr [bx+2Eh], 5Bh
		mov	ax, [bp+var_3A]
		jmp	short loc_5FCF3

loc_5FCF0:
		mov	ax, [bp+var_3A]

loc_5FCF3:
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_5FD1F

loc_5FD10:
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_5FD1F:
		cmp	[bp+var_10], 0
		jz	short loc_5FD10
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_12910
		add	sp, 2
		mov	ax, [bp+var_10]
		cmp	ax, 0FFFEh
		jz	short loc_5FD6E
		cmp	ax, 0FFFFh
		jz	short loc_5FD41
		jmp	short loc_5FD83

loc_5FD41:
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_5FD6E:
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_5FD83:
		mov	ax, [bp+var_10]
		dec	ax
		mov	[si+12h], ax
		mov	bx, [si+12h]
		shl	bx, 1
		push	word ptr [bx+0B52h]
		push	0D30h
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
		call	near ptr sub_5CF26
		add	sp, 8
		jmp	short loc_5FDB8

loc_5FDB8:
		push	si
		nop
		push	cs
		call	near ptr sub_5FDE7
		add	sp, 2
		mov	[bp+var_2], al
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	sub_125CF
		add	sp, 4
		cmp	[bp+var_2], 0
		jnz	short loc_5FDDC
		jmp	loc_5F813

loc_5FDDC:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_5F807		endp

; START OF FUNCTION CHUNK FOR sub_5F807
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5F807

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5FDE7		proc far

var_98		= word ptr -98h
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 98h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	2Ah
		push	134h
		push	99h
		push	6
		lea	ax, [bp+var_98]
		push	ax
		call	sub_12431
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
		mov	[bp+var_3E], 5Ch
		mov	[bp+var_A], 0
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_C], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_5FE71
		jmp	loc_5FEFA

loc_5FE71:
		push	0Ch
		push	41h
		push	9
		push	79h
		push	di
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 704h
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
		mov	word ptr [di+28h], 5Dh
		mov	word ptr [di+0Eh], 738h
		lea	ax, [bp+var_A]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 76Ch
		mov	word ptr [di+2Eh], 5Eh
		mov	ax, di
		jmp	short loc_5FEFC

loc_5FEFA:
		mov	ax, di

loc_5FEFC:
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_14], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_16], ax
		or	ax, ax
		jnz	short loc_5FF28
		jmp	loc_5FFE4

loc_5FF28:
		push	0Ch
		push	41h
		push	18h
		push	57h
		push	[bp+var_16]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_16]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 5Fh
		mov	bx, [bp+var_16]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_A]
		mov	bx, [bp+var_16]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_16]
		mov	word ptr [bx+2Ch], 0FFFFh
		mov	bx, [bp+var_16]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_16]
		mov	word ptr [bx+2Eh], 60h
		mov	ax, [bp+var_16]
		jmp	short loc_5FFE7

loc_5FFE4:
		mov	ax, [bp+var_16]

loc_5FFE7:
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	sub_12B45
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_1E], ax
		push	30h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_20], ax
		or	ax, ax
		jnz	short loc_60013
		jmp	loc_600D0

loc_60013:
		push	0Ch
		push	41h
		push	18h
		push	9Bh
		push	[bp+var_20]
		call	sub_14A5A
		add	sp, 0Ah
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 704h
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
		mov	word ptr [bx+28h], 61h
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 738h
		lea	ax, [bp+var_A]
		mov	bx, [bp+var_20]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_20]
		mov	word ptr [bx+2Ch], 0FFFEh
		mov	bx, [bp+var_20]
		mov	word ptr [bx+0Eh], 76Ch
		mov	bx, [bp+var_20]
		mov	word ptr [bx+2Eh], 62h
		mov	ax, [bp+var_20]
		jmp	short loc_600D3

loc_600D0:
		mov	ax, [bp+var_20]

loc_600D3:
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	sub_12B45
		add	sp, 6
		lea	ax, [bp+var_98]
		push	ax
		call	sub_128E5
		add	sp, 2
		jmp	short loc_600FF

loc_600F0:
		push	1
		lea	ax, [bp+var_98]
		push	ax
		call	GaugeWidget_QueryAndFormat_12B9C
		add	sp, 4

loc_600FF:
		cmp	[bp+var_A], 0
		jz	short loc_600F0
		lea	ax, [bp+var_98]
		push	ax
		call	sub_12910
		add	sp, 2
		mov	ax, [bp+var_A]
		cmp	ax, 0FFFEh
		jz	short loc_60146
		cmp	ax, 0FFFFh
		jz	short loc_60121
		jmp	short loc_6015B

loc_60121:
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_5CFC5
		add	sp, 2
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_60146:
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_6015B:
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	sub_125CF
		add	sp, 4
		mov	al, 2
		pop	di
		pop	si
		leave
		retf
sub_5FDE7		endp

; START OF FUNCTION CHUNK FOR sub_5FDE7
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_5FDE7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60174		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word_4BD04
		push	0FFh
		push	0D3Bh
		push	2Bh
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	word_4BD04
		push	0FFh
		push	0D5Dh
		push	37h
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_5D6B0
		add	sp, 2
		mov	[bp+var_2], al
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_60174		endp

; START OF FUNCTION CHUNK FOR sub_60174
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_60174

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_601BE		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word_4BD04
		push	0FFh
		push	0D82h
		push	2Bh
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	word_4BD04
		push	0FFh
		push	0DA2h
		push	37h
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	word_4BD04
		push	0FFh
		push	0DC6h
		push	43h
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	word_4BD04
		push	0FFh
		push	0DE9h
		push	4Fh
		push	5
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_5FDE7
		add	sp, 2
		mov	[bp+var_2], al
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_601BE		endp

; START OF FUNCTION CHUNK FOR sub_601BE
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_601BE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60234		proc far

var_250		= word ptr -250h
var_24E		= word ptr -24Eh
var_246		= byte ptr -246h
var_244		= word ptr -244h
var_243		= word ptr -243h
var_23E		= word ptr -23Eh
var_236		= word ptr -236h
var_234		= byte ptr -234h
var_233		= dword ptr -233h
var_22F		= dword ptr -22Fh
var_22B		= dword ptr -22Bh
var_227		= word ptr -227h
var_225		= word ptr -225h
var_223		= dword ptr -223h
var_220		= word ptr -220h
var_21F		= dword ptr -21Fh
var_21E		= dword ptr -21Eh
var_21B		= dword ptr -21Bh
var_21A		= dword ptr -21Ah
var_217		= dword ptr -217h
var_216		= dword ptr -216h
var_212		= word ptr -212h
var_1F5		= dword ptr -1F5h
var_1F1		= dword ptr -1F1h
var_1ED		= dword ptr -1EDh
var_1E9		= word ptr -1E9h
var_1D4		= word ptr -1D4h
var_177		= dword ptr -177h
var_173		= dword ptr -173h
var_16F		= dword ptr -16Fh
var_167		= byte ptr -167h
var_15E		= dword ptr -15Eh
var_12C		= word ptr -12Ch
var_DC		= word ptr -0DCh
var_7F		= dword ptr -7Fh
var_7B		= dword ptr -7Bh
var_77		= dword ptr -77h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2E		= dword ptr -2Eh
var_2C		= dword ptr -2Ch
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
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
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_DC], 480h
		mov	[bp+var_7B], 100h
		mov	[bp+var_7F], 0
		mov	[bp+var_DC], 498h
		mov	[bp+var_60], 0
		xor	ax, ax
		mov	[bp+var_62], ax
		movsx	eax, ax
		mov	[bp+var_77], eax
		mov	[bp+var_DC], 5A5h
		push	0
		push	0E02h
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ReadDispatch_411DE
		add	sp, 6
		mov	al, 0
		push	ds
		push	offset aIff
		push	ds
		push	offset aTemplate
		push	ds
		push	offset aDataMissions
		lea	ax, [bp+var_12C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_1D4]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_1D4], 480h
		mov	[bp+var_173], 100h
		mov	[bp+var_177], 0
		mov	[bp+var_1D4], 498h
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
		call	sub_42C34
		add	sp, 2
		push	large 0
		push	large dword_497F7
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_30193
		add	sp, 0Ah
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_30229
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		push	large dword_497FC
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_30659
		add	sp, 8
		push	large 0
		push	large dword_49801
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	0
		push	large dword_49806
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_304B2
		add	sp, 4
		cmp	word ptr [si+28h], 1
		jz	short loc_60379
		jmp	loc_603FC

loc_60379:
		mov	byte ptr [bp+var_244], 53h
		push	0E2Bh
		lea	ax, [bp+var_243]
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
		push	large 31h
		push	ss
		lea	ax, [bp+var_244]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 31h

loc_603FC:
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		lea	ax, [bp+var_1D4]
		push	ax
		push	large dword_4981A
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_30659
		add	sp, 8
		push	large 0
		push	large dword_4981F
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	0
		push	large dword_49824
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_304B2
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
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 2
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large dword_49829
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	0
		push	large dword_4982E
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		push	large 9
		lea	ax, [bp+var_1D4]
		push	ax
		call	sub_42D79
		add	sp, 6
		mov	[bp+var_4], ax
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_304B2
		add	sp, 4
		cmp	word ptr [si+28h], 1
		jz	short loc_60501
		jmp	loc_60580

loc_60501:
		mov	word ptr [bp+var_24+2], 0
		jmp	short loc_6057A

loc_60508:
		mov	bx, word ptr [bp+var_24+2]
		shl	bx, 1
		mov	ax, [bx+si+6]
		mov	word ptr [bp+var_24], ax
		xor	di, di
		jmp	short loc_6056D

loc_60517:
		mov	ax, word ptr [bp+var_24]
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+0A70h], 0
		jz	short loc_6053F
		mov	bx, [si+12h]
		shl	bx, 1
		push	word ptr [bx+0B52h]
		lea	ax, word ptr [bp+var_2E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_6054E

loc_6053F:
		push	0E53h
		lea	ax, word ptr [bp+var_2E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_6054E:
		push	large [bp+var_77]
		push	large 9
		push	ss
		lea	ax, word ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 9
		inc	di

loc_6056D:
		mov	bx, word ptr [bp+var_24+2]
		shl	bx, 1
		cmp	[bx+si+0Ch], di
		jg	short loc_60517
		inc	word ptr [bp+var_24+2]

loc_6057A:
		cmp	word ptr [bp+var_24+2], 3
		jl	short loc_60508

loc_60580:
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large dword_4983A
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	0
		push	large dword_4983F
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		push	large 3Eh
		lea	ax, [bp+var_1D4]
		push	ax
		call	sub_42D79
		add	sp, 6
		mov	[bp+var_6], ax
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
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
		mov	ecx, dword_4C355
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_1ED], eax
		mov	[bp+var_1E9], 5Ah
		push	large [bp+var_77]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 3Eh
		mov	[bp+var_20], 1
		jmp	short loc_606B3

loc_6067B:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	large [bp+var_77]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_212]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 3Eh
		inc	[bp+var_20]

loc_606B3:
		mov	ax, [bp+var_20]
		cmp	ax, [bp+var_6]
		jl	short loc_6067B
		cmp	word ptr [si+28h], 1
		jz	short loc_606C4
		jmp	loc_60826

loc_606C4:
		mov	ax, [bp+var_4]
		mov	word ptr [bp+var_24+2], ax
		mov	[bp+var_26], 0FF198800h
		mov	[bp+var_2A], 1F40000h
		mov	eax, [bp+var_12]
		mov	[bp+var_2E], eax
		mov	word ptr [bp+var_30], 0
		jmp	loc_6081D

loc_606EA:
		mov	word ptr [bp+var_34+2], 0
		jmp	loc_60802

loc_606F2:
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
		push	word ptr [bx+0A64h]
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
		push	word ptr [bx+0A66h]
		lea	ax, [bp+var_23E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_236], 0FFFFh
		mov	[bp+var_234], 0
		mov	eax, [bp+var_26]
		mov	[bp+var_233], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_22F], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_22B], eax
		mov	[bp+var_227], 10Eh
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+0A70h], 0
		jz	short loc_60782
		mov	[bp+var_225], 0C8h
		jmp	short loc_60788

loc_60782:
		mov	[bp+var_225], 64h

loc_60788:
		mov	byte ptr [bp+var_223], 0FFh
		mov	word ptr [bp+var_223+1], 0FFFFh
		mov	[bp+var_220], 0
		mov	word ptr [bp+var_21E], 0
		mov	word ptr [bp+var_21E+2], 0
		mov	word ptr [bp+var_21A], 0FFFFh
		mov	ax, di
		mov	dx, 0Fh
		imul	dx
		mov	bx, ax
		cmp	byte ptr [bx+0A70h], 0
		jz	short loc_607C3
		mov	word ptr [bp+var_21A+2], 1
		jmp	short loc_607C9

loc_607C3:
		mov	word ptr [bp+var_21A+2], 2

loc_607C9:
		mov	word ptr [bp+var_216], 3
		mov	word ptr [bp+var_216+2], 0FFFFh
		push	large [bp+var_77]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_250]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 3Eh
		add	[bp+var_2A], 12C00h
		inc	word ptr [bp+var_24+2]
		inc	word ptr [bp+var_34+2]

loc_60802:
		mov	bx, word ptr [bp+var_30]
		shl	bx, 1
		mov	ax, [bx+si+0Ch]
		cmp	ax, word ptr [bp+var_34+2]
		jle	short loc_60812
		jmp	loc_606F2

loc_60812:
		add	[bp+var_26], 1F400h
		inc	word ptr [bp+var_30]

loc_6081D:
		cmp	word ptr [bp+var_30], 3
		jge	short loc_60826
		jmp	loc_606EA

loc_60826:
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large dword_49844
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	0
		push	large dword_49849
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_304B2
		add	sp, 4
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large dword_4984E
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	0
		push	large dword_49853
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_304B2
		add	sp, 4
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		push	large 0
		push	large dword_49858
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_30193
		add	sp, 0Ah
		lea	ax, [bp+var_DC]
		push	ax
		call	sub_30229
		add	sp, 2
		push	0
		push	large dword_4985D
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperB_30505
		add	sp, 4
		cmp	word ptr [si+28h], 1
		jz	short loc_60941
		jmp	loc_60A29

loc_60941:
		push	large 0
		push	large dword_49862
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		mov	byte ptr [bp+var_22B+1], 1
		mov	word ptr [bp+var_22B+2], 0Dh
		mov	[bp+var_227], 0FFFFh
		mov	[bp+var_225], 0FFFFh
		mov	word ptr [bp+var_223], 0FFFFh
		mov	byte ptr [bp+var_223+2], 0
		mov	[bp+var_220], 0
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_21E], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_21A], eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		mov	[bp+var_216], eax
		push	large [bp+var_77]
		push	large 18h
		push	ss
		lea	ax, word ptr [bp+var_22B+1]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 18h
		mov	ax, [bp+var_6]
		mov	word ptr [bp+var_2E], ax
		mov	word ptr [bp+var_30], 0
		jmp	short loc_60A16

loc_609DD:
		xor	di, di
		jmp	short loc_60A09

loc_609E1:
		mov	ax, word ptr [bp+var_2E]
		mov	word ptr [bp+var_34+2], ax
		inc	word ptr [bp+var_2E]
		push	large [bp+var_77]
		push	large 2
		push	ss
		lea	ax, word ptr [bp+var_34+2]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	[bp+var_77], 2
		inc	di

loc_60A09:
		mov	bx, word ptr [bp+var_30]
		shl	bx, 1
		cmp	[bx+si+0Ch], di
		jg	short loc_609E1
		inc	word ptr [bp+var_30]

loc_60A16:
		cmp	word ptr [bp+var_30], 3
		jl	short loc_609DD
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2

loc_60A29:
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_SeekAndRelease_302BA
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		push	large 0
		push	large dword_49867
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	0
		push	large dword_4986C
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_1D4]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_BridgeWrapperA_304B2
		add	sp, 4
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_302AB
		add	sp, 2
		mov	eax, [bp+var_15E]
		mov	[bp+var_16F], eax
		mov	[bp+var_167], 0
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_SeekAndRelease_302BA
		add	sp, 2
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		mov	[bp+var_1D4], 498h
		lea	ax, [bp+var_1D4]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_1D4]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	[bp+var_DC], 498h
		lea	ax, [bp+var_DC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_DC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_60234		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60AFC		proc far

var_7C		= word ptr -7Ch
var_64		= word ptr -64h
var_5E		= dword ptr -5Eh
var_5A		= byte ptr -5Ah
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_52		= word ptr -52h
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		mov	si, [bp+arg_0]
		mov	byte_49538, 1
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_60B6D
		shl	bx, 1
		jmp	cs:off_60C71[bx]	; switch jump

loc_60B1F:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_60B6D

loc_60B39:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_60B6D

loc_60B53:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_60B6D

loc_60B6D:
		push	1Ch
		lea	ax, [bp+var_52]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4
		mov	[bp+var_1], 0
		lea	ax, [bp+var_7C]
		push	ax
		nop
		push	cs
		call	near ptr sub_60C7B
		add	sp, 2
		lea	ax, [bp+var_7C]
		push	ax
		push	cs
		call	near ptr sub_5C7CD
		add	sp, 2
		mov	[bp+var_1], al
		call	TextScrollDisplayB_ApplyHelperD_4555C
		cmp	[bp+var_1], 0
		jz	short loc_60BFE
		mov	word ptr [si+262h], 6
		mov	word ptr [si+264h], 6
		mov	word ptr [si+266h], 0Ch
		mov	word ptr [si+268h], 0Ch
		mov	word ptr [si+26Ah], 18h
		mov	word ptr [si+26Ch], 18h
		mov	word ptr [si+26Eh], 4
		mov	word ptr [si+270h], 8
		mov	word ptr [si+272h], 6
		mov	byte ptr [si+0FDh], 0Bh
		push	0
		push	si
		call	sub_479F4
		add	sp, 4
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_60BFE
		lea	ax, [bp+var_7C]
		push	ax
		push	cs
		call	near ptr sub_60234
		add	sp, 2

loc_60BFE:
		mov	byte_49538, 0
		call	sub_2DA30
		mov	al, [bp+var_1]
		mov	[bp+var_2], al
		cmp	[bp+var_59], 0
		jz	short loc_60C32
		cmp	[bp+var_5E], 0
		jz	short loc_60C32
		push	0
		mov	al, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_60C32

loc_60C32:
		mov	[bp+var_5E], 0
		mov	[bp+var_59], 0
		mov	[bp+var_58], 0
		mov	[bp+var_64], 0E91h
		lea	ax, [bp+var_64]
		push	ax
		call	sub_36702
		add	sp, 2
		mov	[bp+var_64], 1E4h
		lea	ax, [bp+var_64]
		push	ax
		call	sub_36702
		add	sp, 2
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_60AFC		endp

; START OF FUNCTION CHUNK FOR sub_60AFC
		pop	si
		leave
		retf
off_60C71	dw offset loc_60B1F
		dw offset loc_60B53
		dw offset loc_60B39
		dw offset loc_60B53
		dw offset loc_60B53
; END OF FUNCTION CHUNK FOR sub_60AFC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60C7B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_60C97
		push	2Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_60CF4

loc_60C97:
		mov	word ptr [si+18h], 1E4h
		xor	ax, ax
		mov	[si+1Ch], ax
		mov	[si+1Ah], ax
		mov	word ptr [si+18h], 0E91h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	word ptr [si+28h], 0
		mov	dword ptr [si], 1388h
		mov	word ptr [si+4], 0
		mov	word ptr [si+12h], 0
		mov	word ptr [si+16h], 0
		mov	word ptr [si+14h], 0
		xor	di, di
		jmp	short loc_60CEF

loc_60CE5:
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+0Ch], 0
		inc	di

loc_60CEF:
		cmp	di, 3
		jl	short loc_60CE5

loc_60CF4:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_60C7B		endp

; START OF FUNCTION CHUNK FOR sub_60C7B
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_60C7B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60CFE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_60D36
		mov	word ptr [si], 0E91h
		push	si
		call	sub_36702
		add	sp, 2
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_60D36
		push	si
		call	sub_39C
		add	sp, 2

loc_60D36:
		pop	di
		pop	si
		pop	bp
		retf
sub_60CFE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60D3A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_60D96
		mov	word ptr [si], 0E95h
		cmp	byte ptr [si+9], 0
		jz	short loc_60D73
		cmp	dword ptr [si+4], 0
		jz	short loc_60D73
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_60D73

loc_60D73:
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1
		jz	short loc_60D96
		push	si
		call	sub_39C
		add	sp, 2

loc_60D96:
		pop	di
		pop	si
		pop	bp
		retf
sub_60D3A		endp
ovr194		ends
