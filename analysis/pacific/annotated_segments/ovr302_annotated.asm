ovr302		segment	para public 'OVERLAY' use16
		assume cs:ovr302
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD3E0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_AD3F7
		jmp	loc_AD499

loc_AD3F7:
		push	1
		push	0
		push	2
		push	large 0C0h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_AD48C
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3ACh
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx
		push	bx
		call	sub_9FDC
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 5C2h
		mov	ax, [bp+var_4]
		add	ax, 1Ah
		push	[bp+var_2]
		push	ax
		call	sub_736DA
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+1Ah], 59Ah
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_AD492

loc_AD48C:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_AD492:
		mov	[si+2], dx
		mov	[si], ax
		jmp	short loc_AD4A2

loc_AD499:
		push	0C012h
		call	sub_1DDFE
		pop	cx

loc_AD4A2:
		pop	si
		leave
		retf
sub_AD3E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD4A5		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_AD4B8
		jmp	loc_AD55F

loc_AD4B8:
		push	1
		push	0
		push	2
		push	large 0C0h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_AD54D
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3ACh
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx
		push	bx
		call	sub_9FDC
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 5C2h
		mov	ax, [bp+var_4]
		add	ax, 1Ah
		push	[bp+var_2]
		push	ax
		call	sub_736DA
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+1Ah], 59Ah
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_AD553

loc_AD54D:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_AD553:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		jmp	short loc_AD568

loc_AD55F:
		push	0C013h
		call	sub_1DDFE
		pop	cx

loc_AD568:
		leave
		retf
sub_AD4A5		endp
ovr302		ends
