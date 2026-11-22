seg163		segment	para public 'CODE' use16
		assume cs:seg163
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 45h, 2, 8Bh, 44h, 4, 89h, 45h, 4, 8Bh, 0C7h, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_417AE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_41800

loc_417B6:
		mov	ax, si
		imul	ax, ax, 0Ch
		les	bx, [bp+arg_0]
		add	bx, ax
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	dx, si
		imul	dx, dx, 0Ch
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, [bp+arg_0]
		add	bx, ax
		test	byte ptr es:[bx], 1
		jz	short loc_417FF
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	[bp+arg_2]
		push	dx
		call	sub_31FAF
		add	sp, 4
		jmp	short loc_417FF

loc_417FF:
		inc	si

loc_41800:
		cmp	si, 4
		jl	short loc_417B6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+61h], 0FFh
		mov	al, 0
		mov	es:[bx+63h], al
		mov	es:[bx+62h], al
		pop	si
		pop	bp
		retf
sub_417AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4181A		proc far

var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_8]
		jmp	loc_4191E

loc_4182B:
		xor	cx, cx
		mov	[bp+var_2], 0FFFFh
		jmp	short loc_41886

loc_41834:
		mov	ax, cx
		imul	ax, ax, 0Ch
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	dx, cx
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		add	eax, es:[bx+8]
		mov	bx, [bp+arg_6]
		sub	eax, [bx]
		mov	[bp+var_6], eax
		mov	eax, [bx]
		mov	dx, cx
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		sub	eax, es:[bx+4]
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 0
		jl	short loc_41885
		cmp	[bp+var_6], 0
		jle	short loc_41885
		mov	[bp+var_2], cx
		jmp	short loc_41892

loc_41885:
		inc	cx

loc_41886:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		cmp	ax, cx
		jg	short loc_41834

loc_41892:
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_4189B
		jmp	loc_41927

loc_4189B:
		mov	eax, [si]
		cmp	eax, [bp+var_6]
		jge	short loc_418A8
		mov	[bp+var_6], eax

loc_418A8:
		push	large [bp+var_6]
		push	large [bp+var_A]
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		push	word ptr [bp+arg_0+2]
		push	dx
		push	large [di]
		call	sub_31945
		add	sp, 10h
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+61h], al
		mov	bx, [bp+arg_6]
		mov	eax, [bp+var_6]
		add	[bx], eax
		sub	[si], eax
		cmp	dword ptr [si], 0
		jz	short loc_4191E
		mov	cx, di
		mov	bx, cx
		mov	ax, [bx]
		shr	ax, 4
		mov	dx, [bx+2]
		add	dx, ax
		mov	[bp+var_C], dx
		mov	ax, [bx]
		and	ax, 0Fh
		mov	[bx+2], dx
		mov	[bx], ax
		mov	eax, [bp+var_6]
		sar	eax, 4
		mov	dx, [di+2]
		add	dx, ax
		mov	ax, [di]
		mov	bx, word ptr [bp+var_6]
		and	bx, 0Fh
		add	ax, bx
		mov	[di+2], dx
		mov	[di], ax

loc_4191E:
		cmp	dword ptr [si], 0
		jz	short loc_41927
		jmp	loc_4182B

loc_41927:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_41FFA
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_4181A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41937		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_6], 0
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 0
		jz	short loc_41982
		cmp	byte ptr es:[bx+61h], 0
		jl	short loc_41961
		mov	eax, [bp+arg_0]
		cmp	eax, dword_4DCE2
		jz	short loc_41982

loc_41961:
		call	CRT_Rand
		les	bx, word ptr [bp+arg_0]
		push	ax
		mov	al, es:[bx+62h]
		cbw
		mov	bx, ax
		pop	ax
		cwd
		idiv	bx
		mov	[bp+var_2], dx
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+61h], 0FFh
		jmp	short loc_419D6

loc_41982:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 1
		jle	short loc_419D1
		call	CRT_Rand
		les	bx, word ptr [bp+arg_0]
		push	ax
		mov	al, es:[bx+62h]
		cbw
		dec	ax
		mov	bx, ax
		pop	ax
		cwd
		idiv	bx
		mov	[bp+var_2], dx
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+61h]
		cbw
		cmp	ax, [bp+var_2]
		jg	short loc_419B4
		inc	[bp+var_2]

loc_419B4:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+61h]
		cbw
		push	ax
		mov	al, es:[bx+62h]
		cbw
		dec	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_419D6
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+61h], al
		jmp	short loc_419D6

