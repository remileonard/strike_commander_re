seg157		segment	para public 'CODE' use16
		assume cs:seg157
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 40h, 52h, 0F7h, 6, 3Eh, 52h, 0FFh, 0FFh, 74h, 0E8h

loc_403CA:
		db 5Dh, 0CAh, 2, 0, 0B8h, 9, 12h, 50h, 9Ah, 0A1h, 1, 2Bh, 13h, 83h, 0C4h, 2
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_403DB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	word_4DC1E, 0

loc_403E6:
		mov	bx, [bp+arg_6]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	ah, 42h
		int	21h
		jnb	short loc_4040D
		mov	word_4DC1E, ax
		call	dword ptr dword_4DC20
		test	word_4DC1E, 0FFFFh
		jz	short loc_403E6
		mov	ax, 0FFFFh
		mov	dx, ax
		stc

loc_4040D:
		pop	di
		pop	si
		pop	bp
sub_403DB		endp
seg157		ends
