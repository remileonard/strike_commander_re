seg178		segment	para public 'CODE' use16
		assume cs:seg178
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Fh, 8Bh, 0E5h, 5Dh, 0CAh, 8, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69728		proc far

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
		jle	short loc_69743
		xchg	cx, ax

loc_69743:
		mov	si, [bx+4]
		mov	dx, [bx+8]
		cmp	ax, dx
		jg	short loc_697B3
		cmp	ax, si
		jge	short loc_69753
		mov	ax, si

loc_69753:
		mov	[bp+var_2], ax
		cmp	cx, si
		jl	short loc_697B3
		cmp	cx, dx
		jle	short loc_69760
		mov	cx, dx

loc_69760:
		mov	[bp+var_4], cx
		mov	ax, [bx+6]
		mov	si, [bp+arg_4]
		mov	cx, [bp+arg_8]
		cmp	si, cx
		jle	short loc_69772
		xchg	cx, si

loc_69772:
		cmp	si, ax
		jge	short loc_69778
		mov	si, ax

loc_69778:
		mov	ax, [bx+0Ah]
		mov	bx, cx
		cmp	bx, ax
		jle	short loc_69783
		mov	bx, ax

loc_69783:
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
sub_69728		endp
seg178		ends
