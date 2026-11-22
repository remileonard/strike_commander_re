seg118		segment	para public 'CODE' use16
		assume cs:seg118
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0ACh, 0EEh, 0EBh, 0, 4Ah, 0FEh, 0C3h, 0E2h, 0E9h, 5Eh, 5Dh, 0CAh, 6, 0

; ----------------------------------------------------------------------

sub_47D9E		proc far
		db 8Bh
		push	ss
sub_47D9E		endp
seg118		ends
