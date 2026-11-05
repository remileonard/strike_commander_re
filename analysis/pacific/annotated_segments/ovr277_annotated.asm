ovr277		segment	para public 'OVERLAY' use16
		assume cs:ovr277
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3A00		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_A3A15
		jmp	loc_A3B79

loc_A3A15:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 11C0h
		xor	di, di
		jmp	short loc_A3A6F

loc_A3A21:
		les	bx, word ptr [bp+arg_0]
		add	bx, di
		cmp	byte ptr es:[bx+52h], 0
		jz	short loc_A3A58
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+24h]
		mov	dx, es:[bx+22h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_A3A58:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	word ptr es:[bx+24h], 0
		mov	word ptr es:[bx+22h], 0
		inc	di

loc_A3A6F:
		cmp	di, 8
		jl	short loc_A3A21
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+1Eh]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+1Eh], 0
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 7Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_751C4
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+17h], 0
		jz	short loc_A3AE6
		cmp	dword ptr es:[bx+12h], 0
		jz	short loc_A3AE6
		push	0
		mov	al, es:[bx+16h]
		push	ax
		mov	eax, es:[bx+12h]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A3AE6

loc_A3AE6:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+17h], 0
		mov	dword ptr es:[bx+18h], 0
		cmp	byte ptr es:[bx+0Dh], 0
		jz	short loc_A3B30
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_A3B30
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		mov	eax, es:[bx+8]
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A3B30

loc_A3B30:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_23D7C
		add	sp, 6
		test	si, 1
		jz	short loc_A3B79
		mov	eax, [bp+arg_0]
		mov	[bp+var_14], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_A3B79:
		pop	di
		pop	si
		leave
		retf
sub_A3A00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3B7D		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		cmp	[bp+arg_0], 0
		jnz	short loc_A3BAB
		push	1
		push	0
		push	2
		push	large 7Bh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_A3BAB
		jmp	loc_A3C47

loc_A3BAB:
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1100h
		push	ax
		push	large [bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Descriptor_Construct_23EB1
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 123Ah
		mov	word ptr es:[bx+0Ah], 338h
		mov	word ptr es:[bx+0Ah], 1236h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Calibration_ComputeHelper_58AAE
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 48h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Calibration_ComputeHelper_58AAE
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+7Ah], 1
		mov	word ptr es:[bx+78h], 0
		mov	byte ptr es:[bx+16h], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_29C36
		add	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		les	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx+94h], 0
		jnz	short loc_A3C47
		mov	eax, [bp+arg_0]
		mov	es:[bx+94h], eax

loc_A3C47:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_A3B7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3C4F		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_A3CB9
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 123Ah
		mov	eax, es:[bx+4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+94h]
		cmp	eax, [bp+arg_0]
		jnz	short loc_A3C8A
		mov	dword ptr es:[bx+94h], 0

loc_A3C8A:
		push	0
		push	large [bp+arg_0]
		call	sub_23E5B
		add	sp, 6
		test	si, 1
		jz	short loc_A3CB9
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_A3CB9:
		pop	si
		leave
		retf
sub_A3C4F		endp
ovr277		ends
