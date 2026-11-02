seg018		segment	para public 'CODE' use16
		assume cs:seg018
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FEh, 0Eh, 0Bh, 0, 0CFh, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0F8h, 0, 4Bh, 0Ah, 0F8h, 0
		db 4Bh, 0Ah, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A5F0		proc far

saved_2		= dword ptr  2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		enter	0, 0
		push	large [bp+saved_2]
		pop	dword ptr cs:132h
		push	large [bp+arg_0]
		pop	dword ptr cs:136h
		push	[bp+arg_4]
		pop	word ptr cs:13Eh
		leave
		add	sp, 0Ah
		cli
		mov	cs:13Ah, sp
		mov	cs:13Ch, ss
		lss	sp, cs:12Eh
		push	large cs:13Ah
		push	gs
		push	fs
		push	ds
		push	es
		push	word ptr cs:13Eh
		push	large cs:136h
		pushal
		lss	sp, cs:13Ah
		push	large cs:132h
		retf
sub_A5F0		endp

; START OF FUNCTION CHUNK FOR sub_A5F0
		db 2Eh, 81h, 3Eh, 2Eh, 1, 0F8h, 0, 2Eh, 0C7h, 6, 2Eh, 1, 0F8h, 0, 2Eh, 0C7h
		db 6, 2Ah, 1, 0F8h, 0, 75h, 0Eh, 2Eh, 0C7h, 6, 2Eh, 1, 2Ah, 1, 2Eh, 0C7h
		db 6, 2Ah, 1, 0C6h, 0, 0Eh, 0E8h, 7Ch, 0FFh, 2Eh, 0Fh, 0B2h, 26h, 2Ah, 1, 66h
		db 61h, 66h, 2Eh, 8Fh, 6, 36h, 1, 2Eh, 8Fh, 6, 3Eh, 1, 7, 1Fh, 0Fh, 0A1h
		db 0Fh, 0A9h, 66h, 2Eh, 8Fh, 6, 3Ah, 1, 2Eh, 0Fh, 0B2h, 26h, 3Ah
		add	word_4C0DF, bp
		add	ds:[bp+2Eh], sp
; END OF FUNCTION CHUNK FOR sub_A5F0
seg018		ends
