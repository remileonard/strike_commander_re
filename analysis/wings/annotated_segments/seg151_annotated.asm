seg151		segment	para public 'CODE' use16
		assume cs:seg151
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 0FEh, 0C9h, 75h, 0A3h

loc_51215:
		db 1Fh, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

sub_5121A		proc far
		call	sub_50729
		jb	short loc_51242
		mov	ax, ss:4704h
		mov	ss:4710h, ax
		mov	ax, ss:4706h
		mov	ss:4712h, ax
		call	sub_4FC44
		jnb	short loc_51247
		mov	word ptr ss:488Ah, 606h
		jmp	loc_512DB

loc_51242:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_51247:
		mov	word ptr ss:488Ah, 3ADh
		jmp	short loc_5127B
sub_5121A		endp

; ----------------------------------------------------------------------

sub_51250		proc far
		call	sub_5071C
		jb	short loc_5126F
		mov	ax, ss:4704h
		mov	ss:4710h, ax
		call	sub_4FC44
		jnb	short loc_51274
		mov	word ptr ss:488Ah, 465h
		jmp	short loc_512DB

loc_5126F:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_51274:
		mov	word ptr ss:488Ah, 2F7h

loc_5127B:
		inc	word ptr ss:4710h

loc_51280:
		xor	ax, ax
		add	ss:462Eh, bl
		adc	al, bh
		mov	ss:472Bh, al
		sub	ss:4710h, ax

loc_51292:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_512D6
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_512C3
		jg	short loc_512CA
		add	si, 6
		shr	ax, 1
		jb	short loc_512AF
		add	si, ax
		jmp	short loc_512C1

loc_512AF:
		push	di
		mov	di, ax

loc_512B2:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_512BC
		add	si, ax
		dec	si

loc_512BC:
		sub	di, ax
		jnz	short loc_512B2
		pop	di

loc_512C1:
		jmp	short loc_51292

loc_512C3:
		call	word ptr ss:488Ah
		jmp	short loc_51292

loc_512CA:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jnz	short loc_51280

loc_512D6:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_512DB:
		mov	ax, ss:4710h
		inc	ax
		mov	ss:4710h, ax
		cmp	ax, ss:4743h
		jle	short loc_5131D
		mov	dx, ss:4743h

loc_512F0:
		xor	cx, cx
		add	ss:462Eh, bl
		adc	cl, bh
		sub	ax, cx
		cmp	ax, dx
		jle	short loc_5130E
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jnz	short loc_512F0
		jmp	loc_51399

loc_5130E:
		mov	ss:4710h, ax
		sub	ax, dx
		or	ax, ax
		jns	short loc_5131A
		neg	ax

loc_5131A:
		inc	ax
		jmp	short loc_51346

loc_5131D:
		xor	ax, ax
		add	ss:462Eh, bl
		adc	al, bh
		adc	ah, 0
		sub	ss:4710h, ax
		mov	cx, ss:473Fh
		sub	cx, ss:4710h
		jle	short loc_51346
		sub	ax, cx
		mov	cx, ss:473Fh
		mov	ss:4710h, cx

loc_51346:
		mov	ss:472Bh, al

loc_5134A:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_51399
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_5137B
		jg	short loc_51382
		add	si, 6
		shr	ax, 1
		jb	short loc_51367
		add	si, ax
		jmp	short loc_51379

loc_51367:
		push	di
		mov	di, ax

loc_5136A:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_51374
		add	si, ax
		dec	si

loc_51374:
		sub	di, ax
		jnz	short loc_5136A
		pop	di

loc_51379:
		jmp	short loc_5134A

loc_5137B:
		call	word ptr ss:488Ah
		jmp	short loc_5134A

loc_51382:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_51399
		mov	ax, ss:4710h
		cmp	ax, ss:473Fh
		jg	short loc_5131D

loc_51399:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_51250		endp

; ----------------------------------------------------------------------

sub_5139E		proc far
		call	sub_50736
		jb	short loc_513B6
		call	sub_4FC44
		jnb	short loc_513BB
		mov	word ptr ss:488Ah, 465h
		jmp	loc_51450

loc_513B6:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_513BB:
		mov	word ptr ss:488Ah, 2F7h
		jmp	short loc_513EF
sub_5139E		endp

; ----------------------------------------------------------------------

sub_513C4		proc far
		call	sub_50743
		jb	short loc_513E3
		mov	ax, ss:4706h
		mov	ss:4712h, ax
		call	sub_4FC44
		jnb	short loc_513E8
		mov	word ptr ss:488Ah, 606h
		jmp	short loc_51450

