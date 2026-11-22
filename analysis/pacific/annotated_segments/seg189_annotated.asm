seg189		segment	para public 'CODE' use16
		assume cs:seg189
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 0FDh, 5Eh, 1Fh, 0E9h, 0AEh, 0FDh

loc_6AB87:
		db 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6AB8C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	ds
		lds	si, [bp+arg_0]
		mov	ax, [si+4]
		shr	ax, 1
		shr	ax, 1
		dec	ax
		pop	ds
		pop	si
		pop	bp
sub_6AB8C		endp

; START OF FUNCTION CHUNK FOR sub_6AB8C
		db 0CAh
; END OF FUNCTION CHUNK FOR sub_6AB8C
seg189		ends
