seg147		segment	para public 'CODE' use16
		assume cs:seg147
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

sub_398A2		proc far
		call	sub_3E701
		jb	short loc_398B9
		call	sub_3E3EE
		jnb	short loc_398BE
		mov	word ptr ss:51EEh, 269h
		jmp	short loc_398EA

loc_398B9:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_398BE:
		mov	word ptr ss:51EEh, 1D3h
		jmp	short loc_398EA
sub_398A2		endp

; ----------------------------------------------------------------------

sub_398C7		proc far
		call	sub_3E780
		jb	short loc_398DE
		call	sub_3E3EE
		jnb	short loc_398E3
		mov	word ptr ss:51EEh, 4FAh
		jmp	short loc_398EA

loc_398DE:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_398E3:
		mov	word ptr ss:51EEh, 464h

loc_398EA:
		xor	dx, dx

loc_398EC:
		mov	ss:4F90h, dx
		mov	ss:5074h, bx
		mov	ss:5076h, bp

loc_398FB:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_39903
		jmp	short loc_3997C

loc_39903:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_39930
		jl	short loc_39911
		jmp	short loc_39937

loc_39911:
		add	si, 6
		shr	ax, 1
		jb	short loc_3991C
		add	si, ax
		jmp	short loc_3992E

loc_3991C:
		push	di
		mov	di, ax

loc_3991F:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_39929
		add	si, ax
		dec	si

loc_39929:
		sub	di, ax
		jnz	short loc_3991F
		pop	di

loc_3992E:
		jmp	short loc_398FB

loc_39930:
		call	word ptr ss:51EEh
		jmp	short loc_398FB

loc_39937:
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	dx, ss:4F90h

loc_39946:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3997C
		mov	ax, 0
		add	dl, ch
		jnb	short loc_39963
		dec	bx
		cmp	cl, ch
		jl	short loc_39969
		mov	ax, 2
		jmp	short loc_39969

loc_39963:
		add	dh, cl
		jb	short loc_3996D
		jnb	short loc_39946

loc_39969:
		add	dh, cl
		jnb	short loc_39975

loc_3996D:
		inc	bp
		cmp	cl, ch
		jge	short loc_39975
		mov	ax, 2

loc_39975:
		mov	ss:4F96h, ax
		jmp	loc_398EC

loc_3997C:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_398C7		endp

; ----------------------------------------------------------------------

sub_39981		proc far
		call	sub_3E801
		jb	short loc_39998
		call	sub_3E3EE
		jnb	short loc_3999D
		mov	word ptr ss:51EEh, 269h
		jmp	short loc_399C9

loc_39998:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3999D:
		mov	word ptr ss:51EEh, 1D3h
		jmp	short loc_399C9
sub_39981		endp

; ----------------------------------------------------------------------

sub_399A6		proc far
		call	sub_3E880
		jb	short loc_399BD
		call	sub_3E3EE
		jnb	short loc_399C2
		mov	word ptr ss:51EEh, 4FAh
		jmp	short loc_399C9

loc_399BD:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_399C2:
		mov	word ptr ss:51EEh, 464h

loc_399C9:
		xor	dx, dx
		mov	ss:4F90h, dx

loc_399D0:
		mov	ss:5074h, bx
		mov	ss:5076h, bp

loc_399DA:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_399E3
		jmp	loc_39A6E

loc_399E3:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_39A10
		jl	short loc_399F1
		jmp	short loc_39A17

loc_399F1:
		add	si, 6
		shr	ax, 1
		jb	short loc_399FC
		add	si, ax
		jmp	short loc_39A0E

loc_399FC:
		push	di
		mov	di, ax

loc_399FF:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_39A09
		add	si, ax
		dec	si

loc_39A09:
		sub	di, ax
		jnz	short loc_399FF
		pop	di

loc_39A0E:
		jmp	short loc_399DA

loc_39A10:
		call	word ptr ss:51EEh
		jmp	short loc_399DA

loc_39A17:
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	dx, ss:4F90h

loc_39A26:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_39A6E
		mov	ax, 0
		add	dl, ch
		jnb	short loc_39A3C
		inc	bx
		jmp	short loc_39A42

loc_39A3C:
		add	dh, cl
		jb	short loc_39A46
		jnb	short loc_39A26

loc_39A42:
		add	dh, cl
		jnb	short loc_39A47

loc_39A46:
		dec	bp

loc_39A47:
		mov	ss:4F90h, dx
		cmp	cl, ch
		jge	short loc_39A5A

loc_39A50:
		add	dl, ch
		jb	short loc_39A64
		add	dh, cl
		jb	short loc_39A67
		jmp	short loc_39A50

