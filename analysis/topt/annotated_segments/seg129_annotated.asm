seg129		segment	para public 'CODE' use16
		assume cs:seg129
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E5h, 5Dh, 0CAh, 8, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37A76		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	es, [bx]
		mov	di, [bx+2]
		mov	ax, [bp+arg_2]
		mov	cx, [bp+arg_6]
		cmp	ax, cx
		jle	short loc_37A91
		xchg	cx, ax

loc_37A91:
		mov	si, [bx+4]
		mov	dx, [bx+8]
		cmp	ax, dx
		jg	short loc_37B01
		cmp	ax, si
		jge	short loc_37AA1
		mov	ax, si

loc_37AA1:
		mov	[bp+var_2], ax
		cmp	cx, si
		jl	short loc_37B01
		cmp	cx, dx
		jle	short loc_37AAE
		mov	cx, dx

loc_37AAE:
		mov	[bp+var_4], cx
		mov	ax, [bx+6]
		mov	si, [bp+arg_4]
		mov	cx, [bp+arg_8]
		cmp	si, cx
		jle	short loc_37AC0
		xchg	cx, si

loc_37AC0:
		cmp	si, ax
		jge	short loc_37AC6
		mov	si, ax

loc_37AC6:
		mov	ax, [bx+0Ah]
		mov	bx, cx
		cmp	bx, ax
		jle	short loc_37AD1
		mov	bx, ax

loc_37AD1:
		mov	dx, [di+2]
		sub	dx, [di]
		sub	bx, si
		inc	bx
		shl	si, 1
		add	di, si
		mov	di, [di]
		add	di, [bp+var_2]
		mov	cx, [bp+var_4]
		sub	cx, [bp+var_2]
		inc	cx
		mov	si, cx
		mov	ax, [bp+arg_A]
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		mov	cx, si
		sub	di, cx
		add	di, dx
		dec	bx
sub_37A76		endp

; START OF FUNCTION CHUNK FOR sub_37A76
		db 75h
; END OF FUNCTION CHUNK FOR sub_37A76
seg129		ends
