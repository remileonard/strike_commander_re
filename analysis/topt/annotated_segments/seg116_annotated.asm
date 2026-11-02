seg116		segment	para public 'CODE' use16
		assume cs:seg116
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C3h, 0E2h, 0E9h, 5Eh, 5Dh, 0CAh, 6, 0

; ----------------------------------------------------------------------

sub_35CF8		proc far
		mov	dx, word_4D390
		in	al, dx
		test	al, 8
sub_35CF8		endp

; START OF FUNCTION CHUNK FOR sub_35CF8
		db 75h
; END OF FUNCTION CHUNK FOR sub_35CF8
seg116		ends
