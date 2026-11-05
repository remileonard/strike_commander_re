seg204		segment	para public 'CODE' use16
		assume cs:seg204
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C814		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_6C866

loc_6C81C:
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
		jz	short loc_6C865
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	[bp+arg_2]
		push	dx
		call	sub_6494D
		add	sp, 4
		jmp	short loc_6C865

loc_6C865:
		inc	si

loc_6C866:
		cmp	si, 4
		jl	short loc_6C81C
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+61h], 0FFh
		mov	al, 0
		mov	es:[bx+63h], al
		mov	es:[bx+62h], al
		pop	si
		pop	bp
		retf
sub_6C814		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C880		proc far

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
		jmp	loc_6C984

loc_6C891:
		xor	cx, cx
		mov	[bp+var_2], 0FFFFh
		jmp	short loc_6C8EC

loc_6C89A:
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
		jl	short loc_6C8EB
		cmp	[bp+var_6], 0
		jle	short loc_6C8EB
		mov	[bp+var_2], cx
		jmp	short loc_6C8F8

loc_6C8EB:
		inc	cx

loc_6C8EC:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		cmp	ax, cx
		jg	short loc_6C89A

loc_6C8F8:
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_6C901
		jmp	loc_6C98D

loc_6C901:
		mov	eax, [si]
		cmp	eax, [bp+var_6]
		jge	short loc_6C90E
		mov	[bp+var_6], eax

loc_6C90E:
		push	large [bp+var_6]
		push	large [bp+var_A]
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		push	word ptr [bp+arg_0+2]
		push	dx
		push	large [di]
		call	sub_642D1
		add	sp, 10h
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+61h], al
		mov	bx, [bp+arg_6]
		mov	eax, [bp+var_6]
		add	[bx], eax
		sub	[si], eax
		cmp	dword ptr [si], 0
		jz	short loc_6C984
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

loc_6C984:
		cmp	dword ptr [si], 0
		jz	short loc_6C98D
		jmp	loc_6C891

loc_6C98D:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_6D060
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6C880		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6C99D		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_6], 0
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 0
		jz	short loc_6C9E8
		cmp	byte ptr es:[bx+61h], 0
		jl	short loc_6C9C7
		mov	eax, [bp+arg_0]
		cmp	eax, dword_7B1CA
		jz	short loc_6C9E8

loc_6C9C7:
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
		jmp	short loc_6CA3C

loc_6C9E8:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 1
		jle	short loc_6CA37
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
		jg	short loc_6CA1A
		inc	[bp+var_2]

loc_6CA1A:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+61h]
		cbw
		push	ax
		mov	al, es:[bx+62h]
		cbw
		dec	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_6CA3C
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+61h], al
		jmp	short loc_6CA3C

loc_6CA37:
		xor	ax, ax
		jmp	loc_6CB4B

loc_6CA3C:
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
		jz	short loc_6CA89
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		push	word ptr [bp+arg_0+2]
		push	dx
		call	sub_6494D
		add	sp, 4
		jmp	short loc_6CA89

loc_6CA89:
		les	bx, word ptr [bp+arg_0]
		dec	byte ptr es:[bx+62h]
		cmp	byte ptr es:[bx+62h], 0
		jnz	short loc_6CA9A
		jmp	loc_6CB48

loc_6CA9A:
		mov	al, es:[bx+62h]
		cbw
		cmp	ax, [bp+var_2]
		jnz	short loc_6CAA7
		jmp	loc_6CB48

loc_6CAA7:
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

loc_6CB48:
		mov	ax, 1

loc_6CB4B:
		leave
		retf
sub_6C99D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CB4D		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		cmp	dword_7B1CA, 0
		jnz	short loc_6CB5E
		jmp	loc_6CBE6

loc_6CB5E:
		mov	eax, dword_7B1CA
		mov	[bp+var_8], eax

loc_6CB66:
		mov	eax, dword_7B1CA
		mov	[bp+var_4], eax
		les	bx, word ptr dword_7B1CA
		mov	eax, es:[bx+30h]
		mov	dword_7B1CA, eax
		cmp	[bp+var_4], 0
		jz	short loc_6CBD3
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6C814
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg204
		push	offset sub_6D500
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_1034
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_6CBD3

loc_6CBD3:
		mov	eax, dword_7B1CA
		cmp	eax, [bp+var_8]
		jnz	short loc_6CB66
		mov	dword_7B1CA, 0

loc_6CBE6:
		leave
		retf
sub_6CB4D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CBE8		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		xor	si, si
		mov	eax, dword_7B1CA
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		jmp	loc_6CD30

loc_6CC04:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+63h]
		cbw
		or	ax, ax
		jz	short loc_6CC13
		jmp	loc_6CCFD

