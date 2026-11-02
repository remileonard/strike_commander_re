ovr244		segment	para public 'OVERLAY' use16
		assume cs:ovr244
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE280		proc far

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
		jnz	short loc_BE295
		jmp	loc_BE41C

loc_BE295:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 372Ah
		xor	di, di
		jmp	short loc_BE2EF

loc_BE2A1:
		les	bx, word ptr [bp+arg_0]
		add	bx, di
		cmp	byte ptr es:[bx+52h], 0
		jz	short loc_BE2D8
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+24h]
		mov	dx, es:[bx+22h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_BE2D8:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	word ptr es:[bx+24h], 0
		mov	word ptr es:[bx+22h], 0
		inc	di

loc_BE2EF:
		cmp	di, 8
		jl	short loc_BE2A1
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+1Eh]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+1Eh], 0
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 7Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_4841A
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+17h], 0
		jz	short loc_BE36F
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+12h], 0
		jz	short loc_BE36F
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+12h]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BE36F

loc_BE36F:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+12h], 0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+17h], 0
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+18h], 0
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0Dh], 0
		jz	short loc_BE3CB
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_BE3CB
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BE3CB

loc_BE3CB:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 0
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+0Eh], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1E569
		add	sp, 6
		test	si, 1
		jz	short loc_BE41C
		mov	eax, [bp+arg_0]
		mov	[bp+var_14], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_BE41C:
		pop	di
		pop	si
		leave
		retf
sub_BE280		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE420		proc far

var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 14h
		cmp	[bp+arg_0], 0
		jnz	short loc_BE451
		push	1
		push	0
		push	2
		push	large 96h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_BE451
		jmp	loc_BE5CC

loc_BE451:
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 36F2h
		push	[bp+var_6]
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1E90E
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3FE0h
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+0Eh], 0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+12h], 2
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+13h], 0
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+14h], 0
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+18h], 35D4h
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+18h], 3FDCh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 23h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_2A480
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 53h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_2A480
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+85h], ax
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+83h], ax
		les	bx, word ptr [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+89h], ax
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+87h], ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 8Bh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 8Fh
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+95h], 1
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+93h], 0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1Eh], 0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1EAD6
		add	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		les	bx, word ptr [bp+var_A]
		mov	ax, es:[bx+2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		les	bx, word ptr [bp+var_A]
		mov	ax, es:[bx+1Ch]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], ax
		les	bx, word ptr [bp+var_A]
		mov	eax, [bp+arg_0]
		mov	es:[bx+90h], eax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 12h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		les	bx, [bp+var_E]
		mov	al, es:[bx+4]
		mov	[bp+var_13], al
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+0Eh], eax
		les	bx, word ptr [bp+arg_0]
		mov	al, [bp+var_13]
		mov	es:[bx+12h], al
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+13h], 0
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+14h], 0
		les	bx, [bp+var_E]
		mov	eax, es:[bx+6]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+14h], eax

loc_BE5CC:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_BE420		endp

; START OF FUNCTION CHUNK FOR sub_BE420
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BE420

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE5D6		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_BE5EA
		jmp	loc_BE6BB

loc_BE5EA:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3FE0h
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+90h]
		cmp	eax, [bp+arg_0]
		jnz	short loc_BE61A
		les	bx, word ptr [bp+var_4]
		mov	dword ptr es:[bx+90h], 0

loc_BE61A:
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 83h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_4841A
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+13h], 0
		jz	short loc_BE66A
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Eh], 0
		jz	short loc_BE66A
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+12h]
		push	ax
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BE66A

loc_BE66A:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+0Eh], 0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+13h], 0
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+14h], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1E8AF
		add	sp, 6
		test	si, 1
		jz	short loc_BE6BB
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_BE6BB:
		pop	si
		leave
		retf
sub_BE5D6		endp
ovr244		ends
