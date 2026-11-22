seg145		segment	para public 'CODE' use16
		assume cs:seg145
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E2h, 0FAh

loc_4B0F2:
		db 5Fh, 5Eh, 8Bh, 0E5h, 5Dh, 0CBh

; ----------------------------------------------------------------------

sub_4B0F8		proc far
		call	sub_4FF57
		jb	short loc_4B10F
		call	sub_4FC44
		jnb	short loc_4B114
		mov	word ptr ss:488Ah, 26Fh
		jmp	short loc_4B140

loc_4B10F:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4B114:
		mov	word ptr ss:488Ah, 1D9h
		jmp	short loc_4B140
sub_4B0F8		endp

; ----------------------------------------------------------------------

sub_4B11D		proc far
		call	sub_4FFD6
		jb	short loc_4B134
		call	sub_4FC44
		jnb	short loc_4B139
		mov	word ptr ss:488Ah, 500h
		jmp	short loc_4B140

loc_4B134:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4B139:
		mov	word ptr ss:488Ah, 46Ah

loc_4B140:
		xor	dx, dx

loc_4B142:
		mov	ss:462Ch, dx
		mov	ss:4710h, bx
		mov	ss:4712h, bp

loc_4B151:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4B159
		jmp	short loc_4B1D2

loc_4B159:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4B186
		jl	short loc_4B167
		jmp	short loc_4B18D

loc_4B167:
		add	si, 6
		shr	ax, 1
		jb	short loc_4B172
		add	si, ax
		jmp	short loc_4B184

loc_4B172:
		push	di
		mov	di, ax

loc_4B175:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4B17F
		add	si, ax
		dec	si

loc_4B17F:
		sub	di, ax
		jnz	short loc_4B175
		pop	di

loc_4B184:
		jmp	short loc_4B151

loc_4B186:
		call	word ptr ss:488Ah
		jmp	short loc_4B151

loc_4B18D:
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	dx, ss:462Ch

loc_4B19C:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4B1D2
		mov	ax, 0
		add	dl, ch
		jnb	short loc_4B1B9
		dec	bx
		cmp	cl, ch
		jl	short loc_4B1BF
		mov	ax, 2
		jmp	short loc_4B1BF

loc_4B1B9:
		add	dh, cl
		jb	short loc_4B1C3
		jnb	short loc_4B19C

loc_4B1BF:
		add	dh, cl
		jnb	short loc_4B1CB

loc_4B1C3:
		inc	bp
		cmp	cl, ch
		jge	short loc_4B1CB
		mov	ax, 2

loc_4B1CB:
		mov	ss:4632h, ax
		jmp	loc_4B142

loc_4B1D2:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4B11D		endp

; ----------------------------------------------------------------------

sub_4B1D7		proc far
		call	sub_50057
		jb	short loc_4B1EE
		call	sub_4FC44
		jnb	short loc_4B1F3
		mov	word ptr ss:488Ah, 26Fh
		jmp	short loc_4B21F

loc_4B1EE:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4B1F3:
		mov	word ptr ss:488Ah, 1D9h
		jmp	short loc_4B21F
sub_4B1D7		endp

; ----------------------------------------------------------------------

sub_4B1FC		proc far
		call	sub_500D6
		jb	short loc_4B213
		call	sub_4FC44
		jnb	short loc_4B218
		mov	word ptr ss:488Ah, 500h
		jmp	short loc_4B21F

loc_4B213:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4B218:
		mov	word ptr ss:488Ah, 46Ah

loc_4B21F:
		xor	dx, dx
		mov	ss:462Ch, dx

loc_4B226:
		mov	ss:4710h, bx
		mov	ss:4712h, bp

loc_4B230:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4B239
		jmp	loc_4B2C4

loc_4B239:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4B266
		jl	short loc_4B247
		jmp	short loc_4B26D

loc_4B247:
		add	si, 6
		shr	ax, 1
		jb	short loc_4B252
		add	si, ax
		jmp	short loc_4B264

loc_4B252:
		push	di
		mov	di, ax

loc_4B255:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4B25F
		add	si, ax
		dec	si

loc_4B25F:
		sub	di, ax
		jnz	short loc_4B255
		pop	di

loc_4B264:
		jmp	short loc_4B230

loc_4B266:
		call	word ptr ss:488Ah
		jmp	short loc_4B230

loc_4B26D:
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	dx, ss:462Ch

loc_4B27C:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4B2C4
		mov	ax, 0
		add	dl, ch
		jnb	short loc_4B292
		inc	bx
		jmp	short loc_4B298

loc_4B292:
		add	dh, cl
		jb	short loc_4B29C
		jnb	short loc_4B27C

loc_4B298:
		add	dh, cl
		jnb	short loc_4B29D

loc_4B29C:
		dec	bp

