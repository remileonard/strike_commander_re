seg130		segment	para public 'CODE' use16
		assume cs:seg130
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49512		proc far

saved_0		= word ptr  0
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	[bp+arg_6], 0
		jz	short loc_49523
		cmp	[bp+arg_8], 0
		jnz	short loc_49550

loc_49523:
		push	[bp+arg_A]
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+arg_6]
		push	ax
		push	[bp+arg_0]
		call	sub_49BA2
		add	sp, 0Ch
		jmp	loc_4984F

loc_49550:
		mov	si, [bp+arg_0]
		mov	es, [si]
		mov	ax, [si+8]
		mov	word_5DE2E, ax
		mov	ax, [si+4]
		mov	word_5DE2A, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_5DE28, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_5DE2C, ax
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_5DE22, ax
		mov	ax, [bp+arg_2]
		mov	word_5DE30, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_5DE32, ax
		mov	word_5DE24, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_5DE26, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_5DE38, ax
		mov	word_5DE3A, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_5DE3C, ax
		mov	word_5DE3E, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_5DE40, ax
		mov	word_5DE42, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_5DE44, ax
		mov	word_5DE46, dx
		mov	word_5DE48, 0
		mov	word_5DE4A, 0
		mov	ax, word_5DE3C
		mov	dx, word_5DE3E
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_5DE4C, ax
		mov	word_5DE4E, dx
		mov	ax, word_5DE38
		mov	dx, word_5DE3A
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_5DE40
		add	dx, word_5DE42
		mov	word_5DE50, ax
		mov	word_5DE52, dx
		mov	ax, word_5DE38
		mov	dx, word_5DE3A
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_5DE50, ax
		sbb	word_5DE52, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_4962C:
		mov	ax, word_5DE48
		mov	dx, word_5DE4A
		sub	ax, word_5DE4C
		sbb	dx, word_5DE4E
		js	short loc_49640
		jmp	loc_4972A

loc_49640:
		push	bx
		mov	ax, word_5DE30
		add	ax, word_5DE24
		cmp	ax, word_5DE2E
		jle	short loc_49651
		mov	ax, word_5DE2E

loc_49651:
		cmp	ax, word_5DE2A
		jge	short loc_49659

loc_49657:
		jmp	short loc_496D1

loc_49659:
		mov	word_5DE36, ax
		mov	ax, word_5DE30
		sub	ax, word_5DE24
		cmp	ax, word_5DE2A
		jge	short loc_4966C
		mov	ax, word_5DE2A

loc_4966C:
		cmp	ax, word_5DE2E
		jg	short loc_49657
		mov	word_5DE34, ax
		mov	si, word_5DE32
		add	si, word_5DE26
		cmp	si, word_5DE28
		jl	short loc_49657
		cmp	si, word_5DE2C
		jg	short loc_496A3
		mov	di, word_5DE34
		mov	cx, word_5DE36
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_5DE22
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_496A3:
		mov	si, word_5DE32
		sub	si, word_5DE26
		cmp	si, word_5DE2C
		jg	short loc_496D1
		cmp	si, word_5DE28
		jl	short loc_496D1
		mov	di, word_5DE34
		mov	cx, word_5DE36
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_5DE22
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_496D1:
		pop	bx
		cmp	word_5DE52, 0
		js	short loc_496FD
		sub	word_5DE26, 2
		dec	bx
		mov	ax, word_5DE4C
		mov	dx, word_5DE4E
		sub	ax, word_5DE3C
		sbb	dx, word_5DE3E
		mov	word_5DE4C, ax
		mov	word_5DE4E, dx
		sub	word_5DE50, ax
		sbb	word_5DE52, dx

loc_496FD:
		inc	word_5DE24
		mov	ax, word_5DE48
		mov	dx, word_5DE4A
		add	ax, word_5DE44
		adc	dx, word_5DE46
		mov	word_5DE48, ax
		mov	word_5DE4A, dx
		add	ax, word_5DE40
		adc	dx, word_5DE42
		add	word_5DE50, ax
		adc	word_5DE52, dx
		jmp	loc_4962C

loc_4972A:
		push	bx
		mov	ax, word_5DE38
		mov	dx, word_5DE3A
		sub	ax, word_5DE40
		sbb	dx, word_5DE42
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_5DE48
		sbb	dx, word_5DE4A
		sub	ax, word_5DE4C
		sbb	dx, word_5DE4E
		sar	dx, 1
		rcr	ax, 1
		add	word_5DE50, ax
		adc	word_5DE52, dx
		pop	bx

loc_49763:
		push	bx
		mov	ax, word_5DE30
		add	ax, word_5DE24
		cmp	ax, word_5DE2E
		jle	short loc_49774
		mov	ax, word_5DE2E

loc_49774:
		cmp	ax, word_5DE2A
		jge	short loc_4977C

loc_4977A:
		jmp	short loc_497F4

loc_4977C:
		mov	word_5DE36, ax
		mov	ax, word_5DE30
		sub	ax, word_5DE24
		cmp	ax, word_5DE2A
		jge	short loc_4978F
		mov	ax, word_5DE2A

loc_4978F:
		cmp	ax, word_5DE2E
		jg	short loc_4977A
		mov	word_5DE34, ax
		mov	si, word_5DE32
		add	si, word_5DE26
		cmp	si, word_5DE28
		jl	short loc_4977A
		cmp	si, word_5DE2C
		jg	short loc_497C6
		mov	di, word_5DE34
		mov	cx, word_5DE36
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_5DE22
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_497C6:
		mov	si, word_5DE32
		sub	si, word_5DE26
		cmp	si, word_5DE2C
		jg	short loc_497F4
		cmp	si, word_5DE28
		jl	short loc_497F4
		mov	di, word_5DE34
		mov	cx, word_5DE36
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_5DE22
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_497F4:
		pop	bx
		cmp	word_5DE52, 0
		jns	short loc_4981E
		inc	word_5DE24
		mov	ax, word_5DE48
		mov	dx, word_5DE4A
		add	ax, word_5DE44
		adc	dx, word_5DE46
		mov	word_5DE48, ax
		mov	word_5DE4A, dx
		add	word_5DE50, ax
		adc	word_5DE52, dx

loc_4981E:
		sub	word_5DE26, 2
		mov	ax, word_5DE4C
		mov	dx, word_5DE4E
		sub	ax, word_5DE3C
		sbb	dx, word_5DE3E
		mov	word_5DE4C, ax
		mov	word_5DE4E, dx
		sub	ax, word_5DE38
		sbb	dx, word_5DE3A
		sub	word_5DE50, ax
		sbb	word_5DE52, dx
		dec	bx
		js	short loc_4984F
		jmp	loc_49763

loc_4984F:
		pop	di
sub_49512		endp
seg130		ends
