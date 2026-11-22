seg164		segment	para public 'CODE' use16
		assume cs:seg164
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CAh, 6, 0, 0

; ----------------------------------------------------------------------

sub_68194		proc far
		push	es
		mov	ax, 40h
		mov	es, ax
		mov	dx, es:63h
sub_68194		endp

; START OF FUNCTION CHUNK FOR sub_68194
		db 80h
; END OF FUNCTION CHUNK FOR sub_68194
seg164		ends