loc_4B29D:
		mov	ss:462Ch, dx
		cmp	cl, ch
		jge	short loc_4B2B0

loc_4B2A6:
		add	dl, ch
		jb	short loc_4B2BA
		add	dh, cl
		jb	short loc_4B2BD
		jmp	short loc_4B2A6

loc_4B2B0:
		add	dh, cl
		jb	short loc_4B2BA
		add	dl, ch
		jb	short loc_4B2BD
		jmp	short loc_4B2B0

loc_4B2BA:
		mov	ax, 2

loc_4B2BD:
		mov	ss:4632h, ax
		jmp	loc_4B226

loc_4B2C4:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4B1FC		endp

; START OF FUNCTION CHUNK FOR sub_4B1FC
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mov	bx, ss:4710h
		mov	di, ss:4712h
		push	ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		add	di, ax
		shl	di, 1
		add	di, ss:473Dh
		add	bx, ss:[di]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_4B348
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4B310:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4B326
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4B310
		jz	short loc_4B337

loc_4B326:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4B310

loc_4B337:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		mov	cx, ss:471Eh
		jmp	short loc_4B34E

loc_4B348:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_4B34E:
		mov	ah, al
		mov	di, ss:4632h
		add	di, 4178h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		mov	ax, [si+2]
		jnb	short loc_4B3B2
		push	ax
		add	si, 6
		mov	bx, ss:4731h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4B37B:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4B391
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4B37B
		jz	short loc_4B3A2

loc_4B391:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4B37B

loc_4B3A2:
		pop	es
		mov	cx, ss:471Eh
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4B3BE

loc_4B3B2:
		add	si, 6
		mov	di, si
		add	di, ss:4731h
		push	di
		push	ds

loc_4B3BE:
		add	ax, ss:470Ah
		mov	byte ptr ss:472Ch, 0
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	di, ax
		mul	cl
		mov	ss:462Eh, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:462Fh, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, bx
		cmp	ax, ss:4743h
		jle	short loc_4B3FB
		jmp	loc_4B557

loc_4B3FB:
		sub	ax, ss:473Fh
		jge	short loc_4B456
		or	byte ptr ss:472Ch, 1
		or	ax, ax
		jns	short loc_4B40E
		neg	ax

loc_4B40E:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Eh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ah
		or	dx, dx
		jz	short loc_4B42B
		inc	ax

loc_4B42B:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4B45F
		push	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax

loc_4B456:
		mov	ax, bp
		cmp	ax, ss:4745h
		jle	short loc_4B462

loc_4B45F:
		jmp	loc_4B557

loc_4B462:
		sub	ax, ss:4741h
		jge	short loc_4B4BD
		or	ax, ax
		jns	short loc_4B46F
		neg	ax

loc_4B46F:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Fh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ch
		or	dx, dx
		jz	short loc_4B48C
		inc	ax

loc_4B48C:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4B45F
		push	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		pop	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		or	byte ptr ss:472Ch, 2

loc_4B4BD:
		mov	ax, ss:4743h
		inc	ax
		sub	ax, bx
		jle	short loc_4B4E7
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	cl
		add	al, ss:462Eh
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:473Fh
		jge	short loc_4B4E9

loc_4B4E7:
		jmp	short loc_4B557

loc_4B4E9:
		sub	ax, ss:4743h
		jle	short loc_4B4F6
		or	byte ptr ss:472Ch, 4

loc_4B4F6:
		mov	ax, ss:4745h
		inc	ax
		sub	ax, bp
		jle	short loc_4B4E7
		mov	ss:4739h, ax
		mov	ax, ss:4731h
		mul	ch
		add	al, ss:462Fh
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bp
		cmp	ax, ss:4741h
		jge	short loc_4B522
		jmp	short loc_4B557

loc_4B522:
		sub	ax, ss:4745h
		jle	short loc_4B52F
		or	byte ptr ss:472Ch, 8

loc_4B52F:
		mov	ax, bp
		shl	bp, 1
		add	bp, ss:473Dh
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:4731h
		or	ah, ah
		jz	short loc_4B557
		mov	dx, ss:462Eh
		mov	di, ss:4632h
		add	di, 417Ch
		call	word ptr ss:[di]

loc_4B557:
		pop	ds
		pop	si
		ret
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mov	bx, ss:4710h
		mov	di, ss:4712h
		push	ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		sub	di, ax
		shl	di, 1
		add	di, ss:473Dh
		add	bx, ss:[di]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_4B5D9
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4B5A1:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4B5B7
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4B5A1
		jz	short loc_4B5C8

loc_4B5B7:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4B5A1

loc_4B5C8:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		mov	cx, ss:471Eh
		jmp	short loc_4B5DF

