seg148		segment	para public 'CODE' use16
		assume cs:seg148
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 0C3h

; ----------------------------------------------------------------------

sub_4F452		proc far
		call	sub_5035E
		jb	short loc_4F472
		mov	ax, ss:4704h
		mov	ss:4710h, ax
		call	sub_4FC44
		jnb	short loc_4F477
		mov	word ptr ss:488Ah, 650h
		jmp	loc_4F51C

loc_4F472:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F477:
		mov	word ptr ss:488Ah, 3CEh
		jmp	short loc_4F4A4
sub_4F452		endp

; ----------------------------------------------------------------------

sub_4F480		proc far
		call	sub_50351
		jb	short loc_4F498
		call	sub_4FC44
		jnb	short loc_4F49D
		mov	word ptr ss:488Ah, 4A8h
		jmp	loc_4F51C

loc_4F498:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F49D:
		mov	word ptr ss:488Ah, 2F1h

loc_4F4A4:
		mov	ax, ss:4712h
		shl	ax, 1
		add	ax, ss:473Dh
		mov	ss:4712h, ax

loc_4F4B3:
		xor	ax, ax
		add	ss:462Fh, bl
		adc	al, bh
		mov	ss:472Bh, al

loc_4F4C0:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4F4C8
		jmp	short loc_4F517

loc_4F4C8:
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_4F4F5
		jl	short loc_4F4D6
		jmp	short loc_4F4FC

loc_4F4D6:
		add	si, 6
		shr	ax, 1
		jb	short loc_4F4E1
		add	si, ax
		jmp	short loc_4F4F3

loc_4F4E1:
		push	di
		mov	di, ax

loc_4F4E4:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4F4EE
		add	si, ax
		dec	si

loc_4F4EE:
		sub	di, ax
		jnz	short loc_4F4E4
		pop	di

loc_4F4F3:
		jmp	short loc_4F4C0

loc_4F4F5:
		call	word ptr ss:488Ah
		jmp	short loc_4F4C0

loc_4F4FC:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4F517
		xor	ax, ax
		mov	al, ss:472Bh
		shl	ax, 1
		add	ss:4712h, ax
		jmp	short loc_4F4B3

loc_4F517:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F51C:
		mov	ax, ss:4712h
		cmp	ax, ss:4741h
		jge	short loc_4F552
		mov	dx, ss:4741h

loc_4F52C:
		xor	cx, cx
		add	ss:462Fh, bl
		adc	cl, bh
		add	ax, cx
		cmp	ax, dx
		jg	short loc_4F549
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jnz	short loc_4F52C
		jmp	short loc_4F5BD

loc_4F549:
		mov	ss:4712h, dx
		sub	ax, dx
		jmp	short loc_4F55B

loc_4F552:
		xor	ax, ax
		add	ss:462Fh, bl
		adc	al, bh

loc_4F55B:
		mov	ss:472Bh, al

loc_4F55F:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4F567
		jmp	short loc_4F5BD

loc_4F567:
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_4F594
		jl	short loc_4F575
		jmp	short loc_4F59B

loc_4F575:
		add	si, 6
		shr	ax, 1
		jb	short loc_4F580
		add	si, ax
		jmp	short loc_4F592

loc_4F580:
		push	di
		mov	di, ax

loc_4F583:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4F58D
		add	si, ax
		dec	si

loc_4F58D:
		sub	di, ax
		jnz	short loc_4F583
		pop	di

loc_4F592:
		jmp	short loc_4F55F

loc_4F594:
		call	word ptr ss:488Ah
		jmp	short loc_4F55F

loc_4F59B:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4F5BD
		xor	ax, ax
		mov	al, ss:472Bh
		add	ax, ss:4712h
		mov	ss:4712h, ax
		cmp	ax, ss:4745h
		jle	short loc_4F552

loc_4F5BD:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4F480		endp

; ----------------------------------------------------------------------

sub_4F5C2		proc far
		call	sub_5036B
		jb	short loc_4F5DA
		call	sub_4FC44
		jnb	short loc_4F5DF
		mov	word ptr ss:488Ah, 4A8h
		jmp	loc_4F684

loc_4F5DA:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F5DF:
		mov	word ptr ss:488Ah, 2F1h
		jmp	short loc_4F613
sub_4F5C2		endp

; ----------------------------------------------------------------------