loc_39A5A:
		add	dh, cl
		jb	short loc_39A64
		add	dl, ch
		jb	short loc_39A67
		jmp	short loc_39A5A

loc_39A64:
		mov	ax, 2

loc_39A67:
		mov	ss:4F96h, ax
		jmp	loc_399D0

loc_39A6E:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_399A6		endp

; START OF FUNCTION CHUNK FOR sub_399A6
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mov	bx, ss:5074h
		mov	di, ss:5076h
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
		add	di, ss:50A1h
		add	bx, ss:[di]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_39AF2
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_39ABA:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39AD0
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_39ABA
		jz	short loc_39AE1

loc_39AD0:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_39ABA

loc_39AE1:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		mov	cx, ss:5082h
		jmp	short loc_39AF8

loc_39AF2:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_39AF8:
		mov	ah, al
		mov	di, ss:4F96h
		add	di, 4ADCh
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:5095h, ax
		mov	ax, [si+2]
		jnb	short loc_39B5C
		push	ax
		add	si, 6
		mov	bx, ss:5095h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_39B25:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39B3B
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_39B25
		jz	short loc_39B4C

loc_39B3B:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_39B25

loc_39B4C:
		pop	es
		mov	cx, ss:5082h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_39B68

loc_39B5C:
		add	si, 6
		mov	di, si
		add	di, ss:5095h
		push	di
		push	ds

loc_39B68:
		add	ax, ss:506Eh
		mov	byte ptr ss:5090h, 0
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	di, ax
		mul	cl
		mov	ss:4F92h, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4F93h, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, bx
		cmp	ax, ss:50A7h
		jle	short loc_39BA5
		jmp	loc_39D01

loc_39BA5:
		sub	ax, ss:50A3h
		jge	short loc_39C00
		or	byte ptr ss:5090h, 1
		or	ax, ax
		jns	short loc_39BB8
		neg	ax

loc_39BB8:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:507Eh
		or	dx, dx
		jz	short loc_39BD5
		inc	ax

loc_39BD5:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_39C09
		push	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax

loc_39C00:
		mov	ax, bp
		cmp	ax, ss:50A9h
		jle	short loc_39C0C

loc_39C09:
		jmp	loc_39D01

loc_39C0C:
		sub	ax, ss:50A5h
		jge	short loc_39C67
		or	ax, ax
		jns	short loc_39C19
		neg	ax

loc_39C19:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:5080h
		or	dx, dx
		jz	short loc_39C36
		inc	ax

loc_39C36:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_39C09
		push	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		pop	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		or	byte ptr ss:5090h, 2

loc_39C67:
		mov	ax, ss:50A7h
		inc	ax
		sub	ax, bx
		jle	short loc_39C91
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	cl
		add	al, ss:4F92h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:50A3h
		jge	short loc_39C93

loc_39C91:
		jmp	short loc_39D01

loc_39C93:
		sub	ax, ss:50A7h
		jle	short loc_39CA0
		or	byte ptr ss:5090h, 4

loc_39CA0:
		mov	ax, ss:50A9h
		inc	ax
		sub	ax, bp
		jle	short loc_39C91
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	ch
		add	al, ss:4F93h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bp
		cmp	ax, ss:50A5h
		jge	short loc_39CCC
		jmp	short loc_39D01

loc_39CCC:
		sub	ax, ss:50A9h
		jle	short loc_39CD9
		or	byte ptr ss:5090h, 8

loc_39CD9:
		mov	ax, bp
		shl	bp, 1
		add	bp, ss:50A1h
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:5095h
		or	ah, ah
		jz	short loc_39D01
		mov	dx, ss:4F92h
		mov	di, ss:4F96h
		add	di, 4AE0h
		call	word ptr ss:[di]

loc_39D01:
		pop	ds
		pop	si
		ret
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mov	bx, ss:5074h
		mov	di, ss:5076h
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
		add	di, ss:50A1h
		add	bx, ss:[di]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_39D83
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_39D4B:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39D61
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_39D4B
		jz	short loc_39D72

loc_39D61:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_39D4B

loc_39D72:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		mov	cx, ss:5082h
		jmp	short loc_39D89

loc_39D83:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_39D89:
		mov	ah, al
		mov	di, ss:4F96h
		add	di, 4AE4h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:5095h, ax
		mov	ax, [si+2]
		jnb	short loc_39DED
		push	ax
		add	si, 6
		mov	bx, ss:5095h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_39DB6:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39DCC
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_39DB6
		jz	short loc_39DDD

loc_39DCC:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_39DB6

loc_39DDD:
		pop	es
		mov	cx, ss:5082h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_39DF9

