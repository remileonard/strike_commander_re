seg198		segment	para public 'CODE' use16
		assume cs:seg198
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CAh, 2, 0, 0B8h, 9, 12h, 50h, 9Ah, 8Eh, 1, 0C7h, 1Dh, 83h, 0C4h, 2
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B441		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	word_7B11E, 0

loc_6B44C:
		mov	bx, [bp+arg_6]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	ah, 42h
		int	21h
		jnb	short loc_6B473
		mov	word_7B11E, ax
		call	dword ptr dword_7B120
		test	word_7B11E, 0FFFFh
		jz	short loc_6B44C
		mov	ax, 0FFFFh
sub_6B441		endp
seg198		ends
