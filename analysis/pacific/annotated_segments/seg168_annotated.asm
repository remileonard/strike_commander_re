seg168		segment	para public 'CODE' use16
		assume cs:seg168
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 89h, 45h, 6, 0B8h, 0FFh, 0FFh

loc_68286:
		db 5Fh, 5Eh, 7, 1Fh, 5Dh, 0CAh, 0Eh, 0

; ----------------------------------------------------------------------

sub_6828E		proc far
		db 8Bh
		push	ss
sub_6828E		endp
seg168		ends