loc_4B5D9:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_4B5DF:
		mov	ah, al
		mov	di, ss:4632h
		add	di, 4180h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		mov	ax, [si+2]
		jnb	short loc_4B643
		push	ax
		add	si, 6
		mov	bx, ss:4731h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4B60C:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4B622
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4B60C
		jz	short loc_4B633

loc_4B622:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4B60C

loc_4B633:
		pop	es
		mov	cx, ss:471Eh
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4B64F

loc_4B643:
		add	si, 6
		mov	di, si
		add	di, ss:4731h
		push	di
		push	ds

loc_4B64F:
		add	ax, ss:470Ah
		mov	byte ptr ss:472Ch, 0
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	di, ax
		mul	cl
		mov	ss:462Eh, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:462Fh, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bx
		cmp	ax, ss:473Fh
		jge	short loc_4B68C
		jmp	loc_4B7E2

loc_4B68C:
		sub	ax, ss:4743h
		jle	short loc_4B6E1
		or	byte ptr ss:472Ch, 4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Eh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ah
		or	dx, dx
		jz	short loc_4B6B6
		inc	ax

loc_4B6B6:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4B6EA
		push	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax

loc_4B6E1:
		mov	ax, bp
		cmp	ax, ss:4741h
		jge	short loc_4B6ED

loc_4B6EA:
		jmp	loc_4B7E2

loc_4B6ED:
		sub	ax, ss:4745h
		jle	short loc_4B742
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Fh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ch
		or	dx, dx
		jz	short loc_4B711
		inc	ax

loc_4B711:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4B6EA
		push	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		pop	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		or	byte ptr ss:472Ch, 8

loc_4B742:
		mov	ax, bx
		inc	ax
		sub	ax, ss:473Fh
		jle	short loc_4B76F
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	cl
		add	al, ss:462Eh
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:4743h
		jle	short loc_4B771

loc_4B76F:
		jmp	short loc_4B7E2

loc_4B771:
		sub	ax, ss:473Fh
		jge	short loc_4B77E
		or	byte ptr ss:472Ch, 1

loc_4B77E:
		mov	ax, bp
		inc	ax
		sub	ax, ss:4741h
		jle	short loc_4B76F
		mov	ss:4739h, ax
		mov	ax, ss:4731h
		mul	ch
		add	al, ss:462Fh
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		sub	ax, bp
		neg	ax
		cmp	ax, ss:4745h
		jle	short loc_4B7AD
		jmp	short loc_4B7E2

loc_4B7AD:
		sub	ax, ss:4741h
		jge	short loc_4B7BA
		or	byte ptr ss:472Ch, 2

loc_4B7BA:
		mov	ax, bx
		shl	bp, 1
		add	bp, ss:473Dh
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:4731h
		or	ah, ah
		jz	short loc_4B7E2
		mov	dx, ss:462Eh
		mov	di, ss:4632h
		add	di, 4184h
		call	word ptr ss:[di]

loc_4B7E2:
		pop	ds
		pop	si
		ret
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	di, ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		shl	bp, 1
		add	bp, ss:473Dh
		add	bx, [bp]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_4B866
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4B82E:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4B844
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4B82E
		jz	short loc_4B855

loc_4B844:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4B82E

loc_4B855:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		mov	cx, ss:471Eh
		jmp	short loc_4B86C

loc_4B866:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_4B86C:
		mov	ah, al
		mov	di, ss:4632h
		add	di, 4188h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		mov	ax, [si+2]
		jnb	short loc_4B8D0
		push	ax
		add	si, 6
		mov	bx, ss:4731h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4B899:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4B8AF
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4B899
		jz	short loc_4B8C0

loc_4B8AF:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4B899

loc_4B8C0:
		pop	es
		mov	cx, ss:471Eh
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4B8DC

loc_4B8D0:
		add	si, 6
		mov	di, si
		add	di, ss:4731h
		push	di
		push	ds

loc_4B8DC:
		add	ax, ss:470Ah
		mov	byte ptr ss:472Ch, 0
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	di, ax
		mul	cl
		mov	ss:462Eh, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:462Fh, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, bx
		cmp	ax, ss:473Fh
		jge	short loc_4B919
		jmp	loc_4BA72

loc_4B919:
		sub	ax, ss:4743h
		jle	short loc_4B96E
		or	byte ptr ss:472Ch, 4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Eh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ah
		or	dx, dx
		jz	short loc_4B943
		inc	ax

loc_4B943:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4B977
		push	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax

loc_4B96E:
		mov	ax, bp
		cmp	ax, ss:4745h
		jle	short loc_4B97A

loc_4B977:
		jmp	loc_4BA72

loc_4B97A:
		sub	ax, ss:4741h
		jge	short loc_4B9D5
		or	ax, ax
		jns	short loc_4B987
		neg	ax

loc_4B987:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Fh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ch
		or	dx, dx
		jz	short loc_4B9A4
		inc	ax

