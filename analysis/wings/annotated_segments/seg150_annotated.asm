seg150		segment	para public 'CODE' use16
		assume cs:seg150
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C7h, 8, 0D1h, 0E7h, 36h, 0FFh, 0ADh, 34h, 46h

; ----------------------------------------------------------------------

sub_50C1A		proc far
		call	sub_4FE21
		jb	short loc_50C41
		mov	bx, ss:4704h
		call	sub_4FC44
		jnb	short loc_50C37
		mov	word ptr ss:488Ah, 228h
		jmp	loc_510F8

loc_50C37:
		mov	word ptr ss:488Ah, 1AAh
		jmp	loc_50CD2

loc_50C41:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_50C1A		endp

; ----------------------------------------------------------------------

sub_50C46		proc far
		call	sub_4FE2E
		jb	short loc_50C71
		mov	bx, ss:4704h
		mov	bp, ss:4706h
		call	sub_4FC44
		jnb	short loc_50C68
		mov	word ptr ss:488Ah, 3C8h
		jmp	loc_510F8

loc_50C68:
		mov	word ptr ss:488Ah, 348h
		jmp	short loc_50CD2

loc_50C71:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_50C46		endp

; ----------------------------------------------------------------------

sub_50C76		proc far
		call	sub_4FE3B
		jb	short loc_50C9D
		mov	bx, ss:4700h
		call	sub_4FC44
		jnb	short loc_50C93
		mov	word ptr ss:488Ah, 228h
		jmp	loc_51189

loc_50C93:
		mov	word ptr ss:488Ah, 1AAh
		jmp	loc_50D46

loc_50C9D:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_50C76		endp

; ----------------------------------------------------------------------

sub_50CA2		proc far
		call	sub_4FE48
		jb	short loc_50CCD
		mov	bx, ss:4700h
		mov	bp, ss:4706h
		call	sub_4FC44
		jnb	short loc_50CC4
		mov	word ptr ss:488Ah, 3C8h
		jmp	loc_51189

loc_50CC4:
		mov	word ptr ss:488Ah, 348h
		jmp	short loc_50D46

loc_50CCD:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_50CD2:
		shl	bp, 1
		add	bp, ss:473Dh
		mov	ss:4712h, bp
		mov	ch, ss:462Eh
		mov	cl, ss:46FAh
		mov	bp, ss:4747h

loc_50CED:
		add	ch, dh
		jb	short loc_50CFF
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_50CED
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_50CFF:
		mov	di, ss:46F6h

loc_50D04:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_50D41
		cmp	[si+4], di
		jz	short loc_50D30
		jg	short loc_50D37
		add	si, 6
		shr	ax, 1
		jb	short loc_50D1C
		add	si, ax
		jmp	short loc_50D2E

loc_50D1C:
		push	di
		mov	di, ax

loc_50D1F:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_50D29
		add	si, ax
		dec	si

loc_50D29:
		sub	di, ax
		jnz	short loc_50D1F
		pop	di

loc_50D2E:
		jmp	short loc_50D04

loc_50D30:
		call	word ptr ss:488Ah
		jmp	short loc_50CFF

loc_50D37:
		inc	word ptr ss:46F6h
		dec	bx
		dec	cl
		jnz	short loc_50CED

loc_50D41:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_50D46:
		shl	bp, 1
		add	bp, ss:473Dh
		mov	ss:4712h, bp
		mov	ch, ss:462Eh
		mov	cl, ss:46FAh
		mov	bp, ss:4747h

loc_50D61:
		add	ch, dh
		jb	short loc_50D73
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_50D61
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_50D73:
		mov	di, ss:46F6h

loc_50D78:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_50DB5
		cmp	[si+4], di
		jz	short loc_50DA4
		jg	short loc_50DAB
		add	si, 6
		shr	ax, 1
		jb	short loc_50D90
		add	si, ax
		jmp	short loc_50DA2

loc_50D90:
		push	di
		mov	di, ax

loc_50D93:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_50D9D
		add	si, ax
		dec	si

loc_50D9D:
		sub	di, ax
		jnz	short loc_50D93
		pop	di

loc_50DA2:
		jmp	short loc_50D78

loc_50DA4:
		call	word ptr ss:488Ah
		jmp	short loc_50D73

loc_50DAB:
		inc	word ptr ss:46F6h
		inc	bx
		dec	cl
		jnz	short loc_50D61

loc_50DB5:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
		push	ax
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Fh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		add	ax, ss:4712h
		mov	di, ax
		mov	di, ss:[di]
		add	di, bx
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_50E00
		mov	ah, al
		inc	ah

