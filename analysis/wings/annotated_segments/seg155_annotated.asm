seg155		segment	para public 'CODE' use16
		assume cs:seg155
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 0FFh, 74h, 0E8h

loc_51C24:
		db 5Dh, 0CAh, 2, 0, 0B8h, 9, 12h, 50h, 9Ah, 7, 0, 0D4h, 9, 83h, 0C4h, 2
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51C35		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	word_5E5FA, 0
		mov	bx, [bp+arg_6]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	ah, 42h
		int	21h
		jnb	short loc_51C67
		mov	word_5E5FA, ax
		call	dword ptr dword_5E5FC
		test	word_5E5FA, 0FFFFh
sub_51C35		endp

; START OF FUNCTION CHUNK FOR sub_51C35
		db 74h
; END OF FUNCTION CHUNK FOR sub_51C35
seg155		ends