loc_4B9A4:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4B977
		push	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		pop	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		or	byte ptr ss:472Ch, 2

loc_4B9D5:
		mov	ax, bx
		inc	ax
		sub	ax, ss:473Fh
		jle	short loc_4BA02
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	cl
		add	al, ss:462Eh
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		mov	dx, bx
		sub	dx, ax
		cmp	dx, ss:4743h
		jle	short loc_4BA04

loc_4BA02:
		jmp	short loc_4BA72

loc_4BA04:
		cmp	dx, ss:473Fh
		jge	short loc_4BA11
		or	byte ptr ss:472Ch, 1

loc_4BA11:
		mov	ax, ss:4745h
		inc	ax
		sub	ax, bp
		jle	short loc_4BA02
		mov	ss:4739h, ax
		mov	ax, ss:4731h
		mul	ch
		add	al, ss:462Fh
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bp
		cmp	ax, ss:4741h
		jge	short loc_4BA3D
		jmp	short loc_4BA72

loc_4BA3D:
		cmp	ax, ss:4745h
		jle	short loc_4BA4A
		or	byte ptr ss:472Ch, 8

loc_4BA4A:
		mov	ax, bp
		shl	bp, 1
		add	bp, ss:473Dh
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:4731h
		or	ah, ah
		jz	short loc_4BA72
		mov	dx, ss:462Eh
		mov	di, ss:4632h
		add	di, 418Ch
		call	word ptr ss:[di]

loc_4BA72:
		pop	ds
		pop	si
		ret
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	di, ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		shl	bp, 1
		add	bp, ss:473Dh
		add	bx, [bp]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_4BAF6
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4BABE:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4BAD4
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4BABE
		jz	short loc_4BAE5

loc_4BAD4:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4BABE

loc_4BAE5:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		mov	cx, ss:471Eh
		jmp	short loc_4BAFC

loc_4BAF6:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_4BAFC:
		mov	ah, al
		mov	di, ss:4632h
		add	di, 4190h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		mov	ax, [si+2]
		jnb	short loc_4BB60
		push	ax
		add	si, 6
		mov	bx, ss:4731h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4BB29:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4BB3F
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4BB29
		jz	short loc_4BB50

loc_4BB3F:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4BB29

loc_4BB50:
		pop	es
		mov	cx, ss:471Eh
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4BB6C

loc_4BB60:
		add	si, 6
		mov	di, si
		add	di, ss:4731h
		push	di
		push	ds

loc_4BB6C:
		add	ax, ss:470Ah
		mov	byte ptr ss:472Ch, 0
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	di, ax
		mul	cl
		mov	ss:462Eh, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:462Fh, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bx
		cmp	ax, ss:4743h
		jle	short loc_4BBA9
		jmp	loc_4BCFC

loc_4BBA9:
		sub	ax, ss:473Fh
		jge	short loc_4BC00
		neg	ax
		or	byte ptr ss:472Ch, 1
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Eh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ah
		or	dx, dx
		jz	short loc_4BBD5
		inc	ax

loc_4BBD5:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4BC09
		push	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax

loc_4BC00:
		mov	ax, bp
		cmp	ax, ss:4741h
		jge	short loc_4BC0C

loc_4BC09:
		jmp	loc_4BCFC

loc_4BC0C:
		sub	ax, ss:4745h
		jle	short loc_4BC61
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:462Fh
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:471Ch
		or	dx, dx
		jz	short loc_4BC30
		inc	ax

loc_4BC30:
		add	si, ax
		sub	ss:4731h, ax
		jle	short loc_4BC09
		push	ax
		mul	ch
		add	ss:462Fh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		pop	ax
		mul	cl
		add	ss:462Eh, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		or	byte ptr ss:472Ch, 8

loc_4BC61:
		mov	ax, ss:4743h
		inc	ax
		sub	ax, bx
		jle	short loc_4BC8B
		mov	ss:4737h, ax
		mov	ax, ss:4731h
		mul	cl
		add	al, ss:462Eh
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:473Fh
		jge	short loc_4BC8D

loc_4BC8B:
		jmp	short loc_4BCFC

loc_4BC8D:
		cmp	ax, ss:4743h
		jle	short loc_4BC9A
		or	byte ptr ss:472Ch, 4

loc_4BC9A:
		mov	ax, bp
		inc	ax
		sub	ax, ss:4741h
		jle	short loc_4BC8B
		mov	ss:4739h, ax
		mov	ax, ss:4731h
		mul	ch
		add	al, ss:462Fh
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		neg	ax
		add	ax, bp
		cmp	ax, ss:4745h
		jle	short loc_4BCC7
		jmp	short loc_4BCFC

loc_4BCC7:
		cmp	ax, ss:4741h
		jge	short loc_4BCD4
		or	byte ptr ss:472Ch, 2

