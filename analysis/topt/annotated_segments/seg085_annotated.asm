seg085		segment	para public 'CODE' use16
		assume cs:seg085
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 7, 0, 74h, 7, 56h, 9Ah, 2Ah, 0, 3Ah, 2Fh, 59h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F40E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_0]
		cmp	word_4CE00, 0
		jnz	short loc_2F423
		jmp	loc_2F4FF

loc_2F423:
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_4F55E, ax
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_4F560, ax
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_4F562, ax
		cmp	word_4F55E, 0
		jz	short loc_2F456
		cmp	word_4F560, 0
		jz	short loc_2F456
		cmp	word_4F562, 0
		jnz	short loc_2F48E

loc_2F456:
		cmp	word_4F55E, 0
		jz	short loc_2F467
		push	word_4F55E
		call	sub_39C
		pop	cx

loc_2F467:
		cmp	word_4F560, 0
		jz	short loc_2F478
		push	word_4F560
		call	sub_39C
		pop	cx

loc_2F478:
		cmp	word_4F562, 0
		jz	short loc_2F489
		push	word_4F562
		call	sub_39C
		pop	cx

loc_2F489:
		xor	ax, ax
		jmp	loc_2F577

loc_2F48E:
		mov	word_4F564, 0
		xor	cx, cx
		jmp	short loc_2F4D8

loc_2F498:
		mov	bx, cx
		mov	al, [bx+di]
		mov	ah, 0
		mov	bx, [bp+arg_2]
		add	bx, cx
		mov	dl, [bx]
		mov	dh, 0
		sub	ax, dx
		mov	dx, ax
		or	dx, dx
		jge	short loc_2F4BC
		neg	dx
		mov	bx, word_4F562
		add	bx, cx
		mov	byte ptr [bx], 1
		jmp	short loc_2F4C5

loc_2F4BC:
		mov	bx, word_4F562
		add	bx, cx
		mov	byte ptr [bx], 0FFh

loc_2F4C5:
		mov	bx, word_4F560
		add	bx, cx
		mov	[bx], dl
		cmp	dx, word_4F564
		jbe	short loc_2F4D7
		mov	word_4F564, dx

loc_2F4D7:
		inc	cx

loc_2F4D8:
		cmp	cx, si
		jb	short loc_2F498
		mov	dx, word_4F564
		shr	dx, 1
		xor	cx, cx
		jmp	short loc_2F4EF

loc_2F4E6:
		mov	bx, word_4F55E
		add	bx, cx
		mov	[bx], dl
		inc	cx

loc_2F4EF:
		cmp	cx, si
		jb	short loc_2F4E6
		mov	ax, word_4F564
		mov	word_4F566, ax
		mov	word_4CE00, 0

loc_2F4FF:
		mov	ax, word_4F566
		dec	word_4F566
		or	ax, ax
		jnz	short loc_2F531
		push	word_4F55E
		call	sub_39C
		pop	cx
		push	word_4F560
		call	sub_39C
		pop	cx
		push	word_4F562
		call	sub_39C
		pop	cx
		mov	word_4CE00, 1
		jmp	loc_2F489

loc_2F531:
		xor	cx, cx
		jmp	short loc_2F570
sub_2F40E		endp

; START OF FUNCTION CHUNK FOR sub_2F40E
		mov	bx, word_4F560
		add	bx, cx
		mov	al, [bx]
		mov	bx, word_4F55E
		add	bx, cx
		add	[bx], al
		mov	al, [bx]
		mov	ah, 0
		cmp	ax, word_4F564
		jbe	short loc_2F56F
		mov	bx, word_4F55E
		add	bx, cx
		mov	al, [bx]
		sub	al, byte ptr word_4F564
		mov	bx, word_4F55E
		add	bx, cx
		mov	[bx], al
		mov	bx, word_4F562
		add	bx, cx
		mov	al, [bx]
		mov	bx, cx
		add	[bx+di], al

loc_2F56F:
		inc	cx
; END OF FUNCTION CHUNK FOR sub_2F40E
seg085		ends
