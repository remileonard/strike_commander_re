seg099		segment	para public 'CODE' use16
		assume cs:seg099
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43931		proc far
		push	bp
		mov	bp, sp

loc_43934:
		pushf

loc_43935:
		cmp	byte_5DA1E, 0
		jnz	short loc_43935
		cli
		cmp	byte_5DA1E, 0
		jz	short loc_43945
		popf

loc_43945:
		cmp	byte_5DA1E, 0
		jnz	short loc_43934
		mov	byte_5DA1E, 1
		popf
		pop	bp
		retf
sub_43931		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43954		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		cmp	dword_5DA11, 0
		jnz	short loc_4398B
		mov	eax, [bp+arg_0]
		mov	dword_5DA11, eax
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		jmp	loc_43A89

loc_4398B:
		mov	eax, dword_5DA11
		mov	[bp+var_8], eax
		push	1
		push	large [bp+arg_0]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		push	1
		push	large dword_5DA11
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jbe	short loc_439DE
		mov	eax, [bp+arg_0]
		mov	dword_5DA11, eax
		jmp	short loc_43A14

loc_439DE:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	eax, [bp+var_8]
		cmp	eax, dword_5DA11
		jz	short loc_43A14
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jb	short loc_439DE

loc_43A14:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_C]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]

loc_43A89:
		mov	es:[bx+8], eax
		leave
		retf
sub_43954		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43A90		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+arg_0]
		jnz	short loc_43AC3
		mov	dword_5DA11, 0
		jmp	short loc_43B29

loc_43AC3:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		cmp	eax, dword_5DA11
		jnz	short loc_43AEB
		mov	eax, [bp+var_C]
		mov	dword_5DA11, eax

loc_43AEB:
		push	1
		push	large [bp+var_8]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx+8], eax

loc_43B29:
		leave
		retf
sub_43A90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43B2B		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	1
		push	large [bp+arg_0]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_10]
		jnz	short loc_43BA8
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_10]
		jnz	short loc_43B79
		jmp	loc_43D5E

loc_43B79:
		mov	dword_5DA11, eax
		push	1
		push	large [bp+var_10]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_43BA1
		jmp	loc_43D5E

loc_43BA1:
		mov	eax, [bp+var_10]
		jmp	loc_43D5A

loc_43BA8:
		mov	al, 1
		mov	[bp+var_12], al
		mov	[bp+var_11], al
		push	1
		push	large [bp+var_10]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jnb	short loc_43BDC
		mov	eax, [bp+var_10]
		cmp	eax, dword_5DA11
		jnz	short loc_43C12

loc_43BDC:
		push	1
		push	large [bp+var_C]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jbe	short loc_43C08
		mov	eax, [bp+arg_0]
		cmp	eax, dword_5DA11
		jnz	short loc_43C0E

loc_43C08:
		mov	[bp+var_12], 0
		jmp	short loc_43C12

loc_43C0E:
		mov	[bp+var_11], 0

loc_43C12:
		cmp	[bp+var_12], 0
		jnz	short loc_43C1B
		jmp	loc_43D5E

loc_43C1B:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_43A90
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_43C81
		push	1
		push	large [bp+var_10]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax

loc_43C40:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_5DA11
		jz	short loc_43CD0
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_43C40
		jmp	short loc_43CD0

loc_43C81:
		push	1
		push	large [bp+var_C]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax

loc_43C95:
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		cmp	eax, dword_5DA11
		jz	short loc_43CD0
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		ja	short loc_43C95

loc_43CD0:
		push	1
		push	large [bp+var_16]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_1A]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		push	1
		push	large [bp+arg_0]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_1A]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_16]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_5DA11
		jnz	short loc_43D5E
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_1E]
		jnb	short loc_43D5E
		mov	eax, [bp+arg_0]

loc_43D5A:
		mov	dword_5DA11, eax

loc_43D5E:
		leave
		retf
sub_43B2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43D60		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		mov	[bp+var_4], 0
		cmp	byte_5DA10, 0
		jz	short loc_43D79
		jmp	loc_43F0B

