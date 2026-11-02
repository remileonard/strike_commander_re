seg084		segment	para public 'CODE' use16
		assume cs:seg084
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 0, 0C9h, 35h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3F7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
sub_2F3F7		endp

; START OF FUNCTION CHUNK FOR sub_2F3F7
		db 80h, 7Ch
; END OF FUNCTION CHUNK FOR sub_2F3F7
seg084		ends
