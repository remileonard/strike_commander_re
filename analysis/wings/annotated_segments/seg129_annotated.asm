seg129		segment	para public 'CODE' use16
		assume cs:seg129
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 8Bh, 0E5h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49486		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		push	ds
		push	es
		cld
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	ax, [bx+4]
		mov	[bp+var_2], ax
		mov	cx, [si+4]
		mov	[bp+var_4], cx
		mov	ax, [si+8]
		sub	ax, cx
		inc	ax
		mov	dx, [bx+8]
		sub	dx, [bx+4]
		inc	dx
		cmp	dx, ax
		jbe	short loc_494B6
		mov	dx, ax

loc_494B6:
		mov	cx, [si+0Ah]
		sub	cx, [si+6]
		inc	cx
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax
		cmp	ax, cx
		jbe	short loc_494CA
		mov	ax, cx

loc_494CA:
		mov	di, [si+2]
		mov	cx, [si+6]
		shl	cx, 1
		add	cx, di
		mov	[bp+var_6], cx
		mov	di, [bx+2]
		mov	cx, [bx+6]
		shl	cx, 1
		add	cx, di
		mov	es, [si]
		mov	ds, [bx]
		mov	bx, cx

loc_494E7:
		mov	si, ss:[bx]
		mov	di, [bp+var_6]
		mov	di, ss:[di]
		add	si, [bp+var_2]
		add	di, [bp+var_4]
		mov	cx, dx
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	[bp+var_6], 2
		add	bx, 2
		dec	ax
		jnz	short loc_494E7
		pop	es
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
sub_49486		endp
seg129		ends
