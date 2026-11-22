seg152		segment	para public 'CODE' use16
		assume cs:seg152
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 36h, 2Bh, 3Eh, 47h, 47h, 0FEh, 0CEh, 75h, 0F1h

loc_519B9:
		db 1Fh, 5Eh, 0C3h

; ----------------------------------------------------------------------

sub_519BC		proc near
		mov	si, word_5E5CB
		cmp	si, word_5E5E1
		jb	short loc_51A1B
		mov	di, word_5E5D1
		mov	word_5E5CB, di
		push	di
		mov	cx, di
		add	cx, word_5E5CF
		sub	cx, si
		mov	ch, cl

loc_519D9:
		mov	al, gs:[si]
		inc	si
		mov	gs:[di], al
		inc	di
		dec	cl
		jnz	short loc_519D9
		shr	cx, 8
		neg	cx
		add	cx, word_5E5CF
		push	ds
		mov	ax, gs
		mov	ds, ax
		mov	dx, di
		push	ds
		push	es
		push	fs
		push	gs
		push	large 0FFFFFFFFh
		push	0
		push	cx
		push	ds
		push	dx
		push	seg dseg
		pop	ds
		push	word_5E5B4
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		pop	gs
		pop	fs
		pop	es
		pop	ds
		pop	ds
		pop	si

loc_51A1B:
		mov	ax, gs:[si]
		mov	bl, gs:[si+2]
		mov	cx, word_5E5D3
		shrd	ax, bx, cl
		and	ax, word_5E5DF
		add	cx, word_5E5BA
		mov	bx, cx
		shr	bx, 3
		add	word_5E5CB, bx
		and	cx, 7
		mov	word_5E5D3, cx
		ret
sub_519BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51A42		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		enter	0, 0
		push	bp
		push	di
		push	si
		mov	ax, [bp+arg_0]
		mov	word_5E5B4, ax
		mov	es, word_5E5C0
		mov	fs, word_5E5C9
		mov	gs, word_5E5CD
		mov	ax, word_5E5CB
		mov	word_5E5D1, ax
		add	ax, word_5E5CF
		sub	ax, 3
		mov	word_5E5E1, ax
		mov	ax, word_5E5B6
		cmp	ax, 0FFFFh
		jnz	short loc_51A9F
		push	ds
		push	es
		push	fs
		push	gs
		push	large [bp+arg_2]
		mov	cx, word_5E5CF
		push	0
		push	cx
		push	large word_5E5CB
		push	seg dseg
		pop	ds
		push	word_5E5B4
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		pop	gs
		pop	fs
		pop	es
		pop	ds

loc_51A9F:
		mov	word_5E5B6, 0
		cld
		mov	word_5E5BA, 9
		mov	word_5E5DF, 1FFh
		mov	word_5E5BC, 200h
		mov	word_5E5BE, 102h
		jmp	short loc_51AFD

loc_51AC0:
		pop	si
		pop	di
		pop	bp
		leave
		retf

loc_51AC5:
		mov	word_5E5BA, 9
		mov	word_5E5DF, 1FFh
		mov	word_5E5BC, 200h
		mov	word_5E5BE, 102h
		call	sub_519BC
		mov	word_5E5C5, ax
		mov	byte_5E5C4, al
		mov	di, word ptr dword_5E5C7
		mov	fs:[di], al
		inc	word ptr dword_5E5C7
		jnz	short loc_51AFD
		add	word_5E5C9, 1000h
		mov	fs, word_5E5C9

loc_51AFD:
		call	sub_519BC
		cmp	ax, 101h
		jz	short loc_51AC0
		cmp	ax, 100h
		jz	short loc_51AC5
		mov	di, word ptr dword_5E5C7
		mov	cx, sp
		mov	word_5E5C2, ax
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		cmp	ax, word_5E5BE
		jl	short loc_51B2F
		mov	al, byte_5E5C4
		push	ax
		mov	es:[bx+2], al
		mov	ax, word_5E5C5
		mov	es:[bx], ax
		jmp	short loc_51B3B

loc_51B2F:
		or	ah, ah
		jz	short loc_51B43
		mov	al, es:[bx+2]
		push	ax
		mov	ax, es:[bx]

loc_51B3B:
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		jmp	short loc_51B2F

loc_51B43:
		mov	byte_5E5C4, al
		push	ax
		sub	cx, sp
		shr	cx, 1
		jmp	short loc_51B57

loc_51B4D:
		mov	ax, fs
		add	ah, 10h
		mov	fs, ax
		dec	cx
		jz	short loc_51B61

loc_51B57:
		pop	ax
		mov	fs:[di], al
		inc	di
		jz	short loc_51B4D
		dec	cx
		jnz	short loc_51B57

loc_51B61:
		mov	word_5E5C9, fs
		mov	word ptr dword_5E5C7, di
		mov	ax, word_5E5BE
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		mov	al, byte_5E5C4
		mov	es:[bx+2], al
		mov	ax, word_5E5C5
		mov	es:[bx], ax
		inc	word_5E5BE
		mov	ax, word_5E5C2
		mov	word_5E5C5, ax
		mov	bx, word_5E5BE
		cmp	bx, word_5E5BC
		jl	short loc_51BAA
		cmp	word_5E5BA, 0Ch
		jz	short loc_51BAA
		inc	word_5E5BA
sub_51A42		endp

; START OF FUNCTION CHUNK FOR sub_51A42
		db 0D1h, 26h
; END OF FUNCTION CHUNK FOR sub_51A42
seg152		ends
