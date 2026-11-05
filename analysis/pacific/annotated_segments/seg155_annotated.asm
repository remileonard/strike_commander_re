seg155		segment	para public 'CODE' use16
		assume cs:seg155
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 9, 50h, 9Ah, 0B2h, 3, 0, 0, 59h, 0EBh, 0

loc_6735B:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6735D		proc far

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
		jz	short loc_6737F
		mov	ax, word_7AF7C
		mov	[si+1], ax
		mov	[bp+var_2], di
		mov	ax, [bp+var_2]
		mov	word_7AF7C, ax

loc_6737F:
		pop	di
		pop	si
		leave
		retf
sub_6735D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67383		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1]
sub_67383		endp
seg155		ends
