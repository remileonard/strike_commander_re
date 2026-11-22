seg020		segment	para public 'CODE' use16
		assume cs:seg020
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A032		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_A032		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A037		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_A037		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A03C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	byte_7C7C2, 6
		jz	short loc_A04D

loc_A049:
		mov	al, 0
		jmp	short loc_A0BB

loc_A04D:
		cmp	word_7C7D7, 14h
		jg	short loc_A049
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 96h
		jl	short loc_A049
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jg	short loc_A049
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0B2h], 2
		jnz	short loc_A09F
		cmp	byte ptr es:[bx+19h], 3
		jz	short loc_A049
		mov	eax, dword_7C7DF
		mov	ebx, 2
		cdq
		idiv	ebx
		cmp	eax, dword_7C7D9
		jle	short loc_A049
		jmp	short loc_A0B9
		jmp	short loc_A049

loc_A09F:
		mov	eax, dword_7C7DF
		mov	ebx, 2
		cdq
		idiv	ebx
		cmp	eax, dword_7C7D9
		jle	short loc_A0B9
		mov	al, 5
		jmp	short loc_A0BB

loc_A0B9:
		mov	al, 4

loc_A0BB:
		leave
		retf
sub_A03C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0BD		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		mov	[bp+var_1], 0
		cmp	byte_7C7C2, 6
		jz	short loc_A0D3

loc_A0CE:
		mov	al, 0
		jmp	loc_A1A6

loc_A0D3:
		mov	eax, dword_7C837
		cmp	eax, dword_7C7F7
		jg	short loc_A0CE
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		cwd
		sub	ax, dx
		sar	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	dx, [bx+9Fh]
		shl	dx, 1
		add	ax, dx
		cmp	ax, word_7C829
		ja	short loc_A0CE
		cmp	word_7C82D, 0FFF6h
		jl	short loc_A0CE
		cmp	word_7C82D, 14h
		jg	short loc_A0CE
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		push	large es:[bx+0DAh]
		call	sub_415CD
		add	sp, 4
		or	al, al
		jnz	short loc_A0CE
		cmp	dword_7C7D9, 0C8h
		jge	short loc_A161
		mov	ax, word_7C7D3
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 14h
		jge	short loc_A161
		mov	ax, word_7C7D5
		mov	[bp+var_6], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0A0h
		jle	short loc_A161
		mov	al, 7
		jmp	short loc_A1A6

loc_A161:
		cmp	dword_7C837, 3E8h
		jge	short loc_A174
		mov	al, [bp+var_1]
		add	al, 3
		mov	[bp+var_1], al

loc_A174:
		mov	ax, word_7C7D3
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 96h
		jle	short loc_A18B
		mov	al, [bp+var_1]
		add	al, 3
		jmp	short loc_A1A0

loc_A18B:
		mov	ax, word_7C7D3
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jle	short loc_A1A3
		mov	al, [bp+var_1]
		inc	al

loc_A1A0:
		mov	[bp+var_1], al

loc_A1A3:
		mov	al, [bp+var_1]

loc_A1A6:
		leave
		retf
sub_A0BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1A8		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7C7C2, 6
		jz	short loc_A1B6
		mov	al, 0
		jmp	short loc_A1B8

loc_A1B6:
		mov	al, 5

loc_A1B8:
		pop	bp
		retf
sub_A1A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1BA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 13h
		jz	short loc_A211
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+85h], 0FFh
		jz	short loc_A1E2
		mov	ax, 1
		jmp	short loc_A1E4

loc_A1E2:
		xor	ax, ax

loc_A1E4:
		or	al, al
		jnz	short loc_A211
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		movzx	eax, word ptr [bx+60D4h]
		cmp	eax, dword_7C837
		jl	short loc_A211
		cmp	word_7C82D, 0
		jge	short loc_A211
		mov	al, 0Ah
		jmp	short loc_A213

loc_A211:
		mov	al, 0

loc_A213:
		pop	bp
		retf
sub_A1BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A215		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+85h], 0FFh
		jz	short loc_A22F
		mov	ax, 1
		jmp	short loc_A231

loc_A22F:
		xor	ax, ax

loc_A231:
		or	al, al
		jz	short loc_A239
		mov	al, 0
		jmp	short loc_A275

loc_A239:
		xor	dx, dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_A270
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		cmp	ax, word_7C829
		jbe	short loc_A273
		cmp	word_7C82D, 0
		jle	short loc_A273

loc_A270:
		mov	dx, 0Ah

loc_A273:
		mov	al, dl

loc_A275:
		pop	bp
		retf
sub_A215		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A277		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	cl, 0
		cmp	byte_7C7C2, 6
		jz	short loc_A28B

loc_A286:
		mov	al, 0
		jmp	loc_A331

loc_A28B:
		mov	eax, dword_7C837
		cmp	eax, dword_7C7F7
		jg	short loc_A286
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 6
		jz	short loc_A2DF
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jl	short loc_A286
		cmp	word_7C7D7, 5Ah
		jge	short loc_A2C6
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jl	short loc_A286

loc_A2C6:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 4
		jnz	short loc_A2E6
		cmp	dword_7C837, 3E8h
		jge	short loc_A2E3

loc_A2DF:
		mov	al, 9
		jmp	short loc_A331

loc_A2E3:
		add	cl, 3

loc_A2E6:
		cmp	word_7C7D7, 9Bh
		jge	short loc_A2F2
		inc	cl
		jmp	short loc_A2F5

loc_A2F2:
		add	cl, 3

loc_A2F5:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		movzx	eax, word ptr [bx+60D4h]
		cmp	eax, dword_7C837
		jle	short loc_A318
		add	cl, 4
		jmp	short loc_A326

loc_A318:
		cmp	dword_7C837, 3E8h
		jge	short loc_A326
		add	cl, 2

loc_A326:
		cmp	cl, 8
		jbe	short loc_A32F
		mov	al, 8
		jmp	short loc_A331

loc_A32F:
		mov	al, cl

loc_A331:
		leave
		retf
sub_A277		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A333		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		xor	cx, cx
		cmp	byte_7C7C2, 6
		jz	short loc_A347

loc_A342:
		mov	al, 0
		jmp	loc_A406

loc_A347:
		cmp	word_7C7D7, 1Eh
		jg	short loc_A342
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7EB
		jg	short loc_A342
		cmp	word_7C82D, 0FFF4h
		jl	short loc_A342
		cmp	word_7C82D, 14h
		jg	short loc_A342
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 7
		jnz	short loc_A342
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		mov	ax, [bx+60D4h]
		shl	ax, 1
		movzx	eax, ax
		cmp	eax, dword_7C837
		jg	short loc_A342
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		shl	ax, 1
		cmp	ax, word_7C829
		jbe	short loc_A3B1
		add	cx, 2

loc_A3B1:
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 87h
		jle	short loc_A3C4
		add	cx, 2

loc_A3C4:
		mov	eax, dword_7C7DF
		shl	eax, 1
		cmp	eax, dword_7C7D9
		jle	short loc_A3D5
		add	cx, 4

loc_A3D5:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+0A7h], 3
		jb	short loc_A3E8
		inc	cx

loc_A3E8:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+0A8h], 3
		jb	short loc_A3FB
		dec	cx

loc_A3FB:
		cmp	cx, 8
		jle	short loc_A404
sub_A333		endp
seg020		ends
