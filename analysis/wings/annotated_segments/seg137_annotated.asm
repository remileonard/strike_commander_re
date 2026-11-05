seg137		segment	para public 'CODE' use16
		assume cs:seg137
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0A6h, 0FEh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4A3E2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	ds
		lds	si, [bp+arg_0]
		mov	ax, [si+4]
		shr	ax, 1
sub_4A3E2		endp

; START OF FUNCTION CHUNK FOR sub_4A3E2
		db 0D1h
; END OF FUNCTION CHUNK FOR sub_4A3E2
seg137		ends
