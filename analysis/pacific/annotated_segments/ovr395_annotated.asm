ovr395		segment	para public 'OVERLAY' use16
		assume cs:ovr395
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E16A0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	large 0
		push	word_7D156
		call	sub_75D27
		add	sp, 6
		mov	bx, [bp+arg_0]
		shl	bx, 1
		push	word ptr [bx+6A28h]
		push	42CAh
		push	word_7D156
		call	sub_75D4A
		add	sp, 6
		pop	bp
		retf
sub_E16A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E16DE		proc far

var_10C		= word ptr -10Ch
var_AF		= dword ptr -0AFh
var_AB		= dword ptr -0ABh
var_A7		= dword ptr -0A7h
var_9F		= byte ptr -9Fh
var_9A		= word ptr -9Ah
var_96		= dword ptr -96h
var_64		= word ptr -64h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_3		= byte ptr -3
var_2		= byte ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10Ch
		push	si
		mov	al, [bp+arg_0]
		add	al, 30h
		mov	[bp+var_B], al
		push	42CDh
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_B]
		mov	[bp+var_3], al
		mov	[bp+var_2], 0
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large [bp+var_10]
		lea	ax, [bp+var_64]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_10C]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_10C], 508h
		mov	[bp+var_AB], 100h
		mov	[bp+var_AF], 0
		mov	[bp+var_10C], 520h
		push	1
		lea	ax, [bp+var_64]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		mov	bx, [bp+var_10C]
		call	dword ptr [bx+14h]
		add	sp, 6
		xor	si, si
		push	0
		push	large 4E474542h
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_E180B
		jmp	short loc_E17E5

loc_E179F:
		push	[bp+var_9A]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	bx, si
		shl	bx, 1
		mov	[bx+6A28h], ax
		push	ds
		mov	bx, si
		shl	bx, 1
		push	word ptr [bx+6A28h]
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		inc	si
		cmp	si, 14h
		jnz	short loc_E17D6
		push	7734h
		call	sub_1DDFE
		pop	cx

loc_E17D6:
		mov	eax, [bp+var_96]
		mov	[bp+var_A7], eax
		mov	[bp+var_9F], 0

loc_E17E5:
		push	1
		push	large 54584554h
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_E179F
		jmp	short loc_E180B

loc_E1800:
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+6A28h], 0
		inc	si

loc_E180B:
		cmp	si, 14h
		jl	short loc_E1800
		mov	[bp+var_10C], 520h
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_10C]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_E16DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E1833		proc far

var_14A		= word ptr -14Ah
var_ED		= word ptr -0EDh
var_D2		= word ptr -0D2h
var_71		= dword ptr -71h
var_6D		= dword ptr -6Dh
var_65		= word ptr -65h
var_61		= dword ptr -61h
var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14Ah
		push	si
		push	di
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	[bp+arg_4]
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	[bp+arg_2]
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_6D]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_65]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_E18A6
		mov	eax, [bp+var_71]
		jmp	short loc_E18AA

loc_E18A6:
		mov	eax, [bp+var_61]

loc_E18AA:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		push	edx
		push	large [bp+var_4]
		lea	ax, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_14A]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_7477
		add	sp, 0Ch
		mov	di, [bp+var_ED]
		xor	si, si
		jmp	short loc_E18F1

loc_E18D5:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	dx
		push	si
		lea	ax, [bp+var_14A]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_E18F1:
		cmp	si, di
		jl	short loc_E18D5
		mov	[bp+var_A], di
		push	2
		lea	ax, [bp+var_14A]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	ax, [bp+var_A]
		pop	di
		pop	si
		leave
		retf
sub_E1833		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E191D		proc far

var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	1B38h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_E1991
		mov	byte ptr [bp+var_4], 0
		mov	byte ptr [bp+var_4+1], 3Fh
		mov	[bp+var_2], 0
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76259
		add	sp, 8
		call	sub_75750

loc_E197C:
		call	sub_7575F
		mov	ah, 0
		or	ax, ax
		jz	short loc_E197C
		lea	ax, [bp+var_A]
		push	ax
		call	sub_7627C
		pop	cx

loc_E1991:
		call	sub_75750
		leave
		retf
sub_E191D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E1998		proc far

var_D0		= word ptr -0D0h
var_B1		= byte ptr -0B1h
var_AE		= word ptr -0AEh
var_5E		= word ptr -5Eh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0D0h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_3], 0
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_AE]
		push	ax
		push	0
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_E19F7

loc_E19D1:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5E]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E19F7:
		cmp	si, [bp+var_2]
		jl	short loc_E19D1
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx]
		mov	al, [bx+2]
		push	ax
		push	bx
		call	sub_76259
		add	sp, 8
		mov	[bp+var_4], 0
		push	[bp+arg_4]
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_60273
		add	sp, 8
		xor	si, si
		mov	[bp+var_6], 0
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_D0]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		jmp	loc_E1B46

