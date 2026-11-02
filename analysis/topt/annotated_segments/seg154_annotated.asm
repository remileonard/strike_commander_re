seg154		segment	para public 'CODE' use16
		assume cs:seg154
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 0C3h

; ----------------------------------------------------------------------

sub_40162		proc near
		mov	si, word_4DBEF
		cmp	si, word_4DC05
		jb	short loc_401C1
		mov	di, word_4DBF5
		mov	word_4DBEF, di
		push	di
		mov	cx, di
		add	cx, word_4DBF3
		sub	cx, si
		mov	ch, cl

loc_4017F:
		mov	al, gs:[si]
		inc	si
		mov	gs:[di], al
		inc	di
		dec	cl
		jnz	short loc_4017F
		shr	cx, 8
		neg	cx
		add	cx, word_4DBF3
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
		push	word_4DBD8
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		pop	gs
		pop	fs
		pop	es
		pop	ds
		pop	ds
		pop	si

loc_401C1:
		mov	ax, gs:[si]
		mov	bl, gs:[si+2]
		mov	cx, word_4DBF7
		shrd	ax, bx, cl
		and	ax, word_4DC03
		add	cx, word_4DBDE
		mov	bx, cx
		shr	bx, 3
		add	word_4DBEF, bx
		and	cx, 7
		mov	word_4DBF7, cx
		ret
sub_40162		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_401E8		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		enter	0, 0
		push	bp
		push	di
		push	si
		mov	ax, [bp+arg_0]
		mov	word_4DBD8, ax
		mov	es, word_4DBE4
		mov	fs, word_4DBED
		mov	gs, word_4DBF1
		mov	ax, word_4DBEF
		mov	word_4DBF5, ax
		add	ax, word_4DBF3
		sub	ax, 3
		mov	word_4DC05, ax
		mov	ax, word_4DBDA
		cmp	ax, 0FFFFh
		jnz	short loc_40245
		push	ds
		push	es
		push	fs
		push	gs
		push	large [bp+arg_2]
		mov	cx, word_4DBF3
		push	0
		push	cx
		push	large word_4DBEF
		push	seg dseg
		pop	ds
		push	word_4DBD8
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		pop	gs
		pop	fs
		pop	es
		pop	ds

loc_40245:
		mov	word_4DBDA, 0
		cld
		mov	word_4DBDE, 9
		mov	word_4DC03, 1FFh
		mov	word_4DBE0, 200h
		mov	word_4DBE2, 102h
		jmp	short loc_402A3

loc_40266:
		pop	si
		pop	di
		pop	bp
		leave
		retf

loc_4026B:
		mov	word_4DBDE, 9
		mov	word_4DC03, 1FFh
		mov	word_4DBE0, 200h
		mov	word_4DBE2, 102h
		call	sub_40162
		mov	word_4DBE9, ax
		mov	byte_4DBE8, al
		mov	di, word ptr dword_4DBEB
		mov	fs:[di], al
		inc	word ptr dword_4DBEB
		jnz	short loc_402A3
		add	word_4DBED, 1000h
		mov	fs, word_4DBED

loc_402A3:
		call	sub_40162
		cmp	ax, 101h
		jz	short loc_40266
		cmp	ax, 100h
		jz	short loc_4026B
		mov	di, word ptr dword_4DBEB
		mov	cx, sp
		mov	word_4DBE6, ax
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		cmp	ax, word_4DBE2
		jl	short loc_402D5
		mov	al, byte_4DBE8
		push	ax
		mov	es:[bx+2], al
		mov	ax, word_4DBE9
		mov	es:[bx], ax
		jmp	short loc_402E1

loc_402D5:
		or	ah, ah
		jz	short loc_402E9
		mov	al, es:[bx+2]
		push	ax
		mov	ax, es:[bx]

loc_402E1:
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		jmp	short loc_402D5

loc_402E9:
		mov	byte_4DBE8, al
		push	ax
		sub	cx, sp
		shr	cx, 1
		jmp	short loc_402FD

loc_402F3:
		mov	ax, fs
		add	ah, 10h
		mov	fs, ax
		dec	cx
		jz	short loc_40307

loc_402FD:
		pop	ax
		mov	fs:[di], al
		inc	di
		jz	short loc_402F3
		dec	cx
		jnz	short loc_402FD

loc_40307:
		mov	word_4DBED, fs
		mov	word ptr dword_4DBEB, di
		mov	ax, word_4DBE2
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		mov	al, byte_4DBE8
		mov	es:[bx+2], al
		mov	ax, word_4DBE9
		mov	es:[bx], ax
		inc	word_4DBE2
		mov	ax, word_4DBE6
		mov	word_4DBE9, ax
		mov	bx, word_4DBE2
		cmp	bx, word_4DBE0
		jl	short loc_40350
		cmp	word_4DBDE, 0Ch
		jz	short loc_40350
		inc	word_4DBDE
		shl	word_4DBE0, 1
		shl	word_4DC03, 1
		inc	word_4DC03
sub_401E8		endp
seg154		ends
