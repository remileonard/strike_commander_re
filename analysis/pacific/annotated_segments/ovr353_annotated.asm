ovr353		segment	para public 'OVERLAY' use16
		assume cs:ovr353
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5070		proc far

var_F0		= word ptr -0F0h
var_A0		= word ptr -0A0h
var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0F0h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C5090
		push	78h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_C5090
		jmp	loc_C514B

loc_C5090:
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Eh], 2
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		mov	dword ptr [si+14h], 0
		mov	byte ptr [si+18h], 2
		mov	byte ptr [si+19h], 0
		mov	dword ptr [si+1Ah], 0
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	ax, si
		add	ax, 28h
		push	seg seg008
		push	offset loc_61EF
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_6204
		lea	ax, [bp+var_A0]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_620B
		lea	ax, [bp+var_F0]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_F0]
		push	ax
		push	ss
		lea	ax, [bp+var_A0]
		push	ax
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		mov	ax, si
		add	ax, 28h
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh

loc_C514B:
		mov	ax, si
		pop	si
		leave
		retf
sub_C5070		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5150		proc far

var_CA		= word ptr -0CAh
var_6D		= dword ptr -6Dh
var_69		= dword ptr -69h
var_65		= dword ptr -65h
var_5D		= byte ptr -5Dh
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0CAh
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 28h
		mov	[bp+var_2], ax
		lea	ax, [bp+var_CA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_CA], 508h
		mov	[bp+var_69], 100h
		mov	[bp+var_6D], 0
		mov	[bp+var_CA], 520h
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_CA]
		push	ax
		mov	bx, [bp+var_CA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4E525453h
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C51BA
		jmp	loc_C53E0

loc_C51BA:
		push	0
		push	large 48544150h
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C5242
		mov	eax, [bp+var_58]
		mov	[bp+var_6], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_6]
		mov	[si+6], eax
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	eax, [bp+var_54]
		mov	[bp+var_65], eax
		mov	[bp+var_5D], 0

loc_C5242:
		push	0
		push	large 454C4946h
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C52CC
		mov	eax, [bp+var_58]
		mov	[bp+var_E], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[si+0Ah], eax
		mov	byte ptr [si+0Eh], 2
		mov	byte ptr [si+0Fh], 1
		mov	dword ptr [si+10h], 0
		mov	eax, [bp+var_E]
		mov	[si+10h], eax
		push	0
		mov	al, [si+0Eh]
		push	ax
		push	large [si+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	eax, [bp+var_54]
		mov	[bp+var_65], eax
		mov	[bp+var_5D], 0

loc_C52CC:
		push	0
		push	large 4E545845h
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C5356
		mov	eax, [bp+var_58]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[si+14h], eax
		mov	byte ptr [si+18h], 2
		mov	byte ptr [si+19h], 1
		mov	dword ptr [si+1Ah], 0
		mov	eax, [bp+var_16]
		mov	[si+1Ah], eax
		push	0
		mov	al, [si+18h]
		push	ax
		push	large [si+14h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	eax, [bp+var_54]
		mov	[bp+var_65], eax
		mov	[bp+var_5D], 0

loc_C5356:
		push	0
		push	large 4353494Dh
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C53E0
		mov	eax, [bp+var_58]
		mov	[bp+var_1E], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[si+1Eh], eax
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 1
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_1E]
		mov	[si+24h], eax
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	eax, [bp+var_54]
		mov	[bp+var_65], eax
		mov	[bp+var_5D], 0

loc_C53E0:
		mov	[bp+var_CA], 520h
		lea	ax, [bp+var_CA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_CA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_C5150		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5403		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+5], 0
		jz	short loc_C542A
		cmp	dword ptr [si], 0
		jz	short loc_C542A
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C542A

loc_C542A:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		cmp	byte ptr [si+0Fh], 0
		jz	short loc_C5463
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_C5463
		push	0
		mov	al, [si+0Eh]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C5463

loc_C5463:
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		cmp	byte ptr [si+19h], 0
		jz	short loc_C549D
		cmp	dword ptr [si+14h], 0
		jz	short loc_C549D
		push	0
		mov	al, [si+18h]
		push	ax
		mov	ax, si
		add	ax, 14h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C549D

loc_C549D:
		mov	dword ptr [si+14h], 0
		mov	byte ptr [si+19h], 0
		mov	dword ptr [si+1Ah], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_C54D7
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_C54D7
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C54D7

loc_C54D7:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		pop	si
		pop	bp
		retf
sub_C5403		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C54EE		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_4], 0
		cmp	di, 64h
		jnb	short loc_C5569
		cmp	di, 50h
		jnb	short loc_C554A
		cmp	di, 32h
		jnb	short loc_C552E
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, di
		imul	bx, bx, 28h
		jmp	short loc_C5586

loc_C552E:
		push	0
		mov	al, [si+0Eh]
		push	ax
		push	large [si+0Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, di
		sub	bx, 32h
		jmp	short loc_C5583

loc_C554A:
		push	0
		mov	al, [si+18h]
		push	ax
		push	large [si+14h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, di
		sub	bx, 50h
		imul	bx, bx, 5
		jmp	short loc_C5586

loc_C5569:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, di
		sub	bx, 64h

loc_C5583:
		imul	bx, bx, 0Ah

loc_C5586:
		xor	si, si
		add	bx, ax
		adc	si, 0
		mov	cx, 0Ch
		shl	si, cl
		add	si, dx
		mov	word ptr [bp+var_4+2], si
		mov	word ptr [bp+var_4], bx
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_C54EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C55A4		proc far
		push	bp
		mov	bp, sp
		push	6996h
		push	cs
		call	near ptr sub_C5070
		pop	cx
		pop	bp
		retf
sub_C55A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C55B1		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7D0E9, 0
		jz	short loc_C55D9
		cmp	dword_7D0E4, 0
		jz	short loc_C55D9
		push	0
		mov	al, byte_7D0E8
		push	ax
		push	69B4h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C55D9

loc_C55D9:
		mov	dword_7D0E4, 0
		mov	byte_7D0E9, 0
		mov	dword_7D0EA, 0
		cmp	byte_7D0DF, 0
		jz	short loc_C5615
		cmp	dword_7D0DA, 0
		jz	short loc_C5615
		push	0
		mov	al, byte_7D0DE
		push	ax
		push	69AAh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C5615

loc_C5615:
		mov	dword_7D0DA, 0
		mov	byte_7D0DF, 0
		mov	dword_7D0E0, 0
		cmp	byte_7D0D5, 0
		jz	short loc_C5651
		cmp	dword_7D0D0, 0
		jz	short loc_C5651
		push	0
		mov	al, byte_7D0D4
		push	ax
		push	69A0h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C5651

loc_C5651:
		mov	dword_7D0D0, 0
		mov	byte_7D0D5, 0
		mov	dword_7D0D6, 0
		cmp	byte_7D0CB, 0
		jz	short loc_C568D
		cmp	dword_7D0C6, 0
		jz	short loc_C568D
		push	0
		mov	al, byte_7D0CA
		push	ax
		push	6996h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C568D

loc_C568D:
		mov	dword_7D0C6, 0
		mov	byte_7D0CB, 0
		mov	dword_7D0CC, 0
		pop	bp
		retf
sub_C55B1		endp
ovr353		ends
