seg083		segment	para public 'CODE' use16
		assume cs:seg083
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_385D2		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Eh], 0
		jle	short loc_38658
		inc	word ptr es:[bx+14h]
		mov	ax, es:[bx+14h]
		cmp	ax, es:[bx+0Eh]
		jl	short loc_385F6
		mov	word ptr es:[bx+14h], 0

loc_385F6:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		mov	bx, es:[bx+14h]
		imul	bx, bx, 0Eh
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], al
		les	bx, [bp+var_4]
		mov	eax, es:[bx+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+9]
		les	bx, [bp+arg_0]
		mov	es:[bx+9], eax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+5]
		les	bx, [bp+arg_0]
		mov	es:[bx+5], ax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+7]
		les	bx, [bp+arg_0]
		mov	es:[bx+7], ax

loc_38658:
		leave
		retf
sub_385D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3865A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_38691
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_38688
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_385D2
		add	sp, 4
		inc	si
		add	word ptr [bp+var_4], 18h

loc_38688:
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], si
sub_3865A		endp

; START OF FUNCTION CHUNK FOR sub_3865A
		db 77h
; END OF FUNCTION CHUNK FOR sub_3865A
seg083		ends
