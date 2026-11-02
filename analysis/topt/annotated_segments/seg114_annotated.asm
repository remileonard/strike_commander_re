seg114		segment	para public 'CODE' use16
		assume cs:seg114
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Dh, 0CAh, 6, 0, 0

; ----------------------------------------------------------------------

sub_35C96		proc far
		push	es
		mov	ax, 40h
		mov	es, ax
sub_35C96		endp

; START OF FUNCTION CHUNK FOR sub_35C96
		db 26h, 8Bh, 16h, 63h
; END OF FUNCTION CHUNK FOR sub_35C96
seg114		ends