loc_E1A64:
		mov	[bp+var_A], 9
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		push	1
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_75BF0
		add	sp, 4
		inc	[bp+var_6]
		push	0Bh
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	word_7AF7E
		push	[bp+arg_4]
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_E1AED
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	si
		cmp	si, [bp+var_2]
		jnz	short loc_E1AD5
		mov	[bp+var_4], 1
		jmp	short loc_E1AED

loc_E1AD5:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_D0]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_E1AED:
		cmp	[bp+var_6], 18h
		jnz	short loc_E1B03
		mov	[bp+var_A], 1Eh
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax

loc_E1B03:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_E1B17
		mov	ax, 1
		jmp	short loc_E1B19

loc_E1B17:
		xor	ax, ax

loc_E1B19:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E1B03
		cmp	[bp+var_B1], 0
		jz	short loc_E1B46
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_D0]
		push	ax
		call	sub_665AB
		add	sp, 4
		mov	[bp+var_4], 1
		mov	[bp+var_3], 1

loc_E1B46:
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E1B52
		jmp	loc_E1A64

loc_E1B52:
		push	0
		lea	ax, [bp+var_D0]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		xor	si, si
		jmp	loc_E1BED

loc_E1B66:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E1B8F
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E1B8F

loc_E1B8F:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E1BC8
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E1BC8
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E1BC8

loc_E1BC8:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E1BED:
		cmp	si, [bp+var_2]
		jge	short loc_E1BF5
		jmp	loc_E1B66

loc_E1BF5:
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	[bp+arg_4]
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_E1998		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E1C1D		proc far

var_AE		= word ptr -0AEh
var_5E		= word ptr -5Eh
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0AEh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	byte ptr [bp+var_6], 0
		mov	byte ptr [bp+var_6+1], 0
		mov	[bp+var_4], 0
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76268
		add	sp, 8
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_AE]
		push	ax
		push	2
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_E1CAA

loc_E1C84:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5E]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E1CAA:
		cmp	si, [bp+var_2]
		jl	short loc_E1C84
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+0Ah]
		mov	al, [bx+0Ch]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0Ah
		push	ax
		call	sub_76259
		add	sp, 8
		push	1
		push	[bp+arg_4]
		push	[bp+var_2]
		lea	ax, [bp+var_5E]
		push	ax
		call	sub_75E6C
		add	sp, 8
		mov	[bp+var_3], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E1D0C
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76286
		add	sp, 0Ah

loc_E1D0C:
		xor	si, si
		jmp	loc_E1D98

loc_E1D11:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E1D3A
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E1D3A

loc_E1D3A:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E1D73
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E1D73
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E1D73

loc_E1D73:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E1D98:
		cmp	si, [bp+var_2]
		jge	short loc_E1DA0
		jmp	loc_E1D11

loc_E1DA0:
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	al, [bp+var_3]
		mov	[bp+var_D], al
		lea	ax, [bp+var_C]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_D]
		pop	di
		pop	si
		leave
		retf
sub_E1C1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E1DC9		proc far

var_B6		= word ptr -0B6h
var_66		= word ptr -66h
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B6h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	byte ptr [bp+var_4], 0
		mov	byte ptr [bp+var_4+1], 0
		mov	[bp+var_2], 0
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_A]
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	sub_76259
		add	sp, 8
		xor	eax, eax
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_B6]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_B6]
		push	ax
		push	1
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_14], ax
		xor	si, si
		jmp	short loc_E1E76

loc_E1E50:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_66]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E1E76:
		cmp	si, [bp+var_14]
		jl	short loc_E1E50
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+arg_4]
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	2
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	[bp+arg_4]
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_4]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 5
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		mov	[bp+var_E], 0A0h
		mov	eax, dword_7B29D
		mov	[bp+var_12], eax

loc_E1EFE:
		mov	eax, [bp+var_12]
		add	eax, [bp+var_E]
		cmp	eax, dword_7B29D
		ja	short loc_E1F12
		mov	ax, 1
		jmp	short loc_E1F14

loc_E1F12:
		xor	ax, ax

loc_E1F14:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E1EFE
		push	0
		push	[bp+arg_4]
		push	[bp+var_14]
		lea	ax, [bp+var_66]
		push	ax
		call	sub_75E6C
		add	sp, 8
		mov	[bp+var_15], al
		xor	si, si
		jmp	loc_E1FBD

loc_E1F36:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_66]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E1F5F
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E1F5F

loc_E1F5F:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E1F98
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E1F98
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E1F98

loc_E1F98:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E1FBD:
		cmp	si, [bp+var_14]
		jge	short loc_E1FC5
		jmp	loc_E1F36

loc_E1FC5:
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	[bp+arg_4]
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	al, [bp+var_15]
		mov	[bp+var_16], al
		lea	ax, [bp+var_A]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_16]
		pop	di
		pop	si
		leave
		retf
sub_E1DC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E1FFD		proc far

var_B6		= word ptr -0B6h
var_66		= word ptr -66h
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B6h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	byte ptr [bp+var_6], 0
		mov	byte ptr [bp+var_6+1], 0
		mov	[bp+var_4], 0
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76259
		add	sp, 8
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_B6]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_B6]
		push	ax
		push	4
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_E209F

