seg072		segment	para public 'CODE' use16
		assume cs:seg072
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 26h, 0C4h, 5Fh, 9

loc_2BCE4:
		db 26h, 89h, 47h, 4, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BCEB		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2BD13
		add	sp, 8
		pop	bp
		retf
sub_2BCEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BCFF		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	sub_2BDB1
		add	sp, 8
		pop	bp
		retf
sub_2BCFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BD13		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_2BD32
		push	14h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_2BDA9

loc_2BD32:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 13DAh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Ch
		mov	eax, dword_7CB28
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+6]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+0Eh]
		push	ax
		push	large es:[bx+0Ah]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+18h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		mov	word ptr es:[bx+6], 1Bh

loc_2BDA9:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_2BD13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BDB1		proc near

var_4		= dword ptr -4
arg_2		= dword ptr  6
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_2], 0
		jnz	short loc_2BDD0
		push	14h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_2+2], dx
		mov	word ptr [bp+arg_2], ax
		or	ax, dx
		jz	short loc_2BE3F

loc_2BDD0:
		les	bx, word ptr [bp+arg_2]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 13DAh
		mov	ax, word ptr [bp+arg_2]
		add	ax, 0Ch
		mov	eax, dword_7CB28
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_6]
		mov	eax, es:[bx+6]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_6]
		mov	al, es:[bx+0Eh]
		push	ax
		push	large es:[bx+0Ah]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+10h], eax
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+4]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+0Ah], ax
		mov	word ptr es:[bx+8], 0FFh
		mov	word ptr es:[bx+6], 1Bh
sub_2BDB1		endp

; START OF FUNCTION CHUNK FOR sub_2BDB1

loc_2BE3F:
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_2BDB1
seg072		ends
