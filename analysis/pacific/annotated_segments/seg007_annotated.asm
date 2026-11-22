seg007		segment	para public 'CODE' use16
		assume cs:seg007
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Ch, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_7C406, ax
		pop	bp
		retf
sub_54B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54BE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		push	large [bp+arg_2]
		call	sub_398A
		add	sp, 4
		mov	[bp+var_2], ax
		inc	[bp+var_2]
		push	es
		push	ds
		push	ds
		pop	es
		lds	si, word ptr [bp+arg_2]
		mov	di, [bp+arg_0]
		mov	cx, [bp+var_2]
		rep movsb
		pop	ds
		pop	es
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_54BE		endp
seg007		ends