loc_4BCD4:
		mov	ax, bx
		shl	bp, 1
		add	bp, ss:473Dh
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:4731h
		or	ah, ah
		jz	short loc_4BCFC
		mov	dx, ss:462Eh
		mov	di, ss:4632h
		add	di, 4194h
		call	word ptr ss:[di]

loc_4BCFC:
		pop	ds
		pop	si
		ret

loc_4BCFF:
		mov	di, ss:4747h
		jmp	short loc_4BD1B

loc_4BD06:
		add	dl, cl
		jb	short loc_4BD14
		add	dh, ch
		jb	short loc_4BD19
		inc	si
		dec	ah
		jnz	short loc_4BD06
		ret

loc_4BD14:
		inc	bx
		add	dh, ch
		jnb	short loc_4BD1B

loc_4BD19:
		add	bx, di

loc_4BD1B:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BD06
		ret
		test	byte ptr ss:472Ch, 0Ch
		jz	short loc_4BCFF
		mov	di, ss:4747h
		jmp	short loc_4BD56

loc_4BD33:
		add	dl, cl
		jb	short loc_4BD41
		add	dh, ch
		jb	short loc_4BD4D
		inc	si
		dec	ah
		jnz	short loc_4BD33
		ret

loc_4BD41:
		dec	word ptr ss:4737h
		jle	short loc_4BD5E
		inc	bx
		add	dh, ch
		jnb	short loc_4BD56

loc_4BD4D:
		dec	word ptr ss:4739h
		jle	short loc_4BD5E
		add	bx, di

loc_4BD56:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BD33

loc_4BD5E:
		ret

loc_4BD5F:
		mov	di, ss:4747h
		jmp	short loc_4BD7E

loc_4BD66:
		add	dl, cl
		jb	short loc_4BD74
		add	dh, ch
		jb	short loc_4BD7C
		lodsb
		dec	ah
		jnz	short loc_4BD66
		ret

loc_4BD74:
		inc	bx
		add	dh, ch
		jnb	short loc_4BD7E
		mov	es:[bx], al

loc_4BD7C:
		add	bx, di

loc_4BD7E:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BD66
		ret
		mov	di, ss:4747h
		test	byte ptr ss:472Ch, 1
		jnz	short loc_4BDA3
		test	byte ptr ss:472Ch, 0Ch
		jz	short loc_4BD5F
		mov	ah, ss:4731h
		jmp	short loc_4BDEE

loc_4BDA3:
		cmp	bp, ss:4741h
		jz	short loc_4BDEE
		push	si
		push	dx

loc_4BDAC:
		dec	si
		sub	dl, cl
		jnb	short loc_4BDC0
		sub	dh, ch
		jnb	short loc_4BDC4
		mov	al, [si]
		sub	bx, di
		mov	es:[bx], al
		add	bx, di
		jmp	short loc_4BDC4

loc_4BDC0:
		sub	dh, ch
		jnb	short loc_4BDAC

loc_4BDC4:
		pop	dx
		pop	si
		jmp	short loc_4BDEE

loc_4BDC8:
		add	dl, cl
		jb	short loc_4BDD6
		add	dh, ch
		jb	short loc_4BDE5
		lodsb
		dec	ah
		jnz	short loc_4BDC8
		ret

loc_4BDD6:
		dec	word ptr ss:4737h
		jle	short loc_4BDF6
		inc	bx
		add	dh, ch
		jnb	short loc_4BDEE
		mov	es:[bx], al

loc_4BDE5:
		add	bx, di
		dec	word ptr ss:4739h
		jle	short loc_4BDF6

loc_4BDEE:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BDC8

loc_4BDF6:
		ret

loc_4BDF7:
		mov	di, ss:4747h
		jmp	short loc_4BE13

loc_4BDFE:
		add	dl, cl
		jb	short loc_4BE0C
		add	dh, ch
		jb	short loc_4BE11
		inc	si
		dec	ah
		jnz	short loc_4BDFE
		ret

loc_4BE0C:
		inc	bx
		add	dh, ch
		jnb	short loc_4BE13

loc_4BE11:
		sub	bx, di

loc_4BE13:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BDFE
		ret
		test	byte ptr ss:472Ch, 6
		jz	short loc_4BDF7
		mov	di, ss:4747h
		jmp	short loc_4BE4E

loc_4BE2B:
		add	dl, cl
		jb	short loc_4BE39
		add	dh, ch
		jb	short loc_4BE45
		inc	si
		dec	ah
		jnz	short loc_4BE2B
		ret

loc_4BE39:
		dec	word ptr ss:4737h
		jle	short loc_4BE56
		inc	bx
		add	dh, ch
		jnb	short loc_4BE4E