loc_39DED:
		add	si, 6
		mov	di, si
		add	di, ss:5095h
		push	di
		push	ds

loc_39DF9:
		add	ax, ss:506Eh
		mov	byte ptr ss:5090h, 0
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	di, ax
		mul	cl
		mov	ss:4F92h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4F93h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bx
		cmp	ax, ss:50A3h
		jge	short loc_39E36
		jmp	loc_39F8C

loc_39E36:
		sub	ax, ss:50A7h
		jle	short loc_39E8B
		or	byte ptr ss:5090h, 4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:507Eh
		or	dx, dx
		jz	short loc_39E60
		inc	ax

loc_39E60:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_39E94
		push	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax

loc_39E8B:
		mov	ax, bp
		cmp	ax, ss:50A5h
		jge	short loc_39E97

loc_39E94:
		jmp	loc_39F8C

loc_39E97:
		sub	ax, ss:50A9h
		jle	short loc_39EEC
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:5080h
		or	dx, dx
		jz	short loc_39EBB
		inc	ax

loc_39EBB:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_39E94
		push	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		pop	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		or	byte ptr ss:5090h, 8

loc_39EEC:
		mov	ax, bx
		inc	ax
		sub	ax, ss:50A3h
		jle	short loc_39F19
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	cl
		add	al, ss:4F92h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:50A7h
		jle	short loc_39F1B

loc_39F19:
		jmp	short loc_39F8C

loc_39F1B:
		sub	ax, ss:50A3h
		jge	short loc_39F28
		or	byte ptr ss:5090h, 1

loc_39F28:
		mov	ax, bp
		inc	ax
		sub	ax, ss:50A5h
		jle	short loc_39F19
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	ch
		add	al, ss:4F93h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		sub	ax, bp
		neg	ax
		cmp	ax, ss:50A9h
		jle	short loc_39F57
		jmp	short loc_39F8C

loc_39F57:
		sub	ax, ss:50A5h
		jge	short loc_39F64
		or	byte ptr ss:5090h, 2

loc_39F64:
		mov	ax, bx
		shl	bp, 1
		add	bp, ss:50A1h
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:5095h
		or	ah, ah
		jz	short loc_39F8C
		mov	dx, ss:4F92h
		mov	di, ss:4F96h
		add	di, 4AE8h
		call	word ptr ss:[di]

loc_39F8C:
		pop	ds
		pop	si
		ret
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mov	bx, ss:5074h
		mov	bp, ss:5076h
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
		add	bp, ss:50A1h
		add	bx, [bp]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_3A010
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_39FD8:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39FEE
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_39FD8
		jz	short loc_39FFF

loc_39FEE:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_39FD8

loc_39FFF:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		mov	cx, ss:5082h
		jmp	short loc_3A016

loc_3A010:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_3A016:
		mov	ah, al
		mov	di, ss:4F96h
		add	di, 4AECh
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:5095h, ax
		mov	ax, [si+2]
		jnb	short loc_3A07A
		push	ax
		add	si, 6
		mov	bx, ss:5095h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3A043:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3A059
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3A043
		jz	short loc_3A06A

loc_3A059:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3A043

loc_3A06A:
		pop	es
		mov	cx, ss:5082h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3A086

loc_3A07A:
		add	si, 6
		mov	di, si
		add	di, ss:5095h
		push	di
		push	ds

loc_3A086:
		add	ax, ss:506Eh
		mov	byte ptr ss:5090h, 0
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	di, ax
		mul	cl
		mov	ss:4F92h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4F93h, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, bx
		cmp	ax, ss:50A3h
		jge	short loc_3A0C3
		jmp	loc_3A21C

loc_3A0C3:
		sub	ax, ss:50A7h
		jle	short loc_3A118
		or	byte ptr ss:5090h, 4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:507Eh
		or	dx, dx
		jz	short loc_3A0ED
		inc	ax

loc_3A0ED:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_3A121
		push	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax

loc_3A118:
		mov	ax, bp
		cmp	ax, ss:50A9h
		jle	short loc_3A124

loc_3A121:
		jmp	loc_3A21C

loc_3A124:
		sub	ax, ss:50A5h
		jge	short loc_3A17F
		or	ax, ax
		jns	short loc_3A131
		neg	ax

loc_3A131:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:5080h
		or	dx, dx
		jz	short loc_3A14E
		inc	ax

loc_3A14E:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_3A121
		push	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		pop	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		or	byte ptr ss:5090h, 2

loc_3A17F:
		mov	ax, bx
		inc	ax
		sub	ax, ss:50A3h
		jle	short loc_3A1AC
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	cl
		add	al, ss:4F92h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		mov	dx, bx
		sub	dx, ax
		cmp	dx, ss:50A7h
		jle	short loc_3A1AE