loc_419D1:
		xor	ax, ax
		jmp	loc_41AE5

loc_419D6:
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		test	byte ptr es:[bx], 1
		jz	short loc_41A23
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		push	word ptr [bp+arg_0+2]
		push	dx
		call	sub_31FAF
		add	sp, 4
		jmp	short loc_41A23

loc_41A23:
		les	bx, word ptr [bp+arg_0]
		dec	byte ptr es:[bx+62h]
		cmp	byte ptr es:[bx+62h], 0
		jnz	short loc_41A34
		jmp	loc_41AE2

loc_41A34:
		mov	al, es:[bx+62h]
		cbw
		cmp	ax, [bp+var_2]
		jnz	short loc_41A41
		jmp	loc_41AE2

loc_41A41:
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx]
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+8]
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+8], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_6]
		mov	es:[bx], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	bx, word ptr [bp+arg_0]
		push	eax
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		pop	eax
		mov	es:[bx+4], eax

loc_41AE2:
		mov	ax, 1

loc_41AE5:
		leave
		retf
sub_41937		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41AE7		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		cmp	dword_4DCE2, 0
		jnz	short loc_41AF8
		jmp	loc_41B80

loc_41AF8:
		mov	eax, dword_4DCE2
		mov	[bp+var_8], eax

loc_41B00:
		mov	eax, dword_4DCE2
		mov	[bp+var_4], eax
		les	bx, word ptr dword_4DCE2
		mov	eax, es:[bx+30h]
		mov	dword_4DCE2, eax
		cmp	[bp+var_4], 0
		jz	short loc_41B6D
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_417AE
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg163
		push	offset sub_4249A
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_100B
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_41B6D

loc_41B6D:
		mov	eax, dword_4DCE2
		cmp	eax, [bp+var_8]
		jnz	short loc_41B00
		mov	dword_4DCE2, 0

loc_41B80:
		leave
		retf
sub_41AE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41B82		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		xor	si, si
		mov	eax, dword_4DCE2
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		jmp	loc_41CCA

loc_41B9E:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+63h]
		cbw
		or	ax, ax
		jz	short loc_41BAD
		jmp	loc_41C97

loc_41BAD:
		push	word ptr [bp+var_4+2]
		push	bx
		push	cs
		call	near ptr sub_41937
		add	sp, 4
		or	ax, ax
		jnz	short loc_41BBF
		jmp	loc_41C97

loc_41BBF:
		inc	si
		mov	eax, [bp+var_4]
		cmp	eax, [bp+arg_0]
		jnz	short loc_41BCD
		jmp	loc_41C97

loc_41BCD:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+62h]
		cbw
		or	ax, ax
		jz	short loc_41BDC
		jmp	loc_41C97

loc_41BDC:
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		les	bx, es:[bx+34h]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+36h]
		mov	dx, es:[bx+34h]
		les	bx, es:[bx+30h]
		mov	es:[bx+36h], ax
		mov	es:[bx+34h], dx
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_4]
		jnz	short loc_41C20
		mov	dword_4DCE2, 0
		jmp	short loc_41C37

loc_41C20:
		mov	eax, [bp+var_4]
		cmp	eax, dword_4DCE2
		jnz	short loc_41C37
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	dword_4DCE2, eax

loc_41C37:
		cmp	[bp+var_4], 0
		jz	short loc_41C8F
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_417AE
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg163
		push	offset sub_4249A
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_100B
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_41C8F

loc_41C8F:
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_41C97:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		cmp	[bp+var_4], 0
		jnz	short loc_41CB0
		mov	eax, dword_4DCE2
		mov	[bp+var_4], eax
		jmp	short loc_41CCA

loc_41CB0:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_4]
		jz	short loc_41CD4

loc_41CCA:
		cmp	[bp+var_4], 0
		jz	short loc_41CD4
		jmp	loc_41B9E

loc_41CD4:
		mov	ax, si
		pop	si
		leave
		retf
sub_41B82		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41CD9		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	eax, dword_4DCE2
		mov	[bp+var_4], eax
		xor	si, si
		mov	al, byte_4DCEC
		cbw
		or	ax, ax
		jnz	short loc_41D33
		xor	dx, dx
		xor	ax, ax
		jmp	loc_41E7E

