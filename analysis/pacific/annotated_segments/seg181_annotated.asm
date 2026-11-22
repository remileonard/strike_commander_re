seg181		segment	para public 'CODE' use16
		assume cs:seg181
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69892		proc far

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
		jz	short loc_698A3
		cmp	[bp+arg_8], 0
		jnz	short loc_698D0

loc_698A3:
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
		call	sub_69F22
		add	sp, 0Ch
		jmp	loc_69BCF

loc_698D0:
		mov	si, [bp+arg_0]
		mov	es, [si]
		mov	ax, [si+8]
		mov	word_7B06E, ax
		mov	ax, [si+4]
		mov	word_7B06A, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_7B068, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_7B06C, ax
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_7B062, ax
		mov	ax, [bp+arg_2]
		mov	word_7B070, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_7B072, ax
		mov	word_7B064, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_7B066, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_7B078, ax
		mov	word_7B07A, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_7B07C, ax
		mov	word_7B07E, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_7B080, ax
		mov	word_7B082, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_7B084, ax
		mov	word_7B086, dx
		mov	word_7B088, 0
		mov	word_7B08A, 0
		mov	ax, word_7B07C
		mov	dx, word_7B07E
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_7B08C, ax
		mov	word_7B08E, dx
		mov	ax, word_7B078
		mov	dx, word_7B07A
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_7B080
		add	dx, word_7B082
		mov	word_7B090, ax
		mov	word_7B092, dx
		mov	ax, word_7B078
		mov	dx, word_7B07A
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_7B090, ax
		sbb	word_7B092, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_699AC:
		mov	ax, word_7B088
		mov	dx, word_7B08A
		sub	ax, word_7B08C
		sbb	dx, word_7B08E
		js	short loc_699C0
		jmp	loc_69AAA

loc_699C0:
		push	bx
		mov	ax, word_7B070
		add	ax, word_7B064
		cmp	ax, word_7B06E
		jle	short loc_699D1
		mov	ax, word_7B06E

loc_699D1:
		cmp	ax, word_7B06A
		jge	short loc_699D9

loc_699D7:
		jmp	short loc_69A51

loc_699D9:
		mov	word_7B076, ax
		mov	ax, word_7B070
		sub	ax, word_7B064
		cmp	ax, word_7B06A
		jge	short loc_699EC
		mov	ax, word_7B06A

loc_699EC:
		cmp	ax, word_7B06E
		jg	short loc_699D7
		mov	word_7B074, ax
		mov	si, word_7B072
		add	si, word_7B066
		cmp	si, word_7B068
		jl	short loc_699D7
		cmp	si, word_7B06C
		jg	short loc_69A23
		mov	di, word_7B074
		mov	cx, word_7B076
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_7B062
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_69A23:
		mov	si, word_7B072
		sub	si, word_7B066
		cmp	si, word_7B06C
		jg	short loc_69A51
		cmp	si, word_7B068
		jl	short loc_69A51
		mov	di, word_7B074
		mov	cx, word_7B076
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_7B062
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_69A51:
		pop	bx
		cmp	word_7B092, 0
		js	short loc_69A7D
		sub	word_7B066, 2
		dec	bx
		mov	ax, word_7B08C
		mov	dx, word_7B08E
		sub	ax, word_7B07C
		sbb	dx, word_7B07E
		mov	word_7B08C, ax
		mov	word_7B08E, dx
		sub	word_7B090, ax
		sbb	word_7B092, dx

loc_69A7D:
		inc	word_7B064
		mov	ax, word_7B088
		mov	dx, word_7B08A
		add	ax, word_7B084
		adc	dx, word_7B086
		mov	word_7B088, ax
		mov	word_7B08A, dx
		add	ax, word_7B080
		adc	dx, word_7B082
		add	word_7B090, ax
		adc	word_7B092, dx
		jmp	loc_699AC

loc_69AAA:
		push	bx
		mov	ax, word_7B078
		mov	dx, word_7B07A
		sub	ax, word_7B080
		sbb	dx, word_7B082
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_7B088
		sbb	dx, word_7B08A
		sub	ax, word_7B08C
		sbb	dx, word_7B08E
		sar	dx, 1
		rcr	ax, 1
		add	word_7B090, ax
		adc	word_7B092, dx
		pop	bx

loc_69AE3:
		push	bx
		mov	ax, word_7B070
		add	ax, word_7B064
		cmp	ax, word_7B06E
		jle	short loc_69AF4
		mov	ax, word_7B06E

loc_69AF4:
		cmp	ax, word_7B06A
		jge	short loc_69AFC

loc_69AFA:
		jmp	short loc_69B74

loc_69AFC:
		mov	word_7B076, ax
		mov	ax, word_7B070
		sub	ax, word_7B064
		cmp	ax, word_7B06A
		jge	short loc_69B0F
		mov	ax, word_7B06A

loc_69B0F:
		cmp	ax, word_7B06E
		jg	short loc_69AFA
		mov	word_7B074, ax
		mov	si, word_7B072
		add	si, word_7B066
		cmp	si, word_7B068
		jl	short loc_69AFA
		cmp	si, word_7B06C
		jg	short loc_69B46
		mov	di, word_7B074
		mov	cx, word_7B076
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_7B062
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_69B46:
		mov	si, word_7B072
		sub	si, word_7B066
		cmp	si, word_7B06C
		jg	short loc_69B74
		cmp	si, word_7B068
		jl	short loc_69B74
		mov	di, word_7B074
		mov	cx, word_7B076
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_7B062
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_69B74:
		pop	bx
		cmp	word_7B092, 0
		jns	short loc_69B9E
		inc	word_7B064
		mov	ax, word_7B088
		mov	dx, word_7B08A
		add	ax, word_7B084
		adc	dx, word_7B086
		mov	word_7B088, ax
		mov	word_7B08A, dx
		add	word_7B090, ax
		adc	word_7B092, dx

loc_69B9E:
		sub	word_7B066, 2
		mov	ax, word_7B08C
		mov	dx, word_7B08E
		sub	ax, word_7B07C
		sbb	dx, word_7B07E
		mov	word_7B08C, ax
		mov	word_7B08E, dx
		sub	ax, word_7B078
		sbb	dx, word_7B07A
		sub	word_7B090, ax
		sbb	word_7B092, dx
		dec	bx
		js	short loc_69BCF
		jmp	loc_69AE3

loc_69BCF:
		pop	di
sub_69892		endp
seg181		ends
