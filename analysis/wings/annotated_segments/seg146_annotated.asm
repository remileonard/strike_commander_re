seg146		segment	para public 'CODE' use16
		assume cs:seg146
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Fh, 5Fh, 5Eh, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

sub_4C2D6		proc far
		call	sub_50543
		jb	short loc_4C2FB
		call	sub_4FC44
		jnb	short loc_4C300
		mov	word ptr ss:488Ah, 0DD7h
		mov	ax, 0EC2h
		cmp	bl, bh
		jb	short loc_4C2F5
		mov	ax, 1200h

loc_4C2F5:
		mov	ss:488Ch, ax
		jmp	short loc_4C356

loc_4C2FB:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C300:
		mov	word ptr ss:488Ah, 464h
		mov	ax, 4BBh
		cmp	bl, bh
		jb	short loc_4C311
		mov	ax, 556h

loc_4C311:
		mov	ss:488Ch, ax
		jmp	short loc_4C356
sub_4C2D6		endp

; ----------------------------------------------------------------------

sub_4C317		proc far
		call	sub_504A6
		jb	short loc_4C33C
		call	sub_4FC44
		jnb	short loc_4C341
		mov	word ptr ss:488Ah, 5F0h
		mov	ax, 6DFh
		cmp	bl, bh
		jb	short loc_4C336
		mov	ax, 0A41h

loc_4C336:
		mov	ss:488Ch, ax
		jmp	short loc_4C356

loc_4C33C:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C341:
		mov	word ptr ss:488Ah, 2EBh
		mov	ax, 33Eh
		cmp	bl, bh
		jb	short loc_4C352
		mov	ax, 3CAh

loc_4C352:
		mov	ss:488Ch, ax

loc_4C356:
		mov	word ptr ss:462Ch, 0

loc_4C35D:
		mov	dx, ss:471Ch
		mov	cx, ss:471Ah
		add	ss:462Ch, dl
		adc	dh, 0
		add	ss:462Dh, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:4722h, cx
		or	cx, cx
		jnz	short loc_4C385
		jmp	loc_4C432

loc_4C385:
		xor	ax, ax
		mov	al, cl
		sub	ss:4710h, ax
		mov	al, ch
		add	ss:4712h, ax

loc_4C395:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4C39E
		jmp	loc_4C441

loc_4C39E:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4C3CC
		jl	short loc_4C3AD
		jmp	loc_4C432

loc_4C3AD:
		add	si, 6
		shr	ax, 1
		jb	short loc_4C3B8
		add	si, ax
		jmp	short loc_4C3CA

loc_4C3B8:
		push	di
		mov	di, ax

loc_4C3BB:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4C3C5
		add	si, ax
		dec	si

loc_4C3C5:
		sub	di, ax
		jnz	short loc_4C3BB
		pop	di

loc_4C3CA:
		jmp	short loc_4C395

loc_4C3CC:
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4C41C
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4C3E5:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4C3FB
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4C3E5
		jz	short loc_4C40C

loc_4C3FB:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4C3E5

loc_4C40C:
		pop	es
		pop	ax
		mov	bx, ss:471Eh
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4C428

loc_4C41C:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4C428:
		call	word ptr ss:488Ah
		pop	ds
		pop	si
		jmp	loc_4C395

loc_4C432:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4C441
		jmp	loc_4C35D

loc_4C441:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4C317		endp

; ----------------------------------------------------------------------

sub_4C446		proc far
		call	sub_505E2
		jb	short loc_4C46B
		call	sub_4FC44
		jnb	short loc_4C470
		mov	word ptr ss:488Ah, 5F0h
		mov	ax, 6DFh
		cmp	bl, bh
		jb	short loc_4C465
		mov	ax, 0A41h

loc_4C465:
		mov	ss:488Ch, ax
		jmp	short loc_4C4C6

loc_4C46B:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C470:
		mov	word ptr ss:488Ah, 2EBh
		mov	ax, 33Eh
		cmp	bl, bh
		jb	short loc_4C481
		mov	ax, 3CAh

loc_4C481:
		mov	ss:488Ch, ax
		jmp	short loc_4C4C6
sub_4C446		endp

; ----------------------------------------------------------------------

sub_4C487		proc far
		call	sub_5067F
		jb	short loc_4C4AC
		call	sub_4FC44
		jnb	short loc_4C4B1
		mov	word ptr ss:488Ah, 0DD7h
		mov	ax, 0EC2h
		cmp	bl, bh
		jb	short loc_4C4A6
		mov	ax, 1200h

loc_4C4A6:
		mov	ss:488Ch, ax
		jmp	short loc_4C4C6

loc_4C4AC:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C4B1:
		mov	word ptr ss:488Ah, 464h
		mov	ax, 4BBh
		cmp	bl, bh
		jb	short loc_4C4C2
		mov	ax, 556h

loc_4C4C2:
		mov	ss:488Ch, ax

loc_4C4C6:
		xor	dx, dx
		mov	ss:462Ch, dx

loc_4C4CD:
		mov	dx, ss:471Ch
		mov	cx, ss:471Ah
		add	ss:462Ch, dl
		adc	dh, 0
		add	ss:462Dh, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:4722h, cx
		or	cx, cx
		jnz	short loc_4C4F5
		jmp	loc_4C592

loc_4C4F5:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4C4FE
		jmp	loc_4C5B6

loc_4C4FE:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4C52C
		jl	short loc_4C50D
		jmp	loc_4C592

loc_4C50D:
		add	si, 6
		shr	ax, 1
		jb	short loc_4C518
		add	si, ax
		jmp	short loc_4C52A

loc_4C518:
		push	di
		mov	di, ax

loc_4C51B:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4C525
		add	si, ax
		dec	si

loc_4C525:
		sub	di, ax
		jnz	short loc_4C51B
		pop	di

loc_4C52A:
		jmp	short loc_4C4F5

loc_4C52C:
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4C57C
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4C545:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4C55B
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4C545
		jz	short loc_4C56C

loc_4C55B:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4C545

loc_4C56C:
		pop	es
		pop	ax
		mov	bx, ss:471Eh
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4C588

loc_4C57C:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4C588:
		call	word ptr ss:488Ah
		pop	ds
		pop	si
		jmp	loc_4C4F5

loc_4C592:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4C5B6
		mov	cx, ss:4722h
		xor	ax, ax
		mov	al, cl
		add	ss:4710h, ax
		mov	al, ch
		sub	ss:4712h, ax
		jmp	loc_4C4CD

loc_4C5B6:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
		add	ax, ss:470Ah
		mul	word ptr ss:4728h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:462Fh, al
		mov	ss:4727h, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4712h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:462Eh, al
		mov	ss:4726h, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4710h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:488Ch
		mov	cx, ss:471Ch
		mov	al, ss:462Fh
		add	ss:4727h, cl
		adc	ch, 0
		mov	ss:4721h, ch
		mov	cx, ss:4722h
		mov	dh, dl
		or	ch, ch
		jz	short loc_4C63B

loc_4C62F:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	ch, 0
		jnz	short loc_4C62F

loc_4C63B:
		mov	ch, al

loc_4C63D:
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4C675

loc_4C645:
		mov	al, [si]

loc_4C647:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:4747h
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_4C65A:
		add	dl, bl
		jnb	short loc_4C661
		dec	cl
		inc	di

loc_4C661:
		add	ch, bh
		jnb	short loc_4C65A

loc_4C665:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_4C665
		dec	byte ptr ss:4721h
		jnz	short loc_4C647

loc_4C675:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4C67C:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4C699
		or	ch, ch
		jz	short loc_4C67C
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4C645

loc_4C699:
		ret
		mov	cx, ss:471Ah
		add	ss:4726h, cl
		adc	ch, 0
		mov	ss:4720h, ch
		mov	cx, ss:4722h
		mov	ah, ss:462Fh
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_4C6CA

loc_4C6BE:
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	ch, 0
		jnz	short loc_4C6BE

loc_4C6CA:
		mov	ch, ss:462Fh

loc_4C6CF:
		mov	bp, ss:4747h
		mov	al, [si]
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4C70A

loc_4C6DE:
		mov	al, [si]

loc_4C6E0:
		push	cx
		push	di

loc_4C6E2:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_4C6E2
		pop	di
		pop	cx
		inc	di

loc_4C6EE:
		add	ch, bh
		jnb	short loc_4C6F6
		inc	cl
		add	di, bp

loc_4C6F6:
		add	dl, bl
		jnb	short loc_4C6EE

loc_4C6FA:
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_4C6FA
		dec	byte ptr ss:4720h
		jnz	short loc_4C6E0

loc_4C70A:
		mov	bp, cx
		mov	cx, ss:471Ah

loc_4C711:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4C733
		or	ch, ch
		jle	short loc_4C711
		mov	ss:4720h, ch
		mov	cx, bp
		mov	bp, ss:4747h
		jmp	short loc_4C6DE

loc_4C733:
		ret
		add	ax, ss:470Ah
		mul	word ptr ss:4728h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:462Fh, al
		mov	ss:4727h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4712h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:462Eh, al
		mov	ss:4726h, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4710h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:488Ch
		mov	cx, ss:471Ch
		mov	al, ss:462Fh
		add	ss:4727h, cl
		adc	ch, 0
		mov	ss:4721h, ch
		mov	ah, ss:462Fh
		mov	ch, ah
		mov	dl, ss:462Eh
		mov	dh, dl
		mov	cl, ss:4722h
		mov	al, ss:4723h
		or	al, al
		jz	short loc_4C7C7

loc_4C7BC:
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_4C7BC

loc_4C7C7:
		mov	ch, al

loc_4C7C9:
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4C801

loc_4C7D1:
		mov	al, [si]

loc_4C7D3:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:4747h
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_4C7E6:
		add	dl, bl
		jnb	short loc_4C7ED
		inc	cl
		dec	di

loc_4C7ED:
		add	ch, bh
		jnb	short loc_4C7E6

loc_4C7F1:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_4C7F1
		dec	byte ptr ss:4721h
		jnz	short loc_4C7D3

loc_4C801:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4C808:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4C825
		or	ch, ch
		jz	short loc_4C808
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4C7D1

loc_4C825:
		ret
sub_4C487		endp

; START OF FUNCTION CHUNK FOR sub_4C487
		mov	cx, ss:471Ah
		add	ss:4726h, cl
		adc	ch, 0
		mov	ss:4720h, ch
		mov	cx, ss:4722h
		mov	ah, ss:462Fh
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_4C856

loc_4C84A:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	ch, 0
		jg	short loc_4C84A

loc_4C856:
		mov	ch, ss:462Fh

loc_4C85B:
		mov	bp, ss:4747h
		mov	al, [si]
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4C896

loc_4C86A:
		mov	al, [si]

loc_4C86C:
		push	cx
		push	di

loc_4C86E:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_4C86E
		pop	di
		pop	cx
		dec	di

loc_4C87A:
		add	ch, bh
		jnb	short loc_4C882
		dec	cl
		sub	di, bp

loc_4C882:
		add	dl, bl
		jnb	short loc_4C87A

loc_4C886:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_4C886
		dec	byte ptr ss:4720h
		jnz	short loc_4C86C

loc_4C896:
		mov	bp, cx
		mov	cx, ss:471Ah

loc_4C89D:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4C8BF
		or	ch, ch
		jle	short loc_4C89D
		mov	ss:4720h, ch
		mov	cx, bp
		mov	bp, ss:4747h
		jmp	short loc_4C86A

loc_4C8BF:
		ret
		add	ax, ss:470Ah
		mul	word ptr ss:4728h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:462Fh, al
		mov	cx, ss:471Ch
		add	al, cl
		adc	ch, 0
		mov	ss:4721h, ch
		mov	ss:4727h, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4712h
		mov	ss:4718h, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:462Eh, al
		mov	ss:4726h, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4710h
		mov	ss:4716h, ax
		mov	bp, ax
		mov	word ptr ss:472Dh, 0
		mov	word ptr ss:472Fh, 0
		mov	byte ptr ss:472Ch, 0
		cmp	ax, ss:4743h
		jle	short loc_4C938
		jmp	short loc_4C9AE

loc_4C938:
		mov	ax, ss:4718h
		sub	ax, ss:4741h
		jge	short loc_4C9A9
		or	ax, ax
		jns	short loc_4C949
		neg	ax

loc_4C949:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Fh
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_4C967
		inc	ax

loc_4C967:
		push	ax
		mul	cx
		add	ss:462Fh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:472Fh, ax
		add	ss:4718h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:462Eh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4716h, ax
		add	ss:472Dh, ax
		or	byte ptr ss:472Ch, 2