loc_41CF9:
		inc	si
		push	28h
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		push	large [bp+arg_0]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_41D3A
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_4DCE2
		jnz	short loc_41D33
		mov	[bp+var_4], 0
		jmp	short loc_41D3A

loc_41D33:
		cmp	[bp+var_4], 0
		jnz	short loc_41CF9

loc_41D3A:
		cmp	[bp+var_4], 0
		jz	short loc_41D44
		jmp	loc_41E78

loc_41D44:
		cmp	word_4CFA2, 0
		jge	short loc_41D4E
		jmp	loc_41E78

loc_41D4E:
		jmp	short loc_41D51

loc_41D50:
		dec	si

loc_41D51:
		cmp	si, word_4DCE6
		jb	short loc_41D66
		push	large 0
		nop
		push	cs
		call	near ptr sub_41E81
		add	sp, 4
		or	ax, ax
		jnz	short loc_41D50

loc_41D66:
		cmp	si, word_4DCE6
		jb	short loc_41D6F
		jmp	loc_41E78

loc_41D6F:
		push	large 0
		nop
		push	cs
		call	near ptr sub_42391
		add	sp, 4
		or	ax, ax
		jnz	short loc_41D81
		jmp	loc_41E78

loc_41D81:
		push	1
		push	0
		push	2
		push	large 64h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_41DE2
		push	seg seg163
		push	offset sub_424E1
		push	5
		push	large 4
		push	0Ch
		push	dx
		push	[bp+var_8]
		call	sub_1474
		add	sp, 10h
		les	bx, [bp+var_8]
		mov	al, 0
		mov	es:[bx+62h], al
		mov	es:[bx+63h], al
		mov	es:[bx+61h], al
		mov	es:[bx+38h], al
		mov	es:[bx+45h], al
		mov	dword ptr es:[bx+30h], 0
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		jmp	short loc_41DE8

loc_41DE2:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_41DE8:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	dx
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_417AE
		add	sp, 4
		push	28h
		push	large [bp+var_C]
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_36A8
		add	sp, 0Ah
		cmp	dword_4DCE2, 0
		jz	short loc_41E63
		les	bx, word ptr [bp+var_4]
		mov	eax, dword_4DCE2
		mov	es:[bx+30h], eax
		les	bx, word ptr dword_4DCE2
		mov	eax, es:[bx+34h]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+34h], eax
		les	bx, word ptr dword_4DCE2
		les	bx, es:[bx+34h]
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr dword_4DCE2
		mov	eax, [bp+var_4]
		mov	es:[bx+34h], eax
		jmp	short loc_41E74

loc_41E63:
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_4]
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax

loc_41E74:
		mov	dword_4DCE2, eax

loc_41E78:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_41E7E:
		pop	si
		leave
		retf
sub_41CD9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41E81		proc far

var_68		= word ptr -68h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		xor	si, si
		mov	eax, dword_4DCE2
		mov	[bp+var_4], eax
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	sub_30C62
		add	sp, 4
		cmp	[bp+var_4], 0
		jnz	short loc_41EA9
		jmp	loc_41F9C

loc_41EA9:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+63h]
		cbw
		or	ax, ax
		jnz	short loc_41EC8
		cmp	[bp+arg_0], 0
		jz	short loc_41ED5

loc_41EC8:
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_4]
		jz	short loc_41ED5
		jmp	loc_41F8E

loc_41ED5:
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		les	bx, es:[bx+34h]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+36h]
		mov	dx, es:[bx+34h]
		les	bx, es:[bx+30h]
		mov	es:[bx+36h], ax
		mov	es:[bx+34h], dx
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_4]
		jnz	short loc_41F1C
		mov	dword_4DCE2, 0
		jmp	short loc_41F33

loc_41F1C:
		mov	eax, [bp+var_4]
		cmp	eax, dword_4DCE2
		jnz	short loc_41F33
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	dword_4DCE2, eax

loc_41F33:
		cmp	[bp+var_4], 0
		jz	short loc_41F8B
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_417AE
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg163
		push	offset sub_4249A
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_100B
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_41F8B

loc_41F8B:
		inc	si
		jmp	short loc_41F9C

loc_41F8E:
		mov	eax, [bp+var_4]
		cmp	eax, dword_4DCE2
		jz	short loc_41F9C
		jmp	loc_41EA9

loc_41F9C:
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	sub_30C79
		add	sp, 4
		mov	ax, si
		pop	si
		leave
		retf
