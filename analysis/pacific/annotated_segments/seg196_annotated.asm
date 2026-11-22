seg196		segment	para public 'CODE' use16
		assume cs:seg196
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0D3h, 49h, 0FFh, 6, 0D3h, 49h

loc_6B3B6:
		db 0E9h, 50h, 0FFh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B3BA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_6B3BF:
		push	ds
		lds	dx, [bp+arg_0]
		xor	cx, cx
		mov	ah, 3Ch
		int	21h
		pop	ds
		jnb	short loc_6B3DF
		mov	word_7B11E, ax
		call	dword ptr dword_7B120
		test	word_7B11E, 0FFFFh
		jz	short loc_6B3BF
		mov	ax, 0FFFFh
		stc

loc_6B3DF:
		pop	di
sub_6B3BA		endp
seg196		ends
