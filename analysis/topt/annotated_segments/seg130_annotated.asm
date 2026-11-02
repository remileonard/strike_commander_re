seg130		segment	para public 'CODE' use16
		assume cs:seg130
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0EFh

loc_37B01:
		db 5Fh, 5Eh, 8Bh, 0E5h, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37B08		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		cld
		mov	ax, [bp+arg_2]
		mov	ah, al
		mov	bx, [bp+arg_0]
		mov	es, [bx]
		mov	dx, [bx+4]
		mov	[bp+var_2], dx
		mov	dx, [bx+8]
		sub	dx, [bp+var_2]
		inc	dx
		mov	si, [bx+0Ah]
		sub	si, [bx+6]
		inc	si
		mov	di, [bx+2]
		mov	bx, [bx+6]
		shl	bx, 1
		add	bx, di

loc_37B39:
		mov	di, [bx]
		add	di, [bp+var_2]
		mov	cx, dx
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	bx, 2
		dec	si
		jnz	short loc_37B39
		pop	di
		pop	si
sub_37B08		endp
seg130		ends