loc_3A1AC:
		jmp	short loc_3A21C

loc_3A1AE:
		cmp	dx, ss:50A3h
		jge	short loc_3A1BB
		or	byte ptr ss:5090h, 1

loc_3A1BB:
		mov	ax, ss:50A9h
		inc	ax
		sub	ax, bp
		jle	short loc_3A1AC
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	ch
		add	al, ss:4F93h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bp
		cmp	ax, ss:50A5h
		jge	short loc_3A1E7
		jmp	short loc_3A21C

loc_3A1E7:
		cmp	ax, ss:50A9h
		jle	short loc_3A1F4
		or	byte ptr ss:5090h, 8

loc_3A1F4:
		mov	ax, bp
		shl	bp, 1
		add	bp, ss:50A1h
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:5095h
		or	ah, ah
		jz	short loc_3A21C
		mov	dx, ss:4F92h
		mov	di, ss:4F96h
		add	di, 4AF0h
		call	word ptr ss:[di]

loc_3A21C:
		pop	ds
		pop	si
		ret
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mov	bx, ss:5074h
		mov	bp, ss:5076h
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
		add	bp, ss:50A1h
		add	bx, [bp]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_3A2A0
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3A268:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3A27E
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3A268
		jz	short loc_3A28F

loc_3A27E:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3A268

loc_3A28F:
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		mov	cx, ss:5082h
		jmp	short loc_3A2A6

loc_3A2A0:
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_3A2A6:
		mov	ah, al
		mov	di, ss:4F96h
		add	di, 4AF4h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:5095h, ax
		mov	ax, [si+2]
		jnb	short loc_3A30A
		push	ax
		add	si, 6
		mov	bx, ss:5095h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3A2D3:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3A2E9
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3A2D3
		jz	short loc_3A2FA

loc_3A2E9:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3A2D3

loc_3A2FA:
		pop	es
		mov	cx, ss:5082h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3A316

loc_3A30A:
		add	si, 6
		mov	di, si
		add	di, ss:5095h
		push	di
		push	ds

loc_3A316:
		add	ax, ss:506Eh
		mov	byte ptr ss:5090h, 0
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	di, ax
		mul	cl
		mov	ss:4F92h, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4F93h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bx
		cmp	ax, ss:50A7h
		jle	short loc_3A353
		jmp	loc_3A4A6

loc_3A353:
		sub	ax, ss:50A3h
		jge	short loc_3A3AA
		neg	ax
		or	byte ptr ss:5090h, 1
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:507Eh
		or	dx, dx
		jz	short loc_3A37F
		inc	ax

loc_3A37F:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_3A3B3
		push	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax

loc_3A3AA:
		mov	ax, bp
		cmp	ax, ss:50A5h
		jge	short loc_3A3B6

loc_3A3B3:
		jmp	loc_3A4A6

loc_3A3B6:
		sub	ax, ss:50A9h
		jle	short loc_3A40B
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:5080h
		or	dx, dx
		jz	short loc_3A3DA
		inc	ax

loc_3A3DA:
		add	si, ax
		sub	ss:5095h, ax
		jle	short loc_3A3B3
		push	ax
		mul	ch
		add	ss:4F93h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		pop	ax
		mul	cl
		add	ss:4F92h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		or	byte ptr ss:5090h, 8

loc_3A40B:
		mov	ax, ss:50A7h
		inc	ax
		sub	ax, bx
		jle	short loc_3A435
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	cl
		add	al, ss:4F92h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:50A3h
		jge	short loc_3A437

loc_3A435:
		jmp	short loc_3A4A6

loc_3A437:
		cmp	ax, ss:50A7h
		jle	short loc_3A444
		or	byte ptr ss:5090h, 4

loc_3A444:
		mov	ax, bp
		inc	ax
		sub	ax, ss:50A5h
		jle	short loc_3A435
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	ch
		add	al, ss:4F93h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		neg	ax
		add	ax, bp
		cmp	ax, ss:50A9h
		jle	short loc_3A471
		jmp	short loc_3A4A6

loc_3A471:
		cmp	ax, ss:50A5h
		jge	short loc_3A47E
		or	byte ptr ss:5090h, 2

loc_3A47E:
		mov	ax, bx
		shl	bp, 1
		add	bp, ss:50A1h
		add	bx, [bp]
		mov	bp, ax
		mov	ah, ss:5095h
		or	ah, ah
		jz	short loc_3A4A6
		mov	dx, ss:4F92h
		mov	di, ss:4F96h
		add	di, 4AF8h
		call	word ptr ss:[di]