loc_6CC13:
		push	word ptr [bp+var_4+2]
		push	bx
		push	cs
		call	near ptr sub_6C99D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6CC25
		jmp	loc_6CCFD

loc_6CC25:
		inc	si
		mov	eax, [bp+var_4]
		cmp	eax, [bp+arg_0]
		jnz	short loc_6CC33
		jmp	loc_6CCFD

loc_6CC33:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+62h]
		cbw
		or	ax, ax
		jz	short loc_6CC42
		jmp	loc_6CCFD

loc_6CC42:
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
		jnz	short loc_6CC86
		mov	dword_7B1CA, 0
		jmp	short loc_6CC9D

loc_6CC86:
		mov	eax, [bp+var_4]
		cmp	eax, dword_7B1CA
		jnz	short loc_6CC9D
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	dword_7B1CA, eax

loc_6CC9D:
		cmp	[bp+var_4], 0
		jz	short loc_6CCF5
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6C814
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg204
		push	offset sub_6D500
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_1034
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_6CCF5

loc_6CCF5:
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_6CCFD:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		cmp	[bp+var_4], 0
		jnz	short loc_6CD16
		mov	eax, dword_7B1CA
		mov	[bp+var_4], eax
		jmp	short loc_6CD30

loc_6CD16:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_4]
		jz	short loc_6CD3A

loc_6CD30:
		cmp	[bp+var_4], 0
		jz	short loc_6CD3A
		jmp	loc_6CC04

loc_6CD3A:
		mov	ax, si
		pop	si
		leave
		retf
sub_6CBE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CD3F		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	eax, dword_7B1CA
		mov	[bp+var_4], eax
		xor	si, si
		mov	al, byte_7B1D4
		cbw
		or	ax, ax
		jnz	short loc_6CD99
		xor	dx, dx
		xor	ax, ax
		jmp	loc_6CEE4

loc_6CD5F:
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
		jz	short loc_6CDA0
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_7B1CA
		jnz	short loc_6CD99
		mov	[bp+var_4], 0
		jmp	short loc_6CDA0

loc_6CD99:
		cmp	[bp+var_4], 0
		jnz	short loc_6CD5F

loc_6CDA0:
		cmp	[bp+var_4], 0
		jz	short loc_6CDAA
		jmp	loc_6CEDE

loc_6CDAA:
		cmp	word_7AB82, 0
		jge	short loc_6CDB4
		jmp	loc_6CEDE

loc_6CDB4:
		jmp	short loc_6CDB7

loc_6CDB6:
		dec	si

loc_6CDB7:
		cmp	si, word_7B1CE
		jb	short loc_6CDCC
		push	large 0
		nop
		push	cs
		call	near ptr sub_6CEE7
		add	sp, 4
		or	ax, ax
		jnz	short loc_6CDB6

loc_6CDCC:
		cmp	si, word_7B1CE
		jb	short loc_6CDD5
		jmp	loc_6CEDE

loc_6CDD5:
		push	large 0
		nop
		push	cs
		call	near ptr sub_6D3F7
		add	sp, 4
		or	ax, ax
		jnz	short loc_6CDE7
		jmp	loc_6CEDE

loc_6CDE7:
		push	1
		push	0
		push	2
		push	large 64h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_6CE48
		push	seg seg204
		push	offset sub_6D547
		push	5
		push	large 4
		push	0Ch
		push	dx
		push	[bp+var_8]
		call	sub_149D
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
		jmp	short loc_6CE4E

loc_6CE48:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_6CE4E:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	dx
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_6C814
		add	sp, 4
		push	28h
		push	large [bp+var_C]
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		cmp	dword_7B1CA, 0
		jz	short loc_6CEC9
		les	bx, word ptr [bp+var_4]
		mov	eax, dword_7B1CA
		mov	es:[bx+30h], eax
		les	bx, word ptr dword_7B1CA
		mov	eax, es:[bx+34h]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+34h], eax
		les	bx, word ptr dword_7B1CA
		les	bx, es:[bx+34h]
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr dword_7B1CA
		mov	eax, [bp+var_4]
		mov	es:[bx+34h], eax
		jmp	short loc_6CEDA

loc_6CEC9:
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_4]
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax

loc_6CEDA:
		mov	dword_7B1CA, eax

loc_6CEDE:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_6CEE4:
		pop	si
		leave
		retf
sub_6CD3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CEE7		proc far

var_68		= word ptr -68h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		xor	si, si
		mov	eax, dword_7B1CA
		mov	[bp+var_4], eax
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	sub_636D5
		add	sp, 4
		cmp	[bp+var_4], 0
		jnz	short loc_6CF0F
		jmp	loc_6D002

