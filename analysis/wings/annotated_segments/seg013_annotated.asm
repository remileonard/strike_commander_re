seg013		segment	para public 'CODE' use16
		assume cs:seg013
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8590		proc far
		push	bp
		mov	bp, sp
		sub	sp, 2
		call	sub_58A63
		mov	sp, bp
		pop	bp
		retf
sub_8590		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_859F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_8590
		cmp	ax, seg stub185
		jnz	short loc_85B3
		mov	dx, seg stub185
		mov	ax, [bp+arg_0]
		jmp	short loc_85C3

loc_85B3:
		mov	ax, seg stub185
		mov	es, ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+1]
		mov	dx, es:[bx+3]

loc_85C3:
		pop	bp
		retf
sub_859F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85C5		proc far
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	cs
		call	near ptr sub_8590
		cmp	ax, seg stub185
		jnz	short loc_85DB
		mov	ax, 43h
		xor	dx, dx
		jmp	short loc_85E9

loc_85DB:
		mov	ax, seg stub185
		mov	es, ax
		mov	bx, 43h
		mov	ax, es:[bx+1]
		xor	dx, dx

loc_85E9:
		mov	sp, bp
		pop	bp
		retf
sub_85C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85ED		proc far

saved_2		= word ptr  2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_85C5
		push	dx
		push	ax
		mov	ax, 43h
		push	ax
		push	cs
		call	near ptr sub_859F
		pop	cx
		push	dx
		push	ax
		push	bp
		mov	bp, sp
		mov	[bp+saved_2], 0
		pop	bp
		push	[bp+arg_2]
		push	[bp+arg_0]
sub_85ED		endp
seg013		ends