loc_3A4A6:
		pop	ds
		pop	si
		ret

loc_3A4A9:
		mov	di, ss:50ABh
		jmp	short loc_3A4C5

loc_3A4B0:
		add	dl, cl
		jb	short loc_3A4BE
		add	dh, ch
		jb	short loc_3A4C3
		inc	si
		dec	ah
		jnz	short loc_3A4B0
		ret

loc_3A4BE:
		inc	bx
		add	dh, ch
		jnb	short loc_3A4C5

loc_3A4C3:
		add	bx, di

loc_3A4C5:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A4B0
		ret
		test	byte ptr ss:5090h, 0Ch
		jz	short loc_3A4A9
		mov	di, ss:50ABh
		jmp	short loc_3A500

loc_3A4DD:
		add	dl, cl
		jb	short loc_3A4EB
		add	dh, ch
		jb	short loc_3A4F7
		inc	si
		dec	ah
		jnz	short loc_3A4DD
		ret

loc_3A4EB:
		dec	word ptr ss:509Bh
		jle	short loc_3A508
		inc	bx
		add	dh, ch
		jnb	short loc_3A500

loc_3A4F7:
		dec	word ptr ss:509Dh
		jle	short loc_3A508
		add	bx, di

loc_3A500:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A4DD

loc_3A508:
		ret

loc_3A509:
		mov	di, ss:50ABh
		jmp	short loc_3A528

loc_3A510:
		add	dl, cl
		jb	short loc_3A51E
		add	dh, ch
		jb	short loc_3A526
		lodsb
		dec	ah
		jnz	short loc_3A510
		ret

loc_3A51E:
		inc	bx
		add	dh, ch
		jnb	short loc_3A528
		mov	es:[bx], al

loc_3A526:
		add	bx, di

loc_3A528:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A510
		ret
		mov	di, ss:50ABh
		test	byte ptr ss:5090h, 1
		jnz	short loc_3A54D
		test	byte ptr ss:5090h, 0Ch
		jz	short loc_3A509
		mov	ah, ss:5095h
		jmp	short loc_3A598

loc_3A54D:
		cmp	bp, ss:50A5h
		jz	short loc_3A598
		push	si
		push	dx

loc_3A556:
		dec	si
		sub	dl, cl
		jnb	short loc_3A56A
		sub	dh, ch
		jnb	short loc_3A56E
		mov	al, [si]
		sub	bx, di
		mov	es:[bx], al
		add	bx, di
		jmp	short loc_3A56E

loc_3A56A:
		sub	dh, ch
		jnb	short loc_3A556

loc_3A56E:
		pop	dx
		pop	si
		jmp	short loc_3A598

loc_3A572:
		add	dl, cl
		jb	short loc_3A580
		add	dh, ch
		jb	short loc_3A58F
		lodsb
		dec	ah
		jnz	short loc_3A572
		ret

loc_3A580:
		dec	word ptr ss:509Bh
		jle	short loc_3A5A0
		inc	bx
		add	dh, ch
		jnb	short loc_3A598
		mov	es:[bx], al

loc_3A58F:
		add	bx, di
		dec	word ptr ss:509Dh
		jle	short loc_3A5A0

loc_3A598:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A572

loc_3A5A0:
		ret

loc_3A5A1:
		mov	di, ss:50ABh
		jmp	short loc_3A5BD

loc_3A5A8:
		add	dl, cl
		jb	short loc_3A5B6
		add	dh, ch
		jb	short loc_3A5BB
		inc	si
		dec	ah
		jnz	short loc_3A5A8
		ret

loc_3A5B6:
		inc	bx
		add	dh, ch
		jnb	short loc_3A5BD

loc_3A5BB:
		sub	bx, di

loc_3A5BD:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A5A8
		ret
		test	byte ptr ss:5090h, 6
		jz	short loc_3A5A1
		mov	di, ss:50ABh
		jmp	short loc_3A5F8

loc_3A5D5:
		add	dl, cl
		jb	short loc_3A5E3
		add	dh, ch
		jb	short loc_3A5EF
		inc	si
		dec	ah
		jnz	short loc_3A5D5
		ret

loc_3A5E3:
		dec	word ptr ss:509Bh
		jle	short loc_3A600
		inc	bx
		add	dh, ch
		jnb	short loc_3A5F8

loc_3A5EF:
		dec	word ptr ss:509Dh
		jle	short loc_3A600
		sub	bx, di

loc_3A5F8:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A5D5

loc_3A600:
		ret

loc_3A601:
		mov	di, ss:50ABh
		jmp	short loc_3A620

loc_3A608:
		add	dl, cl
		jb	short loc_3A616
		add	dh, ch
		jb	short loc_3A629
		lodsb
		dec	ah
		jnz	short loc_3A608
		ret