loc_E2079:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_66]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E209F:
		cmp	si, [bp+var_2]
		jl	short loc_E2079
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0Ch
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 14h
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		xor	eax, eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[bp+var_10], 64h
		mov	eax, dword_7B29D
		mov	[bp+var_14], eax

loc_E2117:
		mov	eax, [bp+var_14]
		add	eax, [bp+var_10]
		cmp	eax, dword_7B29D
		ja	short loc_E212B
		mov	ax, 1
		jmp	short loc_E212D

loc_E212B:
		xor	ax, ax

loc_E212D:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E2117
		push	0
		push	[bp+arg_4]
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 80003h
		call	sub_75E53
		add	sp, 4
		push	0Ch
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	1
		push	[bp+arg_4]
		push	[bp+var_2]
		lea	ax, [bp+var_66]
		push	ax
		call	sub_75E6C
		add	sp, 8
		mov	[bp+var_3], al
		xor	si, si
		jmp	loc_E21F8

loc_E2171:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_66]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E219A
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E219A

loc_E219A:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E21D3
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E21D3
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E21D3

loc_E21D3:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E21F8:
		cmp	si, [bp+var_2]
		jge	short loc_E2200
		jmp	loc_E2171

loc_E2200:
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	al, [bp+var_3]
		mov	[bp+var_15], al
		lea	ax, [bp+var_C]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_15]
		pop	di
		pop	si
		leave
		retf
sub_E1FFD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E2229		proc far

var_29A		= word ptr -29Ah
var_24A		= dword ptr -24Ah
var_246		= word ptr -246h
var_245		= word ptr -245h
var_244		= word ptr -244h
var_BA		= word ptr -0BAh
var_6A		= word ptr -6Ah
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 29Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		push	seg stub253
		push	offset sub_735A5
		push	large 10028h
		push	0Ah
		lea	ax, word ptr [bp+var_24A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	byte ptr [bp+var_12], 0
		mov	byte ptr [bp+var_12+1], 0
		mov	[bp+var_10], 0
		push	100h
		push	0
		lea	ax, [bp+var_18]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	sub_76259
		add	sp, 8
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_29A]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_29A]
		push	ax
		push	5
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		lea	ax, [bp+var_29A]
		push	ax
		push	9
		lea	ax, word ptr [bp+var_24A]
		push	ax
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_4], ax
		xor	si, si
		jmp	short loc_E230C

loc_E22E3:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_24A]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_BA]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E230C:
		cmp	si, [bp+var_2]
		jl	short loc_E22E3
		xor	si, si
		jmp	short loc_E233F

loc_E2315:
		push	large 180000h
		mov	ax, si
		add	ax, 2
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_6A]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E233F:
		mov	ax, [bp+var_2]
		add	ax, 0FFFEh
		cmp	ax, si
		jg	short loc_E2315
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0
		mov	al, byte ptr [bp+var_246]
		push	ax
		push	large [bp+var_24A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	3
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	di
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 2Dh
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		mov	[bp+var_A], 78h
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax

loc_E23C9:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_E23DD
		mov	ax, 1
		jmp	short loc_E23DF

loc_E23DD:
		xor	ax, ax

loc_E23DF:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E23C9
		push	0
		push	di
		push	[bp+var_2]
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_75E6C
		add	sp, 8
		mov	[bp+var_A], 5Ah
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax

loc_E2408:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_E241C
		mov	ax, 1
		jmp	short loc_E241E

loc_E241C:
		xor	ax, ax

loc_E241E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E2408
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 2Dh
		push	ax
		call	sub_76286
		add	sp, 0Ah
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 18h
		mov	word ptr [di+8], 13Fh
		mov	word ptr [di+0Ah], 91h
		mov	bx, word_7AF7E
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 18h
		mov	word ptr [bx+8], 13Fh
		mov	word ptr [bx+0Ah], 91h
		push	0
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+18h]
		push	ax
		push	large [bx+14h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0FFD80000h
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+0Eh]
		push	ax
		push	large [bx+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 110000h
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+4]
		push	ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	4
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	di
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 19h
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		xor	si, si
		jmp	loc_E2604

loc_E2533:
		mov	[bp+var_A], 9
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		push	0
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+18h]
		push	ax
		push	large [bx+14h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, 40h
		sub	ax, si
		mov	dx, 18h
		sub	dx, ax
		push	dx
		push	0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+0Eh]
		push	ax
		push	large [bx+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, si
		shl	ax, 1
		add	ax, 11h
		push	ax
		push	0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	bx, [bp+arg_0]
		mov	al, [bx+4]
		push	ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, si
		shl	ax, 1
		add	ax, 18h
		push	ax
		push	0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	di
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4

loc_E25E7:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_E25FB
		mov	ax, 1
		jmp	short loc_E25FD

loc_E25FB:
		xor	ax, ax

loc_E25FD:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E25E7
		inc	si

loc_E2604:
		cmp	si, 40h
		jge	short loc_E260C
		jmp	loc_E2533

loc_E260C:
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	word ptr [di+8], 13Fh
		mov	word ptr [di+0Ah], 0C7h
		mov	bx, word_7AF7E
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	word ptr [bx+8], 13Fh
		mov	word ptr [bx+0Ah], 0C7h
		push	0
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	di
		mov	ax, [bp+var_2]
		add	ax, 0FFFEh
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_75E6C
		add	sp, 8
		mov	[bp+var_5], al
		xor	si, si
		jmp	short loc_E268A

loc_E2660:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_6A]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E2689
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E2689

