seg166		segment	para public 'CODE' use16
		assume cs:seg166
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 5Eh, 5Dh, 0CAh, 6, 0

; ----------------------------------------------------------------------

sub_681F6		proc far
		mov	dx, word_7AFA0

loc_681FA:
		in	al, dx
		test	al, 8
		jnz	short loc_681FA
		in	al, dx
sub_681F6		endp
seg166		ends