loc_3A616:
		add	dh, ch
		jnb	short loc_3A61F
		sub	bx, di
		mov	es:[bx], al

loc_3A61F:
		inc	bx

loc_3A620:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A608
		ret

loc_3A629:
		sub	bx, di
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A608
		ret
		mov	di, ss:50ABh
		test	byte ptr ss:5090h, 8
		jnz	short loc_3A64B
		test	byte ptr ss:5090h, 6
		jz	short loc_3A601
		jmp	short loc_3A6A6

loc_3A64B:
		cmp	bp, ss:50A3h
		jz	short loc_3A6A6
		push	si
		push	dx

loc_3A654:
		dec	si
		sub	dl, cl
		jnb	short loc_3A666
		sub	dh, ch
		jnb	short loc_3A66A
		mov	al, [si]
		dec	bx
		mov	es:[bx], al
		inc	bx
		jmp	short loc_3A66A

loc_3A666:
		sub	dh, ch
		jnb	short loc_3A654

loc_3A66A:
		pop	dx
		pop	si
		jmp	short loc_3A6A6

loc_3A66E:
		add	dl, cl
		jb	short loc_3A67C
		add	dh, ch
		jb	short loc_3A69D
		lodsb
		dec	ah
		jnz	short loc_3A66E
		ret

loc_3A67C:
		add	dh, ch
		jnb	short loc_3A68C
		dec	word ptr ss:509Dh
		jle	short loc_3A6AE
		sub	bx, di
		mov	es:[bx], al

loc_3A68C:
		dec	word ptr ss:509Bh
		jle	short loc_3A6AE
		inc	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A66E
		ret

loc_3A69D:
		sub	bx, di
		dec	word ptr ss:509Dh
		jle	short loc_3A6AE

loc_3A6A6:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A66E

loc_3A6AE:
		ret

loc_3A6AF:
		mov	di, ss:50ABh
		jmp	short loc_3A6CB

loc_3A6B6:
		add	dl, cl
		jb	short loc_3A6C4
		add	dh, ch
		jb	short loc_3A6C9
		inc	si
		dec	ah
		jnz	short loc_3A6B6
		ret

loc_3A6C4:
		dec	bx
		add	dh, ch
		jnb	short loc_3A6CB

loc_3A6C9:
		add	bx, di

loc_3A6CB:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A6B6
		ret
		test	byte ptr ss:5090h, 9
		jz	short loc_3A6AF
		mov	di, ss:50ABh
		jmp	short loc_3A706

loc_3A6E3:
		add	dl, cl
		jb	short loc_3A6F1
		add	dh, ch
		jb	short loc_3A6FD
		inc	si
		dec	ah
		jnz	short loc_3A6E3
		ret

loc_3A6F1:
		dec	word ptr ss:509Bh
		jle	short loc_3A70E
		dec	bx
		add	dh, ch
		jnb	short loc_3A706

loc_3A6FD:
		dec	word ptr ss:509Dh
		jle	short loc_3A70E
		add	bx, di

loc_3A706:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A6E3

loc_3A70E:
		ret

loc_3A70F:
		mov	di, ss:50ABh
		jmp	short loc_3A72E

loc_3A716:
		add	dl, cl
		jb	short loc_3A724
		add	dh, ch
		jb	short loc_3A72C
		lodsb
		dec	ah
		jnz	short loc_3A716
		ret

loc_3A724:
		dec	bx
		add	dh, ch
		jnb	short loc_3A72E
		mov	es:[bx], al

loc_3A72C:
		add	bx, di

loc_3A72E:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A716
		ret
		mov	di, ss:50ABh
		test	byte ptr ss:5090h, 4
		jnz	short loc_3A74E
		test	byte ptr ss:5090h, 9
		jz	short loc_3A70F
		jmp	short loc_3A799

loc_3A74E:
		cmp	bp, ss:50A5h
		jz	short loc_3A799
		push	si
		push	dx

loc_3A757:
		dec	si
		sub	dl, cl
		jnb	short loc_3A76B
		sub	dh, ch
		jnb	short loc_3A76F
		sub	bx, di
		mov	al, [si]
		mov	es:[bx], al
		add	bx, di
		jmp	short loc_3A76F

loc_3A76B:
		sub	dh, ch
		jnb	short loc_3A757

loc_3A76F:
		pop	dx
		pop	si
		jmp	short loc_3A799

loc_3A773:
		add	dl, cl
		jb	short loc_3A781
		add	dh, ch
		jb	short loc_3A790
		lodsb
		dec	ah
		jnz	short loc_3A773
		ret