loc_4C9A9:
		jmp	word ptr ss:488Ch

loc_4C9AE:
		ret
		xor	ax, ax
		mov	al, ss:4722h
		mov	ch, ss:4723h
		xor	dx, dx
		or	ch, ch
		jz	short loc_4C9CC

loc_4C9C0:
		add	dl, bl
		adc	ax, 0
		add	dh, bh
		sbb	ch, 0
		jg	short loc_4C9C0

loc_4C9CC:
		inc	ax
		mov	ss:4724h, ax
		mov	dx, ax
		mov	ax, ss:4716h
		add	ax, dx
		sub	ax, ss:473Fh
		jl	short loc_4C9E2
		jmp	short loc_4CA41

loc_4C9E2:
		or	ax, ax
		jns	short loc_4C9E8
		neg	ax

loc_4C9E8:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Eh
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_4CA06
		inc	ax

loc_4CA06:
		push	ax
		mul	cx
		add	ss:462Eh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4716h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:462Fh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4718h, ax
		add	ss:472Fh, ax
		or	byte ptr ss:472Ch, 1

loc_4CA41:
		mov	ax, ss:4743h
		inc	ax
		sub	ax, ss:4716h
		jg	short loc_4CA4E

loc_4CA4D:
		ret

loc_4CA4E:
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	word ptr ss:471Ah
		add	al, ss:4726h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		add	ax, ss:4724h
		cmp	ax, ss:473Fh
		jl	short loc_4CA4D
		cmp	ax, ss:4743h
		jle	short loc_4CA85
		or	byte ptr ss:472Ch, 4

loc_4CA85:
		mov	ax, ss:4745h
		inc	ax
		sub	ax, ss:4718h
		mov	ss:4739h, ax
		jle	short loc_4CAFA
		mov	ax, ss:4731h
		mul	word ptr ss:471Ch
		add	al, ss:4727h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4741h
		jl	short loc_4CAFA
		cmp	ax, ss:4745h
		jle	short loc_4CAC3
		or	byte ptr ss:472Ch, 8

loc_4CAC3:
		test	byte ptr ss:472Ch, 3
		jz	short loc_4CB24
		mov	ax, ss:472Fh
		or	ax, ax
		jz	short loc_4CB24
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:462Fh
		sub	al, ss:4727h
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:471Ch
		div	cx
		add	si, ax
		sub	ss:4731h, ax
		jg	short loc_4CAFB

loc_4CAFA:
		ret

loc_4CAFB:
		mul	cx
		add	ss:4727h, al
		adc	ah, 0
		adc	dx, 0
		add	ss:4727h, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:472Fh
		mov	ss:4721h, al
		jmp	short loc_4CB36

loc_4CB24:
		mov	cx, ss:471Ch
		add	ss:4727h, cl
		adc	ch, 0
		mov	ss:4721h, ch

loc_4CB36:
		mov	ax, ss:4718h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4716h
		mov	ah, ss:462Fh
		mov	ch, ah
		mov	dl, ss:462Eh
		mov	dh, dl
		mov	cl, ss:4722h
		mov	al, ss:4723h
		or	al, al
		jz	short loc_4CB71

loc_4CB66:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	al, 0
		jg	short loc_4CB66

loc_4CB71:
		push	cx
		xor	ch, ch
		sub	ss:4737h, cx
		pop	cx
		jg	short loc_4CB7F
		jmp	loc_4CC91

loc_4CB7F:
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4CBDF

loc_4CB87:
		mov	al, [si]

loc_4CB89:
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:473Fh
		sub	dx, ss:4716h
		jle	short loc_4CC07
		sub	cx, dx
		jle	short loc_4CBA2
		add	di, dx
		rep stosb

loc_4CBA2:
		pop	cx
		pop	dx
		pop	di
		add	di, ss:4747h

loc_4CBAA:
		add	dl, bl
		jnb	short loc_4CBB6
		dec	cl
		inc	di
		inc	word ptr ss:4716h

loc_4CBB6:
		add	ch, bh
		jnb	short loc_4CBAA

loc_4CBBA:
		add	dh, bl
		jnb	short loc_4CBC5
		dec	word ptr ss:4737h
		inc	cl

loc_4CBC5:
		add	ah, bh
		jnb	short loc_4CBBA
		dec	word ptr ss:4739h
		jle	short loc_4CC03
		cmp	word ptr ss:4737h, 0
		jle	short loc_4CC04
		dec	byte ptr ss:4721h
		jg	short loc_4CB89

loc_4CBDF:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4CBE6:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4CC03
		or	ch, ch
		jz	short loc_4CBE6
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4CB87

loc_4CC03:
		ret

loc_4CC04:
		jmp	loc_4CC8C

loc_4CC07:
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:472Ch, 0Ch
		jnz	short loc_4CC15
		jmp	loc_4C63D

loc_4CC15:
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4CBDF

loc_4CC1D:
		mov	al, [si]

loc_4CC1F:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:4747h
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_4CC32:
		add	dl, bl
		jnb	short loc_4CC3E
		dec	cl
		inc	di
		inc	word ptr ss:4716h

loc_4CC3E:
		add	ch, bh
		jnb	short loc_4CC32

loc_4CC42:
		add	dh, bl
		jnb	short loc_4CC4D
		dec	word ptr ss:4737h
		inc	cl

loc_4CC4D:
		add	ah, bh
		jnb	short loc_4CC42
		dec	word ptr ss:4739h
		jle	short loc_4CC8B
		cmp	word ptr ss:4737h, 0
		jle	short loc_4CC04
		dec	byte ptr ss:4721h
		jg	short loc_4CC1F
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4CC6E:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4CC8B
		or	ch, ch
		jz	short loc_4CC6E
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4CC1D

loc_4CC8B:
		ret

loc_4CC8C:
		dec	byte ptr ss:4721h

loc_4CC91:
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4CCEC

loc_4CC99:
		mov	al, [si]

loc_4CC9B:
		push	di
		push	cx
		xor	ch, ch
		mov	bp, ss:4716h
		add	bp, cx
		stc
		sbb	bp, ss:4743h
		jle	short loc_4CCB0
		sub	cx, bp

loc_4CCB0:
		rep stosb
		pop	cx
		pop	di
		add	di, ss:4747h

loc_4CCB9:
		add	dl, bl
		jnb	short loc_4CCD1
		dec	cl
		inc	di
		inc	word ptr ss:4716h
		mov	bp, ss:4716h
		cmp	bp, ss:4743h
		jg	short loc_4CD10

loc_4CCD1:
		add	ch, bh
		jnb	short loc_4CCB9

loc_4CCD5:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_4CCD5
		dec	word ptr ss:4739h
		jle	short loc_4CD10
		dec	byte ptr ss:4721h
		jg	short loc_4CC9B

loc_4CCEC:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4CCF3:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4CD10
		or	ch, ch
		jz	short loc_4CCF3
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4CC99

loc_4CD10:
		ret
		xor	ax, ax
		mov	al, ss:4723h
		mov	ch, ss:4722h
		xor	dx, dx
		or	ch, ch
		jz	short loc_4CD2E

loc_4CD22:
		sub	dh, bh
		adc	ax, 0
		sub	dl, bl
		sbb	ch, 0
		jg	short loc_4CD22

loc_4CD2E:
		inc	ax
		mov	ss:4724h, ax
		mov	ax, ss:4716h
		sub	ax, ss:473Fh
		jl	short loc_4CD40
		jmp	short loc_4CD9F

loc_4CD40:
		or	ax, ax
		jns	short loc_4CD46
		neg	ax

loc_4CD46:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Eh
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_4CD64
		inc	ax

loc_4CD64:
		push	ax
		mul	cx
		add	ss:462Eh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4716h, ax
		add	ss:472Dh, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:462Fh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4718h, ax
		or	byte ptr ss:472Ch, 1

loc_4CD9F:
		mov	ax, ss:4743h
		inc	ax
		sub	ax, ss:4716h
		jg	short loc_4CDAC

loc_4CDAB:
		ret

loc_4CDAC:
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	word ptr ss:471Ah
		add	al, ss:4726h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		cmp	ax, ss:473Fh
		jl	short loc_4CDAB
		cmp	ax, ss:4743h
		jle	short loc_4CDDE
		or	byte ptr ss:472Ch, 4

loc_4CDDE:
		mov	ax, ss:4745h
		inc	ax
		sub	ax, ss:4718h
		mov	ss:4739h, ax
		jg	short loc_4CDF7
		add	ax, ss:4724h
		jle	short loc_4CE58
		jg	short loc_4CE1F

loc_4CDF7:
		mov	ax, ss:4731h
		mul	word ptr ss:471Ch
		add	al, ss:4727h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4741h
		jl	short loc_4CE58
		cmp	ax, ss:4745h
		jl	short loc_4CE25

loc_4CE1F:
		or	byte ptr ss:472Ch, 8

loc_4CE25:
		test	byte ptr ss:472Ch, 3
		jz	short loc_4CE82
		mov	ax, ss:472Dh
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:462Eh
		sub	al, ss:4726h
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:471Ah
		div	cx
		add	si, ax
		sub	ss:4731h, ax
		jg	short loc_4CE59

loc_4CE58:
		ret

loc_4CE59:
		mul	cx
		add	ss:4726h, al
		adc	ah, 0
		adc	dx, 0
		add	ss:4726h, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:472Dh
		mov	ss:4720h, al
		jmp	short loc_4CE94

loc_4CE82:
		mov	cx, ss:471Ah
		add	ss:4726h, cl
		adc	ch, 0
		mov	ss:4720h, ch

loc_4CE94:
		mov	ax, ss:4718h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4716h
		mov	ah, ss:462Fh
		mov	ch, ah
		mov	dl, ss:462Eh
		mov	dh, dl
		mov	cl, ss:4723h
		mov	al, ss:4722h
		or	al, al
		jz	short loc_4CECF

loc_4CEC4:
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	al, 0
		jg	short loc_4CEC4

loc_4CECF:
		mov	bp, ss:4718h
		cmp	bp, ss:4745h
		jl	short loc_4CF06
		jz	short loc_4CF03
		sub	bp, ss:4745h
		mov	al, ch
		xor	ch, ch
		sub	cx, bp
		mov	ch, al
		jg	short loc_4CEED
		ret

loc_4CEED:
		mov	bp, ss:4745h
		shl	bp, 1
		add	bp, ss:473Dh
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:4716h

loc_4CF03:
		jmp	loc_4D042

loc_4CF06:
		push	cx
		xor	ch, ch
		dec	cx
		sub	bp, cx
		pop	cx
		cmp	bp, ss:4741h
		jl	short loc_4CF17

loc_4CF14:
		jmp	loc_4CFAC

loc_4CF17:
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4CF85

loc_4CF1F:
		mov	al, [si]

loc_4CF21:
		cmp	bp, ss:4741h
		jge	short loc_4CF14
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:4741h
		xor	ch, ch
		add	cx, dx
		pop	dx

loc_4CF37:
		mov	es:[di], al
		sub	di, ss:4747h
		dec	cl
		jg	short loc_4CF37
		pop	di
		pop	cx
		inc	di
		inc	word ptr ss:4716h

loc_4CF4B:
		add	ch, bh
		jnb	short loc_4CF5B
		inc	cl
		add	di, ss:4747h
		dec	word ptr ss:4739h

loc_4CF5B:
		add	dl, bl
		jnb	short loc_4CF4B

loc_4CF5F:
		add	ah, bh
		jnb	short loc_4CF66
		inc	bp
		dec	cl

loc_4CF66:
		add	dh, bl
		jnb	short loc_4CF5F
		dec	word ptr ss:4737h
		jz	short loc_4CFA9
		push	ax
		mov	ax, ss:4716h
		cmp	ax, ss:4743h
		pop	ax
		jg	short loc_4CFA9
		dec	byte ptr ss:4720h
		jnz	short loc_4CF21

loc_4CF85:
		push	cx
		mov	cx, ss:471Ah

loc_4CF8B:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4CFA8
		or	ch, ch
		jle	short loc_4CF8B
		mov	ss:4720h, ch
		pop	cx
		jmp	loc_4CF1F

loc_4CFA8:
		pop	cx

loc_4CFA9:
		jmp	loc_4D0A6

loc_4CFAC:
		test	byte ptr ss:472Ch, 0Ch
		jnz	short loc_4CFB7
		jmp	loc_4C6CF

loc_4CFB7:
		mov	bp, ss:4747h
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4D00B

loc_4CFC4:
		mov	al, [si]

loc_4CFC6:
		push	cx
		push	di

loc_4CFC8:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_4CFC8
		pop	di
		pop	cx
		inc	di

