seg122		segment	para public 'CODE' use16
		assume cs:seg122
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 0

loc_50872:
		db 56h, 0Eh, 0E8h, 66h, 0FEh, 59h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5087B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Eh], 0
		jle	short loc_50901
		inc	word ptr es:[bx+14h]
		mov	ax, es:[bx+14h]
		cmp	ax, es:[bx+0Eh]
		jl	short loc_5089F
		mov	word ptr es:[bx+14h], 0

loc_5089F:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		mov	bx, es:[bx+14h]
		imul	bx, bx, 0Eh
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	al, es:[bx+0Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], al
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax

loc_50901:
		leave
		retf
sub_5087B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50903		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_5093A
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_50931
sub_50903		endp

; START OF FUNCTION CHUNK FOR sub_50903
		db 66h, 0FFh, 76h, 0FCh, 0Eh, 0E8h, 52h, 0FFh, 83h, 0C4h, 4, 46h, 83h
		inc	si
		cld
; END OF FUNCTION CHUNK FOR sub_50903
seg122		ends