loc_50DED:
		dec	ah
		jz	short loc_50DFF

loc_50DF1:
		lodsb
		add	dl, dh
		jnb	short loc_50DED
		mov	es:[di], al
		add	di, bp
		dec	ah
		jnz	short loc_50DF1

loc_50DFF:
		ret

loc_50E00:
		push	bx
		mov	bx, ax

loc_50E03:
		lodsb
		shr	al, 1
		jb	short loc_50E20
		sub	bl, al
		mov	ah, al

loc_50E0C:
		lodsb
		add	dl, dh
		jnb	short loc_50E16
		mov	es:[di], al
		add	di, bp

loc_50E16:
		dec	ah
		jnz	short loc_50E0C
		or	bl, bl
		jnz	short loc_50E03
		jmp	short loc_50E36

loc_50E20:
		sub	bl, al
		mov	ah, al
		lodsb

loc_50E25:
		add	dl, dh
		jnb	short loc_50E2E
		mov	es:[di], al
		add	di, bp

loc_50E2E:
		dec	ah
		jnz	short loc_50E25
		or	bl, bl
		jnz	short loc_50E03

loc_50E36:
		pop	bx
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_50E85
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_50E52:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_50E68
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_50E52
		jz	short loc_50E79

loc_50E68:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_50E52

loc_50E79:
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_50E91

loc_50E85:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_50E91:
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Fh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, ss:4712h
		mov	bx, ax
		cmp	ax, ss:4745h
		jle	short loc_50EB7

loc_50EB4:
		jmp	loc_50F55

loc_50EB7:
		mov	ax, ss:4731h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:4741h
		jl	short loc_50EB4
		cmp	ax, ss:4745h
		jle	short loc_50EF5
		mov	ax, ss:4745h
		sub	ax, bx
		mov	ah, al
		xor	al, al
		inc	ah
		sub	al, dl
		sbb	ah, 0
		jb	short loc_50F55
		div	dh
		or	ah, ah
		jz	short loc_50EF1
		inc	al

loc_50EF1:
		mov	ss:4731h, al

loc_50EF5:
		mov	ax, bx
		sub	ax, ss:4741h
		jge	short loc_50F2F
		or	ax, ax
		jns	short loc_50F04
		neg	ax

loc_50F04:
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_50F55
		div	dh
		or	ah, ah
		jz	short loc_50F17
		inc	al

loc_50F17:
		xor	ah, ah
		sub	ss:4731h, ax
		jle	short loc_50F55
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax

loc_50F2F:
		mov	di, bx
		shl	di, 1
		add	di, ss:473Dh
		mov	di, ss:[di]
		add	di, bp
		mov	bx, ss:4747h
		mov	ah, ss:4731h

loc_50F47:
		lodsb
		add	dl, dh
		jnb	short loc_50F51
		mov	es:[di], al
		add	di, bx

loc_50F51:
		dec	ah
		jnz	short loc_50F47

loc_50F55:
		pop	ds
		pop	si
		ret
		push	ax
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Fh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		neg	ax
		add	ax, ss:4712h
		mov	di, ax
		mov	di, ss:[di]
		add	di, bx
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_50FA0
		mov	ah, al
		inc	ah

loc_50F8D:
		dec	ah
		jz	short loc_50F9F

loc_50F91:
		lodsb
		add	dl, dh
		jnb	short loc_50F8D
		mov	es:[di], al
		sub	di, bp
		dec	ah
		jnz	short loc_50F91

loc_50F9F:
		ret

loc_50FA0:
		push	bx
		mov	bx, ax

loc_50FA3:
		lodsb
		shr	al, 1
		jb	short loc_50FC0
		sub	bl, al
		mov	ah, al

loc_50FAC:
		lodsb
		add	dl, dh
		jnb	short loc_50FB6
		mov	es:[di], al
		sub	di, bp

loc_50FB6:
		dec	ah
		jnz	short loc_50FAC
		or	bl, bl
		jnz	short loc_50FA3
		jmp	short loc_50FD6

loc_50FC0:
		sub	bl, al
		mov	ah, al
		lodsb

loc_50FC5:
		add	dl, dh
		jnb	short loc_50FCE
		mov	es:[di], al
		sub	di, bp

loc_50FCE:
		dec	ah
		jnz	short loc_50FC5
		or	bl, bl
		jnz	short loc_50FA3

loc_50FD6:
		pop	bx
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_51025
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_50FF2:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_51008
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_50FF2
		jz	short loc_51019

loc_51008:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_50FF2

loc_51019:
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_51031