loc_43D79:
		cmp	[bp+arg_4], 0
		jnz	short loc_43D89
		push	1504h
		call	sub_9D47
		pop	cx

loc_43D89:
		push	cs
		call	near ptr sub_43931
		mov	byte_5DA15, 0
		add	[bp+arg_4], 1Fh
		and	[bp+arg_4], 0FFFFFFF0h
		mov	eax, dword_5DA11
		mov	[bp+var_C], eax
		mov	[bp+var_D], 0
		cmp	dword_5DA11, 0
		jz	short loc_43DF4

loc_43DB0:
		push	1
		push	large [bp+var_C]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnb	short loc_43DDC
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		jmp	short loc_43DE0

loc_43DDC:
		mov	[bp+var_D], 1

loc_43DE0:
		mov	eax, [bp+var_C]
		cmp	eax, dword_5DA11
		jz	short loc_43DF4
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_43DB0

loc_43DF4:
		cmp	[bp+var_D], 0
		jnz	short loc_43DFD
		jmp	loc_43EF7

loc_43DFD:
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnz	short loc_43E1D
		or	dword ptr es:[bx], 1
		push	large [bp+var_C]
		push	cs
		call	near ptr sub_43A90
		add	sp, 4
		jmp	loc_43EAB

loc_43E1D:
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		sub	eax, [bp+arg_4]
		mov	[bp+var_1A], eax
		mov	eax, es:[bx]
		add	eax, [bp+var_C]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_C]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx], eax
		push	1
		push	large [bp+var_12]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		mov	eax, [bp+arg_4]
		or	eax, 1
		les	bx, [bp+var_8]
		mov	es:[bx], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+4], eax
		push	1
		push	large [bp+var_16]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_12]
		mov	es:[bx+4], eax
		push	large [bp+var_C]
		push	cs
		call	near ptr sub_43B2B
		add	sp, 4
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax

loc_43EAB:
		mov	eax, [bp+var_C]
		add	eax, [bp+arg_4]
		dec	eax
		shr	eax, 0Eh
		inc	ax
		mov	edx, [bp+var_C]
		add	edx, 10h
		shr	edx, 0Eh
		sub	ax, dx
		mov	si, ax
		cmp	si, 4
		jbe	short loc_43ED8
		push	1513h
		call	sub_9D47
		pop	cx

loc_43ED8:
		movzx	eax, si
		shl	eax, 18h
		mov	edx, 1
		or	edx, eax
		or	[bp+var_C], edx
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_43F06

loc_43EF7:
		cmp	[bp+arg_8], 0
		jz	short loc_43F06
		push	1503h
		call	sub_9D47
		pop	cx

loc_43F06:
		mov	byte_5DA1E, 0

loc_43F0B:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_43D60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43F1F		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_43F3B
		jmp	loc_44035

loc_43F3B:
		cmp	byte_5DA10, 0
		jz	short loc_43F45
		jmp	loc_44035

loc_43F45:
		push	large [bp+arg_0]
		call	sub_4344A
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43F65
		mov	byte_5DA10, 1
		push	1509h
		call	sub_9D47
		pop	cx

loc_43F65:
		push	cs
		call	near ptr sub_43931
		mov	byte_5DA15, 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_8], eax
		push	eax
		nop
		push	cs
		call	near ptr sub_44037
		add	sp, 4
		push	1
		push	large [bp+var_8]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		and	dword ptr es:[bx], 0FFFFFFFEh
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jz	short loc_44012
		push	1
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		test	dword ptr es:[bx], 1
		jnz	short loc_44012
		mov	eax, [bp+var_C]
		add	es:[bx], eax
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_10]
		mov	es:[bx+4], eax
		push	eax
		push	cs
		call	near ptr sub_43B2B
		jmp	short loc_4401A

loc_44012:
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_43954

loc_4401A:
		add	sp, 4
		mov	[bp+var_14], 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_14]
		mov	es:[bx], eax
		mov	byte_5DA1E, 0

loc_44035:
		leave
		retf