loc_E2689:
		inc	si

loc_E268A:
		mov	ax, [bp+var_2]
		add	ax, 0FFFEh
		cmp	ax, si
		jg	short loc_E2660
		xor	si, si
		jmp	short loc_E2715

loc_E2698:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+5], 0
		jz	short loc_E26E1
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_E26E1
		push	0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E26E1

loc_E26E1:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		inc	si

loc_E2715:
		cmp	si, [bp+var_2]
		jge	short loc_E271D
		jmp	loc_E2698

loc_E271D:
		xor	si, si
		jmp	loc_E27CC

loc_E2722:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_BA]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E274C
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E274C

loc_E274C:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_245]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_E2797
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_24A]
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_E2797
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_246]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, word ptr [bp+var_24A]
		add	ax, dx
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E2797

loc_E2797:
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, word ptr [bp+var_24A]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_245]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_244]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	si

loc_E27CC:
		cmp	si, [bp+var_4]
		jge	short loc_E27D4
		jmp	loc_E2722

loc_E27D4:
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	di
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	al, [bp+var_5]
		mov	[bp+var_19], al
		lea	ax, [bp+var_18]
		push	ax
		call	sub_7627C
		pop	cx
		push	seg stub253
		push	offset sub_735A0
		push	large 10028h
		push	0Ah
		lea	ax, word ptr [bp+var_24A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	al, [bp+var_19]
		pop	di
		pop	si
		leave
		retf
sub_E2229		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E2825		proc far

var_B6		= word ptr -0B6h
var_66		= word ptr -66h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B6h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_3], 0
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_B6]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_B6]
		push	ax
		push	3
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_E2887

loc_E285E:
		push	large 180000h
		mov	ax, si
		add	ax, 2
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_66]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E2887:
		mov	ax, [bp+var_2]
		add	ax, 0FFFEh
		cmp	ax, si
		jg	short loc_E285E
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+0Fh]
		mov	al, [bx+11h]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0Fh
		push	ax
		call	sub_76259
		add	sp, 8
		mov	[bp+var_4], 0
		xor	si, si
		mov	[bp+var_6], 0
		mov	[bp+var_8], 0
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+arg_4]
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		push	5
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		jmp	loc_E2A12

loc_E28FA:
		mov	[bp+var_C], 0Ah
		mov	eax, dword_7B29D
		mov	[bp+var_10], eax
		add	[bp+var_8], 2
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		mov	ax, [bp+var_6]
		add	ax, 0FED5h
		push	ax
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	al, [di+0Eh]
		push	ax
		push	large [di+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		mov	ax, [bp+var_6]
		add	ax, 14h
		push	ax
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		add	[bp+var_6], 3
		mov	ax, [bp+arg_4]
		mov	[bp+var_16], ax
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	3Ch
		mov	ax, 78h
		sub	ax, [bp+var_8]
		push	ax
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_66]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_66]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		call	sub_67383
		pop	cx
		push	[bp+arg_4]
		push	word_7AF7C
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_66]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_E29F6
		inc	si
		mov	ax, [bp+var_2]
		add	ax, 0FFFEh
		cmp	ax, si
		jnz	short loc_E29F6
		mov	[bp+var_4], 1

loc_E29F6:
		mov	eax, [bp+var_10]
		add	eax, [bp+var_C]
		cmp	eax, dword_7B29D
		ja	short loc_E2A0A
		mov	ax, 1
		jmp	short loc_E2A0C

loc_E2A0A:
		xor	ax, ax

loc_E2A0C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E29F6

loc_E2A12:
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E2A1E
		jmp	loc_E28FA

loc_E2A1E:
		xor	si, si
		jmp	short loc_E2A4C

loc_E2A22:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_66]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E2A4B
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E2A4B

loc_E2A4B:
		inc	si

loc_E2A4C:
		mov	ax, [bp+var_2]
		add	ax, 0FFFEh
		cmp	ax, si
		jg	short loc_E2A22
		xor	si, si
		jmp	short loc_E2AB8

loc_E2A5A:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E2A93
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E2A93
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E2A93

loc_E2A93:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E2AB8:
		cmp	si, [bp+var_2]
		jl	short loc_E2A5A
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_E2825		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E2AE4		proc far

