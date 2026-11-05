seg073		segment	para public 'CODE' use16
		assume cs:seg073
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 56h, 8, 8Bh, 46h, 6, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE47		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2BE47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE4C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
sub_2BE4C		endp

; START OF FUNCTION CHUNK FOR sub_2BE4C
		db 0FFh
; END OF FUNCTION CHUNK FOR sub_2BE4C
seg073		ends