loc_3A781:
		dec	word ptr ss:509Bh
		jle	short loc_3A7A1
		dec	bx
		add	dh, ch
		jnb	short loc_3A799
		mov	es:[bx], al

loc_3A790:
		add	bx, di
		dec	word ptr ss:509Dh
		jle	short loc_3A7A1

loc_3A799:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A773

loc_3A7A1:
		ret

loc_3A7A2:
		mov	di, ss:50ABh
		jmp	short loc_3A7BE

loc_3A7A9:
		add	dl, cl
		jb	short loc_3A7B7
		add	dh, ch
		jb	short loc_3A7BC
		inc	si
		dec	ah
		jnz	short loc_3A7A9
		ret

loc_3A7B7:
		dec	bx
		add	dh, ch
		jnb	short loc_3A7BE

loc_3A7BC:
		sub	bx, di

loc_3A7BE:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A7A9
		ret
		test	byte ptr ss:5090h, 3
		jz	short loc_3A7A2
		mov	di, ss:50ABh
		jmp	short loc_3A7F9

loc_3A7D6:
		add	dl, cl
		jb	short loc_3A7E4
		add	dh, ch
		jb	short loc_3A7F0
		inc	si
		dec	ah
		jnz	short loc_3A7D6
		ret

loc_3A7E4:
		dec	word ptr ss:509Bh
		jle	short loc_3A801
		dec	bx
		add	dh, ch
		jnb	short loc_3A7F9

loc_3A7F0:
		dec	word ptr ss:509Dh
		jle	short loc_3A801
		sub	bx, di

loc_3A7F9:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A7D6

loc_3A801:
		ret

loc_3A802:
		mov	di, ss:50ABh
		jmp	short loc_3A82C

loc_3A809:
		add	dl, cl
		jb	short loc_3A817
		add	dh, ch
		jb	short loc_3A82A
		lodsb
		dec	ah
		jnz	short loc_3A809
		ret

loc_3A817:
		add	dh, ch
		jnb	short loc_3A820
		sub	bx, di
		mov	es:[bx], al

loc_3A820:
		dec	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A809
		ret

loc_3A82A:
		sub	bx, di

loc_3A82C:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A809
		ret
		mov	di, ss:50ABh
		test	byte ptr ss:5090h, 8
		jnz	short loc_3A84C
		test	byte ptr ss:5090h, 3
		jz	short loc_3A802
		jmp	short loc_3A8A7

loc_3A84C:
		cmp	bp, ss:50A7h
		jge	short loc_3A8A7
		push	si
		push	dx

loc_3A855:
		dec	si
		sub	dl, cl
		jnb	short loc_3A867
		sub	dh, ch
		jnb	short loc_3A86B
		inc	bx
		mov	al, [si]
		mov	es:[bx], al
		dec	bx
		jmp	short loc_3A86B

loc_3A867:
		sub	dh, ch
		jnb	short loc_3A855

loc_3A86B:
		pop	dx
		pop	si
		jmp	short loc_3A8A7

loc_3A86F:
		add	dl, cl
		jb	short loc_3A87D
		add	dh, ch
		jb	short loc_3A89E
		lodsb
		dec	ah
		jnz	short loc_3A86F
		ret

loc_3A87D:
		add	dh, ch
		jnb	short loc_3A88D
		dec	word ptr ss:509Dh
		jle	short loc_3A8AF
		sub	bx, di
		mov	es:[bx], al

loc_3A88D:
		dec	word ptr ss:509Bh
		jle	short loc_3A8AF
		dec	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A86F
		ret

loc_3A89E:
		sub	bx, di
		dec	word ptr ss:509Dh
		jle	short loc_3A8AF

loc_3A8A7:
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_3A86F

loc_3A8AF:
		ret
; END OF FUNCTION CHUNK FOR sub_399A6

; ----------------------------------------------------------------------

sub_3A8B0		proc far
		call	sub_3E8FF
		jb	short loc_3A8C7
		call	sub_3E3EE
		jnb	short loc_3A8CC
		mov	word ptr ss:51EEh, 787h
		jmp	short loc_3A8F8

loc_3A8C7:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3A8CC:
		mov	word ptr ss:51EEh, 6EFh
		jmp	short loc_3A8F8
sub_3A8B0		endp

; ----------------------------------------------------------------------

sub_3A8D5		proc far
		call	sub_3E980
		jb	short loc_3A8EC
		call	sub_3E3EE
		jnb	short loc_3A8F1
		mov	word ptr ss:51EEh, 0A17h
		jmp	short loc_3A8F8

loc_3A8EC:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3A8F1:
		mov	word ptr ss:51EEh, 97Fh