loc_6CF0F:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+63h]
		cbw
		or	ax, ax
		jnz	short loc_6CF2E
		cmp	[bp+arg_0], 0
		jz	short loc_6CF3B

loc_6CF2E:
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_4]
		jz	short loc_6CF3B
		jmp	loc_6CFF4

loc_6CF3B:
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
		jnz	short loc_6CF82
		mov	dword_7B1CA, 0
		jmp	short loc_6CF99

loc_6CF82:
		mov	eax, [bp+var_4]
		cmp	eax, dword_7B1CA
		jnz	short loc_6CF99
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	dword_7B1CA, eax

loc_6CF99:
		cmp	[bp+var_4], 0
		jz	short loc_6CFF1
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6C814
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg204
		push	offset sub_6D500
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_1034
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_6CFF1

loc_6CFF1:
		inc	si
		jmp	short loc_6D002

loc_6CFF4:
		mov	eax, [bp+var_4]
		cmp	eax, dword_7B1CA
		jz	short loc_6D002
		jmp	loc_6CF0F

loc_6D002:
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	sub_636EC
		add	sp, 4
		mov	ax, si
		pop	si
		leave
		retf
sub_6CEE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D014		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		xor	si, si
		mov	eax, dword_7B1CA
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_0]
		mov	word_7B1CE, ax
		cmp	[bp+var_4], 0
		jz	short loc_6D057

loc_6D032:
		inc	si
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_7B1CA
		jnz	short loc_6D032
		jmp	short loc_6D057

loc_6D048:
		push	large 0
		push	cs
		call	near ptr sub_6CEE7
		add	sp, 4
		or	ax, ax
		jz	short loc_6D05D
		dec	si

loc_6D057:
		cmp	si, word_7B1CE
		ja	short loc_6D048

loc_6D05D:
		pop	si
		leave
		retf
sub_6D014		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D060		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		cmp	eax, dword_7B1CA
		jz	short loc_6D0E0
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
		mov	eax, dword_7B1CA
		mov	es:[bx+30h], eax
		les	bx, word ptr dword_7B1CA
		mov	eax, es:[bx+34h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], eax
		les	bx, word ptr dword_7B1CA
		les	bx, es:[bx+34h]
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr dword_7B1CA
		mov	eax, [bp+arg_0]
		mov	es:[bx+34h], eax
		mov	dword_7B1CA, eax

loc_6D0E0:
		pop	bp
		retf
sub_6D060		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D0E2		proc far

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
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	si
		call	CRT_Strlen
		pop	cx
		mov	bx, ax
		mov	dx, si
		cmp	bx, 28h
		jle	short loc_6D110
		add	ax, 0FFD8h
		add	dx, ax

loc_6D110:
		push	dx
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		push	1
		push	si
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		cmp	al, 1
		jnz	short loc_6D1B5
		push	ss
		lea	ax, [bp+var_98]
		push	ax
		push	cs
		call	near ptr sub_6CD3F
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_6D1AB
		mov	[bp+var_2], 1
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6], eax
		mov	[bp+var_A], 0

loc_6D174:
		mov	eax, [bp+var_1D]
		add	eax, [bp+var_A]
		push	eax
		push	[bp+var_15]
		push	large [bp+var_E]
		nop
		push	cs
		call	near ptr sub_6D248
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_6D1A3
		add	[bp+var_A], 0FFC0h
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_6]
		jl	short loc_6D174

loc_6D1A3:
		les	bx, word ptr [bp+var_E]
		mov	byte ptr es:[bx+63h], 1

loc_6D1AB:
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_6C2A4
		pop	cx

loc_6D1B5:
		mov	al, [bp+var_2]
		mov	[bp+var_10], al
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_Close_6C110
		add	sp, 4
		mov	al, [bp+var_10]
		pop	si
		leave
		retf
sub_6D0E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D1CF		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_7B1D0, eax
		push	large 0
		nop
		push	cs
		call	near ptr sub_6D3F7
		add	sp, 4
		pop	bp
		retf
sub_6D1CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D1E7		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 0
		mov	eax, dword_7B1CA
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jz	short loc_6D23D

loc_6D204:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+62h]
		cbw
		mov	dx, ax
		jmp	short loc_6D223

loc_6D210:
		mov	ax, dx
		imul	ax, ax, 0Ch
		les	bx, word ptr [bp+var_8]
		add	bx, ax
		mov	eax, es:[bx+8]
		add	[bp+var_4], eax

loc_6D223:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_6D210
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx+30h]
		mov	[bp+var_8], eax
		cmp	eax, dword_7B1CA
		jnz	short loc_6D204

