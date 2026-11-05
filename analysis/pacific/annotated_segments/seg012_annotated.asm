seg012		segment	para public 'CODE' use16
		assume cs:seg012
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0B2h, 3, 0, 0, 59h, 0EBh, 0

loc_7977:
		db 5Fh, 5Eh, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_797C		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		shl	ax, 1
		add	[bp+arg_8], ax

loc_7987:
		push	bp
		lds	si, [bp+arg_4]
		inc	[bp+arg_4]
		les	di, [bp+arg_8]
		mov	cx, [bp+arg_0]
		xor	bx, bx
		xor	bp, bp

loc_7998:
		lodsb
		xor	al, 80h
		cbw
		imul	word ptr es:[di]
		sub	di, 2
		add	bx, ax
		adc	bp, dx
		loop	short loc_7998
		mov	dx, bp
		pop	bp
		mov	ax, bx
		mov	cl, 4
		shl	dx, cl
		shr	ax, cl
		or	dl, ah
		add	al, 80h
		adc	dx, 0
		sub	[si], dl
		dec	[bp+arg_2]
		jnz	short loc_7987
		pop	bp
		ret	0Ch
sub_797C		endp

; START OF FUNCTION CHUNK FOR sub_797C
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 7
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
		db 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 8
		db 1, 2, 3, 4, 5, 6, 7, 7, 7, 1, 1, 2, 3, 4, 5, 6
		db 7, 7, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 1, 2, 3, 4, 5
		db 6, 6, 6, 6, 2, 2, 3, 4, 5, 6, 7, 7, 7, 0, 0FFh, 0FFh
		db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 1, 2, 3, 4, 5, 5, 5, 5, 5, 3
		db 3, 4, 5, 6, 7, 7, 7, 7, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
		db 0FFh, 1, 2, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 6, 7, 7
		db 7, 7, 7, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 1, 2, 3, 3
		db 3, 3, 3, 3, 3, 5, 5, 6, 7, 7, 7, 7, 7, 7, 0, 0FFh
		db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 1, 2, 2, 2, 2, 2, 2, 2, 2
		db 6, 6, 7, 7, 7, 7, 7, 7, 7, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
		db 0FFh, 0FFh, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 7, 7, 7, 7
		db 7, 7, 7, 7, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0, 2, 3
		db 4, 5, 6, 7, 8, 8, 1, 1, 1, 2, 3, 4, 5, 6, 7, 0
		db 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0, 2, 3, 4, 5, 6, 7, 7
		db 7, 1, 2, 2, 3, 4, 5, 6, 7, 7, 0, 0, 0FFh, 0FFh, 0FFh, 0FFh
		db 0FFh, 0FFh, 0FFh, 0, 2, 3, 4, 5, 6, 6, 6, 6, 1, 3, 3, 4
		db 5, 6, 7, 7, 7, 0, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0, 2
		db 3, 4, 5, 5, 5, 5, 5, 1, 4, 4, 5, 6, 7, 7, 7, 7
		db 0, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0, 2, 3, 4, 4, 4, 4
		db 4, 4, 1, 5, 5, 6, 7, 7, 7, 7, 7, 0, 0, 0FFh, 0FFh, 0FFh
		db 0FFh, 0FFh, 0FFh, 0FFh, 0, 2, 3, 3, 3, 3, 3, 3, 3, 1, 6, 6
		db 7, 7, 7, 7, 7, 7, 0, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0
		db 2, 2, 2, 2, 2, 2, 2, 2, 1, 7, 7, 7, 7, 7, 7, 7
		db 7, 0, 0, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
; END OF FUNCTION CHUNK FOR sub_797C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7C3F		proc near

