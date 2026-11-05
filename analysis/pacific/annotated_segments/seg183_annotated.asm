seg183		segment	para public 'CODE' use16
		assume cs:seg183
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69F22		proc far

var_A		= word ptr -0Ah
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

		enter	0Ah, 0
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]
		mov	bx, [si+2]
		mov	ax, [bx]
		add	bx, 2
		mov	bx, [bx]
		sub	bx, ax
		mov	[bp+var_4], bx
		mov	[bp+var_2], bx
		mov	ax, [si]
		mov	es, ax
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]
		cmp	bx, ax
		jge	short loc_69F55
		xchg	bx, ax
		xchg	dx, cx

loc_69F55:
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx
		jge	short loc_69F71
		xchg	dx, cx
		neg	[bp+var_2]
		mov	[bp+var_A], 1
		jmp	short loc_69F76

loc_69F71:
		mov	[bp+var_A], 0

loc_69F76:
		cmp	bx, [si+4]
		jl	loc_6A116
		cmp	ax, [si+8]
		jg	loc_6A116
		cmp	dx, [si+6]
		jl	loc_6A116
		cmp	cx, [si+0Ah]
		jg	loc_6A116
		cmp	bx, [si+8]
		jle	short loc_69FB9
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

loc_69FB9:
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_69FE3
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

loc_69FE3:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		test	[bp+var_A], 0FFh
		jz	short loc_6A005
		xchg	bx, ax
		xchg	dx, cx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_6A005:
		cmp	bx, [si+6]
		jl	loc_6A116
		cmp	ax, [si+0Ah]
		jg	loc_6A116
		cmp	bx, [si+0Ah]
		jle	short loc_6A036
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

loc_6A036:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_6A063
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

loc_6A063:
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_8], bx
		test	[bp+var_A], 0FFh
		jz	short loc_6A08E
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

loc_6A08E:
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	[bp+var_6], bx
		mov	ax, [bp+arg_4]
		imul	ax, [bp+var_4]
		add	ax, [bp+arg_2]
		mov	bx, [si+2]
		mov	di, [bx]
		add	di, ax
		mov	al, [bp+arg_A]
		xor	cx, cx
		mov	bx, [bp+arg_2]
		cmp	bx, [bp+arg_6]
		jz	short loc_6A0FA
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jz	short loc_6A108
		mov	bx, [bp+var_6]
		mov	dx, [bp+var_8]
		cmp	dx, bx
		jg	short loc_6A0DF
		mov	si, bx
		inc	si
		mov	cx, bx
		shr	cx, 1

loc_6A0CE:
		stosb
		dec	si
		jz	short loc_6A116
		add	cx, dx
		cmp	cx, bx
		jl	short loc_6A0CE
		add	di, [bp+var_2]
		sub	cx, bx
		jmp	short loc_6A0CE

loc_6A0DF:
		mov	si, dx
		inc	si
		mov	cx, dx
		shr	cx, 1

loc_6A0E6:
		mov	es:[di], al
		add	di, [bp+var_2]
		dec	si
		jz	short loc_6A116
		add	cx, bx
		cmp	cx, dx
		jl	short loc_6A0E6
		inc	di
		sub	cx, dx
		jmp	short loc_6A0E6

loc_6A0FA:
		mov	cx, [bp+var_8]
		inc	cx

loc_6A0FE:
		mov	es:[di], al
		add	di, [bp+var_2]
		loop	short loc_6A0FE
		jmp	short loc_6A116

loc_6A108:
		mov	cx, [bp+var_6]
		inc	cx
		mov	ah, al
		shr	cx, 1
sub_69F22		endp
seg183		ends
