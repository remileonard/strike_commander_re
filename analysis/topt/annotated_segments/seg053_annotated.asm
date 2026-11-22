seg053		segment	para public 'CODE' use16
		assume cs:seg053
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F7D0		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1F7D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F7D5		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	eax, dword_4F22E
		sar	eax, 8
		push	eax
		push	68AEh
		call	Palette_FogTableIndex_2459A
		add	sp, 6
		push	ax
		push	68AEh
		call	sub_2391D
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_1F811
		mov	al, [bp+arg_4]
		mov	[bp+var_5], al
		jmp	short loc_1F821

loc_1F811:
		mov	al, [bp+arg_4]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	al, es:[bx]
sub_1F7D5		endp

; START OF FUNCTION CHUNK FOR sub_1F7D5
		db 88h
		inc	si
; END OF FUNCTION CHUNK FOR sub_1F7D5
seg053		ends