sub_41E81		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41FAE		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		xor	si, si
		mov	eax, dword_4DCE2
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_0]
		mov	word_4DCE6, ax
		cmp	[bp+var_4], 0
		jz	short loc_41FF1

loc_41FCC:
		inc	si
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_4DCE2
		jnz	short loc_41FCC
		jmp	short loc_41FF1

loc_41FE2:
		push	large 0
		push	cs
		call	near ptr sub_41E81
		add	sp, 4
		or	ax, ax
		jz	short loc_41FF7
		dec	si

loc_41FF1:
		cmp	si, word_4DCE6
		ja	short loc_41FE2

loc_41FF7:
		pop	si
		leave
		retf
sub_41FAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41FFA		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		cmp	eax, dword_4DCE2
		jz	short loc_4207A
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		les	bx, es:[bx+34h]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+36h]
		mov	dx, es:[bx+34h]
		les	bx, es:[bx+30h]
		mov	es:[bx+36h], ax
		mov	es:[bx+34h], dx
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword_4DCE2
		mov	es:[bx+30h], eax
		les	bx, word ptr dword_4DCE2
		mov	eax, es:[bx+34h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], eax
		les	bx, word ptr dword_4DCE2
		les	bx, es:[bx+34h]
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr dword_4DCE2
		mov	eax, [bp+arg_0]
		mov	es:[bx+34h], eax
		mov	dword_4DCE2, eax

loc_4207A:
		pop	bp
		retf
sub_41FFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4207C		proc far

var_98		= word ptr -98h
var_6E		= word ptr -6Eh
var_1D		= dword ptr -1Dh
var_15		= word ptr -15h
var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 98h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		pop	cx
		push	si
		call	CRT_Strlen
		pop	cx
		mov	bx, ax
		mov	dx, si
		cmp	bx, 28h
		jle	short loc_420AA
		add	ax, 0FFD8h
		add	dx, ax

loc_420AA:
		push	dx
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strupr_2E71
		pop	cx
		push	1
		push	si
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReadDispatch_411DE
		add	sp, 6
		cmp	al, 1
		jnz	short loc_4214F
		push	ss
		lea	ax, [bp+var_98]
		push	ax
		push	cs
		call	near ptr sub_41CD9
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_42145
		mov	[bp+var_2], 1
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_4154E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6], eax
		mov	[bp+var_A], 0

loc_4210E:
		mov	eax, [bp+var_1D]
		add	eax, [bp+var_A]
		push	eax
		push	[bp+var_15]
		push	large [bp+var_E]
		nop
		push	cs
		call	near ptr sub_421E2
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_4213D
		add	[bp+var_A], 0FFC0h
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_6]
		jl	short loc_4210E

loc_4213D:
		les	bx, word ptr [bp+var_E]
		mov	byte ptr es:[bx+63h], 1

loc_42145:
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_4123E
		pop	cx

loc_4214F:
		mov	al, [bp+var_2]
		mov	[bp+var_10], al
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_Close_410AA
		add	sp, 4
		mov	al, [bp+var_10]
		pop	si
		leave
		retf
sub_4207C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42169		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_4DCE8, eax
		push	large 0
		nop
		push	cs
		call	near ptr sub_42391
		add	sp, 4
		pop	bp
		retf
sub_42169		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42181		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 0
		mov	eax, dword_4DCE2
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jz	short loc_421D7

loc_4219E:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+62h]
		cbw
		mov	dx, ax
		jmp	short loc_421BD

loc_421AA:
		mov	ax, dx
		imul	ax, ax, 0Ch
		les	bx, word ptr [bp+var_8]
		add	bx, ax
		mov	eax, es:[bx+8]
		add	[bp+var_4], eax

loc_421BD:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_421AA
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx+30h]
		mov	[bp+var_8], eax
		cmp	eax, dword_4DCE2
		jnz	short loc_4219E

loc_421D7:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_42181		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_421E2		proc far

var_80		= word ptr -80h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		push	word ptr [si+4]
		call	StreamReader_GetCapacity_4154E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		mov	bx, [si+4]
		mov	eax, [bx+51h]
		mov	[bp+var_18], eax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_42391
		add	sp, 4
		or	ax, ax
		jnz	short loc_42221

loc_4221C:
		xor	ax, ax
		jmp	loc_4238D