var_6C		= word ptr -6Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_5], 0
		mov	byte ptr [bp+var_8], 0
		mov	byte ptr [bp+var_8+1], 0
		mov	[bp+var_6], 0
		mov	byte ptr [bp+var_C], 3Fh
		mov	byte ptr [bp+var_C+1], 3Fh
		mov	[bp+var_A], 3Fh
		push	100h
		push	0
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76245
		add	sp, 6
		cmp	[bp+arg_6], 0
		jz	short loc_E2B2C
		push	100h
		push	0
		lea	ax, [bp+var_C]
		jmp	short loc_E2B34

loc_E2B2C:
		push	100h
		push	0
		lea	ax, [bp+var_8]

loc_E2B34:
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76259
		add	sp, 8
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_6C]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_6C]
		push	ax
		push	6
		push	si
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+arg_4]
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		xor	di, di
		jmp	loc_E2D07

loc_E2BA4:
		mov	[bp+var_16], 9
		mov	eax, dword_7B29D
		mov	[bp+var_1A], eax
		cmp	di, 0Ah
		jnz	short loc_E2BC0
		push	0
		push	cs
		call	near ptr sub_E16A0
		pop	cx

loc_E2BC0:
		cmp	di, 37h
		jnz	short loc_E2BCC
		push	1
		push	cs
		call	near ptr sub_E16A0
		pop	cx

loc_E2BCC:
		mov	[bp+var_4], 0
		jmp	loc_E2CE1

loc_E2BD4:
		push	large 0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	large 20000h
		mov	al, [si+0Eh]
		push	ax
		push	large [si+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	6Eh
		mov	ax, 140h
		sub	ax, di
		push	ax
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	large 10000h
		mov	al, [si+0Eh]
		push	ax
		push	large [si+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	69h
		mov	ax, di
		shl	ax, 1
		mov	dx, 145h
		sub	dx, ax
		push	dx
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	al, [si+0Eh]
		push	ax
		push	large [si+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	7Dh
		mov	ax, di
		imul	ax, ax, 3
		mov	dx, 140h
		sub	dx, ax
		push	dx
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	[bp+arg_4]
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	0Ch
		mov	ax, [bp+arg_2]
		add	ax, 1Eh
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_E2CC9
		push	1
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76259
		add	sp, 8

loc_E2CC9:
		call	sub_7575F
		or	al, al
		jz	short loc_E2CDE
		mov	[bp+var_5], 1
		mov	di, 64h
		mov	[bp+var_4], 3

loc_E2CDE:
		inc	[bp+var_4]

loc_E2CE1:
		cmp	[bp+var_4], 3
		jge	short loc_E2CEA
		jmp	loc_E2BD4

loc_E2CEA:
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_16]
		cmp	eax, dword_7B29D
		ja	short loc_E2CFE
		mov	ax, 1
		jmp	short loc_E2D00

loc_E2CFE:
		xor	ax, ax

loc_E2D00:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E2CEA
		inc	di

loc_E2D07:
		cmp	di, 64h
		jge	short loc_E2D0F
		jmp	loc_E2BA4

loc_E2D0F:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E2D2F
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	sub_76286
		add	sp, 0Ah

loc_E2D2F:
		xor	di, di
		jmp	short loc_E2D91

loc_E2D33:
		mov	bx, di
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+si+5], 0
		jz	short loc_E2D6C
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	ax, [bx+si]
		or	ax, [bx+si+2]
		jz	short loc_E2D6C
		push	0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	al, [bx+si+4]
		push	ax
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	dx, si
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E2D6C

loc_E2D6C:
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	word ptr [bx+si+2], 0
		mov	word ptr [bx+si], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+si+5], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+si+6], 0
		inc	di

loc_E2D91:
		cmp	di, [bp+var_2]
		jl	short loc_E2D33
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	al, [bp+var_5]
		mov	[bp+var_1B], al
		lea	ax, [bp+var_12]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_1B]
		pop	di
		pop	si
		leave
		retf
sub_E2AE4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E2DBF		proc far

var_AE		= word ptr -0AEh
var_5E		= word ptr -5Eh
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0AEh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	byte ptr [bp+var_6], 0
		mov	byte ptr [bp+var_6+1], 0
		mov	[bp+var_4], 0
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76268
		add	sp, 8
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_AE]
		push	ax
		push	7
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_E2E4C

loc_E2E26:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5E]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E2E4C:
		cmp	si, [bp+var_2]
		jl	short loc_E2E26
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx+23h]
		mov	al, [bx+25h]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 23h
		push	ax
		call	sub_76259
		add	sp, 8
		push	6
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	1
		push	[bp+arg_4]
		push	[bp+var_2]
		lea	ax, [bp+var_5E]
		push	ax
		call	sub_75E6C
		add	sp, 8
		mov	[bp+var_3], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E2EB5
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76286
		add	sp, 0Ah

loc_E2EB5:
		xor	si, si
		jmp	loc_E2F41

loc_E2EBA:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5E]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E2EE3
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E2EE3

loc_E2EE3:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E2F1C
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E2F1C
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E2F1C

loc_E2F1C:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E2F41:
		cmp	si, [bp+var_2]
		jge	short loc_E2F49
		jmp	loc_E2EBA

