seg086		segment	para public 'CODE' use16
		assume cs:seg086
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3Bh, 0CEh, 72h, 0C1h, 0B8h, 1, 0

loc_2F577:
		db 5Fh, 5Eh, 5Dh, 0CAh, 6, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F57D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		cmp	dx, word_4CE02
		jz	short loc_2F5A0
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6
sub_2F57D		endp
seg086		ends
