seg136		segment	para public 'CODE' use16
		assume cs:seg136
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38294		proc far

var_158		= word ptr -158h
var_156		= word ptr -156h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_150		= word ptr -150h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		enter	158h, 0
		push	si
		push	di
		push	ds
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_10]
		mov	cx, 6
		rep movsw
		mov	ax, [bp+arg_2]
		mov	[bp+var_154], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_156], ax
		mov	ax, [bp+arg_C]
		mov	ah, al
		mov	[bp+var_158], ax
		mov	es, [bp+var_10]
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	[si+4], bx
		jb	short loc_382D4
		jnz	short loc_382D7

loc_382D4:
		jmp	loc_3838F

loc_382D7:
		xor	eax, eax
		mov	ax, ds
		shl	eax, 4
		add	ax, si
		add	eax, [bx+si]
		mov	si, ax
		and	si, 0Fh
		shr	eax, 4
		mov	ds, ax
		mov	ax, [si]
		add	ax, [bp+var_154]
		cmp	ax, [bp+var_8]
		jg	short loc_3831F
		mov	ax, [bp+var_154]
		sub	ax, [si+2]
		cmp	ax, [bp+var_C]
		jl	short loc_38311
		mov	ax, [bp+var_156]
		sub	ax, [si+4]
		cmp	ax, [bp+var_A]

loc_38311:
		jge	short loc_38315
		jmp	short loc_38394

loc_38315:
		mov	ax, [si+6]
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_6]

loc_3831F:
		jg	short loc_38394
		mov	dx, ds
		add	si, 8

loc_38326:
		lodsw
		or	ax, ax
		jz	short loc_3839A
		mov	cx, ax
		lodsw
		add	ax, [bp+var_154]
		mov	di, ax
		lodsw
		add	ax, [bp+var_156]
		shl	ax, 1
		mov	bx, [bp+var_E]
		add	bx, ax
		add	di, ss:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_38359
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_38326

loc_38359:
		mov	bx, cx

loc_3835B:
		lodsb
		shr	al, 1
		cbw
		push	ax
		mov	cx, ax
		jb	short loc_38379
		mov	ax, [bp+var_158]
		add	si, cx
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_3835B
		jmp	short loc_38326

loc_38379:
		pop	ax
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_3835B
		jmp	short loc_38326

loc_3838F:
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_38394:
		add	si, 8

loc_38397:
		lodsw
		shr	ax, 1

loc_3839A:
		jz	short loc_3838F
		mov	cx, ax
		jnb	short loc_383A2
		jmp	short loc_38416

loc_383A2:
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_38412
		cmp	ax, [bp+var_6]
		jg	short loc_38412
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_38412
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_38412
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		mov	ax, [bp+var_C]
		mov	bx, [bp+var_8]
		sub	ax, dx
		jle	short loc_383E5
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_383E5:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_38400
		add	si, cx
		sub	cx, dx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_38397

loc_38400:
		add	si, cx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_38397

loc_38412:
		add	si, cx
		jmp	short loc_38397

loc_38416:
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_38488
		cmp	ax, [bp+var_6]
		jg	short loc_38488
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_38488
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_38488
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		sub	ax, [bp+var_8]
		jg	short loc_3849B
		sub	dx, [bp+var_C]
		jl	short loc_3849B
		mov	bx, cx

loc_38453:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_38472
		push	ax
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_38453
		jmp	loc_38397

loc_38472:
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_38453
		jmp	loc_38397

loc_38488:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_38494
		add	si, ax
		dec	si

loc_38494:
		sub	cx, ax
		jnz	short loc_38488
		jmp	loc_38397

loc_3849B:
		mov	[bp+var_152], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_150]

loc_384AA:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_384C8
		add	si, cx
		sub	bx, ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_384AA
		jmp	short loc_384DB

loc_384C8:
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_384AA

loc_384DB:
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_150]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_384F4
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_384F4:
		cmp	[bp+var_152], 0
		jle	short loc_38503
		sub	cx, [bp+var_152]
		mov	ax, [bp+var_152]

loc_38503:
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		pop	si
sub_38294		endp
seg136		ends