loc_E2F49:
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	al, [bp+var_3]
		mov	[bp+var_D], al
		lea	ax, [bp+var_C]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_D]
		pop	di
		pop	si
		leave
		retf
sub_E2DBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E2F72		proc far

var_96		= word ptr -96h
var_46		= word ptr -46h
var_41		= word ptr -41h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= byte ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_3], 0
		mov	[bp+var_4], 1
		push	seg stub381
		push	offset sub_75E3F
		push	large 10008h
		push	5
		lea	ax, [bp+var_46]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_8], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	byte ptr [bp+var_12], 0
		mov	byte ptr [bp+var_12+1], 0
		mov	[bp+var_10], 0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+arg_4]
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	seg seg008
		push	offset loc_5F4F
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_96]
		push	ax
		push	1
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		push	2
		push	42DBh
		lea	ax, [bp+var_46]
		mov	[bp+var_14], ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_75E5D
		add	sp, 6
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76259
		add	sp, 8
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	word_7AF7E
		push	[bp+arg_4]
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	si, 140h
		jmp	loc_E3192

loc_E3094:
		mov	[bp+var_18], 6
		mov	eax, dword_7B29D
		mov	[bp+var_1C], eax
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		mov	ax, si
		add	ax, 0FEC0h
		push	ax
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	al, [di+0Eh]
		push	ax
		push	large [di+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	18h
		push	si
		push	[bp+arg_4]
		call	sub_6A514
		add	sp, 0Ch
		cmp	si, 12Ch
		jnz	short loc_E3101
		push	7
		push	cs
		call	near ptr sub_E16A0
		pop	cx

loc_E3101:
		cmp	si, 0C8h
		jnz	short loc_E310E
		push	8
		push	cs
		call	near ptr sub_E16A0
		pop	cx

loc_E310E:
		cmp	si, 64h
		jnz	short loc_E311A
		push	9
		push	cs
		call	near ptr sub_E16A0
		pop	cx

loc_E311A:
		push	word_7AF7E
		push	[bp+arg_4]
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		call	sub_7575F
		or	al, al
		jz	short loc_E3138
		mov	[bp+var_3], 1
		jmp	short loc_E3199

loc_E3138:
		cmp	si, 131h
		jge	short loc_E3175
		cmp	[bp+var_4], 0
		jz	short loc_E3175
		push	0Dh
		lea	ax, [bp+var_41]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jz	short loc_E3171
		push	1
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76259
		add	sp, 8
		jmp	short loc_E3175

loc_E3171:
		mov	[bp+var_4], 0

loc_E3175:
		mov	eax, [bp+var_1C]
		add	eax, [bp+var_18]
		cmp	eax, dword_7B29D
		ja	short loc_E3189
		mov	ax, 1
		jmp	short loc_E318B

loc_E3189:
		xor	ax, ax

loc_E318B:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E3175
		dec	si

loc_E3192:
		or	si, si
		jl	short loc_E3199
		jmp	loc_E3094

loc_E3199:
		xor	si, si
		jmp	short loc_E31FB

loc_E319D:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E31D6
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E31D6
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E31D6

loc_E31D6:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E31FB:
		cmp	si, [bp+var_2]
		jl	short loc_E319D
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	al, [bp+var_3]
		mov	[bp+var_1D], al
		lea	ax, [bp+var_E]
		push	ax
		call	sub_7627C
		pop	cx
		push	seg stub381
		push	offset sub_75E30
		push	large 10008h
		push	5
		lea	ax, [bp+var_46]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	al, [bp+var_1D]
		pop	di
		pop	si
		leave
		retf
sub_E2F72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E3243		proc far

var_68		= word ptr -68h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_4]
		mov	byte ptr [bp+var_8], 0
		mov	byte ptr [bp+var_8+1], 0
		mov	[bp+var_6], 0
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76259
		add	sp, 8
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_68]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_68]
		push	ax
		push	8
		push	di
		push	cs
		call	near ptr sub_E1833
		add	sp, 6
		mov	[bp+var_2], ax
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	si
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 18h
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 90h
		mov	bx, word_7AF7E
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 18h
		mov	word ptr [bx+8], 13Fh
		mov	word ptr [bx+0Ah], 90h
		xor	eax, eax
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 180000h
		push	si
		call	sub_6A514
		add	sp, 0Ch
		push	0Ah
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	si
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 28h
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		mov	[bp+var_4], 0
		jmp	loc_E340A

loc_E3367:
		mov	[bp+var_12], 9
		mov	eax, dword_7B29D
		mov	[bp+var_16], eax
		push	0Ah
		push	cs
		call	near ptr sub_E16A0
		pop	cx
		push	large 0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, 18h
		sub	ax, [bp+var_4]
		push	ax
		push	0
		push	si
		call	sub_6A514
		add	sp, 0Ch
		cmp	[bp+var_4], 1Ch
		jle	short loc_E33DE
		push	large 0
		mov	al, [di+0Eh]
		push	ax
		push	large [di+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+var_4]
		shl	ax, 1
		add	ax, 0FFC8h
		mov	dx, 90h
		sub	dx, ax
		push	dx
		push	3Ch
		push	si
		call	sub_6A514
		add	sp, 0Ch