sub_4F5E8		proc far
		call	sub_50378
		jb	short loc_4F607
		mov	ax, ss:4704h
		mov	ss:4710h, ax
		call	sub_4FC44
		jnb	short loc_4F60C
		mov	word ptr ss:488Ah, 650h
		jmp	short loc_4F684

loc_4F607:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F60C:
		mov	word ptr ss:488Ah, 3CEh

loc_4F613:
		mov	ax, ss:4706h
		inc	ax
		shl	ax, 1
		add	ax, ss:473Dh
		mov	ss:4712h, ax

loc_4F623:
		xor	ax, ax
		add	ss:462Fh, bl
		adc	al, bh
		mov	ss:472Bh, al
		shl	ax, 1
		sub	ss:4712h, ax

loc_4F637:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4F63F
		jmp	short loc_4F67F

loc_4F63F:
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_4F66C
		jl	short loc_4F64D
		jmp	short loc_4F673

loc_4F64D:
		add	si, 6
		shr	ax, 1
		jb	short loc_4F658
		add	si, ax
		jmp	short loc_4F66A

loc_4F658:
		push	di
		mov	di, ax

loc_4F65B:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4F665
		add	si, ax
		dec	si

loc_4F665:
		sub	di, ax
		jnz	short loc_4F65B
		pop	di

loc_4F66A:
		jmp	short loc_4F637

loc_4F66C:
		call	word ptr ss:488Ah
		jmp	short loc_4F637

loc_4F673:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jnz	short loc_4F623

loc_4F67F:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F684:
		mov	ax, ss:4706h
		inc	ax
		mov	ss:4712h, ax
		cmp	ax, ss:4745h
		jle	short loc_4F6BF
		mov	dx, ss:4745h

loc_4F699:
		xor	cx, cx
		add	ss:462Fh, bl
		adc	cl, bh
		sub	ax, cx
		cmp	ax, dx
		jle	short loc_4F6B7
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jnz	short loc_4F699
		jmp	loc_4F73C

loc_4F6B7:
		mov	ss:4712h, ax
		mov	cx, ax
		jmp	short loc_4F6E5

loc_4F6BF:
		xor	ax, ax
		add	ss:462Fh, bl
		adc	al, bh
		sub	ss:4712h, ax
		mov	dx, ss:4741h
		sub	dx, ss:4712h
		jle	short loc_4F6E5
		sub	ax, dx
		mov	dx, ss:4741h
		mov	ss:4712h, dx

loc_4F6E5:
		mov	ss:472Bh, al

loc_4F6E9:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_4F73C
		mov	di, ss:46F6h
		cmp	[si+4], di
		jz	short loc_4F71C
		jl	short loc_4F6FD
		jmp	short loc_4F723

loc_4F6FD:
		add	si, 6
		shr	ax, 1
		jb	short loc_4F708
		add	si, ax
		jmp	short loc_4F71A

loc_4F708:
		push	di
		mov	di, ax

loc_4F70B:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4F715
		add	si, ax
		dec	si

loc_4F715:
		sub	di, ax
		jnz	short loc_4F70B
		pop	di

loc_4F71A:
		jmp	short loc_4F6E9

loc_4F71C:
		call	word ptr ss:488Ah
		jmp	short loc_4F6E9

loc_4F723:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4F73C
		xor	ax, ax
		mov	ax, ss:4712h
		cmp	ax, ss:4741h
		jg	short loc_4F6BF

loc_4F73C:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4F5E8		endp

; START OF FUNCTION CHUNK FOR sub_4F5E8
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mul	bx
		add	al, ss:462Eh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_4F5E8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F751		proc far

saved_0		= word ptr  0

		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		add	ax, ss:4710h
		mov	ss:4714h, ax
		mov	di, ss:4712h
		mov	di, ss:[di]
		add	di, ax
		xor	bp, bp
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jb	short loc_4F7C2
		mov	ah, al
		xor	cx, cx

loc_4F780:
		lodsb
		add	dl, bl
		adc	cl, bh
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_4F780

loc_4F78D:
		mov	dh, ss:472Bh
		dec	dh
		jz	short loc_4F7C1
		push	si
		push	ds
		push	es
		pop	ds
		mov	ax, bp
		mov	bp, ss:4712h

loc_4F7A1:
		mov	si, ss:4714h
		mov	di, si
		add	si, [bp+saved_0]
		add	bp, 2
		add	di, [bp+saved_0]
		mov	cx, ax
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		dec	dh
		jnz	short loc_4F7A1
		pop	ds
		pop	si