loc_4BE45:
		dec	word ptr ss:4739h
		jle	short loc_4BE56
		sub	bx, di

loc_4BE4E:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BE2B

loc_4BE56:
		ret

loc_4BE57:
		mov	di, ss:4747h
		jmp	short loc_4BE76

loc_4BE5E:
		add	dl, cl
		jb	short loc_4BE6C
		add	dh, ch
		jb	short loc_4BE7F
		lodsb
		dec	ah
		jnz	short loc_4BE5E
		ret

loc_4BE6C:
		add	dh, ch
		jnb	short loc_4BE75
		sub	bx, di
		mov	es:[bx], al

loc_4BE75:
		inc	bx

loc_4BE76:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BE5E
		ret

loc_4BE7F:
		sub	bx, di
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BE5E
		ret
		mov	di, ss:4747h
		test	byte ptr ss:472Ch, 8
		jnz	short loc_4BEA1
		test	byte ptr ss:472Ch, 6
		jz	short loc_4BE57
		jmp	short loc_4BEFC

loc_4BEA1:
		cmp	bp, ss:473Fh
		jz	short loc_4BEFC
		push	si
		push	dx

loc_4BEAA:
		dec	si
		sub	dl, cl
		jnb	short loc_4BEBC
		sub	dh, ch
		jnb	short loc_4BEC0
		mov	al, [si]
		dec	bx
		mov	es:[bx], al
		inc	bx
		jmp	short loc_4BEC0

loc_4BEBC:
		sub	dh, ch
		jnb	short loc_4BEAA

loc_4BEC0:
		pop	dx
		pop	si
		jmp	short loc_4BEFC

loc_4BEC4:
		add	dl, cl
		jb	short loc_4BED2
		add	dh, ch
		jb	short loc_4BEF3
		lodsb
		dec	ah
		jnz	short loc_4BEC4
		ret

loc_4BED2:
		add	dh, ch
		jnb	short loc_4BEE2
		dec	word ptr ss:4739h
		jle	short loc_4BF04
		sub	bx, di
		mov	es:[bx], al

loc_4BEE2:
		dec	word ptr ss:4737h
		jle	short loc_4BF04
		inc	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BEC4
		ret

loc_4BEF3:
		sub	bx, di
		dec	word ptr ss:4739h
		jle	short loc_4BF04

loc_4BEFC:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BEC4

loc_4BF04:
		ret

loc_4BF05:
		mov	di, ss:4747h
		jmp	short loc_4BF21

loc_4BF0C:
		add	dl, cl
		jb	short loc_4BF1A
		add	dh, ch
		jb	short loc_4BF1F
		inc	si
		dec	ah
		jnz	short loc_4BF0C
		ret

loc_4BF1A:
		dec	bx
		add	dh, ch
		jnb	short loc_4BF21

loc_4BF1F:
		add	bx, di

loc_4BF21:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BF0C
		ret
		test	byte ptr ss:472Ch, 9
		jz	short loc_4BF05
		mov	di, ss:4747h
		jmp	short loc_4BF5C

loc_4BF39:
		add	dl, cl
		jb	short loc_4BF47
		add	dh, ch
		jb	short loc_4BF53
		inc	si
		dec	ah
		jnz	short loc_4BF39
		ret

loc_4BF47:
		dec	word ptr ss:4737h
		jle	short loc_4BF64
		dec	bx
		add	dh, ch
		jnb	short loc_4BF5C

loc_4BF53:
		dec	word ptr ss:4739h
		jle	short loc_4BF64
		add	bx, di

loc_4BF5C:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BF39

loc_4BF64:
		ret

loc_4BF65:
		mov	di, ss:4747h
		jmp	short loc_4BF84

loc_4BF6C:
		add	dl, cl
		jb	short loc_4BF7A
		add	dh, ch
		jb	short loc_4BF82
		lodsb
		dec	ah
		jnz	short loc_4BF6C
		ret

loc_4BF7A:
		dec	bx
		add	dh, ch
		jnb	short loc_4BF84
		mov	es:[bx], al

loc_4BF82:
		add	bx, di

loc_4BF84:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BF6C
		ret
		mov	di, ss:4747h
		test	byte ptr ss:472Ch, 4
		jnz	short loc_4BFA4
		test	byte ptr ss:472Ch, 9
		jz	short loc_4BF65
		jmp	short loc_4BFEF

loc_4BFA4:
		cmp	bp, ss:4741h
		jz	short loc_4BFEF
		push	si
		push	dx

loc_4BFAD:
		dec	si
		sub	dl, cl
		jnb	short loc_4BFC1
		sub	dh, ch
		jnb	short loc_4BFC5
		sub	bx, di
		mov	al, [si]
		mov	es:[bx], al
		add	bx, di
		jmp	short loc_4BFC5

loc_4BFC1:
		sub	dh, ch
		jnb	short loc_4BFAD

