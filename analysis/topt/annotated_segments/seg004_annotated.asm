seg004		segment	para public 'CODE' use16
		assume cs:seg004
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C1h, 0, 0E9h, 11h, 0F7h, 0B8h, 0C2h, 0, 0E9h, 0Bh, 0F7h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_515B		proc far
		push	bp
		mov	bp, sp
		call	sub_35C96
		push	1
		call	sub_349D7
		add	sp, 2
		call	sub_33962
		push	0
		call	PagedMemory_ReadTextResource_52D8
		add	sp, 2
		mov	word_49E50, ax
		pop	bp
sub_515B		endp
seg004		ends