loc_4F7C1:
		ret

loc_4F7C2:
		mov	bx, ax

loc_4F7C4:
		lodsb
		shr	al, 1
		cbw
		jb	short loc_4F7EC
		sub	bx, ax
		mov	ah, al
		xor	cx, cx

loc_4F7D0:
		lodsb
		add	dl, ss:4728h
		adc	cl, ss:4729h
		adc	ch, 0
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_4F7D0
		or	bl, bl
		jnz	short loc_4F7C4
		jmp	short loc_4F816

loc_4F7EC:
		sub	bx, ax
		mov	cx, dx
		mul	word ptr ss:4728h
		add	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, cx
		mov	cx, ax
		lodsb
		mov	ah, al
		add	bp, cx
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bl, bl
		jnz	short loc_4F7C4

loc_4F816:
		mov	bx, ss:4728h
		jmp	loc_4F78D
sub_4F751		endp

; START OF FUNCTION CHUNK FOR sub_4F751
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mul	bx
		add	al, ss:462Eh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_4F751

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F82E		proc far

saved_0		= word ptr  0

		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		neg	ax
		add	ax, ss:4710h
		mov	ss:4714h, ax
		mov	di, ss:4712h
		mov	di, ss:[di]
		add	di, ax
		xor	bp, bp
		std
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jb	short loc_4F89F
		mov	ah, al
		xor	cx, cx

loc_4F860:
		mov	al, [si]
		inc	si
		add	dl, bl
		adc	cl, bh
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_4F860

loc_4F86F:
		mov	dh, ss:472Bh
		dec	dh
		jz	short loc_4F89D
		push	si
		push	ds
		push	es
		pop	ds
		mov	ax, bp
		mov	bp, ss:4712h

loc_4F883:
		mov	si, ss:4714h
		mov	di, si
		add	si, [bp+saved_0]
		add	bp, 2
		add	di, [bp+saved_0]
		mov	cx, ax
		rep movsb
		dec	dh
		jnz	short loc_4F883
		pop	ds
		pop	si

loc_4F89D:
		cld
		ret

loc_4F89F:
		mov	bx, ax

loc_4F8A1:
		mov	al, [si]
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4F8CA
		sub	bx, ax
		mov	ah, al
		xor	cx, cx

loc_4F8AF:
		mov	al, [si]
		inc	si
		add	dl, ss:4728h
		adc	cl, ss:4729h
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_4F8AF
		or	bl, bl
		jnz	short loc_4F8A1
		jmp	short loc_4F8F0

loc_4F8CA:
		sub	bx, ax
		mov	cx, dx
		mul	word ptr ss:4728h
		add	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, cx
		mov	cx, ax
		mov	al, [si]
		inc	si
		mov	ah, al
		add	bp, cx
		rep stosb
		or	bl, bl
		jnz	short loc_4F8A1

loc_4F8F0:
		mov	bx, ss:4728h
		jmp	loc_4F86F
sub_4F82E		endp

; START OF FUNCTION CHUNK FOR sub_4F82E
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4F947
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4F911:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4F927
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4F911
		jz	short loc_4F938

loc_4F927:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4F911

loc_4F938:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_5E448
		mov	si, 474Ah
		jmp	short loc_4F953

loc_4F947:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4F953:
		add	ax, ss:470Ah
		xor	ch, ch
		mul	bx
		add	al, ss:462Eh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_4F82E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F962		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4710h
		mov	di, ax
		cmp	ax, ss:4743h
		jle	short loc_4F97E

loc_4F97B:
		jmp	loc_4FA9D

loc_4F97E:
		mov	ax, ss:4731h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:473Fh
		jl	short loc_4F97B
		cmp	ax, ss:4743h
		jle	short loc_4F9C3
		mov	ax, ss:4743h
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
		jz	short loc_4F9BF
		mov	ch, 1

loc_4F9BF:
		mov	ss:4731h, ax

loc_4F9C3:
		mov	ax, di
		sub	ax, ss:473Fh
		jge	short loc_4FA14
		or	ax, ax
		jns	short loc_4F9D2
		neg	ax

loc_4F9D2:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		jb	short loc_4F97B
		div	bx
		sub	ss:4731h, ax
		jb	short loc_4F97B
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	di, ss:473Fh
		sub	ax, di
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	cl, al
		jmp	short loc_4FA1C

loc_4FA14:
		mov	dx, cx
		xor	cx, cx
		add	dl, bl
		adc	cl, bh

