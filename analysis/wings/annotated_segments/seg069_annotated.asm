seg069		segment	para public 'CODE' use16
		assume cs:seg069
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 44h, 83h, 0C4h, 0Ah, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30547		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_30547		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3054C		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3054C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30551		proc far

var_4		= dword ptr -4
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		push	63DEh
		call	Palette_FogTableIndex_35E32
		add	sp, 6
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_3058A
		mov	dl, [bp+arg_4]
		jmp	short loc_30597

loc_3058A:
		mov	al, [bp+arg_4]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	dl, es:[bx]

loc_30597:
		mov	al, dl
		leave
		retf
sub_30551		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3059B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3059B		endp
seg069		ends