loc_513E3:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_513E8:
		mov	word ptr ss:488Ah, 3ADh

loc_513EF:
		xor	ax, ax
		add	ss:462Eh, bl
		adc	al, bh
		mov	ss:472Bh, al

loc_513FC:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_5144B
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_5142D
		jg	short loc_51434
		add	si, 6
		shr	ax, 1
		jb	short loc_51419
		add	si, ax
		jmp	short loc_5142B

loc_51419:
		push	di
		mov	di, ax

loc_5141C:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_51426
		add	si, ax
		dec	si

loc_51426:
		sub	di, ax
		jnz	short loc_5141C
		pop	di

loc_5142B:
		jmp	short loc_513FC

loc_5142D:
		call	word ptr ss:488Ah
		jmp	short loc_513FC

loc_51434:
		xor	ax, ax
		mov	al, ss:472Bh
		add	ss:4710h, ax
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jnz	short loc_513EF

loc_5144B:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_51450:
		mov	ax, ss:4710h
		cmp	ax, ss:473Fh
		jge	short loc_51487
		mov	dx, ss:473Fh

loc_51460:
		xor	cx, cx
		add	ss:462Eh, bl
		adc	cl, bh
		add	ax, cx
		cmp	ax, dx
		jg	short loc_5147E
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jnz	short loc_51460
		jmp	loc_51502

loc_5147E:
		sub	ax, dx
		mov	ss:4710h, dx
		jmp	short loc_514A4

loc_51487:
		xor	ax, ax
		add	ss:462Eh, bl
		adc	al, bh
		adc	ah, 0
		mov	cx, ss:4743h
		inc	cx
		sub	cx, ax
		sub	cx, ss:4710h
		jge	short loc_514A4
		add	ax, cx

loc_514A4:
		mov	ss:472Bh, al

loc_514A8:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_51502
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_514D9
		jg	short loc_514E0
		add	si, 6
		shr	ax, 1
		jb	short loc_514C5
		add	si, ax
		jmp	short loc_514D7

loc_514C5:
		push	di
		mov	di, ax

loc_514C8:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_514D2
		add	si, ax
		dec	si

loc_514D2:
		sub	di, ax
		jnz	short loc_514C8
		pop	di

loc_514D7:
		jmp	short loc_514A8

loc_514D9:
		call	word ptr ss:488Ah
		jmp	short loc_514A8

loc_514E0:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_51502
		xor	ax, ax
		mov	al, ss:472Bh
		add	ss:4710h, ax
		mov	ax, ss:4710h
		cmp	ax, ss:4743h
		jle	short loc_51487

loc_51502:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_513C4		endp

; START OF FUNCTION CHUNK FOR sub_513C4
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_51556
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_51520:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_51536
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_51520
		jz	short loc_51547

loc_51536:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_51520

loc_51547:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_5E448
		mov	si, 474Ah
		jmp	short loc_51562

loc_51556:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_51562:
		add	ax, ss:470Ah
		mul	bx
		add	al, ss:462Fh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_513C4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5156F		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		add	ax, ss:4712h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4710h
		mov	ah, ss:4731h
		xor	cx, cx
		mov	cl, ss:472Bh
		mov	bp, cx
		xor	dh, dh

loc_515A2:
		add	dl, bl
		adc	dh, bh
		lodsb

loc_515A7:
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:4747h
		dec	dh
		jnz	short loc_515A7
		dec	ah
		jnz	short loc_515A2
		pop	ds
		pop	si
		ret
sub_5156F		endp

; START OF FUNCTION CHUNK FOR sub_5156F
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_5160C
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_515D6:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_515EC
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_515D6
		jz	short loc_515FD

loc_515EC:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_515D6

loc_515FD:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_5E448
		mov	si, 474Ah
		jmp	short loc_51618

loc_5160C:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_51618:
		add	ax, ss:470Ah
		mul	bx
		add	al, ss:462Fh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_5156F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51625		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		neg	ax
		add	ax, ss:4712h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4710h
		mov	ah, ss:4731h
		xor	cx, cx
		mov	cl, ss:472Bh
		mov	bp, cx
		xor	dh, dh

loc_5165A:
		add	dl, bl
		adc	dh, bh
		lodsb

loc_5165F:
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:4747h
		dec	dh
		jnz	short loc_5165F
		dec	ah
		jnz	short loc_5165A
		pop	ds
		pop	si
		ret
sub_51625		endp

; START OF FUNCTION CHUNK FOR sub_51625
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_516C4
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_5168E:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_516A4
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_5168E
		jz	short loc_516B5

