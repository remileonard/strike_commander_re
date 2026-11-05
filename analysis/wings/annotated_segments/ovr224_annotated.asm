ovr224		segment	para public 'OVERLAY' use16
		assume cs:ovr224
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78990		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+8]
		push	ax
		push	word ptr es:[bx+0Bh]
		push	word ptr es:[bx+9]
		push	word_5DD42
		call	Render_SetPixelClipped_49D9A
		add	sp, 8
		pop	bp
		retf
sub_78990		endp
ovr224		ends
