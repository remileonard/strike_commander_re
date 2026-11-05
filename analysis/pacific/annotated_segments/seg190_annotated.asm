seg190		segment	para public 'CODE' use16
		assume cs:seg190
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6ABA2		proc far

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
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_E		= word ptr  14h

		enter	12h, 0
		push	si
		push	di
		push	ds
		les	di, [bp+arg_A]
		mov	bx, [bp+arg_E]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	es:[di+4], bx
		jb	short loc_6ABBC
		jnz	short loc_6ABBF

loc_6ABBC:
		jmp	loc_6ACD4

loc_6ABBF:
		mov	ax, es
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, di
		adc	dx, 0
		add	ax, es:[bx+di]
		adc	dx, es:[bx+di+2]
		mov	di, ax
		and	di, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	es, ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[di]
		stc
		adc	ax, es:[di+2]
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, es:[di+6]
		stc
		adc	ax, es:[di+4]
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		mov	ax, [bp+arg_6]
		sub	ax, es:[di+2]
		cmp	ax, [bx+8]
		jg	short loc_6AC46
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_6AC3A
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_6AC3A:
		mov	ax, [bp+arg_8]
		sub	ax, es:[di+4]
		cmp	ax, [bx+0Ah]
		jle	short loc_6AC49

loc_6AC46:
		jmp	loc_6ACD4

loc_6AC49:
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_6AC60
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_6AC60:
		mov	ax, [bp+arg_6]
		add	ax, es:[di]
		cmp	ax, [bx+4]
		jl	short loc_6AC7D
		sub	ax, [bx+8]
		jle	short loc_6AC73
		sub	[bp+var_E], ax

loc_6AC73:
		mov	ax, [bp+arg_8]
		add	ax, es:[di+6]
		cmp	ax, [bx+6]

loc_6AC7D:
		jl	short loc_6ACD4
		sub	ax, [bx+0Ah]
		jle	short loc_6AC87
		sub	[bp+var_10], ax

loc_6AC87:
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	si, ax
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	si, dx
		mov	ax, [bp+arg_4]
		mov	[bp+var_12], ax
		mov	es, [bx]
		add	si, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		push	ds
		pop	gs
		mov	ds, [bp+var_12]
		mov	di, gs:[bx]
		add	di, [bp+var_C]
		mov	cx, [bp+var_E]
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	bx, 2
		sub	si, [bp+var_E]
		add	si, [bp+var_6]
sub_6ABA2		endp

; START OF FUNCTION CHUNK FOR sub_6ABA2
		db 0FFh
; END OF FUNCTION CHUNK FOR sub_6ABA2
seg190		ends
