seg105		segment	para public 'CODE' use16
		assume cs:seg105
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 9, 56h, 9Ah, 0B2h, 3, 0, 0, 59h, 0EBh, 0

loc_42DBB:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42DBF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_42DBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42DC9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
sub_42DC9		endp
seg105		ends