loc_4BFC5:
		pop	dx
		pop	si
		jmp	short loc_4BFEF

loc_4BFC9:
		add	dl, cl
		jb	short loc_4BFD7
		add	dh, ch
		jb	short loc_4BFE6
		lodsb
		dec	ah
		jnz	short loc_4BFC9
		ret

loc_4BFD7:
		dec	word ptr ss:4737h
		jle	short loc_4BFF7
		dec	bx
		add	dh, ch
		jnb	short loc_4BFEF
		mov	es:[bx], al

loc_4BFE6:
		add	bx, di
		dec	word ptr ss:4739h
		jle	short loc_4BFF7

loc_4BFEF:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BFC9

loc_4BFF7:
		ret

loc_4BFF8:
		mov	di, ss:4747h
		jmp	short loc_4C014

loc_4BFFF:
		add	dl, cl
		jb	short loc_4C00D
		add	dh, ch
		jb	short loc_4C012
		inc	si
		dec	ah
		jnz	short loc_4BFFF
		ret

loc_4C00D:
		dec	bx
		add	dh, ch
		jnb	short loc_4C014

loc_4C012:
		sub	bx, di

loc_4C014:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4BFFF
		ret
		test	byte ptr ss:472Ch, 3
		jz	short loc_4BFF8
		mov	di, ss:4747h
		jmp	short loc_4C04F

loc_4C02C:
		add	dl, cl
		jb	short loc_4C03A
		add	dh, ch
		jb	short loc_4C046
		inc	si
		dec	ah
		jnz	short loc_4C02C
		ret

loc_4C03A:
		dec	word ptr ss:4737h
		jle	short loc_4C057
		dec	bx
		add	dh, ch
		jnb	short loc_4C04F

loc_4C046:
		dec	word ptr ss:4739h
		jle	short loc_4C057
		sub	bx, di

loc_4C04F:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4C02C

loc_4C057:
		ret

loc_4C058:
		mov	di, ss:4747h
		jmp	short loc_4C082

loc_4C05F:
		add	dl, cl
		jb	short loc_4C06D
		add	dh, ch
		jb	short loc_4C080
		lodsb
		dec	ah
		jnz	short loc_4C05F
		ret

loc_4C06D:
		add	dh, ch
		jnb	short loc_4C076
		sub	bx, di
		mov	es:[bx], al

loc_4C076:
		dec	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4C05F
		ret

loc_4C080:
		sub	bx, di

loc_4C082:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4C05F
		ret
		mov	di, ss:4747h
		test	byte ptr ss:472Ch, 8
		jnz	short loc_4C0A2
		test	byte ptr ss:472Ch, 3
		jz	short loc_4C058
		jmp	short loc_4C0FD

loc_4C0A2:
		cmp	bp, ss:4743h
		jge	short loc_4C0FD
		push	si
		push	dx

loc_4C0AB:
		dec	si
		sub	dl, cl
		jnb	short loc_4C0BD
		sub	dh, ch
		jnb	short loc_4C0C1
		inc	bx
		mov	al, [si]
		mov	es:[bx], al
		dec	bx
		jmp	short loc_4C0C1

loc_4C0BD:
		sub	dh, ch
		jnb	short loc_4C0AB

loc_4C0C1:
		pop	dx
		pop	si
		jmp	short loc_4C0FD

loc_4C0C5:
		add	dl, cl
		jb	short loc_4C0D3
		add	dh, ch
		jb	short loc_4C0F4
		lodsb
		dec	ah
		jnz	short loc_4C0C5
		ret

loc_4C0D3:
		add	dh, ch
		jnb	short loc_4C0E3
		dec	word ptr ss:4739h
		jle	short loc_4C105
		sub	bx, di
		mov	es:[bx], al

loc_4C0E3:
		dec	word ptr ss:4737h
		jle	short loc_4C105
		dec	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4C0C5
		ret

loc_4C0F4:
		sub	bx, di
		dec	word ptr ss:4739h
		jle	short loc_4C105

loc_4C0FD:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_4C0C5

loc_4C105:
		ret
; END OF FUNCTION CHUNK FOR sub_4B1FC

; ----------------------------------------------------------------------

sub_4C106		proc far
		call	sub_50155
		jb	short loc_4C11D
		call	sub_4FC44
		jnb	short loc_4C122
		mov	word ptr ss:488Ah, 78Dh
		jmp	short loc_4C14E

loc_4C11D:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C122:
		mov	word ptr ss:488Ah, 6F5h
		jmp	short loc_4C14E
sub_4C106		endp

; ----------------------------------------------------------------------

sub_4C12B		proc far
		call	sub_501D6
		jb	short loc_4C142
		call	sub_4FC44
		jnb	short loc_4C147
		mov	word ptr ss:488Ah, 0A1Dh
		jmp	short loc_4C14E

