seg108		segment	para public 'CODE' use16
		assume cs:seg108
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 59h, 0EBh, 0

loc_469A3:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_469A5		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jz	short loc_469C7
		mov	ax, word_5DD42
		mov	[si+1], ax
		mov	[bp+var_2], di
		mov	ax, [bp+var_2]
		mov	word_5DD42, ax

loc_469C7:
		pop	di
		pop	si
		leave
		retf
sub_469A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_469CB		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1]
		mov	[bp+var_2], ax
		mov	word_5DD42, ax
		pop	si
		leave
sub_469CB		endp
seg108		ends