loc_4CFD4:
		add	ch, bh
		jnb	short loc_4CFE3
		dec	word ptr ss:4739h
		jle	short loc_4CFE3
		inc	cl
		add	di, bp

loc_4CFE3:
		add	dl, bl
		jnb	short loc_4CFD4

loc_4CFE7:
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_4CFE7
		inc	word ptr ss:4716h
		dec	word ptr ss:4737h
		jz	short loc_4D035
		cmp	word ptr ss:4739h, 0
		jle	short loc_4D035
		dec	byte ptr ss:4720h
		jnz	short loc_4CFC6

loc_4D00B:
		mov	bp, cx
		mov	cx, ss:471Ah

loc_4D012:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D034
		or	ch, ch
		jle	short loc_4D012
		mov	ss:4720h, ch
		mov	cx, bp
		mov	bp, ss:4747h
		jmp	short loc_4CFC4

loc_4D034:
		ret

loc_4D035:
		test	byte ptr ss:472Ch, 8
		jz	short loc_4D0A6
		dec	byte ptr ss:4720h

loc_4D042:
		mov	bp, ss:4716h
		cmp	bp, ss:4743h
		jg	short loc_4D0A6
		cmp	byte ptr ss:4720h, 0
		jle	short loc_4D083

loc_4D056:
		mov	al, [si]

loc_4D058:
		push	cx
		push	di

loc_4D05A:
		mov	es:[di], al
		sub	di, ss:4747h
		dec	cl
		jg	short loc_4D05A
		pop	di
		pop	cx
		inc	di
		inc	bp
		cmp	bp, ss:4743h
		jg	short loc_4D0A6

loc_4D071:
		add	ah, bh
		sbb	cl, 0
		jle	short loc_4D0A6
		add	dh, bl
		jnb	short loc_4D071
		dec	byte ptr ss:4720h
		jnz	short loc_4D058

loc_4D083:
		push	cx
		mov	cx, ss:471Ah

loc_4D089:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D0A5
		or	ch, ch
		jle	short loc_4D089
		mov	ss:4720h, ch
		pop	cx
		jmp	short loc_4D056

loc_4D0A5:
		pop	cx

loc_4D0A6:
		ret
		add	ax, ss:470Ah
		mul	word ptr ss:4728h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:462Fh, al
		mov	cx, ss:471Ch
		add	al, cl
		adc	ch, 0
		mov	ss:4721h, ch
		mov	ss:4727h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4712h
		mov	ss:4718h, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:462Eh, al
		mov	ss:4726h, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4710h
		mov	ss:4716h, ax
		mov	bp, ax
		mov	word ptr ss:472Dh, 0
		mov	word ptr ss:472Fh, 0
		mov	byte ptr ss:472Ch, 0
		cmp	ax, ss:473Fh
		jge	short loc_4D123
		jmp	short loc_4D191

loc_4D123:
		mov	ax, ss:4716h
		sub	ax, ss:4743h
		jle	short loc_4D18C
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Eh
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_4D14C
		inc	ax

loc_4D14C:
		push	ax
		mul	cx
		add	ss:462Eh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4716h, ax
		add	ss:472Dh, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:462Fh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4718h, ax
		add	ss:472Fh, ax
		or	byte ptr ss:472Ch, 4

loc_4D18C:
		call	word ptr ss:488Ch

loc_4D191:
		ret
		xor	ax, ax
		mov	al, ss:4722h
		mov	ch, ss:4723h
		xor	dx, dx
		or	ch, ch
		jz	short loc_4D1AF

loc_4D1A3:
		sub	dl, bl
		adc	ax, 0
		sub	dh, bh
		sbb	ch, 0
		jg	short loc_4D1A3

loc_4D1AF:
		inc	ax
		mov	ss:4724h, ax
		mov	ax, ss:4718h
		sub	ax, ss:4745h
		jle	short loc_4D21A
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Fh
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_4D1DD
		inc	ax

loc_4D1DD:
		push	ax
		mul	cx
		add	ss:462Fh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:472Fh, ax
		sub	ss:4718h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:462Eh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4716h, ax
		or	byte ptr ss:472Ch, 8

loc_4D21A:
		mov	ax, ss:4716h
		inc	ax
		sub	ax, ss:473Fh
		jg	short loc_4D22E
		add	ax, ss:4724h
		jg	short loc_4D25D
		ret

loc_4D22E:
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	word ptr ss:471Ah
		add	al, ss:4726h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, bp
		sub	dx, ax
		cmp	dx, ss:4743h
		jle	short loc_4D256
		ret

loc_4D256:
		cmp	dx, ss:473Fh
		jge	short loc_4D263

loc_4D25D:
		or	byte ptr ss:472Ch, 1

loc_4D263:
		mov	ax, ss:4718h
		inc	ax
		sub	ax, ss:4741h
		jle	short loc_4D2DA
		mov	ss:4739h, ax
		mov	ax, ss:4731h
		mul	word ptr ss:471Ch
		add	al, ss:4727h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:4745h
		jg	short loc_4D2DA
		cmp	ax, ss:4741h
		jge	short loc_4D2A3
		or	byte ptr ss:472Ch, 2

loc_4D2A3:
		test	byte ptr ss:472Ch, 0Ch
		jz	short loc_4D304
		mov	ax, ss:472Fh
		or	ax, ax
		jz	short loc_4D304
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:462Fh
		sub	al, ss:4727h
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:471Ch
		div	cx
		add	si, ax
		sub	ss:4731h, ax
		jg	short loc_4D2DB

loc_4D2DA:
		ret

loc_4D2DB:
		mul	cx
		add	ss:4727h, al
		adc	ah, 0
		adc	dx, 0
		add	ss:4727h, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
; END OF FUNCTION CHUNK FOR sub_4C487

; ----------------------------------------------------------------------

sub_4D2F9		proc near
		sub	ax, ss:472Fh
		mov	ss:4721h, al
		jmp	short loc_4D316

loc_4D304:
		mov	cx, ss:471Ch
		add	ss:4727h, cl
		adc	ch, 0
		mov	ss:4721h, ch

loc_4D316:
		mov	ax, ss:4718h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4716h
		mov	ah, ss:462Fh
		mov	ch, ah
		mov	dl, ss:462Eh
		mov	dh, dl
		mov	cl, ss:4722h
		mov	al, ss:4723h
		or	al, al
		jz	short loc_4D351

loc_4D346:
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_4D346

loc_4D351:
		test	byte ptr ss:472Ch, 1
		jz	short loc_4D36E
		mov	bp, ss:4716h
		sub	bp, ss:473Fh
		jg	short loc_4D36E
		neg	bp
		add	di, bp
		sub	cx, bp
		jmp	loc_4D47E

loc_4D36E:
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4D3CC

loc_4D376:
		mov	al, [si]

loc_4D378:
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:4743h
		inc	dx
		sub	dx, ss:4716h
		cmp	cx, dx
		jle	short loc_4D3F4
		mov	cx, dx
		rep stosb
		pop	cx
		pop	dx
		pop	di
		sub	di, ss:4747h

loc_4D398:
		add	dl, bl
		jnb	short loc_4D3A9
		inc	cl
		dec	word ptr ss:4716h
		dec	di
		dec	word ptr ss:4737h

loc_4D3A9:
		add	ch, bh
		jnb	short loc_4D398

loc_4D3AD:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_4D3AD
		dec	word ptr ss:4739h
		jle	short loc_4D3F0
		cmp	word ptr ss:4737h, 0
		jle	short loc_4D3F1
		dec	byte ptr ss:4721h
		jg	short loc_4D378

loc_4D3CC:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4D3D3:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D3F0
		or	ch, ch
		jz	short loc_4D3D3
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4D376

loc_4D3F0:
		ret

loc_4D3F1:
		jmp	loc_4D477

loc_4D3F4:
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:472Ch, 3
		jnz	short loc_4D402
		jmp	loc_4C7C9

loc_4D402:
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4D3CC

loc_4D40A:
		mov	al, [si]

loc_4D40C:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:4747h
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_4D41F:
		add	dl, bl
		jnb	short loc_4D42D
		dec	word ptr ss:4737h
		jle	short loc_4D42D
		inc	cl
		dec	di

loc_4D42D:
		add	ch, bh
		jnb	short loc_4D41F

loc_4D431:
		add	dh, bl
		sbb	cl, 0
		jle	short loc_4D476
		add	ah, bh
		jnb	short loc_4D431
		dec	word ptr ss:4739h
		jle	short loc_4D476
		cmp	word ptr ss:4737h, 0
		jle	short loc_4D477
		dec	byte ptr ss:4721h
		jg	short loc_4D40C
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4D459:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D476
		or	ch, ch
		jz	short loc_4D459
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4D40A

loc_4D476:
		ret

loc_4D477:
		dec	byte ptr ss:4721h
		jle	short loc_4D4AB

loc_4D47E:
		cmp	cl, 0
		jle	short loc_4D476
		mov	al, [si]

loc_4D485:
		push	di
		push	cx
		xor	ch, ch
		rep stosb
		pop	cx
		pop	di
		sub	di, ss:4747h

loc_4D492:
		add	dh, bl
		sbb	cl, 0
		jle	short loc_4D4CF
		add	ah, bh
		jnb	short loc_4D492
		dec	word ptr ss:4739h
		jle	short loc_4D4CF
		dec	byte ptr ss:4721h
		jg	short loc_4D485

loc_4D4AB:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4D4B2:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D4CF
		or	ch, ch
		jz	short loc_4D4B2
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4D47E

loc_4D4CF:
		ret
sub_4D2F9		endp

; START OF FUNCTION CHUNK FOR sub_4D2F9
		xor	ax, ax
		mov	al, ss:4723h
		mov	ch, ss:4722h
		xor	dx, dx
		or	ch, ch
		jz	short loc_4D4ED

loc_4D4E1:
		add	dh, bh
		adc	ax, 0
		add	dl, bl
		sbb	ch, 0
		jg	short loc_4D4E1

loc_4D4ED:
		inc	ax
		mov	ss:4724h, ax
		mov	dx, ax
		mov	ax, ss:4718h
		sub	ax, ss:4745h
		jle	short loc_4D55E
		sub	ax, dx
		jle	short loc_4D55E
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Fh
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_4D521
		inc	ax

loc_4D521:
		push	ax
		mul	cx
		add	ss:462Fh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4718h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:462Eh, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4716h, ax
		add	ss:472Dh, ax
		or	byte ptr ss:472Ch, 8

loc_4D55E:
		mov	ax, ss:4716h
		inc	ax
		sub	ax, ss:473Fh
		jg	short loc_4D56B

loc_4D56A:
		ret

loc_4D56B:
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	word ptr ss:471Ah
		add	al, ss:4726h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, bp
		cmp	ax, ss:4743h
		jg	short loc_4D56A
		cmp	ax, ss:473Fh
		jge	short loc_4D59F
		or	byte ptr ss:472Ch, 1

loc_4D59F:
		mov	ax, ss:4718h
		inc	ax
		sub	ax, ss:4741h
		jle	short loc_4D56A
		mov	ss:4739h, ax
		mov	ax, ss:4731h
		mul	word ptr ss:471Ch
		add	al, ss:4727h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4724h
		neg	ax
		add	ax, di
		cmp	ax, ss:4745h
		jg	short loc_4D617
		cmp	ax, ss:4741h
		jge	short loc_4D5E4
		or	byte ptr ss:472Ch, 2

loc_4D5E4:
		test	byte ptr ss:472Ch, 0Ch
		jz	short loc_4D641
		mov	ax, ss:472Dh
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:462Eh
		sub	al, ss:4726h
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:471Ah
		div	cx
		add	si, ax
		sub	ss:4731h, ax
		jg	short loc_4D618

loc_4D617:
		ret

loc_4D618:
		mul	cx
		add	ss:4726h, al
		adc	ah, 0
		adc	dx, 0
		add	ss:4726h, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:472Dh
		mov	ss:4720h, al
		jmp	short loc_4D653

loc_4D641:
		mov	cx, ss:471Ah
		add	ss:4726h, cl
		adc	ch, 0
		mov	ss:4720h, ch

loc_4D653:
		mov	ax, ss:4718h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4716h
		mov	cl, ss:4723h
		mov	al, ss:4722h
		mov	ah, ss:462Fh
		mov	ch, ah
		mov	dl, ss:462Eh
		mov	dh, dl
		or	al, al
		jz	short loc_4D68E

loc_4D683:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	al, 0
		jg	short loc_4D683

