seg074		segment	para public 'CODE' use16
		assume cs:seg074
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 66h, 59h, 66h, 58h, 0E9h, 99h, 0FCh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D6F8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_2D6F8		endp

; START OF FUNCTION CHUNK FOR sub_2D6F8
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2D6F8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D706		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2D706		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D70E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2D70E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D716		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2D716		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D71E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_2D71E		endp

; START OF FUNCTION CHUNK FOR sub_2D71E
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2D71E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D72A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2D72A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D732		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2D759
		mov	word ptr [si], 3884h
		mov	word ptr [si+2], 0FFFFh
		test	di, 1
		jz	short loc_2D759
		push	si
		call	sub_39C
		add	sp, 2

loc_2D759:
		pop	di
		pop	si
		pop	bp
		retf
sub_2D732		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D75D		proc far
		push	bp
		mov	bp, sp
sub_2D75D		endp
seg074		ends
