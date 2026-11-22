seg136		segment	para public 'CODE' use16
		assume cs:seg136
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Fh, 0E9h, 83h, 0FEh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4A194		proc far

var_152		= word ptr -152h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h

		enter	152h, 0
		push	si
		push	di
		push	ds
		cld
		push	ss
		pop	es
		push	ds
		pop	gs
		mov	si, [bp+arg_0]
		lea	di, [bp+var_12]
		mov	cx, 6
		rep movsw
		mov	es, [bp+var_12]
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4], bx
		jb	short loc_4A1C1
		jnz	short loc_4A1C4

loc_4A1C1:
		jmp	loc_4A280

loc_4A1C4:
		mov	ax, ds
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		mov	ax, [si]
		add	ax, [bp+arg_2]
		cmp	ax, [bp+var_A]
		jg	short loc_4A223
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_4A218
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		cmp	ax, [bp+var_C]

loc_4A218:
		jl	short loc_4A285
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_8]

loc_4A223:
		jg	short loc_4A285
		mov	dx, ds
		add	si, 8

loc_4A22A:
		lodsw
		or	ax, ax
		jz	short loc_4A28B
		mov	cx, ax
		lodsw
		add	ax, [bp+arg_2]
		mov	di, ax
		lodsw
		add	ax, [bp+arg_4]
		shl	ax, 1
		mov	bx, [bp+var_10]
		add	bx, ax
		add	di, gs:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_4A255
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_4A22A

loc_4A255:
		mov	bx, cx

loc_4A257:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4A26D
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_4A257
		jmp	short loc_4A22A

loc_4A26D:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_4A257
		jmp	short loc_4A22A

loc_4A280:
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_4A285:
		add	si, 8

loc_4A288:
		lodsw
		shr	ax, 1

loc_4A28B:
		jz	short loc_4A280
		mov	cx, ax
		jb	short loc_4A2F9
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_4A2F5
		cmp	ax, [bp+var_8]
		jg	short loc_4A2F5
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_4A2F5
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_4A2F5
		shl	bx, 1
		push	ds
		mov	ax, [bp+var_10]
		add	bx, ax
		mov	di, gs:[bx]
		pop	ds
		add	di, dx
		mov	ax, [bp+var_E]
		mov	bx, [bp+var_A]
		sub	ax, dx
		jle	short loc_4A2D6
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_4A2D6:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_4A2EB
		sub	cx, dx
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, dx
		jmp	short loc_4A288

loc_4A2EB:
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_4A288

loc_4A2F5:
		add	si, cx
		jmp	short loc_4A288

loc_4A2F9:
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_4A366
		cmp	ax, [bp+var_8]
		jg	short loc_4A366
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_4A366
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_4A366
		shl	bx, 1
		push	ds
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, gs:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]
		sub	dx, [bp+var_E]
		jl	short loc_4A379
		cmp	ax, 0
		jg	short loc_4A379
		mov	bx, cx

loc_4A33B:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4A352
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_4A33B
		jmp	loc_4A288

loc_4A352:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_4A33B
		jmp	loc_4A288

loc_4A366:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_4A372
		add	si, ax
		dec	si

loc_4A372:
		sub	cx, ax
		jnz	short loc_4A366
		jmp	loc_4A288

loc_4A379:
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_4A387:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4A39D
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_4A387
		jmp	short loc_4A3AE

loc_4A39D:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_4A387

loc_4A3AE:
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_152]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_4A3C7
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_4A3C7:
		cmp	[bp+var_2], 0
		jle	short loc_4A3D3
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_4A3D3:
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, ax
		pop	si
		pop	ds
sub_4A194		endp

; START OF FUNCTION CHUNK FOR sub_4A194
		db 0E9h
; END OF FUNCTION CHUNK FOR sub_4A194
seg136		ends
