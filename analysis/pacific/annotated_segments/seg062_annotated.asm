seg062		segment	para public 'CODE' use16
		assume cs:seg062
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0ECh, 0B0h, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23ED5		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23ED5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23EDA		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23EDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23EDF		proc far

var_4		= dword ptr -4
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	eax, dword_7CB28
		sar	eax, 8
		push	eax
		push	64DEh
		call	Palette_FogTableIndex_2E6CE
		add	sp, 6
		push	ax
		push	64DEh
		call	Palette_FadeTablePtr_2DE44
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_23F18
		mov	dl, [bp+arg_4]
		jmp	short loc_23F25

loc_23F18:
		mov	al, [bp+arg_4]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
sub_23EDF		endp
seg062		ends
