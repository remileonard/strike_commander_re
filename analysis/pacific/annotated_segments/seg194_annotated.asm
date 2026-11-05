seg194		segment	para public 'CODE' use16
		assume cs:seg194
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E1h

loc_6AFD1:
		db 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6AFD6		proc far

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
		jge	short loc_6B004
		xchg	bx, ax
		xchg	dx, cx

loc_6B004:
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx
		jge	short loc_6B020
		xchg	dx, cx
		neg	[bp+var_2]
		mov	[bp+var_8], 1
		jmp	short loc_6B025

loc_6B020:
		mov	[bp+var_8], 0

loc_6B025:
		cmp	bx, [si+4]
		jge	short loc_6B02D
		jmp	loc_6B1C2

loc_6B02D:
		cmp	ax, [si+8]
		jle	short loc_6B035
		jmp	loc_6B1C2

loc_6B035:
		cmp	dx, [si+6]
		jge	short loc_6B03D
		jmp	loc_6B1C2

loc_6B03D:
		cmp	cx, [si+0Ah]
		jle	short loc_6B045
		jmp	loc_6B1C2

loc_6B045:
		cmp	bx, [si+8]
		jle	short loc_6B06C
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

loc_6B06C:
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_6B096
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

loc_6B096:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		test	[bp+var_8], 0FFh
		jz	short loc_6B0B8
		xchg	bx, ax
		xchg	dx, cx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_6B0B8:
		cmp	bx, [si+6]
		jge	short loc_6B0C0
		jmp	loc_6B1C2

loc_6B0C0:
		cmp	ax, [si+0Ah]
		jle	short loc_6B0C8
		jmp	loc_6B1C2

loc_6B0C8:
		cmp	bx, [si+0Ah]
		jle	short loc_6B0EB
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

loc_6B0EB:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_6B118
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

loc_6B118:
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_6], bx
		test	[bp+var_8], 0FFh
		jz	short loc_6B143
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

loc_6B143:
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
		jz	short loc_6B1AA
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jz	short loc_6B1B8
		mov	bx, [bp+var_4]
		mov	dx, [bp+var_6]
		cmp	dx, bx
		jg	short loc_6B193
		mov	si, bx
		inc	si

loc_6B17F:
		xor	es:[di], al
		inc	di
		dec	si
		jz	short loc_6B1C2
		add	cx, dx
		cmp	cx, bx
		jl	short loc_6B17F
		add	di, [bp+var_2]
		sub	cx, bx
		jmp	short loc_6B17F

loc_6B193:
		mov	si, dx
		inc	si

loc_6B196:
		xor	es:[di], al
		add	di, [bp+var_2]
		dec	si
		jz	short loc_6B1C2
		add	cx, bx
		cmp	cx, dx
		jl	short loc_6B196
		inc	di
		sub	cx, dx
		jmp	short loc_6B196

loc_6B1AA:
		mov	cx, [bp+var_6]
		inc	cx

loc_6B1AE:
		xor	es:[di], al
		add	di, [bp+var_2]
		loop	short loc_6B1AE
		jmp	short loc_6B1C2

loc_6B1B8:
		mov	cx, [bp+var_4]
		inc	cx
		xor	es:[di], al
		inc	di
sub_6AFD6		endp
seg194		ends
