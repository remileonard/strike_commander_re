seg132		segment	para public 'CODE' use16
		assume cs:seg132
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37BE0		proc far

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
		jz	short loc_37BF1
		cmp	[bp+arg_8], 0
		jnz	short loc_37C1E

loc_37BF1:
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
		call	sub_37F22
		add	sp, 0Ch
		jmp	loc_37F1D

loc_37C1E:
		mov	si, [bp+arg_0]
		mov	es, [si]
		mov	ax, [si+8]
		mov	word_4D480, ax
		mov	ax, [si+4]
		mov	word_4D47C, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_4D47A, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_4D47E, ax
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_4D474, ax
		mov	ax, [bp+arg_2]
		mov	word_4D482, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_4D484, ax
		mov	word_4D476, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_4D478, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_4D48A, ax
		mov	word_4D48C, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_4D48E, ax
		mov	word_4D490, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_4D492, ax
		mov	word_4D494, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_4D496, ax
		mov	word_4D498, dx
		mov	word_4D49A, 0
		mov	word_4D49C, 0
		mov	ax, word_4D48E
		mov	dx, word_4D490
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_4D49E, ax
		mov	word_4D4A0, dx
		mov	ax, word_4D48A
		mov	dx, word_4D48C
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_4D492
		add	dx, word_4D494
		mov	word_4D4A2, ax
		mov	word_4D4A4, dx
		mov	ax, word_4D48A
		mov	dx, word_4D48C
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_4D4A2, ax
		sbb	word_4D4A4, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_37CFA:
		mov	ax, word_4D49A
		mov	dx, word_4D49C
		sub	ax, word_4D49E
		sbb	dx, word_4D4A0
		js	short loc_37D0E
		jmp	loc_37DF8

loc_37D0E:
		push	bx
		mov	ax, word_4D482
		add	ax, word_4D476
		cmp	ax, word_4D480
		jle	short loc_37D1F
		mov	ax, word_4D480

loc_37D1F:
		cmp	ax, word_4D47C
		jge	short loc_37D27

loc_37D25:
		jmp	short loc_37D9F

loc_37D27:
		mov	word_4D488, ax
		mov	ax, word_4D482
		sub	ax, word_4D476
		cmp	ax, word_4D47C
		jge	short loc_37D3A
		mov	ax, word_4D47C

loc_37D3A:
		cmp	ax, word_4D480
		jg	short loc_37D25
		mov	word_4D486, ax
		mov	si, word_4D484
		add	si, word_4D478
		cmp	si, word_4D47A
		jl	short loc_37D25
		cmp	si, word_4D47E
		jg	short loc_37D71
		mov	di, word_4D486
		mov	cx, word_4D488
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_4D474
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_37D71:
		mov	si, word_4D484
		sub	si, word_4D478
		cmp	si, word_4D47E
		jg	short loc_37D9F
		cmp	si, word_4D47A
		jl	short loc_37D9F
		mov	di, word_4D486
		mov	cx, word_4D488
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_4D474
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_37D9F:
		pop	bx
		cmp	word_4D4A4, 0
		js	short loc_37DCB
		sub	word_4D478, 2
		dec	bx
		mov	ax, word_4D49E
		mov	dx, word_4D4A0
		sub	ax, word_4D48E
		sbb	dx, word_4D490
		mov	word_4D49E, ax
		mov	word_4D4A0, dx
		sub	word_4D4A2, ax
		sbb	word_4D4A4, dx

loc_37DCB:
		inc	word_4D476
		mov	ax, word_4D49A
		mov	dx, word_4D49C
		add	ax, word_4D496
		adc	dx, word_4D498
		mov	word_4D49A, ax
		mov	word_4D49C, dx
		add	ax, word_4D492
		adc	dx, word_4D494
		add	word_4D4A2, ax
		adc	word_4D4A4, dx
		jmp	loc_37CFA

loc_37DF8:
		push	bx
		mov	ax, word_4D48A
		mov	dx, word_4D48C
		sub	ax, word_4D492
		sbb	dx, word_4D494
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_4D49A
		sbb	dx, word_4D49C
		sub	ax, word_4D49E
		sbb	dx, word_4D4A0
		sar	dx, 1
		rcr	ax, 1
		add	word_4D4A2, ax
		adc	word_4D4A4, dx
		pop	bx

loc_37E31:
		push	bx
		mov	ax, word_4D482
		add	ax, word_4D476
		cmp	ax, word_4D480
		jle	short loc_37E42
		mov	ax, word_4D480

loc_37E42:
		cmp	ax, word_4D47C
		jge	short loc_37E4A

loc_37E48:
		jmp	short loc_37EC2

loc_37E4A:
		mov	word_4D488, ax
		mov	ax, word_4D482
		sub	ax, word_4D476
		cmp	ax, word_4D47C
		jge	short loc_37E5D
		mov	ax, word_4D47C

loc_37E5D:
		cmp	ax, word_4D480
		jg	short loc_37E48
		mov	word_4D486, ax
		mov	si, word_4D484
		add	si, word_4D478
		cmp	si, word_4D47A
		jl	short loc_37E48
		cmp	si, word_4D47E
		jg	short loc_37E94
		mov	di, word_4D486
		mov	cx, word_4D488
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_4D474
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_37E94:
		mov	si, word_4D484
		sub	si, word_4D478
		cmp	si, word_4D47E
		jg	short loc_37EC2
		cmp	si, word_4D47A
		jl	short loc_37EC2
		mov	di, word_4D486
		mov	cx, word_4D488
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_4D474
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_37EC2:
		pop	bx
		cmp	word_4D4A4, 0
		jns	short loc_37EEC
		inc	word_4D476
		mov	ax, word_4D49A
		mov	dx, word_4D49C
		add	ax, word_4D496
		adc	dx, word_4D498
		mov	word_4D49A, ax
		mov	word_4D49C, dx
		add	word_4D4A2, ax
		adc	word_4D4A4, dx

loc_37EEC:
		sub	word_4D478, 2
		mov	ax, word_4D49E
		mov	dx, word_4D4A0
		sub	ax, word_4D48E
		sbb	dx, word_4D490
		mov	word_4D49E, ax
		mov	word_4D4A0, dx
		sub	ax, word_4D48A
		sbb	dx, word_4D48C
		sub	word_4D4A2, ax
		sbb	word_4D4A4, dx
		dec	bx
		js	short loc_37F1D
		jmp	loc_37E31

loc_37F1D:
		pop	di
		pop	si
		pop	bp
sub_37BE0		endp
seg132		ends
