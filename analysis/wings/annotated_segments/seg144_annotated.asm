seg144		segment	para public 'CODE' use16
		assume cs:seg144
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0F0h, 5Eh, 1Fh, 0E9h, 46h, 0FEh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4AF06		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]
		mov	ax, [si]
		mov	es, ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]
		cmp	bx, ax
		jge	short loc_4AF34
		xchg	bx, ax
		xchg	dx, cx

loc_4AF34:
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx
		jge	short loc_4AF50
		xchg	dx, cx
		neg	[bp+var_2]
		mov	[bp+var_8], 1
		jmp	short loc_4AF55

loc_4AF50:
		mov	[bp+var_8], 0

loc_4AF55:
		cmp	bx, [si+4]
		jge	short loc_4AF5D
		jmp	loc_4B0F2

loc_4AF5D:
		cmp	ax, [si+8]
		jle	short loc_4AF65
		jmp	loc_4B0F2

loc_4AF65:
		cmp	dx, [si+6]
		jge	short loc_4AF6D
		jmp	loc_4B0F2

loc_4AF6D:
		cmp	cx, [si+0Ah]
		jle	short loc_4AF75
		jmp	loc_4B0F2

loc_4AF75:
		cmp	bx, [si+8]
		jle	short loc_4AF9C
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+8]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_8], ax
		mov	ax, [si+8]
		mov	[bp+arg_6], ax

loc_4AF9C:
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_4AFC6
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+4]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_4], ax
		mov	ax, [si+4]
		mov	[bp+arg_2], ax

loc_4AFC6:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		test	[bp+var_8], 0FFh
		jz	short loc_4AFE8
		xchg	bx, ax
		xchg	dx, cx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_4AFE8:
		cmp	bx, [si+6]
		jge	short loc_4AFF0
		jmp	loc_4B0F2

loc_4AFF0:
		cmp	ax, [si+0Ah]
		jle	short loc_4AFF8
		jmp	loc_4B0F2

loc_4AFF8:
		cmp	bx, [si+0Ah]
		jle	short loc_4B01B
		sub	bx, ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+0Ah]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+arg_8], ax

loc_4B01B:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_4B048
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+6]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_2], ax
		mov	ax, [si+6]
		mov	[bp+arg_4], ax

loc_4B048:
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_6], bx
		test	[bp+var_8], 0FFh
		jz	short loc_4B073
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		xchg	bx, ax
		xchg	dx, cx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_4B073:
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	[bp+var_4], bx
		xor	al, al
		mov	ah, byte ptr [bp+arg_4]
		shr	ax, 1
		shr	ax, 1
		add	ah, byte ptr [bp+arg_4]
		add	ax, [bp+arg_2]
		mov	di, ax
		mov	al, [bp+arg_A]
		xor	cx, cx
		mov	bx, [bp+arg_2]
		cmp	bx, [bp+arg_6]
		jz	short loc_4B0DA
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jz	short loc_4B0E8
		mov	bx, [bp+var_4]
		mov	dx, [bp+var_6]
		cmp	dx, bx
		jg	short loc_4B0C3
		mov	si, bx
		inc	si

loc_4B0AF:
		xor	es:[di], al
		inc	di
		dec	si
		jz	short loc_4B0F2
		add	cx, dx
		cmp	cx, bx
		jl	short loc_4B0AF
		add	di, [bp+var_2]
		sub	cx, bx
		jmp	short loc_4B0AF

loc_4B0C3:
		mov	si, dx
		inc	si

loc_4B0C6:
		xor	es:[di], al
		add	di, [bp+var_2]
		dec	si
		jz	short loc_4B0F2
		add	cx, bx
		cmp	cx, dx
		jl	short loc_4B0C6
		inc	di
		sub	cx, dx
		jmp	short loc_4B0C6

loc_4B0DA:
		mov	cx, [bp+var_6]
		inc	cx

loc_4B0DE:
		xor	es:[di], al
		add	di, [bp+var_2]
		loop	short loc_4B0DE
		jmp	short loc_4B0F2

loc_4B0E8:
		mov	cx, [bp+var_4]
		inc	cx
		xor	es:[di], al
		inc	di
sub_4AF06		endp
seg144		ends