loc_4D68E:
		test	byte ptr ss:472Ch, 2
		jz	short loc_4D6A5
		push	cx
		xor	ch, ch
		inc	cx
		sub	ss:4739h, cx
		pop	cx
		jge	short loc_4D6A5
		jmp	loc_4D7F3

loc_4D6A5:
		mov	bp, ss:4718h
		cmp	bp, ss:4745h
		jg	short loc_4D6B4

loc_4D6B1:
		jmp	loc_4D759

loc_4D6B4:
		mov	bp, ss:4745h
		shl	bp, 1
		add	bp, ss:473Dh
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:4716h
		mov	bp, ss:4718h
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4D733

loc_4D6D7:
		mov	al, [si]

loc_4D6D9:
		cmp	bp, ss:4745h
		jle	short loc_4D6B1
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:4745h
		xor	ch, ch
		sub	cx, dx
		pop	dx
		jle	short loc_4D6FD

loc_4D6F1:
		mov	es:[di], al
		sub	di, ss:4747h
		dec	cl
		jg	short loc_4D6F1

loc_4D6FD:
		pop	di
		pop	cx
		dec	di

loc_4D700:
		add	ch, bh
		jnb	short loc_4D718
		dec	cl
		dec	word ptr ss:4739h
		dec	bp
		cmp	bp, ss:4745h
		jge	short loc_4D718
		sub	di, ss:4747h

loc_4D718:
		add	dl, bl
		jnb	short loc_4D700

loc_4D71C:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_4D71C
		dec	word ptr ss:4737h
		jz	short loc_4D756
		dec	byte ptr ss:4720h
		jnz	short loc_4D6D9

loc_4D733:
		push	cx
		mov	cx, ss:471Ah

loc_4D739:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D755
		or	ch, ch
		jle	short loc_4D739
		mov	ss:4720h, ch
		pop	cx
		jmp	short loc_4D6D7

loc_4D755:
		pop	cx

loc_4D756:
		jmp	loc_4D86E

loc_4D759:
		test	byte ptr ss:472Ch, 3
		jnz	short loc_4D764
		jmp	loc_4C85B

loc_4D764:
		mov	ss:4718h, bp
		mov	bp, ss:4747h
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4D7BB

loc_4D776:
		mov	al, [si]

loc_4D778:
		push	cx
		push	di

loc_4D77A:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_4D77A
		pop	di
		pop	cx
		dec	di

loc_4D786:
		add	ch, bh
		jnb	short loc_4D798
		dec	word ptr ss:4739h
		dec	cl
		sub	di, bp
		dec	word ptr ss:4718h

loc_4D798:
		add	dl, bl
		jnb	short loc_4D786

loc_4D79C:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_4D79C
		dec	word ptr ss:4737h
		jle	short loc_4D7E4
		cmp	word ptr ss:4739h, 0
		jle	short loc_4D7E5
		dec	byte ptr ss:4720h
		jnz	short loc_4D778

loc_4D7BB:
		mov	bp, cx
		mov	cx, ss:471Ah

loc_4D7C2:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D7E4
		or	ch, ch
		jle	short loc_4D7C2
		mov	ss:4720h, ch
		mov	cx, bp
		mov	bp, ss:4747h
		jmp	short loc_4D776

loc_4D7E4:
		ret

loc_4D7E5:
		test	byte ptr ss:472Ch, 2
		jnz	short loc_4D7EE
		ret

loc_4D7EE:
		dec	byte ptr ss:4720h

loc_4D7F3:
		mov	bp, ss:4718h
		cmp	byte ptr ss:4720h, 0
		jle	short loc_4D84B

loc_4D800:
		mov	al, [si]

loc_4D802:
		push	cx
		push	di
		push	bp

loc_4D805:
		cmp	bp, ss:4741h
		jl	short loc_4D819
		mov	es:[di], al
		sub	di, ss:4747h
		dec	bp
		dec	cl
		jg	short loc_4D805

loc_4D819:
		pop	bp
		pop	di
		pop	cx
		dec	di
		dec	word ptr ss:4737h
		jle	short loc_4D86E

loc_4D824:
		add	ch, bh
		jnb	short loc_4D837
		dec	cl
		sub	di, ss:4747h
		dec	bp
		cmp	bp, ss:4741h
		jl	short loc_4D86E

loc_4D837:
		add	dl, bl
		jnb	short loc_4D824

loc_4D83B:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_4D83B
		dec	byte ptr ss:4720h
		jnz	short loc_4D802

loc_4D84B:
		push	cx
		mov	cx, ss:471Ah

loc_4D851:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4D86D
		or	ch, ch
		jle	short loc_4D851
		mov	ss:4720h, ch
		pop	cx
		jmp	short loc_4D800

loc_4D86D:
		pop	cx

loc_4D86E:
		ret
; END OF FUNCTION CHUNK FOR sub_4D2F9

; ----------------------------------------------------------------------

sub_4D86F		proc far
		call	sub_507E1
		jb	short loc_4D895
		call	sub_4FC44
		jnb	short loc_4D89A
		mov	word ptr ss:488Ah, 1BCCh
		mov	ax, 1CBDh
		cmp	bl, bh
		jb	short loc_4D88E
		mov	ax, 1FAEh

loc_4D88E:
		mov	ss:488Ch, ax
		jmp	loc_4DC79

loc_4D895:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4D89A:
		mov	word ptr ss:488Ah, 16ABh
		mov	ax, 1700h
		cmp	bl, bh
		jb	short loc_4D8AB
		mov	ax, 178Eh

loc_4D8AB:
		mov	ss:488Ch, ax
		jmp	loc_4DC79
sub_4D86F		endp

; ----------------------------------------------------------------------

sub_4D8B2		proc far
		call	sub_50880
		jb	short loc_4D8D8
		call	sub_4FC44
		jnb	short loc_4D8DD
		mov	word ptr ss:488Ah, 2347h
		mov	ax, 23BDh
		cmp	bl, bh
		jb	short loc_4D8D1
		mov	ax, 2791h

loc_4D8D1:
		mov	ss:488Ch, ax
		jmp	loc_4DC79

loc_4D8D8:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4D8DD:
		mov	word ptr ss:488Ah, 182Ah
		mov	ax, 187Fh
		cmp	bl, bh
		jb	short loc_4D8EE
		mov	ax, 190Dh

loc_4D8EE:
		mov	ss:488Ch, ax
		jmp	loc_4DC79
sub_4D8B2		endp

; ----------------------------------------------------------------------

sub_4D8F5		proc far
		call	sub_5091D
		jb	short loc_4D91B
		call	sub_4FC44
		jnb	short loc_4D920
		mov	word ptr ss:488Ah, 1BCCh
		mov	ax, 1CBDh
		cmp	bl, bh
		jb	short loc_4D914
		mov	ax, 1FAEh

loc_4D914:
		mov	ss:488Ch, ax
		jmp	loc_4DD86

loc_4D91B:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4D920:
		mov	word ptr ss:488Ah, 16ABh
		mov	ax, 1700h
		cmp	bl, bh
		jb	short loc_4D931
		mov	ax, 178Eh

loc_4D931:
		mov	ss:488Ch, ax
		jmp	loc_4DD86
sub_4D8F5		endp

; ----------------------------------------------------------------------

sub_4D938		proc far
		call	sub_509B8
		jb	short loc_4D95E
		call	sub_4FC44
		jnb	short loc_4D963
		mov	word ptr ss:488Ah, 2347h
		mov	ax, 23BDh
		cmp	bl, bh
		jb	short loc_4D957
		mov	ax, 2791h

loc_4D957:
		mov	ss:488Ch, ax
		jmp	loc_4DD86

loc_4D95E:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4D963:
		mov	word ptr ss:488Ah, 182Ah
		mov	ax, 187Fh
		cmp	bl, bh
		jb	short loc_4D974
		mov	ax, 190Dh

loc_4D974:
		mov	ss:488Ch, ax
		jmp	loc_4DD86
		add	ax, ss:470Ah
		mul	word ptr ss:4728h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:462Fh, al
		mov	ss:4727h, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4712h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:462Eh, al
		mov	ss:4726h, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		mov	dx, ss:4710h
		sub	dx, ax
		add	di, dx
		mov	dl, cl
		jmp	word ptr ss:488Ch
		mov	cx, ss:471Ch
		add	ss:4727h, cl
		adc	ch, 0
		mov	ss:4721h, ch
		mov	cx, ss:4722h
		mov	al, ss:462Fh
		mov	ah, al
		mov	dh, dl
		or	ch, ch
		jz	short loc_4D9FF

loc_4D9F3:
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	ch, 0
		jg	short loc_4D9F3

loc_4D9FF:
		mov	ch, al
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4DA39

loc_4DA09:
		mov	al, [si]

loc_4DA0B:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		xor	ch, ch
		sub	di, cx
		mov	cx, bp
		add	di, ss:4747h

loc_4DA1E:
		add	dl, bl
		jnb	short loc_4DA25
		inc	cl
		dec	di

loc_4DA25:
		add	ch, bh
		jnb	short loc_4DA1E

loc_4DA29:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_4DA29
		dec	byte ptr ss:4721h
		jnz	short loc_4DA0B

loc_4DA39:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4DA40:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4DA5D
		or	ch, ch
		jz	short loc_4DA40
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4DA09

loc_4DA5D:
		ret
		mov	cx, ss:471Ah
		mov	ax, cx
		add	ss:4726h, cl
		adc	ch, 0
		mov	ss:4720h, ch
		mov	cx, ss:4722h
		mov	ah, ss:462Fh
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_4DA90

loc_4DA84:
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	ch, 0
		jnz	short loc_4DA84

loc_4DA90:
		mov	ch, ss:462Fh
		mov	bp, ss:4747h
		mov	al, [si]
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4DAD0

loc_4DAA4:
		mov	al, [si]

loc_4DAA6:
		push	cx
		push	di

loc_4DAA8:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_4DAA8
		pop	di
		pop	cx
		dec	di

loc_4DAB4:
		add	ch, bh
		jnb	short loc_4DABC
		inc	cl
		add	di, bp

loc_4DABC:
		add	dl, bl
		jnb	short loc_4DAB4

loc_4DAC0:
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_4DAC0
		dec	byte ptr ss:4720h
		jnz	short loc_4DAA6

loc_4DAD0:
		mov	bp, cx
		mov	cx, ss:471Ah

loc_4DAD7:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4DAF9
		or	ch, ch
		jle	short loc_4DAD7
		mov	ss:4720h, ch
		mov	cx, bp
		mov	bp, ss:4747h
		jmp	short loc_4DAA4

loc_4DAF9:
		ret
		add	ax, ss:470Ah
		mul	word ptr ss:4728h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:462Fh, al
		mov	ss:4727h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4712h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:462Eh, al
		mov	ss:4726h, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4710h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:488Ch
		mov	cx, ss:471Ch
		add	ss:4727h, cl
		adc	ch, 0
		mov	ss:4721h, ch
		mov	cx, ss:4722h
		mov	al, ss:462Fh
		mov	ah, al
		mov	dh, dl
		or	ch, ch
		jz	short loc_4DB7E

loc_4DB72:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	ch, 0
		jg	short loc_4DB72

loc_4DB7E:
		mov	ch, al
		cmp	byte ptr ss:4721h, 0
		jle	short loc_4DBB8

loc_4DB88:
		mov	al, [si]

loc_4DB8A:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		xor	ch, ch
		sub	di, cx
		mov	cx, bp
		sub	di, ss:4747h

loc_4DB9D:
		add	dl, bl
		jnb	short loc_4DBA4
		dec	cl
		inc	di

loc_4DBA4:
		add	ch, bh
		jnb	short loc_4DB9D

loc_4DBA8:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_4DBA8
		dec	byte ptr ss:4721h
		jnz	short loc_4DB8A

loc_4DBB8:
		mov	bp, cx
		mov	cx, ss:471Ch

loc_4DBBF:
		inc	si
		add	ss:4727h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4DBDC
		or	ch, ch
		jz	short loc_4DBBF
		mov	ss:4721h, ch
		mov	cx, bp
		jmp	short loc_4DB88

loc_4DBDC:
		ret
		mov	cx, ss:471Ah
		mov	ax, cx
		add	ss:4726h, cl
		adc	ch, 0
		mov	ss:4720h, ch
		mov	cx, ss:4722h
		mov	ah, ss:462Fh
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_4DC0F

loc_4DC03:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	ch, 0
		jnz	short loc_4DC03

loc_4DC0F:
		mov	ch, ss:462Fh
		mov	bp, ss:4747h
		mov	al, [si]
		cmp	byte ptr ss:4720h, 0
		jz	short loc_4DC4F

loc_4DC23:
		mov	al, [si]