loc_516A4:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_5168E

loc_516B5:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_5E448
		mov	si, 474Ah
		jmp	short loc_516D0

loc_516C4:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_516D0:
		add	ax, ss:470Ah
		mul	bx
		add	al, ss:462Fh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_51625

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_516DD		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4712h
		mov	di, ax
		mov	byte ptr ss:472Ch, 0
		cmp	ax, ss:4745h
		jle	short loc_516FF

loc_516FC:
		jmp	loc_51813

loc_516FF:
		mov	ax, ss:4731h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4741h
		jl	short loc_516FC
		cmp	ax, ss:4745h
		jle	short loc_5175C
		mov	ax, ss:4745h
		inc	ax
		sub	ax, di
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_51744
		or	byte ptr ss:472Ch, 8

loc_51744:
		mov	ss:4731h, ax
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	ss:4718h, ax

loc_5175C:
		mov	ax, di
		sub	ax, ss:4741h
		jge	short loc_517A9
		or	ax, ax
		jns	short loc_5176B
		neg	ax

loc_5176B:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:4731h, ax
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	di, ss:4741h
		sub	ax, di
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	dh, al
		jmp	short loc_517B1

loc_517A9:
		mov	dx, cx
		xor	dh, dh
		add	dl, bl
		adc	dh, bh

loc_517B1:
		shl	di, 1
		add	di, ss:473Dh
		mov	di, ss:[di]
		add	di, ss:4710h
		xor	cx, cx
		mov	cl, ss:472Bh
		mov	bp, cx
		lodsb
		mov	ah, ss:4731h
		or	ah, ah
		jle	short loc_517EF
		or	dh, dh
		jz	short loc_517E6

loc_517D7:
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:4747h
		dec	dh
		jg	short loc_517D7

loc_517E6:
		lodsb
		add	dl, bl
		adc	dh, bh
		dec	ah
		jnz	short loc_517D7

loc_517EF:
		test	byte ptr ss:472Ch, 8
		jz	short loc_51813
		mov	dx, ss:4745h
		inc	dx
		sub	dx, ss:4718h
		mov	dh, dl

loc_51804:
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:4747h
		dec	dh
		jnz	short loc_51804

loc_51813:
		pop	ds
		pop	si
		ret
sub_516DD		endp

; START OF FUNCTION CHUNK FOR sub_516DD
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_51865
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_5182F:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_51845
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_5182F
		jz	short loc_51856

loc_51845:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_5182F

loc_51856:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_5E448
		mov	si, 474Ah
		jmp	short loc_51871

loc_51865:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_51871:
		add	ax, ss:470Ah
		mul	bx
		add	al, ss:462Fh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_516DD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5187E		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4712h
		mov	di, ax
		mov	byte ptr ss:472Ch, 0
		cmp	ax, ss:4741h
		jge	short loc_518A2

loc_5189F:
		jmp	loc_519B9

loc_518A2:
		mov	ax, ss:4731h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:4745h
		jg	short loc_5189F
		cmp	ax, ss:4741h
		jge	short loc_51904
		mov	ax, di
		inc	ax
		sub	ax, ss:4741h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_518EA
		or	byte ptr ss:472Ch, 2

loc_518EA:
		mov	ss:4731h, ax
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		mov	ss:4718h, ax

loc_51904:
		mov	ax, di
		sub	ax, ss:4745h
		jle	short loc_5194F
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:4731h, ax
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		mov	di, ss:4745h
		sub	ax, di
		neg	ax
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	dh, al
		jmp	short loc_51957

loc_5194F:
		mov	dx, cx
		xor	dh, dh
		add	dl, bl
		adc	dh, bh

loc_51957:
		shl	di, 1
		add	di, ss:473Dh
		mov	di, ss:[di]
		add	di, ss:4710h
		xor	cx, cx
		mov	cl, ss:472Bh
		mov	bp, cx
		lodsb
		mov	ah, ss:4731h
		or	ah, ah
		jle	short loc_51995
		or	dh, dh
		jz	short loc_5198C

loc_5197D:
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:4747h
		dec	dh
		jg	short loc_5197D

loc_5198C:
		lodsb
		add	dl, bl
		adc	dh, bh
		dec	ah
		jnz	short loc_5197D

loc_51995:
		test	byte ptr ss:472Ch, 2
		jz	short loc_519B9
		mov	dx, ss:4718h
		inc	dx
		sub	dx, ss:4741h
		mov	dh, dl
		rep stosb
		mov	cx, bp
		sub	di, cx
sub_5187E		endp
seg151		ends