loc_E33DE:
		push	si
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4

loc_E33EB:
		mov	eax, [bp+var_16]
		add	eax, [bp+var_12]
		cmp	eax, dword_7B29D
		ja	short loc_E33FF
		mov	ax, 1
		jmp	short loc_E3401

loc_E33FF:
		xor	ax, ax

loc_E3401:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E33EB
		inc	[bp+var_4]

loc_E340A:
		cmp	[bp+var_4], 50h
		jge	short loc_E3413
		jmp	loc_E3367

loc_E3413:
		mov	[bp+var_12], 0B4h
		mov	eax, dword_7B29D
		mov	[bp+var_16], eax

loc_E3423:
		mov	eax, [bp+var_16]
		add	eax, [bp+var_12]
		cmp	eax, dword_7B29D
		ja	short loc_E3437
		mov	ax, 1
		jmp	short loc_E3439

loc_E3437:
		xor	ax, ax

loc_E3439:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E3423
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 0C7h
		mov	bx, word_7AF7E
		mov	word ptr [bx+4], 0
		mov	word ptr [bx+6], 0
		mov	word ptr [bx+8], 13Fh
		mov	word ptr [bx+0Ah], 0C7h
		mov	[bp+var_4], 0
		jmp	short loc_E34D9

loc_E3472:
		mov	bx, [bp+var_4]
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E34AF
		mov	bx, [bp+var_4]
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E34AF
		push	0
		mov	bx, [bp+var_4]
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, [bp+var_4]
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E34AF

loc_E34AF:
		mov	bx, [bp+var_4]
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, [bp+var_4]
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, [bp+var_4]
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	[bp+var_4]

loc_E34D9:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jl	short loc_E3472
		push	0
		push	word_7D156
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	si
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	al, [bp+var_5]
		mov	[bp+var_17], al
		lea	ax, [bp+var_E]
		push	ax
		call	sub_7627C
		pop	cx
		mov	al, [bp+var_17]
		pop	di
		pop	si
		leave
		retf
sub_E3243		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (fichiers, chunks et appels ; pas ligne par ligne). Texte de fin n : nom
; « endtext » + chiffre n (DS 17101), FORM BEGN, jusqu'à 20 chunks TEXT (sub_E16DE), police
; convfont ; table de 5 cas (n de 1 à 5), morceaux 11, 15…
; ==============================================================================================
Gameflow_PlayEndText_E3517		proc far

var_2AE		= word ptr -2AEh
var_29E		= word ptr -29Eh
var_29C		= word ptr -29Ch
var_29A		= word ptr -29Ah
var_296		= word ptr -296h
var_246		= word ptr -246h
var_B6		= word ptr -0B6h
var_84		= word ptr -84h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= byte ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2AEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	byte ptr [si+7C5h], 0
		call	Keyboard_DrainBufferBIOS_701E1
		mov	[bp+var_4], 0
		mov	[bp+var_3], 0
		mov	[bp+var_2], 0
		mov	[bp+var_8], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	[bp+var_34], 0
		mov	[bp+var_32], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_2C], 13Fh
		mov	[bp+var_2A], 0C7h
		push	0
		lea	ax, [bp+var_34]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	seg stub381
		push	offset sub_75E3F
		push	large 1000Ah
		push	5
		lea	ax, [bp+var_B6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 10028h
		push	0Ah
		lea	ax, [bp+var_246]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5F47
		lea	ax, [bp+var_296]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	0Ah
		lea	ax, [bp+var_296]
		push	ax
		lea	ax, [bp+var_B6]
		mov	[bp+var_18], ax
		lea	ax, [bp+var_18]
		push	ax
		call	sub_75E5D
		add	sp, 6
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aConvfont_2
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_26+2], dx
		mov	word ptr [bp+var_26], ax
		mov	eax, [bp+var_26]
		mov	[bp+var_22], eax
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 1
		mov	[bp+var_1C], 0
		lea	ax, word ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_2AE]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_29E], 1
		mov	[bp+var_29C], 0
		push	2Dh
		lea	ax, [bp+var_2AE]
		push	ax
		mov	bx, [bp+var_2AE]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_29A], ax
		push	0Fh
		lea	ax, [bp+var_2AE]
		push	ax
		call	sub_6932C
		add	sp, 4
		cmp	byte_7CB1B, 0
		jz	short loc_E36CB
		cmp	word_79E69, 0
		jz	short loc_E36CB
		mov	byte_7D180, 1
		jmp	short loc_E36D0

loc_E36CB:
		mov	byte_7D180, 0