loc_4FA1C:
		mov	ax, di
		mov	di, ss:4712h
		shl	di, 1
		add	di, ss:473Dh
		mov	di, ss:[di]
		add	di, ax
		push	ax
		mov	ss:4714h, di
		xor	bp, bp
		mov	ah, ss:4731h
		or	ah, ah
		jz	short loc_4FA4D

loc_4FA40:
		lodsb
		add	bp, cx
		rep stosb
		add	dl, bl
		adc	cl, bh
		dec	ah
		jnz	short loc_4FA40

loc_4FA4D:
		pop	ax
		or	dh, dh
		jz	short loc_4FA67
		add	ax, bp
		stc
		sbb	ax, ss:4743h
		or	ax, ax
		jns	short loc_4FA60
		neg	ax

loc_4FA60:
		mov	cx, ax
		add	bp, cx
		lodsb
		rep stosb

loc_4FA67:
		mov	dh, ss:472Bh
		dec	dh
		jz	short loc_4FA9D
		push	es
		pop	ds
		mov	ax, ss:4712h

loc_4FA76:
		inc	ax
		cmp	ax, ss:4745h
		jg	short loc_4FA9D
		mov	si, ss:4714h
		mov	di, si
		add	di, ss:4747h
		mov	ss:4714h, di
		mov	cx, bp
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		dec	dh
		jnz	short loc_4FA76

loc_4FA9D:
		pop	ds
		pop	si
		ret
sub_4F962		endp

; START OF FUNCTION CHUNK FOR sub_4F962
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4FAEF
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4FAB9:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4FACF
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4FAB9
		jz	short loc_4FAE0

loc_4FACF:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4FAB9

loc_4FAE0:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_5E448
		mov	si, 474Ah
		jmp	short loc_4FAFB

loc_4FAEF:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4FAFB:
		add	ax, ss:470Ah
		xor	ch, ch
		mul	bx
		add	al, ss:462Eh
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_4F962

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4FB0A		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4710h
		mov	di, ax
		cmp	ax, ss:473Fh
		jge	short loc_4FB28

loc_4FB25:
		jmp	loc_4FC3F

loc_4FB28:
		mov	ax, ss:4731h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:4743h
		jg	short loc_4FB25
		cmp	ax, ss:473Fh
		jge	short loc_4FB70
		mov	ax, di
		inc	ax
		sub	ax, ss:473Fh
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_4FB6C
		mov	ch, 1

loc_4FB6C:
		mov	ss:4731h, ax

loc_4FB70:
		mov	ax, di
		sub	ax, ss:4743h
		jle	short loc_4FBBD
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:4731h, ax
		jle	short loc_4FB25
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
		mov	di, ss:4743h
		sub	ax, di
		neg	ax
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	cl, al
		jmp	short loc_4FBC5

loc_4FBBD:
		mov	dx, cx
		xor	cx, cx
		add	dl, bl
		adc	cl, bh

loc_4FBC5:
		mov	ax, di
		mov	di, ss:4712h
		shl	di, 1
		add	di, ss:473Dh
		mov	di, ss:[di]
		add	di, ax
		push	ax
		mov	ss:4714h, di
		std
		xor	bp, bp
		mov	ah, ss:4731h
		or	ah, ah
		jz	short loc_4FBF9

loc_4FBEA:
		mov	al, [si]
		inc	si
		add	bp, cx
		rep stosb
		add	dl, bl
		adc	cl, bh
		dec	ah
		jnz	short loc_4FBEA

loc_4FBF9:
		pop	ax
		or	dh, dh
		jz	short loc_4FC0F
		sub	ax, bp
		inc	ax
		sub	ax, ss:473Fh
		mov	cx, ax
		add	bp, cx
		mov	al, [si]
		inc	si
		rep stosb

loc_4FC0F:
		mov	dh, ss:472Bh
		dec	dh
		jz	short loc_4FC3F
		push	es
		pop	ds
		mov	ax, ss:4712h

loc_4FC1E:
		inc	ax
		cmp	ax, ss:4745h
		jg	short loc_4FC3F
		mov	si, ss:4714h
		mov	di, si
		add	di, ss:4747h
		mov	ss:4714h, di
		mov	cx, bp
		rep movsb
		dec	dh
		jnz	short loc_4FC1E

loc_4FC3F:
		cld
sub_4FB0A		endp
seg148		ends