sub_43F1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44037		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		mov	edx, [bp+arg_0]
		add	edx, eax
		mov	[bp+var_8], edx
		push	1
		push	edx
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		test	[bp+var_C], 1
		jnz	short loc_440DE
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_43A90
		add	sp, 4
		push	1
		push	large [bp+arg_0]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		add	es:[bx], eax

loc_440DE:
		leave
		retf
sub_44037		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_440E0		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, byte_5DA15
		mov	ah, 0
		or	ax, ax
		jz	short loc_440F3
		jmp	loc_44185

loc_440F3:
		mov	al, byte_5DA10
		mov	ah, 0
		or	ax, ax
		jz	short loc_440FF
		jmp	loc_44185

loc_440FF:
		mov	eax, dword_5DA11
		mov	[bp+var_8], eax
		mov	si, 4E20h
		mov	byte_5DA15, 1
		xor	eax, eax
		mov	dword_5DA1A, eax
		mov	dword_5DA16, eax
		cmp	dword_5DA11, 0
		jz	short loc_44185

loc_44122:
		push	1
		push	large [bp+var_8]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, dword_5DA1A
		jbe	short loc_44148
		mov	dword_5DA1A, eax

loc_44148:
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		add	dword_5DA16, eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		cmp	eax, dword_5DA11
		jz	short loc_4416B
		mov	ax, si
		dec	si
		or	ax, ax
		jg	short loc_44122

loc_4416B:
		sub	dword_5DA1A, 10h
		or	si, si
		jg	short loc_44185
		mov	byte_5DA10, 1
		xor	eax, eax
		mov	dword_5DA16, eax
		mov	dword_5DA1A, eax

loc_44185:
		mov	eax, dword_5DA16
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_440E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44191		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_5DA15
		mov	ah, 0
		or	ax, ax
		jnz	short loc_441F8
		mov	al, byte_5DA10
		mov	ah, 0
		or	ax, ax
		jnz	short loc_441F8
		cmp	dword_5DA11, 0
		jz	short loc_441EF
		push	1
		push	large dword_5DA11
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	1
		les	bx, [bp+var_4]
		push	large es:[bx+8]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		sub	eax, 10h
		mov	dword_5DA1A, eax
		jmp	short loc_441F8

loc_441EF:
		mov	dword_5DA1A, 0

loc_441F8:
		mov	eax, dword_5DA1A
		shld	edx, eax, 10h
		leave
		retf
sub_44191		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44203		proc far

var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bl, [bp+arg_0]
		mov	eax, dword_5DA11
		mov	[bp+var_14], eax
		movzx	eax, bl
		shl	eax, 8
		movzx	edx, bl
		or	eax, edx
		shl	edx, 8
		movzx	ebx, bl
		or	edx, ebx
		shl	edx, 10h
		or	eax, edx
		mov	[bp+var_10], eax
		cmp	dword_5DA11, 0
		jnz	short loc_44245
		jmp	loc_442F5

loc_44245:
		mov	al, byte_5DA10
		mov	ah, 0
		or	ax, ax
		jz	short loc_44251
		jmp	loc_442F5

loc_44251:
		push	1
		push	large [bp+var_14]
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		sub	eax, 10h
		mov	[bp+var_1C], eax
		jmp	short loc_442DC

loc_44283:
		cmp	[bp+var_1C], 0FFF0h
		jnb	short loc_44297
		mov	eax, [bp+var_1C]
		shr	eax, 2
		jmp	short loc_4429A

loc_44297:
		mov	ax, 3FFCh

loc_4429A:
		mov	si, ax
		push	4
		mov	eax, [bp+var_14]
		add	eax, [bp+var_C]
		sub	eax, [bp+var_1C]
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		movzx	eax, si
		shl	eax, 2
		sub	[bp+var_1C], eax
		jmp	short loc_442D8

loc_442C8:
		les	bx, [bp+var_18]
		mov	eax, [bp+var_10]
		mov	es:[bx], eax
		dec	si
		add	[bp+var_18], 4

loc_442D8:
		or	si, si
		ja	short loc_442C8

loc_442DC:
		cmp	[bp+var_1C], 0
		ja	short loc_44283
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		cmp	eax, dword_5DA11
sub_44203		endp
seg099		ends
