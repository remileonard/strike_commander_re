seg082		segment	para public 'CODE' use16
		assume cs:seg082
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Eh, 44h, 56h, 8Bh, 1Ch, 0FFh, 1Fh, 59h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F31B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_4CDFE
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	[bp+arg_2]
		call	sub_37A76
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_2F31B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F340		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_2F262
		pop	cx
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2F31B
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_2F340		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F35C		proc far

var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax
		mov	ax, [bp+arg_6]
		mov	[si+8], ax
		mov	ax, [bp+arg_8]
		mov	[si+0Ah], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_5], al
		mov	byte_4CDFE, al
		push	[bp+arg_C]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 4
		pop	si
sub_2F35C		endp
seg082		ends