saved_0		= word ptr  0
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_8		= word ptr  0Ch
arg_61		= byte ptr  65h
arg_65		= byte ptr  69h
arg_6C		= byte ptr  70h

		push	bp
		mov	bp, sp
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		lds	di, [bp+arg_4]
		les	bp, [bp+arg_8]
		mov	ch, 8
		sub	si, 8
		mov	dx, si
		shl	dx, 1
		shl	dx, 1
		shl	dx, 1
		add	si, dx
		mov	dx, si
		shl	dx, 1
		add	si, dx
		lea	si, [si+155h]
		xor	bx, bx
		mov	dx, [di]
		add	di, 2

loc_7C6E:
		push	ax
		mov	bl, dl
		mov	bl, cs:[bx+55h]
		mov	cl, cs:[bx+si]
		cmp	ch, cl
		jnb	short loc_7C8A
		xchg	cl, ch
		shr	dx, cl
		sub	ch, cl
		mov	dh, [di]
		inc	di
		mov	cl, ch
		mov	ch, 8

loc_7C8A:
		shr	dx, cl
		sub	ch, cl
		mov	cl, cs:[bx+si+9]
		mov	al, dl
		ror	al, cl
		cbw
		xor	ah, cs:[bx+si+12h]
		shl	ax, cl
		xor	ah, 80h
		mov	es:[bp], ah
		inc	bp
		cmp	ch, cl
		jnb	short loc_7CB6
		xchg	cl, ch
		shr	dx, cl
		sub	ch, cl
		mov	dh, [di]
		inc	di
		mov	cl, ch
		mov	ch, 8

loc_7CB6:
		shr	dx, cl
		sub	ch, cl
		pop	ax
		dec	ax
		jnz	short loc_7C6E
		pop	bp
		ret	0Ch
sub_7C3F		endp

; START OF FUNCTION CHUNK FOR sub_7C3F
		inc	bx
		outsw
		jo	short loc_7D3F
		jb	short loc_7D31
		push	2074h
		xor	[bx+di], di
		cmp	[bp+di+saved_0], si
		and	[bp+di+arg_6C], dl
		arpl	gs:[bx+si+20h], bp
		inc	bx
		outsw
		insw
		jo	short loc_7D4F
		jnb	loc_7D53
		imul	bp, [bx+6Eh], 203Bh
		popaw
		insb
		insb
		and	[bp+si+arg_65], dh
		push	7374h
		and	[bp+si+arg_61], dh
		jnb	short loc_7D59
		jb	short loc_7D6C
		db 65h, 64h
; END OF FUNCTION CHUNK FOR sub_7C3F

; ----------------------------------------------------------------------

sub_7CF8		proc far
		push	si
		push	di
		push	bp
		mov	bp, sp
		push	ds
		cld
		lds	si, [bp+0Eh]
		mov	di, si
		mov	cx, [si]
		shr	cx, 1
		xor	bx, bx

loc_7D0A:
		lodsw
		xor	bx, ax
		loop	short loc_7D0A
		cmp	bx, 0ACEDh
		jz	short loc_7D1B
		mov	ax, 0FFFFh
		jmp	short loc_7D61
		nop

loc_7D1B:
		xor	ax, ax
		mov	al, [di+7]
		push	ax
		shl	ax, 1
		add	ax, 8
		push	ax
		les	si, [bp+0Ah]
		push	es
		add	si, [bp-4]
		push	si
		push	ds
		mov	si, di
		add	di, [bp-6]
		push	di
		push	word ptr [si+2]
		xor	ax, ax
		mov	al, [si+6]
		push	ax

loc_7D3F:
		call	sub_7C3F
		cmp	word ptr [bp-4], 0
		jz	short loc_7D5F
		les	di, [bp+0Eh]
		lea	di, [di+6]
		push	es

loc_7D4F:
		push	di
		lds	si, [bp+0Ah]

loc_7D53:
		push	ds
		push	si
		push	word ptr es:[di-4]

loc_7D59:
		push	word ptr [bp-4]
		call	sub_797C
sub_7CF8		endp

; START OF FUNCTION CHUNK FOR sub_7CF8

loc_7D5F:
		db 33h
; END OF FUNCTION CHUNK FOR sub_7CF8
seg012		ends
