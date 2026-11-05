seg116		segment	para public 'CODE' use16
		assume cs:seg116
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0AAh, 0FEh, 0C3h, 0E2h, 0E3h

loc_47D36:
		db 5Fh, 5Dh, 0CAh, 6, 0, 0

; ----------------------------------------------------------------------

sub_47D3C		proc far
		push	es
		mov	ax, 40h
		mov	es, ax
		mov	dx, es:63h
		add	dl, 6
		mov	word_5DD66, dx
		pop	es
		retf
sub_47D3C		endp
seg116		ends