loc_E36D0:
		lea	ax, [bp+var_2AE]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	0
		call	sub_75D04
		add	sp, 6
		mov	word_7D156, ax
		push	large 0C7013Fh
		push	large 9D0000h
		push	ax
		mov	bx, word_7D156
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ah
		mov	bx, word_7D156
		mov	byte ptr [bx+16h], 2
		push	di
		push	cs
		call	near ptr sub_E16DE
		pop	cx
		mov	byte_7D13E, 0
		mov	bx, di
		dec	bx
		cmp	bx, 4
		jbe	short loc_E371D
		jmp	loc_E3898

loc_E371D:
		shl	bx, 1
		jmp	cs:off_E3A48[bx]	; switch jump

loc_E3724:
		push	0Bh
		call	Music_SetPendingTune_5ED30
		pop	cx
		push	0
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E2AE4
		add	sp, 8
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E1DC9
		add	sp, 6
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E2229
		jmp	loc_E3895

loc_E376D:
		push	0Fh
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E2825
		add	sp, 6
		push	1
		call	Music_Stop_5ED8F
		jmp	short loc_E379A

loc_E3793:
		push	0Ah
		call	Music_SetPendingTune_5ED30

loc_E379A:
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E1FFD
		add	sp, 6
		push	0Ch
		call	Music_SetPendingTune_5ED30
		pop	cx
		push	1
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E2AE4
		add	sp, 8
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E1DC9
		jmp	loc_E3895

loc_E37E4:
		push	0Ch
		call	Music_SetPendingTune_5ED30
		pop	cx
		push	0
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E2AE4
		add	sp, 8
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E1C1D
		add	sp, 6
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E1DC9
		add	sp, 6
		push	10h
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E3243
		jmp	short loc_E3895

loc_E3849:
		push	0Eh
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E2F72
		add	sp, 6
		push	0Dh
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E2DBF
		add	sp, 6
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_B6]
		push	ax
		lea	ax, [bp+var_246]
		push	ax
		push	cs
		call	near ptr sub_E1998

loc_E3895:
		add	sp, 6

loc_E3898:
		push	word_7D14D
		call	sub_60DA5
		pop	cx
		jmp	short loc_E38AD

loc_E38A4:
		call	sub_7575F
		or	al, al
		jnz	short loc_E38B6

loc_E38AD:
		call	sub_5EE45
		or	al, al
		jnz	short loc_E38A4

loc_E38B6:
		push	1
		call	Music_Stop_5ED8F
		pop	cx
		mov	[bp+var_12], 64h
		mov	eax, dword_7B29D
		mov	[bp+var_16], eax

loc_E38CE:
		mov	eax, [bp+var_16]
		add	eax, [bp+var_12]
		cmp	eax, dword_7B29D
		ja	short loc_E38E2
		mov	ax, 1
		jmp	short loc_E38E4

loc_E38E2:
		xor	ax, ax

loc_E38E4:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E38CE
		mov	bx, word_7D14D
		cmp	word ptr [bx+7B8h], 0
		jz	short loc_E396B
		mov	bx, [bx+7B8h]
		cmp	byte ptr [bx+5], 0
		jz	short loc_E3930
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		cmp	dword ptr [bx], 0
		jz	short loc_E3930
		push	0
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	al, [bx+4]
		push	ax
		mov	bx, word_7D14D
		push	word ptr [bx+7B8h]
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E3930

loc_E3930:
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	dword ptr [bx], 0
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	byte ptr [bx+5], 0
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	dword ptr [bx+6], 0
		mov	bx, word_7D14D
		push	word ptr [bx+7B8h]
		call	sub_3B2
		pop	cx
		jmp	short loc_E396B

loc_E396B:
		cmp	word_7D156, 0
		jz	short loc_E398B
		mov	ax, word_7D156
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	word_7D156
		call	sub_3B2
		pop	cx
		jmp	short loc_E398B

loc_E398B:
		xor	di, di
		jmp	short loc_E39A9

loc_E398F:
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+6A28h], 0
		jz	short loc_E39A8
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+6A28h]
		call	sub_3B2
		pop	cx

loc_E39A8:
		inc	di

loc_E39A9:
		cmp	di, 14h
		jl	short loc_E398F
		mov	byte ptr [si+7C5h], 1
		push	2
		lea	ax, [bp+var_2AE]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_1D], 0
		jz	short loc_E39E6
		cmp	[bp+var_22], 0
		jz	short loc_E39E6
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E39E6

loc_E39E6:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	seg stub253
		push	offset sub_735A0
		push	large 10028h
		push	0Ah
		lea	ax, [bp+var_246]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub381
		push	offset sub_75E30
		push	large 1000Ah
		push	5
		lea	ax, [bp+var_B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_34]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_E]
		push	ax
		call	sub_7627C
		pop	cx
		pop	di
		pop	si
		leave
		retf
Gameflow_PlayEndText_E3517		endp

; START OF FUNCTION CHUNK FOR Gameflow_PlayEndText_E3517
off_E3A48	dw offset loc_E3724
		dw offset loc_E376D
		dw offset loc_E3793
		dw offset loc_E37E4
		dw offset loc_E3849
; END OF FUNCTION CHUNK FOR Gameflow_PlayEndText_E3517
ovr395		ends
