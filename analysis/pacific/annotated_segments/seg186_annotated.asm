seg186		segment	para public 'CODE' use16
		assume cs:seg186
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6A294		proc far

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
		jb	short loc_6A2D4
		jnz	short loc_6A2D7

loc_6A2D4:
		jmp	loc_6A38F

loc_6A2D7:
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
		jg	short loc_6A31F
		mov	ax, [bp+var_154]
		sub	ax, [si+2]
		cmp	ax, [bp+var_C]
		jl	short loc_6A311
		mov	ax, [bp+var_156]
		sub	ax, [si+4]
		cmp	ax, [bp+var_A]

loc_6A311:
		jge	short loc_6A315
		jmp	short loc_6A394

loc_6A315:
		mov	ax, [si+6]
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_6]

loc_6A31F:
		jg	short loc_6A394
		mov	dx, ds
		add	si, 8

loc_6A326:
		lodsw
		or	ax, ax
		jz	short loc_6A39A
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
		jb	short loc_6A359
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_6A326

loc_6A359:
		mov	bx, cx

loc_6A35B:
		lodsb
		shr	al, 1
		cbw
		push	ax
		mov	cx, ax
		jb	short loc_6A379
		mov	ax, [bp+var_158]
		add	si, cx
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_6A35B
		jmp	short loc_6A326

loc_6A379:
		pop	ax
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_6A35B
		jmp	short loc_6A326

loc_6A38F:
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_6A394:
		add	si, 8

loc_6A397:
		lodsw
		shr	ax, 1

loc_6A39A:
		jz	short loc_6A38F
		mov	cx, ax
		jnb	short loc_6A3A2
		jmp	short loc_6A416

loc_6A3A2:
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_6A412
		cmp	ax, [bp+var_6]
		jg	short loc_6A412
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_6A412
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_6A412
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		mov	ax, [bp+var_C]
		mov	bx, [bp+var_8]
		sub	ax, dx
		jle	short loc_6A3E5
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_6A3E5:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_6A400
		add	si, cx
		sub	cx, dx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_6A397

loc_6A400:
		add	si, cx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_6A397

loc_6A412:
		add	si, cx
		jmp	short loc_6A397

loc_6A416:
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_6A488
		cmp	ax, [bp+var_6]
		jg	short loc_6A488
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_6A488
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_6A488
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		sub	ax, [bp+var_8]
		jg	short loc_6A49B
		sub	dx, [bp+var_C]
		jl	short loc_6A49B
		mov	bx, cx

loc_6A453:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6A472
		push	ax
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_6A453
		jmp	loc_6A397

loc_6A472:
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_6A453
		jmp	loc_6A397

loc_6A488:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_6A494
		add	si, ax
		dec	si

loc_6A494:
		sub	cx, ax
		jnz	short loc_6A488
		jmp	loc_6A397

loc_6A49B:
		mov	[bp+var_152], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_150]

loc_6A4AA:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6A4C8
		add	si, cx
		sub	bx, ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_6A4AA
		jmp	short loc_6A4DB

loc_6A4C8:
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_6A4AA

loc_6A4DB:
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
		jge	short loc_6A4F4
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_6A4F4:
		cmp	[bp+var_152], 0
		jle	short loc_6A503
		sub	cx, [bp+var_152]
		mov	ax, [bp+var_152]

loc_6A503:
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		pop	si
sub_6A294		endp
seg186		ends
