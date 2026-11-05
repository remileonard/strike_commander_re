seg049		segment	para public 'CODE' use16
		assume cs:seg049
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0B2h, 62h, 9Ah, 57h, 2, 0C4h, 67h, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E0EA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
sub_1E0EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E0F6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E0F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E0FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E0FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E106		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E106		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E10E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_1E10E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E118		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E118		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E120		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_1E143
		mov	word ptr [si], 0DAEh
		mov	word ptr [si+4], 0FFFFh
		test	ax, 1
		jz	short loc_1E143
		push	si
sub_1E120		endp

; START OF FUNCTION CHUNK FOR sub_1E120
		db 9Ah
		mov	dl, 3
; END OF FUNCTION CHUNK FOR sub_1E120
seg049		ends