loc_4DC25:
		push	cx
		push	di

loc_4DC27:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_4DC27
		pop	di
		pop	cx
		inc	di

loc_4DC33:
		add	ch, bh
		jnb	short loc_4DC3B
		dec	cl
		sub	di, bp

loc_4DC3B:
		add	dl, bl
		jnb	short loc_4DC33

loc_4DC3F:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_4DC3F
		dec	byte ptr ss:4720h
		jnz	short loc_4DC25

loc_4DC4F:
		mov	bp, cx
		mov	cx, ss:471Ah

loc_4DC56:
		inc	si
		add	ss:4726h, cl
		adc	ch, 0
		dec	word ptr ss:4731h
		jle	short loc_4DC78
		or	ch, ch
		jle	short loc_4DC56
		mov	ss:4720h, ch
		mov	cx, bp
		mov	bp, ss:4747h
		jmp	short loc_4DC23

loc_4DC78:
		ret

loc_4DC79:
		mov	word ptr ss:462Ch, 0

loc_4DC80:
		mov	dx, ss:471Ch
		add	ss:462Ch, dl
		adc	dh, 0
		mov	cx, ss:471Ah
		add	ss:462Dh, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:4722h, cx
		cmp	bl, bh
		jnb	short loc_4DCB5
		xor	ax, ax
		mov	al, cl
		sub	ss:4710h, ax
		mov	al, ch
		sub	ss:4712h, ax

loc_4DCB5:
		or	cx, cx
		jnz	short loc_4DCBC
		jmp	loc_4DD59

loc_4DCBC:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4DCC5
		jmp	loc_4DD81

loc_4DCC5:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4DCF3
		jl	short loc_4DCD4
		jmp	loc_4DD59

loc_4DCD4:
		add	si, 6
		shr	ax, 1
		jb	short loc_4DCDF
		add	si, ax
		jmp	short loc_4DCF1

loc_4DCDF:
		push	di
		mov	di, ax

loc_4DCE2:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4DCEC
		add	si, ax
		dec	si

loc_4DCEC:
		sub	di, ax
		jnz	short loc_4DCE2
		pop	di

loc_4DCF1:
		jmp	short loc_4DCBC

loc_4DCF3:
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4DD43
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4DD0C:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4DD22
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4DD0C
		jz	short loc_4DD33

loc_4DD22:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4DD0C

loc_4DD33:
		pop	es
		pop	ax
		mov	bx, ss:471Eh
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4DD4F

loc_4DD43:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4DD4F:
		call	word ptr ss:488Ah
		pop	ds
		pop	si
		jmp	loc_4DCBC

loc_4DD59:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4DD81
		mov	cx, ss:4722h
		cmp	bl, bh
		jb	short loc_4DD7E
		xor	ax, ax
		mov	al, cl
		sub	ss:4710h, ax
		mov	al, ch
		sub	ss:4712h, ax

loc_4DD7E:
		jmp	loc_4DC80

loc_4DD81:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4DD86:
		cmp	bl, bh
		jb	short loc_4DD8F
		dec	word ptr ss:4712h

loc_4DD8F:
		mov	word ptr ss:462Ch, 0

loc_4DD96:
		mov	dx, ss:471Ch
		add	ss:462Ch, dl
		adc	dh, 0
		mov	cx, ss:471Ah
		add	ss:462Dh, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:4722h, cx
		cmp	bl, bh
		jb	short loc_4DDCB
		xor	ax, ax
		mov	al, cl
		add	ss:4710h, ax
		mov	al, ch
		add	ss:4712h, ax

loc_4DDCB:
		or	cx, cx
		jnz	short loc_4DDD2
		jmp	loc_4DE6F

loc_4DDD2:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4DDDB
		jmp	loc_4DE97

loc_4DDDB:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4DE09
		jl	short loc_4DDEA
		jmp	loc_4DE6F

loc_4DDEA:
		add	si, 6
		shr	ax, 1
		jb	short loc_4DDF5
		add	si, ax
		jmp	short loc_4DE07

loc_4DDF5:
		push	di
		mov	di, ax

loc_4DDF8:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4DE02
		add	si, ax
		dec	si

loc_4DE02:
		sub	di, ax
		jnz	short loc_4DDF8
		pop	di

loc_4DE07:
		jmp	short loc_4DDD2

loc_4DE09:
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4DE59
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4DE22:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4DE38
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4DE22
		jz	short loc_4DE49

loc_4DE38:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4DE22

loc_4DE49:
		pop	es
		pop	ax
		mov	bx, ss:471Eh
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4DE65

loc_4DE59:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4DE65:
		call	word ptr ss:488Ah
		pop	ds
		pop	si
		jmp	loc_4DDD2

loc_4DE6F:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4DE97
		mov	cx, ss:4722h
		cmp	bl, bh
		jnb	short loc_4DE94
		xor	ax, ax
		mov	al, cl
		add	ss:4710h, ax
		mov	al, ch
		add	ss:4712h, ax

loc_4DE94:
		jmp	loc_4DD96

loc_4DE97:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4D938		endp

