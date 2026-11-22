seg141		segment	para public 'CODE' use16
		assume cs:seg141
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4AA14		proc far

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
		les	si, [bp+arg_A]
		mov	bx, [bp+arg_E]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	es:[si+4], bx
		jb	short loc_4AA2E
		jnz	short loc_4AA31

loc_4AA2E:
		jmp	loc_4AB46

loc_4AA31:
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
		add	ax, si
		adc	dx, 0
		add	ax, es:[bx+si]
		adc	dx, es:[bx+si+2]
		mov	si, ax
		and	si, 0Fh
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
		mov	ax, es:[si]
		stc
		adc	ax, es:[si+2]
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, es:[si+6]
		stc
		adc	ax, es:[si+4]
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		mov	ax, [bp+arg_6]
		sub	ax, es:[si+2]
		cmp	ax, [bx+8]
		jg	short loc_4AAB8
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_4AAAC
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_4AAAC:
		mov	ax, [bp+arg_8]
		sub	ax, es:[si+4]
		cmp	ax, [bx+0Ah]
		jle	short loc_4AABB

loc_4AAB8:
		jmp	loc_4AB46

loc_4AABB:
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_4AAD2
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_4AAD2:
		mov	ax, [bp+arg_6]
		add	ax, es:[si]
		cmp	ax, [bx+4]
		jl	short loc_4AAEF
		sub	ax, [bx+8]
		jle	short loc_4AAE5
		sub	[bp+var_E], ax

loc_4AAE5:
		mov	ax, [bp+arg_8]
		add	ax, es:[si+6]
		cmp	ax, [bx+6]

loc_4AAEF:
		jl	short loc_4AB46
		sub	ax, [bx+0Ah]
		jle	short loc_4AAF9
		sub	[bp+var_10], ax

loc_4AAF9:
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	di, ax
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	di, dx
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	es, [bp+arg_4]
		add	di, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		push	ds
		pop	gs
		mov	ds, [bp+var_12]
		mov	si, gs:[bx]
		add	si, [bp+var_C]
		mov	cx, [bp+var_E]
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	bx, 2
		sub	di, [bp+var_E]
sub_4AA14		endp

; START OF FUNCTION CHUNK FOR sub_4AA14
		db 3, 7Eh
; END OF FUNCTION CHUNK FOR sub_4AA14
seg141		ends