loc_4C142:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C147:
		mov	word ptr ss:488Ah, 985h

loc_4C14E:
		xor	dx, dx
		mov	ss:462Ch, dx

loc_4C155:
		mov	ss:4710h, bx
		mov	ss:4712h, bp

loc_4C15F:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4C168
		jmp	loc_4C1F3

loc_4C168:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4C195
		jl	short loc_4C176
		jmp	short loc_4C19C

loc_4C176:
		add	si, 6
		shr	ax, 1
		jb	short loc_4C181
		add	si, ax
		jmp	short loc_4C193

loc_4C181:
		push	di
		mov	di, ax

loc_4C184:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4C18E
		add	si, ax
		dec	si

loc_4C18E:
		sub	di, ax
		jnz	short loc_4C184
		pop	di

loc_4C193:
		jmp	short loc_4C15F

loc_4C195:
		call	word ptr ss:488Ah
		jmp	short loc_4C15F

loc_4C19C:
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	dx, ss:462Ch

loc_4C1AB:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4C1F3
		mov	ax, 0
		add	dl, ch
		jnb	short loc_4C1C1
		dec	bx
		jmp	short loc_4C1C7

loc_4C1C1:
		add	dh, cl
		jb	short loc_4C1CB
		jnb	short loc_4C1AB

loc_4C1C7:
		add	dh, cl
		jnb	short loc_4C1CC

loc_4C1CB:
		dec	bp

loc_4C1CC:
		mov	ss:462Ch, dx
		cmp	cl, ch
		jge	short loc_4C1DF

loc_4C1D5:
		add	dl, ch
		jb	short loc_4C1E9
		add	dh, cl
		jb	short loc_4C1EC
		jmp	short loc_4C1D5

loc_4C1DF:
		add	dh, cl
		jb	short loc_4C1E9
		add	dl, ch
		jb	short loc_4C1EC
		jmp	short loc_4C1DF

loc_4C1E9:
		mov	ax, 2

loc_4C1EC:
		mov	ss:4632h, ax
		jmp	loc_4C155

loc_4C1F3:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4C12B		endp

; ----------------------------------------------------------------------

sub_4C1F8		proc far
		call	sub_50255
		jb	short loc_4C20F
		call	sub_4FC44
		jnb	short loc_4C214
		mov	word ptr ss:488Ah, 78Dh
		jmp	short loc_4C240

loc_4C20F:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C214:
		mov	word ptr ss:488Ah, 6F5h
		jmp	short loc_4C240
sub_4C1F8		endp

; ----------------------------------------------------------------------

sub_4C21D		proc far
		call	sub_502D2
		jb	short loc_4C234
		call	sub_4FC44
		jnb	short loc_4C239
		mov	word ptr ss:488Ah, 0A1Dh
		jmp	short loc_4C240

loc_4C234:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4C239:
		mov	word ptr ss:488Ah, 985h

loc_4C240:
		xor	dx, dx

loc_4C242:
		mov	ss:462Ch, dx
		mov	ss:4710h, bx
		mov	ss:4712h, bp

loc_4C251:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_4C259
		jmp	short loc_4C2D0

loc_4C259:
		mov	dx, [si+4]
		cmp	dx, ss:46F6h
		jz	short loc_4C286
		jl	short loc_4C267
		jmp	short loc_4C28D

loc_4C267:
		add	si, 6
		shr	ax, 1
		jb	short loc_4C272
		add	si, ax
		jmp	short loc_4C284

loc_4C272:
		push	di
		mov	di, ax

loc_4C275:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4C27F
		add	si, ax
		dec	si

loc_4C27F:
		sub	di, ax
		jnz	short loc_4C275
		pop	di

loc_4C284:
		jmp	short loc_4C251

loc_4C286:
		call	word ptr ss:488Ah
		jmp	short loc_4C251

loc_4C28D:
		mov	bx, ss:4710h
		mov	bp, ss:4712h
		mov	dx, ss:462Ch

loc_4C29C:
		inc	word ptr ss:46F6h
		dec	word ptr ss:46FAh
		jz	short loc_4C2D0
		mov	ax, 0
		add	dl, ch
		jnb	short loc_4C2BD
		inc	bx
		cmp	cl, ch
		jl	short loc_4C2B7
		mov	ax, 2

loc_4C2B7:
		add	dh, cl
		jb	short loc_4C2C1
		jmp	short loc_4C2C9

loc_4C2BD:
		add	dh, cl
		jnb	short loc_4C29C

loc_4C2C1:
		inc	bp
		cmp	cl, ch
		jge	short loc_4C2C9
		mov	ax, 2

loc_4C2C9:
		mov	ss:4632h, ax
		jmp	loc_4C242
sub_4C21D		endp
seg145		ends
