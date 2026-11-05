seg003		segment	para public 'CODE' use16
		assume cs:seg003
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CDh, 15h, 9Dh, 66h, 0A1h, 0C4h, 48h, 66h, 0Fh, 0A4h, 0C2h, 10h, 9Dh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47DF		proc far

var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		lea	ax, [bp+var_8]
		push	ax
		mov	al, [bp+arg_0]
		push	ax
		call	sub_470
		add	sp, 4
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_4803
		mov	eax, 0FFFFFFFFh
		jmp	short loc_481A

loc_4803:
		movzx	eax, [bp+var_8]
		movzx	edx, [bp+var_4]
		imul	eax, edx
		movzx	edx, [bp+var_2]
		imul	eax, edx

loc_481A:
		shld	edx, eax, 10h
		leave
		retf
sub_47DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4821		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		lea	ax, [bp+var_8]
		push	ax
		mov	al, [bp+arg_0]
		push	ax
		call	sub_470
		add	sp, 4
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_4845
		mov	eax, 0FFFFFFFFh
		jmp	short loc_485C

loc_4845:
		movzx	eax, [bp+var_6]
		movzx	edx, [bp+var_4]
		imul	eax, edx
		movzx	edx, [bp+var_2]
		imul	eax, edx
sub_4821		endp

; START OF FUNCTION CHUNK FOR sub_4821

loc_485C:
		db 66h, 0Fh, 0A4h, 0C2h
; END OF FUNCTION CHUNK FOR sub_4821
seg003		ends