loc_42221:
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		call	sub_30C62
		add	sp, 4
		mov	eax, [bp+arg_6]
		sub	eax, [bp+var_18]
		mov	ebx, 0FFC0h
		cdq
		idiv	ebx
		imul	eax, eax, 0FFC0h
		add	eax, [bp+var_18]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_14]
		sub	eax, [bp+var_4]
		add	eax, [bp+var_18]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0FFC0h
		jle	short loc_42272
		mov	[bp+var_8], 0FFC0h

loc_42272:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 4
		jle	short loc_42285
		push	1208h
		call	sub_13451
		pop	cx

loc_42285:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 4
		jnz	short loc_422A4
		cmp	[bp+var_14], 4FEC0h
		jg	short loc_4221C
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41937
		add	sp, 4

loc_422A4:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0+2]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		push	0
		push	large [bp+var_8]
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_31DF0
		add	sp, 0Ah
		mov	eax, [bp+var_1C]
		jmp	short loc_42300

loc_422D3:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0+2]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		push	0
		push	large [bp+var_8]
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_31DF0
		add	sp, 0Ah
		mov	eax, [bp+var_20]

loc_42300:
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_42329
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41B82
		add	sp, 4
		or	ax, ax
		jnz	short loc_422D3

loc_42329:
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jz	short loc_4237E
		push	[bp+var_E]
		push	bx
		call	PagedMemory_WriteByte_31364
		add	sp, 4
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	dx
		push	ax
		push	si
		call	FileStream_Method_Read_4158F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		les	bx, [bp+var_10]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+4], eax
		les	bx, word ptr [bp+arg_0]
		inc	byte ptr es:[bx+62h]
		inc	di

loc_4237E:
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		call	sub_30C79
		add	sp, 4
		mov	ax, di

loc_4238D:
		pop	di
		pop	si
		leave
		retf
sub_421E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42391		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	cs
		call	near ptr sub_42181
		push	dx
		push	ax
		pop	eax
		cmp	eax, dword_4DCE8
		jnb	short loc_423AC
		mov	ax, 1
		jmp	short loc_423AE

loc_423AC:
		xor	ax, ax

loc_423AE:
		mov	si, ax
		or	si, si
		jnz	short loc_423FF
		cmp	[bp+arg_0], 0
		jz	short loc_423CA
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+63h]
		mov	[bp+var_1], al
		mov	byte ptr es:[bx+63h], 1

loc_423CA:
		mov	si, 1

loc_423CD:
		push	large 0
		push	cs
		call	near ptr sub_41E81
		add	sp, 4
		or	ax, ax
		jnz	short loc_423DF
		xor	si, si
		jmp	short loc_423EE

loc_423DF:
		push	cs
		call	near ptr sub_42181
		push	dx
		push	ax
		pop	eax
		cmp	eax, dword_4DCE8
		ja	short loc_423CD

loc_423EE:
		cmp	[bp+arg_0], 0
		jz	short loc_423FF
		les	bx, word ptr [bp+arg_0]
		mov	al, [bp+var_1]
		mov	es:[bx+63h], al

loc_423FF:
		mov	ax, si
		pop	si
		leave
		retf
sub_42391		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42404		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_42439
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_42435
		push	dx
		push	ax
		push	cs
		call	near ptr sub_41E81
		add	sp, 4
		or	ax, ax
		jz	short loc_42435
		mov	ax, 1
		jmp	short loc_42437

loc_42435:
		xor	ax, ax

loc_42437:
		leave
		retf
sub_42404		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42439		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	eax, dword_4DCE2
		mov	[bp+var_4], eax
		jmp	short loc_42482

loc_42449:
		push	28h
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		push	large [bp+arg_0]
		call	sub_36D9
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_42489
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_4DCE2
		jnz	short loc_42482
		mov	[bp+var_4], 0
		jmp	short loc_42489

loc_42482:
		cmp	[bp+var_4], 0
		jnz	short loc_42449

loc_42489:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_42439		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42491		proc far
		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_41AE7
		pop	bp
		retf
sub_42491		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4249A		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_424DE
		les	bx, word ptr [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		test	byte ptr es:[bx], 1
		jz	short loc_424CC
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_31FAF
		add	sp, 4
		jmp	short loc_424CC

loc_424CC:
		test	si, 1
		jz	short loc_424DE
		push	large [bp+arg_0]
		call	sub_3AA
		add	sp, 4

loc_424DE:
		pop	si
		pop	bp
		retf
sub_4249A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_424E1		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_42500
		push	large 0Ch
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_42518

loc_42500:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx], 0
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax

loc_42518:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_424E1		endp
seg163		ends