loc_3A8F8:
		xor	dx, dx
		mov	ss:4F90h, dx

loc_3A8FF:
		mov	ss:5074h, bx
		mov	ss:5076h, bp

loc_3A909:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3A912
		jmp	loc_3A99D

loc_3A912:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_3A93F
		jl	short loc_3A920
		jmp	short loc_3A946

loc_3A920:
		add	si, 6
		shr	ax, 1
		jb	short loc_3A92B
		add	si, ax
		jmp	short loc_3A93D

loc_3A92B:
		push	di
		mov	di, ax

loc_3A92E:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3A938
		add	si, ax
		dec	si

loc_3A938:
		sub	di, ax
		jnz	short loc_3A92E
		pop	di

loc_3A93D:
		jmp	short loc_3A909

loc_3A93F:
		call	word ptr ss:51EEh
		jmp	short loc_3A909

loc_3A946:
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	dx, ss:4F90h

loc_3A955:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3A99D
		mov	ax, 0
		add	dl, ch
		jnb	short loc_3A96B
		dec	bx
		jmp	short loc_3A971

loc_3A96B:
		add	dh, cl
		jb	short loc_3A975
		jnb	short loc_3A955

loc_3A971:
		add	dh, cl
		jnb	short loc_3A976

loc_3A975:
		dec	bp

loc_3A976:
		mov	ss:4F90h, dx
		cmp	cl, ch
		jge	short loc_3A989

loc_3A97F:
		add	dl, ch
		jb	short loc_3A993
		add	dh, cl
		jb	short loc_3A996
		jmp	short loc_3A97F

loc_3A989:
		add	dh, cl
		jb	short loc_3A993
		add	dl, ch
		jb	short loc_3A996
		jmp	short loc_3A989

loc_3A993:
		mov	ax, 2

loc_3A996:
		mov	ss:4F96h, ax
		jmp	loc_3A8FF

loc_3A99D:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3A8D5		endp

; ----------------------------------------------------------------------

sub_3A9A2		proc far
		call	sub_3E9FF
		jb	short loc_3A9B9
		call	sub_3E3EE
		jnb	short loc_3A9BE
		mov	word ptr ss:51EEh, 787h
		jmp	short loc_3A9EA

loc_3A9B9:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3A9BE:
		mov	word ptr ss:51EEh, 6EFh
		jmp	short loc_3A9EA
sub_3A9A2		endp

; ----------------------------------------------------------------------

sub_3A9C7		proc far
		call	sub_3EA7C
		jb	short loc_3A9DE
		call	sub_3E3EE
		jnb	short loc_3A9E3
		mov	word ptr ss:51EEh, 0A17h
		jmp	short loc_3A9EA

loc_3A9DE:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3A9E3:
		mov	word ptr ss:51EEh, 97Fh

loc_3A9EA:
		xor	dx, dx

loc_3A9EC:
		mov	ss:4F90h, dx
		mov	ss:5074h, bx
		mov	ss:5076h, bp

loc_3A9FB:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3AA03
		jmp	short loc_3AA7A

loc_3AA03:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_3AA30
		jl	short loc_3AA11
		jmp	short loc_3AA37

loc_3AA11:
		add	si, 6
		shr	ax, 1
		jb	short loc_3AA1C
		add	si, ax
		jmp	short loc_3AA2E

loc_3AA1C:
		push	di
		mov	di, ax

loc_3AA1F:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3AA29
		add	si, ax
		dec	si

loc_3AA29:
		sub	di, ax
		jnz	short loc_3AA1F
		pop	di

loc_3AA2E:
		jmp	short loc_3A9FB

loc_3AA30:
		call	word ptr ss:51EEh
		jmp	short loc_3A9FB

loc_3AA37:
		mov	bx, ss:5074h
		mov	bp, ss:5076h
		mov	dx, ss:4F90h

loc_3AA46:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3AA7A
		mov	ax, 0
		add	dl, ch
		jnb	short loc_3AA67
		inc	bx
		cmp	cl, ch
		jl	short loc_3AA61
		mov	ax, 2

loc_3AA61:
		add	dh, cl
		jb	short loc_3AA6B
		jmp	short loc_3AA73

loc_3AA67:
		add	dh, cl
		jnb	short loc_3AA46

loc_3AA6B:
		inc	bp
		cmp	cl, ch
		jge	short loc_3AA73
		mov	ax, 2

loc_3AA73:
		mov	ss:4F96h, ax
		jmp	loc_3A9EC

loc_3AA7A:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3A9C7		endp

; START OF FUNCTION CHUNK FOR sub_3A9C7
		db 0
; END OF FUNCTION CHUNK FOR sub_3A9C7
seg147		ends
