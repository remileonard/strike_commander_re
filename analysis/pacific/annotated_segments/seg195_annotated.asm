seg195		segment	para public 'CODE' use16
		assume cs:seg195
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E2h, 0FAh

loc_6B1C2:
		db 5Fh, 5Eh, 8Bh, 0E5h, 5Dh, 0CBh

; ----------------------------------------------------------------------

sub_6B1C8		proc near
		mov	si, word_7B0EF
		cmp	si, word_7B105
		jb	short loc_6B227
		mov	di, word_7B0F5
		mov	word_7B0EF, di
		push	di
		mov	cx, di
		add	cx, word_7B0F3
		sub	cx, si
		mov	ch, cl

loc_6B1E5:
		mov	al, gs:[si]
		inc	si
		mov	gs:[di], al
		inc	di
		dec	cl
		jnz	short loc_6B1E5
		shr	cx, 8
		neg	cx
		add	cx, word_7B0F3
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
		push	word_7B0D8
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		pop	gs
		pop	fs
		pop	es
		pop	ds
		pop	ds
		pop	si

loc_6B227:
		mov	ax, gs:[si]
		mov	bl, gs:[si+2]
		mov	cx, word_7B0F7
		shrd	ax, bx, cl
		and	ax, word_7B103
		add	cx, word_7B0DE
		mov	bx, cx
		shr	bx, 3
		add	word_7B0EF, bx
		and	cx, 7
		mov	word_7B0F7, cx
		ret
sub_6B1C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B24E		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		enter	0, 0
		push	bp
		push	di
		push	si
		mov	ax, [bp+arg_0]
		mov	word_7B0D8, ax
		mov	es, word_7B0E4
		mov	fs, word_7B0ED
		mov	gs, word_7B0F1
		mov	ax, word_7B0EF
		mov	word_7B0F5, ax
		add	ax, word_7B0F3
		sub	ax, 3
		mov	word_7B105, ax
		mov	ax, word_7B0DA
		cmp	ax, 0FFFFh
		jnz	short loc_6B2AB
		push	ds
		push	es
		push	fs
		push	gs
		push	large [bp+arg_2]
		mov	cx, word_7B0F3
		push	0
		push	cx
		push	large word_7B0EF
		push	seg dseg
		pop	ds
		push	word_7B0D8
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		pop	gs
		pop	fs
		pop	es
		pop	ds

loc_6B2AB:
		mov	word_7B0DA, 0
		cld
		mov	word_7B0DE, 9
		mov	word_7B103, 1FFh
		mov	word_7B0E0, 200h
		mov	word_7B0E2, 102h
		jmp	short loc_6B309

loc_6B2CC:
		pop	si
		pop	di
		pop	bp
		leave
		retf

loc_6B2D1:
		mov	word_7B0DE, 9
		mov	word_7B103, 1FFh
		mov	word_7B0E0, 200h
		mov	word_7B0E2, 102h
		call	sub_6B1C8
		mov	word_7B0E9, ax
		mov	byte_7B0E8, al
		mov	di, word ptr dword_7B0EB
		mov	fs:[di], al
		inc	word ptr dword_7B0EB
		jnz	short loc_6B309
		add	word_7B0ED, 1000h
		mov	fs, word_7B0ED

loc_6B309:
		call	sub_6B1C8
		cmp	ax, 101h
		jz	short loc_6B2CC
		cmp	ax, 100h
		jz	short loc_6B2D1
		mov	di, word ptr dword_7B0EB
		mov	cx, sp
		mov	word_7B0E6, ax
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		cmp	ax, word_7B0E2
		jl	short loc_6B33B
		mov	al, byte_7B0E8
		push	ax
		mov	es:[bx+2], al
		mov	ax, word_7B0E9
		mov	es:[bx], ax
		jmp	short loc_6B347

loc_6B33B:
		or	ah, ah
		jz	short loc_6B34F
		mov	al, es:[bx+2]
		push	ax
		mov	ax, es:[bx]

loc_6B347:
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		jmp	short loc_6B33B

loc_6B34F:
		mov	byte_7B0E8, al
		push	ax
		sub	cx, sp
		shr	cx, 1
		jmp	short loc_6B363

loc_6B359:
		mov	ax, fs
		add	ah, 10h
		mov	fs, ax
		dec	cx
		jz	short loc_6B36D

loc_6B363:
		pop	ax
		mov	fs:[di], al
		inc	di
		jz	short loc_6B359
		dec	cx
		jnz	short loc_6B363

loc_6B36D:
		mov	word_7B0ED, fs
		mov	word ptr dword_7B0EB, di
		mov	ax, word_7B0E2
		mov	bx, ax
		add	bx, bx
		add	bx, ax
		mov	al, byte_7B0E8
		mov	es:[bx+2], al
		mov	ax, word_7B0E9
		mov	es:[bx], ax
		inc	word_7B0E2
		mov	ax, word_7B0E6
		mov	word_7B0E9, ax
		mov	bx, word_7B0E2
		cmp	bx, word_7B0E0
		jl	short loc_6B3B6
		cmp	word_7B0DE, 0Ch
		jz	short loc_6B3B6
		inc	word_7B0DE
		shl	word_7B0E0, 1
sub_6B24E		endp

; START OF FUNCTION CHUNK FOR sub_6B24E
		db 0D1h, 26h
; END OF FUNCTION CHUNK FOR sub_6B24E
seg195		ends
