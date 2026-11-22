seg088		segment	para public 'CODE' use16
		assume cs:seg088
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 66h, 89h, 44h, 8, 8Bh, 0C6h, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D0CB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_3D0CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D0D7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D0D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D0DF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D0DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D0E7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D0E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D0EF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_3D0EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D0F9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D0F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D101		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_3D124
		mov	word ptr [si], 2772h
		mov	word ptr [si+2], 0FFFFh
		test	ax, 1
		jz	short loc_3D124
		push	si
sub_3D101		endp

; START OF FUNCTION CHUNK FOR sub_3D101
		db 9Ah, 3Bh
; END OF FUNCTION CHUNK FOR sub_3D101
seg088		ends