; START OF FUNCTION CHUNK FOR sub_4D938
		db 36h, 3, 6, 0Ah, 47h, 36h, 0F7h, 26h, 28h, 47h, 8Ah, 0C4h, 8Ah, 0E2h, 50h, 33h
		db 0C9h, 8Ah, 0CFh, 0F7h, 0E1h, 36h, 0A2h, 2Fh, 46h, 36h, 8Bh, 0Eh, 1Ch, 47h, 2, 0C1h
		db 80h, 0D5h, 0, 36h, 88h, 2Eh, 21h, 47h, 36h, 0A2h, 27h, 47h, 8Ah, 0C4h, 8Ah, 0E2h
		db 36h, 3, 6, 12h, 47h, 36h, 0A3h, 18h, 47h, 8Bh, 0F8h, 58h, 33h, 0C9h, 8Ah, 0CBh
		db 0F7h, 0E1h, 36h, 0A2h, 2Eh, 46h, 36h, 0A2h, 26h, 47h, 8Ah, 0C8h, 8Ah, 0C4h, 8Ah, 0E2h
		db 36h, 8Bh, 16h, 10h, 47h, 2Bh, 0D0h, 8Bh, 0C2h, 36h, 0A3h, 16h, 47h, 8Bh, 0E8h, 36h
		db 0C7h, 6, 2Dh, 47h, 0, 0, 36h, 0C7h, 6, 2Fh, 47h, 0, 0, 36h, 0C6h, 6
		db 2Ch, 47h, 0, 36h, 3Bh, 6, 3Fh, 47h, 7Dh, 1, 0C3h, 36h, 0A1h, 18h, 47h, 36h
		db 2Bh, 6, 41h, 47h, 7Dh, 66h, 0Bh, 0C0h, 79h, 2, 0F7h, 0D8h, 33h, 0D2h, 8Ah, 0D4h
		db 8Ah, 0E0h, 32h, 0C0h, 36h, 2Ah, 6, 2Fh, 46h, 80h, 0DCh, 0, 83h, 0DAh, 0, 33h
		db 0C9h, 8Ah, 0CFh, 0F7h, 0F1h, 0Bh, 0D2h, 74h, 1, 40h, 50h, 0F7h, 0E1h, 36h, 0, 6
		db 2Fh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 1, 6, 2Fh
		db 47h, 36h, 1, 6, 18h, 47h, 58h, 33h, 0C9h, 8Ah, 0CBh, 0F7h, 0E1h, 36h, 0, 6
		db 2Eh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 29h, 6, 16h
		db 47h, 36h, 1, 6, 2Dh, 47h, 36h, 80h, 0Eh, 2Ch, 47h, 2, 36h, 0FFh, 26h, 8Ch
		db 48h, 36h, 0A1h, 16h, 47h, 36h, 2Bh, 6, 43h, 47h, 7Eh, 59h, 33h, 0D2h, 8Ah, 0D4h
		db 8Ah, 0E0h, 32h, 0C0h, 36h, 2Ah, 6, 2Eh, 46h, 80h, 0DCh, 0, 83h, 0DAh, 0, 33h
		db 0C9h, 8Ah, 0CBh, 0F7h, 0F1h, 0Bh, 0D2h, 74h, 1, 40h, 50h, 0F7h, 0E1h, 36h, 0, 6
		db 2Eh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 29h, 6, 16h
		db 47h, 58h, 8Ah, 0CFh, 0F7h, 0E1h, 36h, 0, 6, 2Fh, 46h, 80h, 0D4h, 0, 83h, 0D2h
		db 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 1, 6, 18h, 47h, 36h, 1, 6, 2Fh, 47h, 36h
		db 80h, 0Eh, 2Ch, 47h, 4, 36h, 0A1h, 16h, 47h, 40h, 36h, 2Bh, 6, 3Fh, 47h, 7Fh
		db 1, 0C3h, 36h, 0A3h, 37h, 47h, 36h, 0A1h, 31h, 47h, 36h, 0F7h, 26h, 1Ah, 47h, 36h
		db 2, 6, 26h, 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 8Bh, 0D5h
		db 2Bh, 0D0h, 36h, 3Bh, 16h, 43h, 47h, 7Eh, 1, 0C3h, 36h, 3Bh, 16h, 3Fh, 47h, 7Dh
		db 6, 36h, 80h, 0Eh, 2Ch, 47h, 1, 36h, 0A1h, 45h, 47h, 40h, 36h, 2Bh, 6, 18h
		db 47h, 36h, 0A3h, 39h, 47h, 7Eh, 65h, 36h, 0A1h, 31h, 47h, 36h, 0F7h, 26h, 1Ch, 47h
		db 36h, 2, 6, 27h, 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 3
		db 0C7h, 36h, 3Bh, 6, 41h, 47h, 7Ch, 44h, 36h, 3Bh, 6, 45h, 47h, 7Eh, 6, 36h
		db 80h, 0Eh, 2Ch, 47h, 8, 36h, 0F6h, 6, 2Ch, 47h, 6, 74h, 59h, 36h, 0A1h, 2Fh
		db 47h, 0Bh, 0C0h, 74h, 27h, 33h, 0D2h, 8Ah, 0D4h, 8Ah, 0E0h, 32h, 0C0h, 36h, 0A0h, 2Fh
		db 46h, 36h, 2Ah, 6, 27h, 47h, 80h, 0DCh, 0, 83h, 0DAh, 0, 36h, 8Bh, 0Eh, 1Ch
		db 47h, 0F7h, 0F1h, 3, 0F0h, 36h, 29h, 6, 31h, 47h, 7Fh, 1, 0C3h, 0F7h, 0E1h, 36h
		db 0, 6, 27h, 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 36h, 0, 0Eh, 27h, 47h, 80h
		db 0D5h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 2, 0C5h, 80h, 0D4h, 0, 36h, 2Bh, 6, 2Fh, 47h
		db 36h, 0A2h, 21h, 47h, 0EBh, 12h, 36h, 8Bh, 0Eh, 1Ch, 47h, 36h, 0, 0Eh, 27h, 47h
		db 80h, 0D5h, 0, 36h, 88h, 2Eh, 21h, 47h, 36h, 0A1h, 18h, 47h, 0D1h, 0E0h, 36h, 3
		db 6, 3Dh, 47h, 8Bh, 0F8h, 36h, 8Bh, 3Dh, 36h, 3, 3Eh, 16h, 47h, 36h, 8Ah, 26h
		db 2Fh, 46h, 8Ah, 0ECh, 36h, 8Ah, 16h, 2Eh, 46h, 8Ah, 0F2h, 36h, 8Ah, 0Eh, 22h, 47h
		db 36h, 0A0h, 23h, 47h, 0Ah, 0C0h, 74h, 0Bh, 2Ah, 0F3h, 80h, 0D1h, 0, 2Ah, 0E7h, 1Ch
		db 0, 7Fh, 0F5h, 36h, 80h, 3Eh, 21h, 47h, 0, 7Eh, 56h, 8Ah, 4, 57h, 52h, 51h
		db 32h, 0EDh, 36h, 8Bh, 16h, 43h, 47h, 42h, 36h, 2Bh, 16h, 16h, 47h, 3Bh, 0CAh, 7Eh
		db 68h, 8Bh, 0CAh, 0F3h, 0AAh, 59h, 5Ah, 5Fh, 36h, 3, 3Eh, 47h, 47h, 2, 0D3h, 73h
		db 0Dh, 0FEh, 0C1h, 36h, 0FFh, 0Eh, 16h, 47h, 4Fh, 36h, 0FFh, 0Eh, 37h, 47h, 2, 0EFh
		db 73h, 0EBh, 2, 0F3h, 80h, 0D9h, 0, 2, 0E7h, 73h, 0F7h, 36h, 0FFh, 0Eh, 39h, 47h
		db 7Eh, 33h, 36h, 83h, 3Eh, 37h, 47h, 0, 7Eh, 2Ch, 36h, 0FEh, 0Eh, 21h, 47h, 7Fh
		db 0ACh, 8Bh, 0E9h, 36h, 8Bh, 0Eh, 1Ch, 47h, 46h, 36h, 0, 0Eh, 27h, 47h, 80h, 0D5h
		db 0, 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 0Dh, 0Ah, 0EDh, 74h, 0ECh, 36h, 88h, 2Eh, 21h
		db 47h, 8Bh, 0CDh, 0EBh, 86h, 0C3h, 0E9h, 81h, 0, 59h, 5Ah, 5Fh, 36h, 0F6h, 6, 2Ch
		db 47h, 9, 75h, 3, 0E9h, 4Eh, 0F8h, 36h, 80h, 3Eh, 21h, 47h, 0, 7Eh, 0C2h, 8Ah
		db 4, 8Bh, 0E9h, 32h, 0EDh, 0F3h, 0AAh, 8Bh, 0CDh, 36h, 3, 3Eh, 47h, 47h, 32h, 0EDh
		db 2Bh, 0F9h, 8Bh, 0CDh, 2, 0D3h, 73h, 0Ah, 36h, 0FFh, 0Eh, 37h, 47h, 7Eh, 3, 0FEh
		db 0C1h, 4Fh, 2, 0EFh, 73h, 0EEh, 2, 0F3h, 80h, 0D9h, 0, 2, 0E7h, 73h, 0F7h, 36h
		db 0FFh, 0Eh, 39h, 47h, 7Eh, 33h, 36h, 83h, 3Eh, 37h, 47h, 0, 7Eh, 2Ch, 36h, 0FEh
		db 0Eh, 21h, 47h, 7Fh, 0BCh, 8Bh, 0E9h, 36h, 8Bh, 0Eh, 1Ch, 47h, 46h, 36h, 0, 0Eh
		db 27h, 47h, 80h, 0D5h, 0, 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 0Dh, 0Ah, 0EDh, 74h, 0ECh
		db 36h, 88h, 2Eh, 21h, 47h, 8Bh, 0CDh, 0EBh, 96h, 0C3h, 0Ah, 0C9h, 7Eh, 0FBh, 36h, 0FEh
		db 0Eh, 21h, 47h, 7Eh, 28h, 8Ah, 4, 57h, 51h, 32h, 0EDh, 0F3h, 0AAh, 59h, 5Fh, 36h
		db 3, 3Eh, 47h, 47h, 2, 0F3h, 80h, 0D9h, 0, 74h, 36h, 2, 0E7h, 73h, 0F5h, 36h
		db 0FFh, 0Eh, 39h, 47h, 7Eh, 2Bh, 36h, 0FEh, 0Eh, 21h, 47h, 7Fh, 0DAh, 8Bh, 0E9h, 36h
		db 8Bh, 0Eh, 1Ch, 47h, 46h, 36h, 0, 0Eh, 27h, 47h, 80h, 0D5h, 0, 36h, 0FFh, 0Eh
		db 31h, 47h, 7Eh, 0Dh, 0Ah, 0EDh, 74h, 0ECh, 36h, 88h, 2Eh, 21h, 47h, 8Bh, 0CDh, 0EBh
		db 0B4h, 0C3h, 33h, 0C0h, 36h, 8Ah, 2Eh, 22h, 47h, 36h, 0A0h, 23h, 47h, 33h, 0D2h, 0Ah
		db 0EDh, 74h, 0Ch, 2Ah, 0F7h, 15h, 0, 0, 2Ah, 0D3h, 80h, 0DDh, 0, 7Fh, 0F4h, 40h
		db 36h, 0A3h, 24h, 47h, 36h, 0A1h, 16h, 47h, 36h, 2Bh, 6, 43h, 47h, 7Fh, 2, 0EBh
		db 59h, 33h, 0D2h, 8Ah, 0D4h, 8Ah, 0E0h, 32h, 0C0h, 36h, 2Ah, 6, 2Eh, 46h, 80h, 0DCh
		db 0, 83h, 0DAh, 0, 33h, 0C9h, 8Ah, 0CBh, 0F7h, 0F1h, 0Bh, 0D2h, 74h, 1, 40h, 50h
		db 0F7h, 0E1h, 36h, 0, 6, 2Eh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah
		db 0E2h, 36h, 29h, 6, 16h, 47h, 36h, 1, 6, 2Dh, 47h, 58h, 8Ah, 0CFh, 0F7h, 0E1h
		db 36h, 0, 6, 2Fh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h
		db 1, 6, 18h, 47h, 36h, 80h, 0Eh, 2Ch, 47h, 4, 36h, 0A1h, 16h, 47h, 40h, 36h
		db 2Bh, 6, 3Fh, 47h, 7Fh, 1, 0C3h, 36h, 0A3h, 37h, 47h, 36h, 0A1h, 31h, 47h, 36h
		db 0F7h, 26h, 1Ah, 47h, 36h, 2, 6, 26h, 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah
		db 0C4h, 8Ah, 0E2h, 8Bh, 0D5h, 2Bh, 0D0h, 36h, 3Bh, 16h, 43h, 47h, 7Fh, 0D8h, 36h, 3Bh
		db 16h, 3Fh, 47h, 7Dh, 6, 36h, 80h, 0Eh, 2Ch, 47h, 1, 36h, 0A1h, 45h, 47h, 40h
		db 36h, 2Bh, 6, 18h, 47h, 36h, 0A3h, 39h, 47h, 7Fh, 9, 36h, 3, 6, 24h, 47h
		db 7Eh, 63h, 7Fh, 28h, 36h, 0A1h, 31h, 47h, 36h, 0F7h, 26h, 1Ch, 47h, 36h, 2, 6
		db 27h, 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 3, 0C7h, 36h, 3Bh
		db 6, 41h, 47h, 7Ch, 40h, 36h, 3Bh, 6, 45h, 47h, 7Ch, 6, 36h, 80h, 0Eh, 2Ch
		db 47h, 8, 36h, 0F6h, 6, 2Ch, 47h, 6, 74h, 55h, 36h, 0A1h, 2Dh, 47h, 33h, 0D2h
		db 8Ah, 0D4h, 8Ah, 0E0h, 32h, 0C0h, 36h, 0A0h, 2Eh, 46h, 36h, 2Ah, 6, 26h, 47h, 80h
		db 0DCh, 0, 83h, 0DAh, 0, 36h, 8Bh, 0Eh, 1Ah, 47h, 0F7h, 0F1h, 3, 0F0h, 36h, 29h
		db 6, 31h, 47h, 7Fh, 1, 0C3h, 0F7h, 0E1h, 36h, 0, 6, 26h, 47h, 80h, 0D4h, 0
		db 83h, 0D2h, 0, 36h, 0, 0Eh, 26h, 47h, 80h, 0D5h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 2
		db 0C5h, 80h, 0D4h, 0, 36h, 2Bh, 6, 2Dh, 47h, 36h, 0A2h, 20h, 47h, 0EBh, 12h, 36h
		db 8Bh, 0Eh, 1Ah, 47h, 36h, 0, 0Eh, 26h, 47h, 80h, 0D5h, 0, 36h, 88h, 2Eh, 20h
		db 47h, 36h, 0A1h, 18h, 47h, 0D1h, 0E0h, 36h, 3, 6, 3Dh, 47h, 8Bh, 0F8h, 36h, 8Bh
		db 3Dh, 36h, 3, 3Eh, 16h, 47h, 36h, 8Ah, 0Eh, 23h, 47h, 36h, 0A0h, 22h, 47h, 36h
		db 8Ah, 26h, 2Fh, 46h, 8Ah, 0ECh, 36h, 8Ah, 16h, 2Eh, 46h, 8Ah, 0F2h, 0Ah, 0C0h, 74h
		db 0Bh, 2Ah, 0E7h, 80h, 0D1h, 0, 2Ah, 0F3h, 1Ch, 0, 7Fh, 0F5h, 36h, 8Bh, 2Eh, 18h
		db 47h, 36h, 3Bh, 2Eh, 45h, 47h, 7Ch, 2Bh, 74h, 26h, 36h, 2Bh, 2Eh, 45h, 47h, 8Ah
		db 0C5h, 32h, 0EDh, 2Bh, 0CDh, 8Ah, 0E8h, 7Fh, 1, 0C3h, 36h, 8Bh, 2Eh, 45h, 47h, 0D1h
		db 0E5h, 36h, 3, 2Eh, 3Dh, 47h, 8Bh, 0FDh, 36h, 8Bh, 3Dh, 36h, 3, 3Eh, 16h, 47h
		db 0E9h, 3Ch, 1, 51h, 32h, 0EDh, 49h, 2Bh, 0E9h, 59h, 36h, 3Bh, 2Eh, 41h, 47h, 7Ch
		db 3, 0E9h, 95h, 0, 36h, 80h, 3Eh, 20h, 47h, 0, 74h, 66h, 8Ah, 4, 36h, 3Bh
		db 2Eh, 41h, 47h, 7Dh, 0ECh, 51h, 57h, 52h, 8Bh, 0D5h, 36h, 2Bh, 16h, 41h, 47h, 32h
		db 0EDh, 3, 0CAh, 5Ah, 26h, 88h, 5, 36h, 2Bh, 3Eh, 47h, 47h, 0FEh, 0C9h, 7Fh, 0F4h
		db 5Fh, 59h, 4Fh, 36h, 0FFh, 0Eh, 16h, 47h, 2, 0EFh, 73h, 0Ch, 0FEh, 0C1h, 36h, 3
		db 3Eh, 47h, 47h, 36h, 0FFh, 0Eh, 39h, 47h, 2, 0D3h, 73h, 0ECh, 2, 0E7h, 73h, 3
		db 45h, 0FEh, 0C9h, 2, 0F3h, 73h, 0F5h, 36h, 0FFh, 0Eh, 37h, 47h, 74h, 38h, 50h, 36h
		db 0A1h, 16h, 47h, 36h, 3Bh, 6, 3Fh, 47h, 58h, 7Ch, 2Bh, 36h, 0FEh, 0Eh, 20h, 47h
		db 75h, 9Ch, 51h, 36h, 8Bh, 0Eh, 1Ah, 47h, 46h, 36h, 0, 0Eh, 26h, 47h, 80h, 0D5h
		db 0, 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 0Dh, 0Ah, 0EDh, 7Eh, 0ECh, 36h, 88h, 2Eh, 20h
		db 47h, 59h, 0E9h, 77h, 0FFh, 59h, 0E9h, 1, 1, 36h, 0F6h, 6, 2Ch, 47h, 9, 75h
		db 3, 0E9h, 75h, 0F5h, 36h, 8Bh, 2Eh, 47h, 47h, 36h, 80h, 3Eh, 20h, 47h, 0, 74h
		db 47h, 8Ah, 4, 51h, 57h, 26h, 88h, 5, 2Bh, 0FDh, 0FEh, 0C9h, 7Fh, 0F7h, 5Fh, 59h
		db 4Fh, 2, 0EFh, 73h, 0Bh, 36h, 0FFh, 0Eh, 39h, 47h, 7Eh, 4, 0FEh, 0C1h, 3, 0FDh
		db 2, 0D3h, 73h, 0EDh, 2, 0E7h, 80h, 0D9h, 0, 2, 0F3h, 73h, 0F7h, 36h, 0FFh, 0Eh
		db 16h, 47h, 36h, 0FFh, 0Eh, 37h, 47h, 7Eh, 38h, 36h, 83h, 3Eh, 39h, 47h, 0, 7Eh
		db 31h, 36h, 0FEh, 0Eh, 20h, 47h, 75h, 0BBh, 8Bh, 0E9h, 36h, 8Bh, 0Eh, 1Ah, 47h, 46h
		db 36h, 0, 0Eh, 26h, 47h, 80h, 0D5h, 0, 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 12h, 0Ah
		db 0EDh, 7Eh, 0ECh, 36h, 88h, 2Eh, 20h, 47h, 8Bh, 0CDh, 36h, 8Bh, 2Eh, 47h, 47h, 0EBh
		db 90h, 0C3h, 36h, 0F6h, 6, 2Ch, 47h, 8, 74h, 70h, 36h, 0FEh, 0Eh, 20h, 47h, 36h
		db 8Bh, 2Eh, 16h, 47h, 36h, 3Bh, 2Eh, 43h, 47h, 7Fh, 5Fh, 36h, 80h, 3Eh, 20h, 47h
		db 0, 7Eh, 34h, 8Ah, 4, 51h, 57h, 26h, 88h, 5, 36h, 2Bh, 3Eh, 47h, 47h, 0FEh
		db 0C9h, 7Fh, 0F4h, 5Fh, 59h, 4Fh, 4Dh, 36h, 3Bh, 2Eh, 3Fh, 47h, 7Ch, 3Ch, 2, 0E7h
		db 80h, 0D9h, 0, 7Eh, 35h, 2, 0F3h, 73h, 0F5h, 36h, 0FFh, 0Eh, 37h, 47h, 7Eh, 2Ah
		db 36h, 0FEh, 0Eh, 20h, 47h, 75h, 0CEh, 51h, 36h, 8Bh, 0Eh, 1Ah, 47h, 46h, 36h, 0
		db 0Eh, 26h, 47h, 80h, 0D5h, 0, 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 0Ch, 0Ah, 0EDh, 7Eh
		db 0ECh, 36h, 88h, 2Eh, 20h, 47h, 59h, 0EBh, 0AAh, 59h, 0C3h, 36h, 3, 6, 0Ah, 47h
		db 36h, 0F7h, 26h, 28h, 47h, 8Ah, 0C4h, 8Ah, 0E2h, 50h, 33h, 0C9h, 8Ah, 0CFh, 0F7h, 0E1h
		db 36h, 0A2h, 2Fh, 46h, 36h, 8Bh, 0Eh, 1Ch, 47h, 2, 0C1h, 80h, 0D5h, 0, 36h, 88h
		db 2Eh, 21h, 47h, 36h, 0A2h, 27h, 47h, 8Ah, 0C4h, 8Ah, 0E2h, 0F7h, 0D8h, 36h, 3, 6
		db 12h, 47h, 36h, 0A3h, 18h, 47h, 8Bh, 0F8h, 58h, 33h, 0C9h, 8Ah, 0CBh, 0F7h, 0E1h, 36h
		db 0A2h, 2Eh, 46h, 36h, 0A2h, 26h, 47h, 8Ah, 0C8h, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 3, 6
		db 10h, 47h, 36h, 0A3h, 16h, 47h, 8Bh, 0E8h, 36h, 0C7h, 6, 2Dh, 47h, 0, 0, 36h
		db 0C7h, 6, 2Fh, 47h, 0, 0, 36h, 0C6h, 6, 2Ch, 47h, 0, 36h, 0FFh, 26h, 8Ch
		db 48h, 33h, 0C0h, 36h, 0A0h, 22h, 47h, 36h, 8Ah, 2Eh, 23h, 47h, 33h, 0D2h, 0Ah, 0EDh
		db 74h, 0Ch, 2, 0D3h, 15h, 0, 0, 2, 0F7h, 80h, 0DDh, 0, 7Fh, 0F4h, 40h, 36h
		db 0A3h, 24h, 47h, 8Bh, 0D0h, 36h, 0A1h, 16h, 47h, 3, 0C2h, 36h, 2Bh, 6, 3Fh, 47h
		db 7Ch, 2, 0EBh, 5Fh, 0Bh, 0C0h, 79h, 2, 0F7h, 0D8h, 33h, 0D2h, 8Ah, 0D4h, 8Ah, 0E0h
		db 32h, 0C0h, 36h, 2Ah, 6, 2Eh, 46h, 80h, 0DCh, 0, 83h, 0DAh, 0, 33h, 0C9h, 8Ah
		db 0CBh, 0F7h, 0F1h, 0Bh, 0D2h, 74h, 1, 40h, 50h, 0F7h, 0E1h, 36h, 0, 6, 2Eh, 46h
		db 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 1, 6, 16h, 47h, 58h
		db 8Ah, 0CFh, 0F7h, 0E1h, 36h, 0, 6, 2Fh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah
		db 0C4h, 8Ah, 0E2h, 36h, 29h, 6, 18h, 47h, 36h, 1, 6, 2Fh, 47h, 36h, 80h, 0Eh
		db 2Ch, 47h, 1, 36h, 0A1h, 18h, 47h, 36h, 2Bh, 6, 45h, 47h, 7Eh, 5Bh, 33h, 0D2h
		db 8Ah, 0D4h, 8Ah, 0E0h, 32h, 0C0h, 36h, 2Ah, 6, 2Fh, 46h, 80h, 0DCh, 0, 83h, 0DAh
		db 0, 33h, 0C9h, 8Ah, 0CFh, 0F7h, 0F1h, 0Bh, 0D2h, 74h, 1, 40h, 50h, 0F7h, 0E1h, 36h
		db 0, 6, 2Fh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 1
		db 6, 2Fh, 47h, 36h, 29h, 6, 18h, 47h, 58h, 33h, 0C9h, 8Ah, 0CBh, 0F7h, 0E1h, 36h
		db 0, 6, 2Eh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 1
		db 6, 16h, 47h, 36h, 80h, 0Eh, 2Ch, 47h, 8, 36h, 0A1h, 43h, 47h, 40h, 36h, 2Bh
		db 6, 16h, 47h, 7Fh, 1, 0C3h, 36h, 0A3h, 37h, 47h, 36h, 0A1h, 31h, 47h, 36h, 0F7h
		db 26h, 1Ah, 47h, 36h, 2, 6, 26h, 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h
		db 8Ah, 0E2h, 3, 0C5h, 0F9h, 36h, 12h, 6, 22h, 47h, 80h, 0D4h, 0, 36h, 3Bh, 6
		db 3Fh, 47h, 7Dh, 1, 0C3h, 36h, 3Bh, 6, 43h, 47h, 7Eh, 6, 36h, 80h, 0Eh, 2Ch
		db 47h, 4, 36h, 0A1h, 18h, 47h, 40h, 36h, 2Bh, 6, 41h, 47h, 7Eh, 6Bh, 36h, 0A3h
		db 39h, 47h, 36h, 0A1h, 31h, 47h, 36h, 0F7h, 26h, 1Ch, 47h, 36h, 2, 6, 27h, 47h
		db 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 0F7h, 0D8h, 3, 0C7h, 36h, 3Bh
		db 6, 45h, 47h, 7Fh, 44h, 36h, 3Bh, 6, 41h, 47h, 7Dh, 6, 36h, 80h, 0Eh, 2Ch
		db 47h, 2, 36h, 0F6h, 6, 2Ch, 47h, 9, 74h, 59h, 36h, 0A1h, 2Fh, 47h, 0Bh, 0C0h
		db 74h, 51h, 33h, 0D2h, 8Ah, 0D4h, 8Ah, 0E0h, 32h, 0C0h, 36h, 0A0h, 2Fh, 46h, 36h, 2Ah
		db 6, 27h, 47h, 80h, 0DCh, 0, 83h, 0DAh, 0, 36h, 8Bh, 0Eh, 1Ch, 47h, 0F7h, 0F1h
		db 3, 0F0h, 36h, 29h, 6, 31h, 47h, 7Fh, 1, 0C3h, 0F7h, 0E1h, 36h, 0, 6, 27h
		db 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 36h, 0, 0Eh, 27h, 47h, 80h, 0D5h, 0, 8Ah
		db 0C4h, 8Ah, 0E2h, 2, 0C5h, 80h, 0D4h, 0, 36h, 2Bh, 6, 2Fh, 47h, 36h, 0A2h, 21h
		db 47h, 0EBh, 12h, 36h, 8Bh, 0Eh, 1Ch, 47h, 36h, 0, 0Eh, 27h, 47h, 80h, 0D5h, 0
		db 36h, 88h, 2Eh, 21h, 47h, 36h, 0A1h, 18h, 47h, 0D1h, 0E0h, 36h, 3, 6, 3Dh, 47h
		db 8Bh, 0F8h, 36h, 8Bh, 3Dh, 36h, 3, 3Eh, 16h, 47h, 36h, 8Ah, 26h, 2Fh, 46h, 8Ah
		db 0ECh, 36h, 8Ah, 16h, 2Eh, 46h, 8Ah, 0F2h, 36h, 8Ah, 0Eh, 22h, 47h, 36h, 0A0h, 23h
		db 47h, 0Ah, 0C0h, 74h, 0Bh, 2, 0F3h, 80h, 0D1h, 0, 2, 0E7h, 1Ch, 0, 7Fh, 0F5h
		db 51h, 32h, 0EDh, 36h, 29h, 0Eh, 37h, 47h, 59h, 7Fh, 3, 0E9h, 17h, 1, 36h, 80h
		db 3Eh, 21h, 47h, 0, 7Eh, 58h, 8Ah, 4, 57h, 52h, 51h, 32h, 0EDh, 36h, 8Bh, 16h
		db 3Fh, 47h, 36h, 2Bh, 16h, 16h, 47h, 7Eh, 6Dh, 2Bh, 0CAh, 7Eh, 4, 3, 0FAh, 0F3h
		db 0AAh, 59h, 5Ah, 5Fh, 36h, 2Bh, 3Eh, 47h, 47h, 2, 0D3h, 73h, 8, 0FEh, 0C9h, 47h
		db 36h, 0FFh, 6, 16h, 47h, 2, 0EFh, 73h, 0F0h, 2, 0F3h, 73h, 7, 36h, 0FFh, 0Eh
		db 37h, 47h, 0FEh, 0C1h, 2, 0E7h, 73h, 0F1h, 36h, 0FFh, 0Eh, 39h, 47h, 7Eh, 33h, 36h
		db 83h, 3Eh, 37h, 47h, 0, 7Eh, 2Ch, 36h, 0FEh, 0Eh, 21h, 47h, 7Fh, 0AAh, 8Bh, 0E9h
		db 36h, 8Bh, 0Eh, 1Ch, 47h, 46h, 36h, 0, 0Eh, 27h, 47h, 80h, 0D5h, 0, 36h, 0FFh
		db 0Eh, 31h, 47h, 7Eh, 0Dh, 0Ah, 0EDh, 74h, 0ECh, 36h, 88h, 2Eh, 21h, 47h, 8Bh, 0CDh
		db 0EBh, 84h, 0C3h, 0E9h, 8Ah, 0, 59h, 5Ah, 5Fh, 36h, 0F6h, 6, 2Ch, 47h, 6, 75h
		db 8, 36h, 8Bh, 2Eh, 31h, 47h, 0E9h, 1Bh, 0F2h, 36h, 80h, 3Eh, 21h, 47h, 0, 7Eh
		db 0BDh, 8Ah, 4, 8Bh, 0E9h, 32h, 0EDh, 0F3h, 0AAh, 8Bh, 0CDh, 36h, 2Bh, 3Eh, 47h, 47h
		db 32h, 0EDh, 2Bh, 0F9h, 8Bh, 0CDh, 2, 0D3h, 73h, 8, 0FEh, 0C9h, 47h, 36h, 0FFh, 6
		db 16h, 47h, 2, 0EFh, 73h, 0F0h, 2, 0F3h, 73h, 7, 36h, 0FFh, 0Eh, 37h, 47h, 0FEh
		db 0C1h, 2, 0E7h, 73h, 0F1h, 36h, 0FFh, 0Eh, 39h, 47h, 7Eh, 33h, 36h, 83h, 3Eh, 37h
		db 47h, 0, 7Eh, 9Fh, 36h, 0FEh, 0Eh, 21h, 47h, 7Fh, 0B8h, 8Bh, 0E9h, 36h, 8Bh, 0Eh
		db 1Ch, 47h, 46h, 36h, 0, 0Eh, 27h, 47h, 80h, 0D5h, 0, 36h, 0FFh, 0Eh, 31h, 47h
		db 7Eh, 0Dh, 0Ah, 0EDh, 74h, 0ECh, 36h, 88h, 2Eh, 21h, 47h, 8Bh, 0CDh, 0EBh, 92h, 0C3h
		db 36h, 0FEh, 0Eh, 21h, 47h, 36h, 80h, 3Eh, 21h, 47h, 0, 7Eh, 53h, 8Ah, 4, 57h
		db 51h, 32h, 0EDh, 36h, 8Bh, 2Eh, 16h, 47h, 3, 0E9h, 0F9h, 36h, 1Bh, 2Eh, 43h, 47h
		db 7Eh, 2, 2Bh, 0CDh, 0F3h, 0AAh, 59h, 5Fh, 36h, 2Bh, 3Eh, 47h, 47h, 2, 0D3h, 73h
		db 14h, 0FEh, 0C9h, 47h, 36h, 0FFh, 6, 16h, 47h, 36h, 8Bh, 2Eh, 16h, 47h, 36h, 3Bh
		db 2Eh, 43h, 47h, 7Fh, 3Fh, 2, 0EFh, 73h, 0E4h, 2, 0F3h, 80h, 0D1h, 0, 2, 0E7h
		db 73h, 0F7h, 36h, 0FFh, 0Eh, 39h, 47h, 7Eh, 2Bh, 36h, 0FEh, 0Eh, 21h, 47h, 7Fh, 0AFh
		db 8Bh, 0E9h, 36h, 8Bh, 0Eh, 1Ch, 47h, 46h, 36h, 0, 0Eh, 27h, 47h, 80h, 0D5h, 0
		db 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 0Dh, 0Ah, 0EDh, 74h, 0ECh, 36h, 88h, 2Eh, 21h, 47h
		db 8Bh, 0CDh, 0EBh, 89h, 0C3h, 33h, 0C0h, 36h, 8Ah, 2Eh, 22h, 47h, 36h, 0A0h, 23h, 47h
		db 33h, 0D2h, 0Ah, 0EDh, 74h, 0Ch, 2, 0F7h, 15h, 0, 0, 2, 0D3h, 80h, 0DDh, 0
		db 7Fh, 0F4h, 40h, 36h, 0A3h, 24h, 47h, 36h, 0A1h, 16h, 47h, 36h, 2Bh, 6, 3Fh, 47h
		db 7Ch, 2, 0EBh, 5Bh, 0F7h, 0D8h, 33h, 0D2h, 8Ah, 0D4h, 8Ah, 0E0h, 32h, 0C0h, 36h, 2Ah
		db 6, 2Eh, 46h, 80h, 0DCh, 0, 83h, 0DAh, 0, 33h, 0C9h, 8Ah, 0CBh, 0F7h, 0F1h, 0Bh
		db 0D2h, 74h, 1, 40h, 50h, 0F7h, 0E1h, 36h, 0, 6, 2Eh, 46h, 80h, 0D4h, 0, 83h
		db 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 1, 6, 16h, 47h, 36h, 1, 6, 2Dh, 47h
		db 58h, 8Ah, 0CFh, 0F7h, 0E1h, 36h, 0, 6, 2Fh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0
		db 8Ah, 0C4h, 8Ah, 0E2h, 36h, 29h, 6, 18h, 47h, 36h, 80h, 0Eh, 2Ch, 47h, 1, 36h
		db 0A1h, 18h, 47h, 36h, 2Bh, 6, 45h, 47h, 7Eh, 62h, 36h, 2Bh, 6, 24h, 47h, 7Eh
		db 5Bh, 33h, 0D2h, 8Ah, 0D4h, 8Ah, 0E0h, 32h, 0C0h, 36h, 2Ah, 6, 2Fh, 46h, 80h, 0DCh
		db 0, 83h, 0DAh, 0, 33h, 0C9h, 8Ah, 0CFh, 0F7h, 0F1h, 0Bh, 0D2h, 74h, 1, 40h, 50h
		db 0F7h, 0E1h, 36h, 0, 6, 2Fh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah
		db 0E2h, 36h, 29h, 6, 18h, 47h, 58h, 33h, 0C9h, 8Ah, 0CBh, 0F7h, 0E1h, 36h, 0, 6
		db 2Eh, 46h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 36h, 1, 6, 16h
		db 47h, 36h, 1, 6, 2Dh, 47h, 36h, 80h, 0Eh, 2Ch, 47h, 8, 36h, 0A1h, 43h, 47h
		db 40h, 36h, 2Bh, 6, 16h, 47h, 7Fh, 1, 0C3h, 36h, 0A3h, 37h, 47h, 36h, 0A1h, 31h
		db 47h, 36h, 0F7h, 26h, 1Ah, 47h, 36h, 2, 6, 26h, 47h, 80h, 0D4h, 0, 83h, 0D2h
		db 0, 8Ah, 0C4h, 8Ah, 0E2h, 3, 0C5h, 36h, 3Bh, 6, 3Fh, 47h, 7Ch, 0DAh, 36h, 3Bh
		db 6, 43h, 47h, 7Eh, 6, 36h, 80h, 0Eh, 2Ch, 47h, 4, 36h, 0A1h, 18h, 47h, 40h
		db 36h, 2Bh, 6, 41h, 47h, 7Eh, 0C1h, 36h, 0A3h, 39h, 47h, 36h, 0A1h, 31h, 47h, 36h
		db 0F7h, 26h, 1Ch, 47h, 36h, 2, 6, 27h, 47h, 80h, 0D4h, 0, 83h, 0D2h, 0, 8Ah
		db 0C4h, 8Ah, 0E2h, 36h, 3, 6, 24h, 47h, 0F7h, 0D8h, 3, 0C7h, 36h, 3Bh, 6, 45h
		db 47h, 7Fh, 40h, 36h, 3Bh, 6, 41h, 47h, 7Dh, 6, 36h, 80h, 0Eh, 2Ch, 47h, 2
		db 36h, 0F6h, 6, 2Ch, 47h, 9, 74h, 55h, 36h, 0A1h, 2Dh, 47h, 33h, 0D2h, 8Ah, 0D4h
		db 8Ah, 0E0h, 32h, 0C0h, 36h, 0A0h, 2Eh, 46h, 36h, 2Ah, 6, 26h, 47h, 80h, 0DCh, 0
		db 83h, 0DAh, 0, 36h, 8Bh, 0Eh, 1Ah, 47h, 0F7h, 0F1h, 3, 0F0h, 36h, 29h, 6, 31h
		db 47h, 7Fh, 1, 0C3h, 0F7h, 0E1h, 36h, 0, 6, 26h, 47h, 80h, 0D4h, 0, 83h, 0D2h
		db 0, 36h, 0, 0Eh, 26h, 47h, 80h, 0D5h, 0, 8Ah, 0C4h, 8Ah, 0E2h, 2, 0C5h, 80h
		db 0D4h, 0, 36h, 2Bh, 6, 2Dh, 47h, 36h, 0A2h, 20h, 47h, 0EBh, 12h, 36h, 8Bh, 0Eh
		db 1Ah, 47h, 36h, 0, 0Eh, 26h, 47h, 80h, 0D5h, 0, 36h, 88h, 2Eh, 20h, 47h, 36h
		db 0A1h, 18h, 47h, 0D1h, 0E0h, 36h, 3, 6, 3Dh, 47h, 8Bh, 0F8h, 36h, 8Bh, 3Dh, 36h
		db 3, 3Eh, 16h, 47h, 36h, 8Ah, 0Eh, 23h, 47h, 36h, 0A0h, 22h, 47h, 36h, 8Ah, 26h
		db 2Fh, 46h, 8Ah, 0ECh, 36h, 8Ah, 16h, 2Eh, 46h, 8Ah, 0F2h, 0Ah, 0C0h, 74h, 0Bh, 2
		db 0E7h, 80h, 0D1h, 0, 2, 0F3h, 1Ch, 0, 7Fh, 0F5h, 36h, 0F6h, 6, 2Ch, 47h, 2
		db 74h, 0Fh, 51h, 32h, 0EDh, 41h, 36h, 29h, 0Eh, 39h, 47h, 59h, 7Dh, 3, 0E9h, 4Eh
		db 1, 36h, 8Bh, 2Eh, 18h, 47h, 36h, 3Bh, 2Eh, 45h, 47h, 7Fh, 3, 0E9h, 0A5h, 0
		db 36h, 8Bh, 2Eh, 45h, 47h, 0D1h, 0E5h, 36h, 3, 2Eh, 3Dh, 47h, 8Bh, 0FDh, 36h, 8Bh
		db 3Dh, 36h, 3, 3Eh, 16h, 47h, 36h, 8Bh, 2Eh, 18h, 47h, 36h, 80h, 3Eh, 20h, 47h
		db 0, 74h, 5Ch, 8Ah, 4, 36h, 3Bh, 2Eh, 45h, 47h, 7Eh, 0D1h, 51h, 57h, 52h, 8Bh
		db 0D5h, 36h, 2Bh, 16h, 45h, 47h, 32h, 0EDh, 2Bh, 0CAh, 5Ah, 7Eh, 0Ch, 26h, 88h, 5
		db 36h, 2Bh, 3Eh, 47h, 47h, 0FEh, 0C9h, 7Fh, 0F4h, 5Fh, 59h, 47h, 2, 0EFh, 73h, 14h
		db 0FEh, 0C9h, 36h, 0FFh, 0Eh, 39h, 47h, 4Dh, 36h, 3Bh, 2Eh, 45h, 47h, 7Dh, 5, 36h
		db 2Bh, 3Eh, 47h, 47h, 2, 0D3h, 73h, 0E4h, 2, 0E7h, 80h, 0D1h, 0, 2, 0F3h, 73h
		db 0F7h, 36h, 0FFh, 0Eh, 37h, 47h, 74h, 2Ah, 36h, 0FEh, 0Eh, 20h, 47h, 75h, 0A6h, 51h
		db 36h, 8Bh, 0Eh, 1Ah, 47h, 46h, 36h, 0, 0Eh, 26h, 47h, 80h, 0D5h, 0, 36h, 0FFh
		db 0Eh, 31h, 47h, 7Eh, 0Ch, 0Ah, 0EDh, 7Eh, 0ECh, 36h, 88h, 2Eh, 20h, 47h, 59h, 0EBh
		db 82h, 59h, 0E9h, 15h, 1, 36h, 0F6h, 6, 2Ch, 47h, 6, 75h, 3, 0E9h, 0B8h, 0EEh
		db 36h, 89h, 2Eh, 18h, 47h, 36h, 8Bh, 2Eh, 47h, 47h, 36h, 80h, 3Eh, 20h, 47h, 0
		db 74h, 45h, 8Ah, 4, 51h, 57h, 26h, 88h, 5, 2Bh, 0FDh, 0FEh, 0C9h, 7Fh, 0F7h, 5Fh
		db 59h, 47h, 2, 0EFh, 73h, 0Eh, 36h, 0FFh, 0Eh, 39h, 47h, 0FEh, 0C9h, 2Bh, 0FDh, 36h
		db 0FFh, 0Eh, 18h, 47h, 2, 0D3h, 73h, 0EAh, 2, 0E7h, 80h, 0D1h, 0, 2, 0F3h, 73h
		db 0F7h, 36h, 0FFh, 0Eh, 37h, 47h, 7Eh, 38h, 36h, 83h, 3Eh, 39h, 47h, 0, 7Eh, 31h
		db 36h, 0FEh, 0Eh, 20h, 47h, 75h, 0BDh, 8Bh, 0E9h, 36h, 8Bh, 0Eh, 1Ah, 47h, 46h, 36h
		db 0, 0Eh, 26h, 47h, 80h, 0D5h, 0, 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 12h, 0Ah, 0EDh
		db 7Eh, 0ECh, 36h, 88h, 2Eh, 20h, 47h, 8Bh, 0CDh, 36h, 8Bh, 2Eh, 47h, 47h, 0EBh, 92h
		db 0C3h, 36h, 0F6h, 6, 2Ch, 47h, 2, 75h, 1, 0C3h, 36h, 0FEh, 0Eh, 20h, 47h, 36h
		db 8Bh, 2Eh, 18h, 47h, 36h, 80h, 3Eh, 20h, 47h, 0, 7Eh, 4Bh, 8Ah, 4, 51h, 57h
		db 55h, 36h, 3Bh, 2Eh, 41h, 47h, 7Ch, 0Dh, 26h, 88h, 5, 36h, 2Bh, 3Eh, 47h, 47h
		db 4Dh, 0FEh, 0C9h, 7Fh, 0ECh, 5Dh, 5Fh, 59h, 47h, 36h, 0FFh, 0Eh, 37h, 47h, 7Eh, 4Ah
		db 2, 0EFh, 73h, 0Fh, 0FEh, 0C9h, 36h, 2Bh, 3Eh, 47h, 47h, 4Dh, 36h, 3Bh, 2Eh, 41h
		db 47h, 7Ch, 37h, 2, 0D3h, 73h, 0E9h, 2, 0E7h, 80h, 0D1h, 0, 2, 0F3h, 73h, 0F7h
		db 36h, 0FEh, 0Eh, 20h, 47h, 75h, 0B7h, 51h, 36h, 8Bh, 0Eh, 1Ah, 47h, 46h, 36h, 0
		db 0Eh, 26h, 47h, 80h, 0D5h, 0, 36h, 0FFh, 0Eh, 31h, 47h, 7Eh, 0Ch, 0Ah, 0EDh, 7Eh
		db 0ECh, 36h, 88h, 2Eh
; END OF FUNCTION CHUNK FOR sub_4D938
seg146		ends
