ovr248		segment	para public 'OVERLAY' use16
		assume cs:ovr248
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFB30		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+7]
		push	word_4D36C
		call	Render_SetPixelClipped_3811A
		add	sp, 8
		pop	bp
		retf
sub_BFB30		endp
ovr248		ends
