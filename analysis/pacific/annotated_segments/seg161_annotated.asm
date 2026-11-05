seg161		segment	para public 'CODE' use16
		assume cs:seg161
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68060		proc far

var_A		= word ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		xor	di, di
		push	large [bp+arg_0]
		call	sub_6AB8C
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_6809A

loc_6807A:
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 0
		push	large [bp+arg_0]
		push	si
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]
		inc	dx
		cmp	dx, di
		jle	short loc_68099
		mov	di, dx

loc_68099:
		inc	si

loc_6809A:
		cmp	si, [bp+var_2]
		jl	short loc_6807A
sub_68060		endp

; START OF FUNCTION CHUNK FOR sub_68060
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_68060
seg161		ends