loc_51025:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_51031:
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Fh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		mov	bx, ss:4712h
		sub	bx, ax
		mov	ax, bx
		cmp	ax, ss:4741h
		jge	short loc_51059

loc_51056:
		jmp	loc_510F5

loc_51059:
		mov	ax, ss:4731h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:4745h
		jg	short loc_51056
		cmp	ax, ss:4741h
		jge	short loc_5109B
		mov	ax, ss:4741h
		sub	ax, bx
		neg	ax
		mov	ah, al
		xor	al, al
		inc	ah
		sub	al, dl
		sbb	ah, 0
		jb	short loc_510F5
		div	dh
		or	ah, ah
		jz	short loc_51097
		inc	al

loc_51097:
		mov	ss:4731h, al

loc_5109B:
		mov	ax, bx
		sub	ax, ss:4745h
		jle	short loc_510CF
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_510F5
		div	dh
		or	ah, ah
		jz	short loc_510B7
		inc	al

loc_510B7:
		xor	ah, ah
		sub	ss:4731h, ax
		jle	short loc_510F5
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax

loc_510CF:
		mov	di, bx
		shl	di, 1
		add	di, ss:473Dh
		mov	di, ss:[di]
		add	di, bp
		mov	bx, ss:4747h
		mov	ah, ss:4731h

loc_510E7:
		lodsb
		add	dl, dh
		jnb	short loc_510F1
		mov	es:[di], al
		sub	di, bx

loc_510F1:
		dec	ah
		jnz	short loc_510E7

loc_510F5:
		pop	ds
		pop	si
		ret

loc_510F8:
		mov	ss:4712h, bp
		mov	ch, ss:462Eh
		mov	cl, ss:46FAh
		mov	bp, bx
		cmp	bp, ss:4743h
		jle	short loc_51127

loc_51110:
		inc	word ptr ss:46F6h
		add	ch, dh
		jnb	short loc_51121
		dec	bp
		cmp	bp, ss:4743h
		jle	short loc_51127

loc_51121:
		dec	cl
		jnz	short loc_51110
		jz	short loc_51134

loc_51127:
		add	ch, dh
		jb	short loc_51139
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_51127

loc_51134:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_51139:
		mov	di, ss:46F6h

loc_5113E:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_51134
		cmp	[si+4], di
		jz	short loc_5116C
		jl	short loc_5114D
		jmp	short loc_51173

loc_5114D:
		add	si, 6
		shr	ax, 1
		jb	short loc_51158
		add	si, ax
		jmp	short loc_5116A

loc_51158:
		push	di
		mov	di, ax

loc_5115B:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_51165
		add	si, ax
		dec	si

loc_51165:
		sub	di, ax
		jnz	short loc_5115B
		pop	di

loc_5116A:
		jmp	short loc_5113E

loc_5116C:
		call	word ptr ss:488Ah
		jmp	short loc_51139

loc_51173:
		dec	bp
		cmp	bp, ss:473Fh
		jl	short loc_51184
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_51127

loc_51184:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_51189:
		mov	ss:4712h, bp
		mov	ch, ss:462Eh
		mov	cl, ss:46FAh
		mov	bp, bx
		cmp	bp, ss:473Fh
		jge	short loc_511B8

loc_511A1:
		inc	word ptr ss:46F6h
		add	ch, dh
		jnb	short loc_511B2
		inc	bp
		cmp	bp, ss:473Fh
		jge	short loc_511B8

loc_511B2:
		dec	cl
		jnz	short loc_511A1
		jz	short loc_511C5

loc_511B8:
		add	ch, dh
		jb	short loc_511CA
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_511B8

loc_511C5:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_511CA:
		mov	di, ss:46F6h

loc_511CF:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_511C5
		cmp	[si+4], di
		jz	short loc_511FD
		jl	short loc_511DE
		jmp	short loc_51204

loc_511DE:
		add	si, 6
		shr	ax, 1
		jb	short loc_511E9
		add	si, ax
		jmp	short loc_511FB

loc_511E9:
		push	di
		mov	di, ax

loc_511EC:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_511F6
		add	si, ax
		dec	si

loc_511F6:
		sub	di, ax
		jnz	short loc_511EC
		pop	di

loc_511FB:
		jmp	short loc_511CF

loc_511FD:
		call	word ptr ss:488Ah
		jmp	short loc_511CA

loc_51204:
		inc	bp
		cmp	bp, ss:4743h
		jg	short loc_51215
sub_50CA2		endp

; START OF FUNCTION CHUNK FOR sub_50CA2
		db 36h, 0FFh, 6, 0F6h
; END OF FUNCTION CHUNK FOR sub_50CA2
seg150		ends