loc_6D23D:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_6D1E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D248		proc far

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
		call	StreamReader_GetCapacity_6C5B4
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
		call	near ptr sub_6D3F7
		add	sp, 4
		or	ax, ax
		jnz	short loc_6D287

loc_6D282:
		xor	ax, ax
		jmp	loc_6D3F3

loc_6D287:
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		call	sub_636D5
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
		jle	short loc_6D2D8
		mov	[bp+var_8], 0FFC0h

loc_6D2D8:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 4
		jle	short loc_6D2EB
		push	1208h
		call	sub_1DDFE
		pop	cx

loc_6D2EB:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 4
		jnz	short loc_6D30A
		cmp	[bp+var_14], 4FEC0h
		jg	short loc_6D282
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_6C99D
		add	sp, 4

loc_6D30A:
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
		call	sub_6478E
		add	sp, 0Ah
		mov	eax, [bp+var_1C]
		jmp	short loc_6D366

loc_6D339:
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
		call	sub_6478E
		add	sp, 0Ah
		mov	eax, [bp+var_20]

loc_6D366:
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_6D38F
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_6CBE8
		add	sp, 4
		or	ax, ax
		jnz	short loc_6D339

loc_6D38F:
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jz	short loc_6D3E4
		push	[bp+var_E]
		push	bx
		call	PagedMemory_WriteByte_63E0C
		add	sp, 4
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	dx
		push	ax
		push	si
		call	FileStream_Method_Read_6C5F5
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

loc_6D3E4:
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		call	sub_636EC
		add	sp, 4
		mov	ax, di

loc_6D3F3:
		pop	di
		pop	si
		leave
		retf
sub_6D248		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D3F7		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	cs
		call	near ptr sub_6D1E7
		push	dx
		push	ax
		pop	eax
		cmp	eax, dword_7B1D0
		jnb	short loc_6D412
		mov	ax, 1
		jmp	short loc_6D414

loc_6D412:
		xor	ax, ax

loc_6D414:
		mov	si, ax
		or	si, si
		jnz	short loc_6D465
		cmp	[bp+arg_0], 0
		jz	short loc_6D430
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+63h]
		mov	[bp+var_1], al
		mov	byte ptr es:[bx+63h], 1

loc_6D430:
		mov	si, 1

loc_6D433:
		push	large 0
		push	cs
		call	near ptr sub_6CEE7
		add	sp, 4
		or	ax, ax
		jnz	short loc_6D445
		xor	si, si
		jmp	short loc_6D454

loc_6D445:
		push	cs
		call	near ptr sub_6D1E7
		push	dx
		push	ax
		pop	eax
		cmp	eax, dword_7B1D0
		ja	short loc_6D433

loc_6D454:
		cmp	[bp+arg_0], 0
		jz	short loc_6D465
		les	bx, word ptr [bp+arg_0]
		mov	al, [bp+var_1]
		mov	es:[bx+63h], al

loc_6D465:
		mov	ax, si
		pop	si
		leave
		retf
sub_6D3F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D46A		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_6D49F
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_6D49B
		push	dx
		push	ax
		push	cs
		call	near ptr sub_6CEE7
		add	sp, 4
		or	ax, ax
		jz	short loc_6D49B
		mov	ax, 1
		jmp	short loc_6D49D

loc_6D49B:
		xor	ax, ax

loc_6D49D:
		leave
		retf
sub_6D46A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D49F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	eax, dword_7B1CA
		mov	[bp+var_4], eax
		jmp	short loc_6D4E8

loc_6D4AF:
		push	28h
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		push	large [bp+arg_0]
		call	sub_3A12
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_6D4EF
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_7B1CA
		jnz	short loc_6D4E8
		mov	[bp+var_4], 0
		jmp	short loc_6D4EF

loc_6D4E8:
		cmp	[bp+var_4], 0
		jnz	short loc_6D4AF

loc_6D4EF:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_6D49F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D4F7		proc far
		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_6CB4D
		pop	bp
		retf
sub_6D4F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D500		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_6D544
		les	bx, word ptr [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		test	byte ptr es:[bx], 1
		jz	short loc_6D532
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_6494D
		add	sp, 4
		jmp	short loc_6D532

loc_6D532:
		test	si, 1
		jz	short loc_6D544
		push	large [bp+arg_0]
		call	sub_3C0
		add	sp, 4

loc_6D544:
		pop	si
		pop	bp
		retf
sub_6D500		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D547		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_6D566
		push	large 0Ch
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_6D57E

loc_6D566:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx], 0
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
sub_6D547		endp

; START OF FUNCTION CHUNK FOR sub_6D547

loc_6D57E:
		db 8Bh
		push	si
; END OF FUNCTION CHUNK FOR sub_6D547
seg204		ends
