seg131		segment	para public 'CODE' use16
		assume cs:seg131
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 7Ch, 2, 0EBh, 0B7h

loc_5ADA4:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5ADA8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch

		enter	0, 0
		push	si
		les	si, [bp+arg_2]
		mov	ax, gs
		cmp	ax, 0
		jz	short loc_5ADE2
		nop
		nop
		mov	bx, [bp+arg_6]
		shl	bx, 1
		add	si, es:[bx+si+2]
		mov	bx, [bp+arg_0]
		mov	ax, es:[si+4]
		mov	[bx+4], ax
		add	ax, es:[si]
		dec	ax
		mov	[bx+8], ax
		mov	ax, es:[si+6]
		mov	[bx+6], ax
		add	ax, es:[si+2]
		dec	ax
		mov	[bx+0Ah], ax

loc_5ADE2:
		pop	si
		leave
		retf
sub_5ADA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5ADE5		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		enter	4, 0
		push	si
		push	di
		push	ds
		mov	bx, [bp+arg_8]
		shl	bx, 1
		lgs	si, [bp+arg_4]
		mov	ax, gs
		cmp	ax, 0
		jz	loc_5AE81
		add	si, gs:[bx+si+2]
		mov	bx, [bp+arg_2]
		mov	es, [bx]
		mov	ax, [bx+2]
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		mov	ds, [bx]
		add	si, 4
		lodsw
		mov	dx, ax
		lodsw
		shl	ax, 1
		jmp	short loc_5AE79
		nop
		mov	bx, gs:[si+2]
		shl	bx, 1
		mov	cx, gs:[si+4]
		add	si, 6
		push	si
		mov	si, [bp+var_2]
		sub	bx, ax
		mov	si, ss:[bx+si]
		add	bx, ax
		add	si, di
		sub	si, dx
		add	bx, [bp+var_4]
		add	di, ss:[bx]
		push	ax
		test	di, 3
		jz	short loc_5AE68
		nop
		nop
		mov	ax, di
		and	ax, 3
		neg	ax
		add	ax, 4
		cmp	cx, ax
		jle	short loc_5AE75
		nop
		nop
		sub	cx, ax
		xchg	cx, ax
		rep movsb
		mov	cx, ax

loc_5AE68:
		mov	ax, cx
		shr	cx, 2
		rep movsd
		mov	cx, ax
		and	cx, 3

loc_5AE75:
		rep movsb
		pop	ax
		pop	si

loc_5AE79:
		mov	di, gs:[si]
		cmp	di, 0FFFFh
sub_5ADE5		endp

; START OF FUNCTION CHUNK FOR sub_5ADE5
		db 75h
; END OF FUNCTION CHUNK FOR sub_5ADE5
seg131		ends
