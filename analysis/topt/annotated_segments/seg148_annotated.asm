seg148		segment	para public 'CODE' use16
		assume cs:seg148
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

sub_3AA80		proc far
		call	sub_3ECED
		jb	short loc_3AAA5
		call	sub_3E3EE
		jnb	short loc_3AAAA
		mov	word ptr ss:51EEh, 0DD1h
		mov	ax, 0EBCh
		cmp	bl, bh
		jb	short loc_3AA9F
		mov	ax, 11FAh

loc_3AA9F:
		mov	ss:51F0h, ax
		jmp	short loc_3AB00

loc_3AAA5:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3AAAA:
		mov	word ptr ss:51EEh, 45Eh
		mov	ax, 4B5h
		cmp	bl, bh
		jb	short loc_3AABB
		mov	ax, 550h

loc_3AABB:
		mov	ss:51F0h, ax
		jmp	short loc_3AB00
sub_3AA80		endp

; ----------------------------------------------------------------------

sub_3AAC1		proc far
		call	sub_3EC50
		jb	short loc_3AAE6
		call	sub_3E3EE
		jnb	short loc_3AAEB
		mov	word ptr ss:51EEh, 5EAh
		mov	ax, 6D9h
		cmp	bl, bh
		jb	short loc_3AAE0
		mov	ax, 0A3Bh

loc_3AAE0:
		mov	ss:51F0h, ax
		jmp	short loc_3AB00

loc_3AAE6:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3AAEB:
		mov	word ptr ss:51EEh, 2E5h
		mov	ax, 338h
		cmp	bl, bh
		jb	short loc_3AAFC
		mov	ax, 3C4h

loc_3AAFC:
		mov	ss:51F0h, ax

loc_3AB00:
		mov	word ptr ss:4F90h, 0

loc_3AB07:
		mov	dx, ss:5080h
		mov	cx, ss:507Eh
		add	ss:4F90h, dl
		adc	dh, 0
		add	ss:4F91h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:5086h, cx
		or	cx, cx
		jnz	short loc_3AB2F
		jmp	loc_3ABDC

loc_3AB2F:
		xor	ax, ax
		mov	al, cl
		sub	ss:5074h, ax
		mov	al, ch
		add	ss:5076h, ax

loc_3AB3F:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3AB48
		jmp	loc_3ABEB

loc_3AB48:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_3AB76
		jl	short loc_3AB57
		jmp	loc_3ABDC

loc_3AB57:
		add	si, 6
		shr	ax, 1
		jb	short loc_3AB62
		add	si, ax
		jmp	short loc_3AB74

loc_3AB62:
		push	di
		mov	di, ax

loc_3AB65:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3AB6F
		add	si, ax
		dec	si

loc_3AB6F:
		sub	di, ax
		jnz	short loc_3AB65
		pop	di

loc_3AB74:
		jmp	short loc_3AB3F

loc_3AB76:
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3ABC6
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3AB8F:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3ABA5
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3AB8F
		jz	short loc_3ABB6

loc_3ABA5:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3AB8F

loc_3ABB6:
		pop	es
		pop	ax
		mov	bx, ss:5082h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3ABD2

loc_3ABC6:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3ABD2:
		call	word ptr ss:51EEh
		pop	ds
		pop	si
		jmp	loc_3AB3F

loc_3ABDC:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3ABEB
		jmp	loc_3AB07

loc_3ABEB:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3AAC1		endp

; ----------------------------------------------------------------------

sub_3ABF0		proc far
		call	sub_3ED8C
		jb	short loc_3AC15
		call	sub_3E3EE
		jnb	short loc_3AC1A
		mov	word ptr ss:51EEh, 5EAh
		mov	ax, 6D9h
		cmp	bl, bh
		jb	short loc_3AC0F
		mov	ax, 0A3Bh

loc_3AC0F:
		mov	ss:51F0h, ax
		jmp	short loc_3AC70

loc_3AC15:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3AC1A:
		mov	word ptr ss:51EEh, 2E5h
		mov	ax, 338h
		cmp	bl, bh
		jb	short loc_3AC2B
		mov	ax, 3C4h

loc_3AC2B:
		mov	ss:51F0h, ax
		jmp	short loc_3AC70
sub_3ABF0		endp

; ----------------------------------------------------------------------

sub_3AC31		proc far
		call	sub_3EE29
		jb	short loc_3AC56
		call	sub_3E3EE
		jnb	short loc_3AC5B
		mov	word ptr ss:51EEh, 0DD1h
		mov	ax, 0EBCh
		cmp	bl, bh
		jb	short loc_3AC50
		mov	ax, 11FAh

loc_3AC50:
		mov	ss:51F0h, ax
		jmp	short loc_3AC70

loc_3AC56:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3AC5B:
		mov	word ptr ss:51EEh, 45Eh
		mov	ax, 4B5h
		cmp	bl, bh
		jb	short loc_3AC6C
		mov	ax, 550h

loc_3AC6C:
		mov	ss:51F0h, ax

loc_3AC70:
		xor	dx, dx
		mov	ss:4F90h, dx

loc_3AC77:
		mov	dx, ss:5080h
		mov	cx, ss:507Eh
		add	ss:4F90h, dl
		adc	dh, 0
		add	ss:4F91h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:5086h, cx
		or	cx, cx
		jnz	short loc_3AC9F
		jmp	loc_3AD3C

loc_3AC9F:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3ACA8
		jmp	loc_3AD60

loc_3ACA8:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_3ACD6
		jl	short loc_3ACB7
		jmp	loc_3AD3C

loc_3ACB7:
		add	si, 6
		shr	ax, 1
		jb	short loc_3ACC2
		add	si, ax
		jmp	short loc_3ACD4

loc_3ACC2:
		push	di
		mov	di, ax

loc_3ACC5:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3ACCF
		add	si, ax
		dec	si

loc_3ACCF:
		sub	di, ax
		jnz	short loc_3ACC5
		pop	di

loc_3ACD4:
		jmp	short loc_3AC9F

loc_3ACD6:
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3AD26
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3ACEF:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3AD05
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3ACEF
		jz	short loc_3AD16

loc_3AD05:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3ACEF

loc_3AD16:
		pop	es
		pop	ax
		mov	bx, ss:5082h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3AD32

loc_3AD26:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3AD32:
		call	word ptr ss:51EEh
		pop	ds
		pop	si
		jmp	loc_3AC9F

loc_3AD3C:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3AD60
		mov	cx, ss:5086h
		xor	ax, ax
		mov	al, cl
		add	ss:5074h, ax
		mov	al, ch
		sub	ss:5076h, ax
		jmp	loc_3AC77

loc_3AD60:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3AC31		endp

; START OF FUNCTION CHUNK FOR sub_3AC31
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5076h
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5074h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:51F0h
		mov	cx, ss:5080h
		mov	al, ss:4F93h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	cx, ss:5086h
		mov	dh, dl
		or	ch, ch
		jz	short loc_3ADE5

loc_3ADD9:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	ch, 0
		jnz	short loc_3ADD9

loc_3ADE5:
		mov	ch, al

loc_3ADE7:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3AE1F

loc_3ADEF:
		mov	al, [si]

loc_3ADF1:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:50ABh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_3AE04:
		add	dl, bl
		jnb	short loc_3AE0B
		dec	cl
		inc	di

loc_3AE0B:
		add	ch, bh
		jnb	short loc_3AE04

loc_3AE0F:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_3AE0F
		dec	byte ptr ss:5085h
		jnz	short loc_3ADF1

loc_3AE1F:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3AE26:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3AE43
		or	ch, ch
		jz	short loc_3AE26
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3ADEF

loc_3AE43:
		ret
		mov	cx, ss:507Eh
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch
		mov	cx, ss:5086h
		mov	ah, ss:4F93h
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_3AE74

loc_3AE68:
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	ch, 0
		jnz	short loc_3AE68

loc_3AE74:
		mov	ch, ss:4F93h

loc_3AE79:
		mov	bp, ss:50ABh
		mov	al, [si]
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3AEB4

loc_3AE88:
		mov	al, [si]

loc_3AE8A:
		push	cx
		push	di

loc_3AE8C:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3AE8C
		pop	di
		pop	cx
		inc	di

loc_3AE98:
		add	ch, bh
		jnb	short loc_3AEA0
		inc	cl
		add	di, bp

loc_3AEA0:
		add	dl, bl
		jnb	short loc_3AE98

loc_3AEA4:
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_3AEA4
		dec	byte ptr ss:5084h
		jnz	short loc_3AE8A

loc_3AEB4:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3AEBB:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3AEDD
		or	ch, ch
		jle	short loc_3AEBB
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3AE88

loc_3AEDD:
		ret
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5076h
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5074h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:51F0h
		mov	cx, ss:5080h
		mov	al, ss:4F93h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		mov	cl, ss:5086h
		mov	al, ss:5087h
		or	al, al
		jz	short loc_3AF71

loc_3AF66:
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_3AF66

loc_3AF71:
		mov	ch, al

loc_3AF73:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3AFAB

loc_3AF7B:
		mov	al, [si]

loc_3AF7D:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:50ABh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_3AF90:
		add	dl, bl
		jnb	short loc_3AF97
		inc	cl
		dec	di

loc_3AF97:
		add	ch, bh
		jnb	short loc_3AF90

loc_3AF9B:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_3AF9B
		dec	byte ptr ss:5085h
		jnz	short loc_3AF7D

loc_3AFAB:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3AFB2:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3AFCF
		or	ch, ch
		jz	short loc_3AFB2
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3AF7B

loc_3AFCF:
		ret
		mov	cx, ss:507Eh
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch
		mov	cx, ss:5086h
		mov	ah, ss:4F93h
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_3B000

loc_3AFF4:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	ch, 0
		jg	short loc_3AFF4

loc_3B000:
		mov	ch, ss:4F93h

loc_3B005:
		mov	bp, ss:50ABh
		mov	al, [si]
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3B040

loc_3B014:
		mov	al, [si]

loc_3B016:
		push	cx
		push	di

loc_3B018:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3B018
		pop	di
		pop	cx
		dec	di

loc_3B024:
		add	ch, bh
		jnb	short loc_3B02C
		dec	cl
		sub	di, bp

loc_3B02C:
		add	dl, bl
		jnb	short loc_3B024

loc_3B030:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3B030
		dec	byte ptr ss:5084h
		jnz	short loc_3B016

loc_3B040:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3B047:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3B069
		or	ch, ch
		jle	short loc_3B047
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3B014

loc_3B069:
		ret
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	cx, ss:5080h
		add	al, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5076h
		mov	ss:507Ch, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5074h
		mov	ss:507Ah, ax
		mov	bp, ax
		mov	word ptr ss:5091h, 0
		mov	word ptr ss:5093h, 0
		mov	byte ptr ss:5090h, 0
		cmp	ax, ss:50A7h
		jle	short loc_3B0E2
		jmp	short loc_3B158

loc_3B0E2:
		mov	ax, ss:507Ch
		sub	ax, ss:50A5h
		jge	short loc_3B153
		or	ax, ax
		jns	short loc_3B0F3
		neg	ax

loc_3B0F3:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_3B111
		inc	ax

loc_3B111:
		push	ax
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:5093h, ax
		add	ss:507Ch, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ah, ax
		add	ss:5091h, ax
		or	byte ptr ss:5090h, 2

loc_3B153:
		jmp	word ptr ss:51F0h

loc_3B158:
		ret
		xor	ax, ax
		mov	al, ss:5086h
		mov	ch, ss:5087h
		xor	dx, dx
		or	ch, ch
		jz	short loc_3B176

loc_3B16A:
		add	dl, bl
		adc	ax, 0
		add	dh, bh
		sbb	ch, 0
		jg	short loc_3B16A

loc_3B176:
		inc	ax
		mov	ss:5088h, ax
		mov	dx, ax
		mov	ax, ss:507Ah
		add	ax, dx
		sub	ax, ss:50A3h
		jl	short loc_3B18C
		jmp	short loc_3B1EB

loc_3B18C:
		or	ax, ax
		jns	short loc_3B192
		neg	ax

loc_3B192:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3B1B0
		inc	ax

loc_3B1B0:
		push	ax
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ah, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ch, ax
		add	ss:5093h, ax
		or	byte ptr ss:5090h, 1

loc_3B1EB:
		mov	ax, ss:50A7h
		inc	ax
		sub	ax, ss:507Ah
		jg	short loc_3B1F8

loc_3B1F7:
		ret

loc_3B1F8:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		add	ax, ss:5088h
		cmp	ax, ss:50A3h
		jl	short loc_3B1F7
		cmp	ax, ss:50A7h
		jle	short loc_3B22F
		or	byte ptr ss:5090h, 4

loc_3B22F:
		mov	ax, ss:50A9h
		inc	ax
		sub	ax, ss:507Ch
		mov	ss:509Dh, ax
		jle	short loc_3B2A4
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:50A5h
		jl	short loc_3B2A4
		cmp	ax, ss:50A9h
		jle	short loc_3B26D
		or	byte ptr ss:5090h, 8

loc_3B26D:
		test	byte ptr ss:5090h, 3
		jz	short loc_3B2CE
		mov	ax, ss:5093h
		or	ax, ax
		jz	short loc_3B2CE
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F93h
		sub	al, ss:508Bh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:5080h
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3B2A5

loc_3B2A4:
		ret

loc_3B2A5:
		mul	cx
		add	ss:508Bh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Bh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5093h
		mov	ss:5085h, al
		jmp	short loc_3B2E0

loc_3B2CE:
		mov	cx, ss:5080h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch

loc_3B2E0:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		mov	cl, ss:5086h
		mov	al, ss:5087h
		or	al, al
		jz	short loc_3B31B

loc_3B310:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	al, 0
		jg	short loc_3B310

loc_3B31B:
		push	cx
		xor	ch, ch
		sub	ss:509Bh, cx
		pop	cx
		jg	short loc_3B329
		jmp	loc_3B43B

loc_3B329:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3B389

loc_3B331:
		mov	al, [si]

loc_3B333:
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:50A3h
		sub	dx, ss:507Ah
		jle	short loc_3B3B1
		sub	cx, dx
		jle	short loc_3B34C
		add	di, dx
		rep stosb

loc_3B34C:
		pop	cx
		pop	dx
		pop	di
		add	di, ss:50ABh

loc_3B354:
		add	dl, bl
		jnb	short loc_3B360
		dec	cl
		inc	di
		inc	word ptr ss:507Ah

loc_3B360:
		add	ch, bh
		jnb	short loc_3B354

loc_3B364:
		add	dh, bl
		jnb	short loc_3B36F
		dec	word ptr ss:509Bh
		inc	cl

loc_3B36F:
		add	ah, bh
		jnb	short loc_3B364
		dec	word ptr ss:509Dh
		jle	short loc_3B3AD
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3B3AE
		dec	byte ptr ss:5085h
		jg	short loc_3B333

loc_3B389:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3B390:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3B3AD
		or	ch, ch
		jz	short loc_3B390
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3B331

loc_3B3AD:
		ret

loc_3B3AE:
		jmp	loc_3B436

loc_3B3B1:
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:5090h, 0Ch
		jnz	short loc_3B3BF
		jmp	loc_3ADE7

loc_3B3BF:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3B389

loc_3B3C7:
		mov	al, [si]

loc_3B3C9:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:50ABh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_3B3DC:
		add	dl, bl
		jnb	short loc_3B3E8
		dec	cl
		inc	di
		inc	word ptr ss:507Ah

loc_3B3E8:
		add	ch, bh
		jnb	short loc_3B3DC

loc_3B3EC:
		add	dh, bl
		jnb	short loc_3B3F7
		dec	word ptr ss:509Bh
		inc	cl

loc_3B3F7:
		add	ah, bh
		jnb	short loc_3B3EC
		dec	word ptr ss:509Dh
		jle	short loc_3B435
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3B3AE
		dec	byte ptr ss:5085h
		jg	short loc_3B3C9
		mov	bp, cx
		mov	cx, ss:5080h

loc_3B418:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3B435
		or	ch, ch
		jz	short loc_3B418
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3B3C7

loc_3B435:
		ret

loc_3B436:
		dec	byte ptr ss:5085h

loc_3B43B:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3B496

loc_3B443:
		mov	al, [si]

loc_3B445:
		push	di
		push	cx
		xor	ch, ch
		mov	bp, ss:507Ah
		add	bp, cx
		stc
		sbb	bp, ss:50A7h
		jle	short loc_3B45A
		sub	cx, bp

loc_3B45A:
		rep stosb
		pop	cx
		pop	di
		add	di, ss:50ABh

loc_3B463:
		add	dl, bl
		jnb	short loc_3B47B
		dec	cl
		inc	di
		inc	word ptr ss:507Ah
		mov	bp, ss:507Ah
		cmp	bp, ss:50A7h
		jg	short loc_3B4BA

loc_3B47B:
		add	ch, bh
		jnb	short loc_3B463

loc_3B47F:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_3B47F
		dec	word ptr ss:509Dh
		jle	short loc_3B4BA
		dec	byte ptr ss:5085h
		jg	short loc_3B445

loc_3B496:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3B49D:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3B4BA
		or	ch, ch
		jz	short loc_3B49D
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3B443

loc_3B4BA:
		ret
		xor	ax, ax
		mov	al, ss:5087h
		mov	ch, ss:5086h
		xor	dx, dx
		or	ch, ch
		jz	short loc_3B4D8

loc_3B4CC:
		sub	dh, bh
		adc	ax, 0
		sub	dl, bl
		sbb	ch, 0
		jg	short loc_3B4CC

loc_3B4D8:
		inc	ax
		mov	ss:5088h, ax
		mov	ax, ss:507Ah
		sub	ax, ss:50A3h
		jl	short loc_3B4EA
		jmp	short loc_3B549

loc_3B4EA:
		or	ax, ax
		jns	short loc_3B4F0
		neg	ax

loc_3B4F0:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3B50E
		inc	ax

loc_3B50E:
		push	ax
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ah, ax
		add	ss:5091h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ch, ax
		or	byte ptr ss:5090h, 1

loc_3B549:
		mov	ax, ss:50A7h
		inc	ax
		sub	ax, ss:507Ah
		jg	short loc_3B556

loc_3B555:
		ret

loc_3B556:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		cmp	ax, ss:50A3h
		jl	short loc_3B555
		cmp	ax, ss:50A7h
		jle	short loc_3B588
		or	byte ptr ss:5090h, 4

loc_3B588:
		mov	ax, ss:50A9h
		inc	ax
		sub	ax, ss:507Ch
		mov	ss:509Dh, ax
		jg	short loc_3B5A1
		add	ax, ss:5088h
		jle	short loc_3B602
		jg	short loc_3B5C9

loc_3B5A1:
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:50A5h
		jl	short loc_3B602
		cmp	ax, ss:50A9h
		jl	short loc_3B5CF

loc_3B5C9:
		or	byte ptr ss:5090h, 8

loc_3B5CF:
		test	byte ptr ss:5090h, 3
		jz	short loc_3B62C
		mov	ax, ss:5091h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F92h
		sub	al, ss:508Ah
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:507Eh
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3B603

loc_3B602:
		ret

loc_3B603:
		mul	cx
		add	ss:508Ah, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Ah, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5091h
		mov	ss:5084h, al
		jmp	short loc_3B63E

loc_3B62C:
		mov	cx, ss:507Eh
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch

loc_3B63E:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		mov	cl, ss:5087h
		mov	al, ss:5086h
		or	al, al
		jz	short loc_3B679

loc_3B66E:
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	al, 0
		jg	short loc_3B66E

loc_3B679:
		mov	bp, ss:507Ch
		cmp	bp, ss:50A9h
		jl	short loc_3B6B0
		jz	short loc_3B6AD
		sub	bp, ss:50A9h
		mov	al, ch
		xor	ch, ch
		sub	cx, bp
		mov	ch, al
		jg	short loc_3B697
		ret

loc_3B697:
		mov	bp, ss:50A9h
		shl	bp, 1
		add	bp, ss:50A1h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:507Ah

loc_3B6AD:
		jmp	loc_3B7EC

loc_3B6B0:
		push	cx
		xor	ch, ch
		dec	cx
		sub	bp, cx
		pop	cx
		cmp	bp, ss:50A5h
		jl	short loc_3B6C1

loc_3B6BE:
		jmp	loc_3B756

loc_3B6C1:
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3B72F

loc_3B6C9:
		mov	al, [si]

loc_3B6CB:
		cmp	bp, ss:50A5h
		jge	short loc_3B6BE
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:50A5h
		xor	ch, ch
		add	cx, dx
		pop	dx

loc_3B6E1:
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	cl
		jg	short loc_3B6E1
		pop	di
		pop	cx
		inc	di
		inc	word ptr ss:507Ah

loc_3B6F5:
		add	ch, bh
		jnb	short loc_3B705
		inc	cl
		add	di, ss:50ABh
		dec	word ptr ss:509Dh

loc_3B705:
		add	dl, bl
		jnb	short loc_3B6F5

loc_3B709:
		add	ah, bh
		jnb	short loc_3B710
		inc	bp
		dec	cl

loc_3B710:
		add	dh, bl
		jnb	short loc_3B709
		dec	word ptr ss:509Bh
		jz	short loc_3B753
		push	ax
		mov	ax, ss:507Ah
		cmp	ax, ss:50A7h
		pop	ax
		jg	short loc_3B753
		dec	byte ptr ss:5084h
		jnz	short loc_3B6CB

loc_3B72F:
		push	cx
		mov	cx, ss:507Eh

loc_3B735:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3B752
		or	ch, ch
		jle	short loc_3B735
		mov	ss:5084h, ch
		pop	cx
		jmp	loc_3B6C9

loc_3B752:
		pop	cx

loc_3B753:
		jmp	loc_3B850

loc_3B756:
		test	byte ptr ss:5090h, 0Ch
		jnz	short loc_3B761
		jmp	loc_3AE79

loc_3B761:
		mov	bp, ss:50ABh
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3B7B5

loc_3B76E:
		mov	al, [si]

loc_3B770:
		push	cx
		push	di

loc_3B772:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3B772
		pop	di
		pop	cx
		inc	di

loc_3B77E:
		add	ch, bh
		jnb	short loc_3B78D
		dec	word ptr ss:509Dh
		jle	short loc_3B78D
		inc	cl
		add	di, bp

loc_3B78D:
		add	dl, bl
		jnb	short loc_3B77E

loc_3B791:
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_3B791
		inc	word ptr ss:507Ah
		dec	word ptr ss:509Bh
		jz	short loc_3B7DF
		cmp	word ptr ss:509Dh, 0
		jle	short loc_3B7DF
		dec	byte ptr ss:5084h
		jnz	short loc_3B770

loc_3B7B5:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3B7BC:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3B7DE
		or	ch, ch
		jle	short loc_3B7BC
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3B76E

loc_3B7DE:
		ret

loc_3B7DF:
		test	byte ptr ss:5090h, 8
		jz	short loc_3B850
		dec	byte ptr ss:5084h

loc_3B7EC:
		mov	bp, ss:507Ah
		cmp	bp, ss:50A7h
		jg	short loc_3B850
		cmp	byte ptr ss:5084h, 0
		jle	short loc_3B82D

loc_3B800:
		mov	al, [si]

loc_3B802:
		push	cx
		push	di

loc_3B804:
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	cl
		jg	short loc_3B804
		pop	di
		pop	cx
		inc	di
		inc	bp
		cmp	bp, ss:50A7h
		jg	short loc_3B850

loc_3B81B:
		add	ah, bh
		sbb	cl, 0
		jle	short loc_3B850
		add	dh, bl
		jnb	short loc_3B81B
		dec	byte ptr ss:5084h
		jnz	short loc_3B802

loc_3B82D:
		push	cx
		mov	cx, ss:507Eh

loc_3B833:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3B84F
		or	ch, ch
		jle	short loc_3B833
		mov	ss:5084h, ch
		pop	cx
		jmp	short loc_3B800

loc_3B84F:
		pop	cx

loc_3B850:
		ret
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	cx, ss:5080h
		add	al, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5076h
		mov	ss:507Ch, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5074h
		mov	ss:507Ah, ax
		mov	bp, ax
		mov	word ptr ss:5091h, 0
		mov	word ptr ss:5093h, 0
		mov	byte ptr ss:5090h, 0
		cmp	ax, ss:50A3h
		jge	short loc_3B8CD
		jmp	short loc_3B93B

loc_3B8CD:
		mov	ax, ss:507Ah
		sub	ax, ss:50A7h
		jle	short loc_3B936
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3B8F6
		inc	ax

loc_3B8F6:
		push	ax
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ah, ax
		add	ss:5091h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ch, ax
		add	ss:5093h, ax
		or	byte ptr ss:5090h, 4

loc_3B936:
		call	word ptr ss:51F0h

loc_3B93B:
		ret
		xor	ax, ax
		mov	al, ss:5086h
		mov	ch, ss:5087h
		xor	dx, dx
		or	ch, ch
		jz	short loc_3B959

loc_3B94D:
		sub	dl, bl
		adc	ax, 0
		sub	dh, bh
		sbb	ch, 0
		jg	short loc_3B94D

loc_3B959:
		inc	ax
		mov	ss:5088h, ax
		mov	ax, ss:507Ch
		sub	ax, ss:50A9h
		jle	short loc_3B9C4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_3B987
		inc	ax

loc_3B987:
		push	ax
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:5093h, ax
		sub	ss:507Ch, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ah, ax
		or	byte ptr ss:5090h, 8

loc_3B9C4:
		mov	ax, ss:507Ah
		inc	ax
		sub	ax, ss:50A3h
		jg	short loc_3B9D8
		add	ax, ss:5088h
		jg	short loc_3BA07
		ret

loc_3B9D8:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, bp
		sub	dx, ax
		cmp	dx, ss:50A7h
		jle	short loc_3BA00
		ret

loc_3BA00:
		cmp	dx, ss:50A3h
		jge	short loc_3BA0D

loc_3BA07:
		or	byte ptr ss:5090h, 1

loc_3BA0D:
		mov	ax, ss:507Ch
		inc	ax
		sub	ax, ss:50A5h
		jle	short loc_3BA84
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:50A9h
		jg	short loc_3BA84
		cmp	ax, ss:50A5h
		jge	short loc_3BA4D
		or	byte ptr ss:5090h, 2

loc_3BA4D:
		test	byte ptr ss:5090h, 0Ch
		jz	short loc_3BAAE
		mov	ax, ss:5093h
		or	ax, ax
		jz	short loc_3BAAE
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F93h
		sub	al, ss:508Bh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:5080h
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3BA85

loc_3BA84:
		ret

loc_3BA85:
		mul	cx
		add	ss:508Bh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Bh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5093h
		mov	ss:5085h, al
		jmp	short loc_3BAC0

loc_3BAAE:
		mov	cx, ss:5080h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch

loc_3BAC0:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		mov	cl, ss:5086h
		mov	al, ss:5087h
		or	al, al
		jz	short loc_3BAFB

loc_3BAF0:
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_3BAF0

loc_3BAFB:
		test	byte ptr ss:5090h, 1
		jz	short loc_3BB18
		mov	bp, ss:507Ah
		sub	bp, ss:50A3h
		jg	short loc_3BB18
		neg	bp
		add	di, bp
		sub	cx, bp
		jmp	loc_3BC28

loc_3BB18:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3BB76

loc_3BB20:
		mov	al, [si]

loc_3BB22:
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:50A7h
		inc	dx
		sub	dx, ss:507Ah
		cmp	cx, dx
		jle	short loc_3BB9E
		mov	cx, dx
		rep stosb
		pop	cx
		pop	dx
		pop	di
		sub	di, ss:50ABh

loc_3BB42:
		add	dl, bl
		jnb	short loc_3BB53
		inc	cl
		dec	word ptr ss:507Ah
		dec	di
		dec	word ptr ss:509Bh

loc_3BB53:
		add	ch, bh
		jnb	short loc_3BB42

loc_3BB57:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_3BB57
		dec	word ptr ss:509Dh
		jle	short loc_3BB9A
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3BB9B
		dec	byte ptr ss:5085h
		jg	short loc_3BB22

loc_3BB76:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3BB7D:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3BB9A
		or	ch, ch
		jz	short loc_3BB7D
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3BB20

loc_3BB9A:
		ret

loc_3BB9B:
		jmp	loc_3BC21

loc_3BB9E:
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:5090h, 3
		jnz	short loc_3BBAC
		jmp	loc_3AF73

loc_3BBAC:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3BB76

loc_3BBB4:
		mov	al, [si]

loc_3BBB6:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:50ABh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_3BBC9:
		add	dl, bl
		jnb	short loc_3BBD7
		dec	word ptr ss:509Bh
		jle	short loc_3BBD7
		inc	cl
		dec	di

loc_3BBD7:
		add	ch, bh
		jnb	short loc_3BBC9

loc_3BBDB:
		add	dh, bl
		sbb	cl, 0
		jle	short loc_3BC20
		add	ah, bh
		jnb	short loc_3BBDB
		dec	word ptr ss:509Dh
		jle	short loc_3BC20
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3BC21
		dec	byte ptr ss:5085h
		jg	short loc_3BBB6
		mov	bp, cx
		mov	cx, ss:5080h

loc_3BC03:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3BC20
		or	ch, ch
		jz	short loc_3BC03
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3BBB4

loc_3BC20:
		ret

loc_3BC21:
		dec	byte ptr ss:5085h
		jle	short loc_3BC55

loc_3BC28:
		cmp	cl, 0
		jle	short loc_3BC20
		mov	al, [si]

loc_3BC2F:
		push	di
		push	cx
		xor	ch, ch
		rep stosb
		pop	cx
		pop	di
		sub	di, ss:50ABh

loc_3BC3C:
		add	dh, bl
		sbb	cl, 0
		jle	short loc_3BC79
		add	ah, bh
		jnb	short loc_3BC3C
		dec	word ptr ss:509Dh
		jle	short loc_3BC79
		dec	byte ptr ss:5085h
		jg	short loc_3BC2F

loc_3BC55:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3BC5C:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3BC79
		or	ch, ch
		jz	short loc_3BC5C
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3BC28

loc_3BC79:
		ret
		xor	ax, ax
		mov	al, ss:5087h
		mov	ch, ss:5086h
		xor	dx, dx
		or	ch, ch
		jz	short loc_3BC97

loc_3BC8B:
		add	dh, bh
		adc	ax, 0
		add	dl, bl
		sbb	ch, 0
		jg	short loc_3BC8B

loc_3BC97:
		inc	ax
		mov	ss:5088h, ax
		mov	dx, ax
		mov	ax, ss:507Ch
		sub	ax, ss:50A9h
		jle	short loc_3BD08
		sub	ax, dx
		jle	short loc_3BD08
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_3BCCB
		inc	ax

loc_3BCCB:
		push	ax
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ch, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ah, ax
		add	ss:5091h, ax
		or	byte ptr ss:5090h, 8

loc_3BD08:
		mov	ax, ss:507Ah
		inc	ax
		sub	ax, ss:50A3h
		jg	short loc_3BD15

loc_3BD14:
		ret

loc_3BD15:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, bp
		cmp	ax, ss:50A7h
		jg	short loc_3BD14
		cmp	ax, ss:50A3h
		jge	short loc_3BD49
		or	byte ptr ss:5090h, 1

loc_3BD49:
		mov	ax, ss:507Ch
		inc	ax
		sub	ax, ss:50A5h
		jle	short loc_3BD14
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5088h
		neg	ax
		add	ax, di
		cmp	ax, ss:50A9h
		jg	short loc_3BDC1
		cmp	ax, ss:50A5h
		jge	short loc_3BD8E
		or	byte ptr ss:5090h, 2

loc_3BD8E:
		test	byte ptr ss:5090h, 0Ch
		jz	short loc_3BDEB
		mov	ax, ss:5091h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F92h
		sub	al, ss:508Ah
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:507Eh
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3BDC2

loc_3BDC1:
		ret

loc_3BDC2:
		mul	cx
		add	ss:508Ah, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Ah, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5091h
		mov	ss:5084h, al
		jmp	short loc_3BDFD

loc_3BDEB:
		mov	cx, ss:507Eh
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch

loc_3BDFD:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	cl, ss:5087h
		mov	al, ss:5086h
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		or	al, al
		jz	short loc_3BE38

loc_3BE2D:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	al, 0
		jg	short loc_3BE2D

loc_3BE38:
		test	byte ptr ss:5090h, 2
		jz	short loc_3BE4F
		push	cx
		xor	ch, ch
		inc	cx
		sub	ss:509Dh, cx
		pop	cx
		jge	short loc_3BE4F
		jmp	loc_3BF9D

loc_3BE4F:
		mov	bp, ss:507Ch
		cmp	bp, ss:50A9h
		jg	short loc_3BE5E

loc_3BE5B:
		jmp	loc_3BF03

loc_3BE5E:
		mov	bp, ss:50A9h
		shl	bp, 1
		add	bp, ss:50A1h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	bp, ss:507Ch
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3BEDD

loc_3BE81:
		mov	al, [si]

loc_3BE83:
		cmp	bp, ss:50A9h
		jle	short loc_3BE5B
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:50A9h
		xor	ch, ch
		sub	cx, dx
		pop	dx
		jle	short loc_3BEA7

loc_3BE9B:
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	cl
		jg	short loc_3BE9B

loc_3BEA7:
		pop	di
		pop	cx
		dec	di

loc_3BEAA:
		add	ch, bh
		jnb	short loc_3BEC2
		dec	cl
		dec	word ptr ss:509Dh
		dec	bp
		cmp	bp, ss:50A9h
		jge	short loc_3BEC2
		sub	di, ss:50ABh

loc_3BEC2:
		add	dl, bl
		jnb	short loc_3BEAA

loc_3BEC6:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3BEC6
		dec	word ptr ss:509Bh
		jz	short loc_3BF00
		dec	byte ptr ss:5084h
		jnz	short loc_3BE83

loc_3BEDD:
		push	cx
		mov	cx, ss:507Eh

loc_3BEE3:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3BEFF
		or	ch, ch
		jle	short loc_3BEE3
		mov	ss:5084h, ch
		pop	cx
		jmp	short loc_3BE81

loc_3BEFF:
		pop	cx

loc_3BF00:
		jmp	loc_3C018

loc_3BF03:
		test	byte ptr ss:5090h, 3
		jnz	short loc_3BF0E
		jmp	loc_3B005

loc_3BF0E:
		mov	ss:507Ch, bp
		mov	bp, ss:50ABh
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3BF65

loc_3BF20:
		mov	al, [si]

loc_3BF22:
		push	cx
		push	di

loc_3BF24:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3BF24
		pop	di
		pop	cx
		dec	di

loc_3BF30:
		add	ch, bh
		jnb	short loc_3BF42
		dec	word ptr ss:509Dh
		dec	cl
		sub	di, bp
		dec	word ptr ss:507Ch

loc_3BF42:
		add	dl, bl
		jnb	short loc_3BF30

loc_3BF46:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3BF46
		dec	word ptr ss:509Bh
		jle	short loc_3BF8E
		cmp	word ptr ss:509Dh, 0
		jle	short loc_3BF8F
		dec	byte ptr ss:5084h
		jnz	short loc_3BF22

loc_3BF65:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3BF6C:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3BF8E
		or	ch, ch
		jle	short loc_3BF6C
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3BF20

loc_3BF8E:
		ret

loc_3BF8F:
		test	byte ptr ss:5090h, 2
		jnz	short loc_3BF98
		ret

loc_3BF98:
		dec	byte ptr ss:5084h

loc_3BF9D:
		mov	bp, ss:507Ch
		cmp	byte ptr ss:5084h, 0
		jle	short loc_3BFF5

loc_3BFAA:
		mov	al, [si]

loc_3BFAC:
		push	cx
		push	di
		push	bp

loc_3BFAF:
		cmp	bp, ss:50A5h
		jl	short loc_3BFC3
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	bp
		dec	cl
		jg	short loc_3BFAF

loc_3BFC3:
		pop	bp
		pop	di
		pop	cx
		dec	di
		dec	word ptr ss:509Bh
		jle	short loc_3C018

loc_3BFCE:
		add	ch, bh
		jnb	short loc_3BFE1
		dec	cl
		sub	di, ss:50ABh
		dec	bp
		cmp	bp, ss:50A5h
		jl	short loc_3C018

loc_3BFE1:
		add	dl, bl
		jnb	short loc_3BFCE

loc_3BFE5:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3BFE5
		dec	byte ptr ss:5084h
		jnz	short loc_3BFAC

loc_3BFF5:
		push	cx
		mov	cx, ss:507Eh

loc_3BFFB:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3C017
		or	ch, ch
		jle	short loc_3BFFB
		mov	ss:5084h, ch
		pop	cx
		jmp	short loc_3BFAA

loc_3C017:
		pop	cx

loc_3C018:
		ret
; END OF FUNCTION CHUNK FOR sub_3AC31

; ----------------------------------------------------------------------

sub_3C019		proc far
		call	sub_3EF8B
		jb	short loc_3C03F
		call	sub_3E3EE
		jnb	short loc_3C044
		mov	word ptr ss:51EEh, 1BC6h
		mov	ax, 1CB7h
		cmp	bl, bh
		jb	short loc_3C038
		mov	ax, 1FA8h

loc_3C038:
		mov	ss:51F0h, ax
		jmp	loc_3C423

loc_3C03F:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3C044:
		mov	word ptr ss:51EEh, 16A5h
		mov	ax, 16FAh
		cmp	bl, bh
		jb	short loc_3C055
		mov	ax, 1788h

loc_3C055:
		mov	ss:51F0h, ax
		jmp	loc_3C423
sub_3C019		endp

; ----------------------------------------------------------------------

sub_3C05C		proc far
		call	sub_3F02A
		jb	short loc_3C082
		call	sub_3E3EE
		jnb	short loc_3C087
		mov	word ptr ss:51EEh, 2341h
		mov	ax, 23B7h
		cmp	bl, bh
		jb	short loc_3C07B
		mov	ax, 278Bh

loc_3C07B:
		mov	ss:51F0h, ax
		jmp	loc_3C423

loc_3C082:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3C087:
		mov	word ptr ss:51EEh, 1824h
		mov	ax, 1879h
		cmp	bl, bh
		jb	short loc_3C098
		mov	ax, 1907h

loc_3C098:
		mov	ss:51F0h, ax
		jmp	loc_3C423
sub_3C05C		endp

; ----------------------------------------------------------------------

sub_3C09F		proc far
		call	sub_3F0C7
		jb	short loc_3C0C5
		call	sub_3E3EE
		jnb	short loc_3C0CA
		mov	word ptr ss:51EEh, 1BC6h
		mov	ax, 1CB7h
		cmp	bl, bh
		jb	short loc_3C0BE
		mov	ax, 1FA8h

loc_3C0BE:
		mov	ss:51F0h, ax
		jmp	loc_3C530

loc_3C0C5:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3C0CA:
		mov	word ptr ss:51EEh, 16A5h
		mov	ax, 16FAh
		cmp	bl, bh
		jb	short loc_3C0DB
		mov	ax, 1788h

loc_3C0DB:
		mov	ss:51F0h, ax
		jmp	loc_3C530
sub_3C09F		endp

; ----------------------------------------------------------------------

sub_3C0E2		proc far
		call	sub_3F162
		jb	short loc_3C108
		call	sub_3E3EE
		jnb	short loc_3C10D
		mov	word ptr ss:51EEh, 2341h
		mov	ax, 23B7h
		cmp	bl, bh
		jb	short loc_3C101
		mov	ax, 278Bh

loc_3C101:
		mov	ss:51F0h, ax
		jmp	loc_3C530

loc_3C108:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3C10D:
		mov	word ptr ss:51EEh, 1824h
		mov	ax, 1879h
		cmp	bl, bh
		jb	short loc_3C11E
		mov	ax, 1907h

loc_3C11E:
		mov	ss:51F0h, ax
		jmp	loc_3C530
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5076h
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		mov	dx, ss:5074h
		sub	dx, ax
		add	di, dx
		mov	dl, cl
		jmp	word ptr ss:51F0h
		mov	cx, ss:5080h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	cx, ss:5086h
		mov	al, ss:4F93h
		mov	ah, al
		mov	dh, dl
		or	ch, ch
		jz	short loc_3C1A9

loc_3C19D:
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	ch, 0
		jg	short loc_3C19D

loc_3C1A9:
		mov	ch, al

loc_3C1AB:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3C1E3

loc_3C1B3:
		mov	al, [si]

loc_3C1B5:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		xor	ch, ch
		sub	di, cx
		mov	cx, bp
		add	di, ss:50ABh

loc_3C1C8:
		add	dl, bl
		jnb	short loc_3C1CF
		inc	cl
		dec	di

loc_3C1CF:
		add	ch, bh
		jnb	short loc_3C1C8

loc_3C1D3:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_3C1D3
		dec	byte ptr ss:5085h
		jnz	short loc_3C1B5

loc_3C1E3:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3C1EA:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3C207
		or	ch, ch
		jz	short loc_3C1EA
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3C1B3

loc_3C207:
		ret
		mov	cx, ss:507Eh
		mov	ax, cx
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch
		mov	cx, ss:5086h
		mov	ah, ss:4F93h
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_3C23A

loc_3C22E:
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	ch, 0
		jnz	short loc_3C22E

loc_3C23A:
		mov	ch, ss:4F93h

loc_3C23F:
		mov	bp, ss:50ABh
		mov	al, [si]
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3C27A

loc_3C24E:
		mov	al, [si]

loc_3C250:
		push	cx
		push	di

loc_3C252:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3C252
		pop	di
		pop	cx
		dec	di

loc_3C25E:
		add	ch, bh
		jnb	short loc_3C266
		inc	cl
		add	di, bp

loc_3C266:
		add	dl, bl
		jnb	short loc_3C25E

loc_3C26A:
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_3C26A
		dec	byte ptr ss:5084h
		jnz	short loc_3C250

loc_3C27A:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3C281:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3C2A3
		or	ch, ch
		jle	short loc_3C281
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3C24E

loc_3C2A3:
		ret
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5076h
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5074h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:51F0h
		mov	cx, ss:5080h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	cx, ss:5086h
		mov	al, ss:4F93h
		mov	ah, al
		mov	dh, dl
		or	ch, ch
		jz	short loc_3C328

loc_3C31C:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	ch, 0
		jg	short loc_3C31C

loc_3C328:
		mov	ch, al

loc_3C32A:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3C362

loc_3C332:
		mov	al, [si]

loc_3C334:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		xor	ch, ch
		sub	di, cx
		mov	cx, bp
		sub	di, ss:50ABh

loc_3C347:
		add	dl, bl
		jnb	short loc_3C34E
		dec	cl
		inc	di

loc_3C34E:
		add	ch, bh
		jnb	short loc_3C347

loc_3C352:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_3C352
		dec	byte ptr ss:5085h
		jnz	short loc_3C334

loc_3C362:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3C369:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3C386
		or	ch, ch
		jz	short loc_3C369
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3C332

loc_3C386:
		ret
		mov	cx, ss:507Eh
		mov	ax, cx
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch
		mov	cx, ss:5086h
		mov	ah, ss:4F93h
		xchg	cl, ch
		mov	dh, dl
		or	ch, ch
		jz	short loc_3C3B9

loc_3C3AD:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	ch, 0
		jnz	short loc_3C3AD

loc_3C3B9:
		mov	ch, ss:4F93h

loc_3C3BE:
		mov	bp, ss:50ABh
		mov	al, [si]
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3C3F9

loc_3C3CD:
		mov	al, [si]

loc_3C3CF:
		push	cx
		push	di

loc_3C3D1:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3C3D1
		pop	di
		pop	cx
		inc	di

loc_3C3DD:
		add	ch, bh
		jnb	short loc_3C3E5
		dec	cl
		sub	di, bp

loc_3C3E5:
		add	dl, bl
		jnb	short loc_3C3DD

loc_3C3E9:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3C3E9
		dec	byte ptr ss:5084h
		jnz	short loc_3C3CF

loc_3C3F9:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3C400:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3C422
		or	ch, ch
		jle	short loc_3C400
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3C3CD

loc_3C422:
		ret

loc_3C423:
		mov	word ptr ss:4F90h, 0

loc_3C42A:
		mov	dx, ss:5080h
		add	ss:4F90h, dl
		adc	dh, 0
		mov	cx, ss:507Eh
		add	ss:4F91h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:5086h, cx
		cmp	bl, bh
		jnb	short loc_3C45F
		xor	ax, ax
		mov	al, cl
		sub	ss:5074h, ax
		mov	al, ch
		sub	ss:5076h, ax

loc_3C45F:
		or	cx, cx
		jnz	short loc_3C466
		jmp	loc_3C503

loc_3C466:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3C46F
		jmp	loc_3C52B

loc_3C46F:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_3C49D
		jl	short loc_3C47E
		jmp	loc_3C503

loc_3C47E:
		add	si, 6
		shr	ax, 1
		jb	short loc_3C489
		add	si, ax
		jmp	short loc_3C49B

loc_3C489:
		push	di
		mov	di, ax

loc_3C48C:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3C496
		add	si, ax
		dec	si

loc_3C496:
		sub	di, ax
		jnz	short loc_3C48C
		pop	di

loc_3C49B:
		jmp	short loc_3C466

loc_3C49D:
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3C4ED
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3C4B6:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3C4CC
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3C4B6
		jz	short loc_3C4DD

loc_3C4CC:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3C4B6

loc_3C4DD:
		pop	es
		pop	ax
		mov	bx, ss:5082h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3C4F9

loc_3C4ED:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3C4F9:
		call	word ptr ss:51EEh
		pop	ds
		pop	si
		jmp	loc_3C466

loc_3C503:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3C52B
		mov	cx, ss:5086h
		cmp	bl, bh
		jb	short loc_3C528
		xor	ax, ax
		mov	al, cl
		sub	ss:5074h, ax
		mov	al, ch
		sub	ss:5076h, ax

loc_3C528:
		jmp	loc_3C42A

loc_3C52B:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3C530:
		cmp	bl, bh
		jb	short loc_3C539
		dec	word ptr ss:5076h

loc_3C539:
		mov	word ptr ss:4F90h, 0

loc_3C540:
		mov	dx, ss:5080h
		add	ss:4F90h, dl
		adc	dh, 0
		mov	cx, ss:507Eh
		add	ss:4F91h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:5086h, cx
		cmp	bl, bh
		jb	short loc_3C575
		xor	ax, ax
		mov	al, cl
		add	ss:5074h, ax
		mov	al, ch
		add	ss:5076h, ax

loc_3C575:
		or	cx, cx
		jnz	short loc_3C57C
		jmp	loc_3C619

loc_3C57C:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3C585
		jmp	loc_3C641

loc_3C585:
		mov	dx, [si+4]
		cmp	dx, ss:505Ah
		jz	short loc_3C5B3
		jl	short loc_3C594
		jmp	loc_3C619

loc_3C594:
		add	si, 6
		shr	ax, 1
		jb	short loc_3C59F
		add	si, ax
		jmp	short loc_3C5B1

loc_3C59F:
		push	di
		mov	di, ax

loc_3C5A2:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3C5AC
		add	si, ax
		dec	si

loc_3C5AC:
		sub	di, ax
		jnz	short loc_3C5A2
		pop	di

loc_3C5B1:
		jmp	short loc_3C57C

loc_3C5B3:
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3C603
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3C5CC:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3C5E2
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3C5CC
		jz	short loc_3C5F3

loc_3C5E2:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3C5CC

loc_3C5F3:
		pop	es
		pop	ax
		mov	bx, ss:5082h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3C60F

loc_3C603:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3C60F:
		call	word ptr ss:51EEh
		pop	ds
		pop	si
		jmp	loc_3C57C

loc_3C619:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3C641
		mov	cx, ss:5086h
		cmp	bl, bh
		jnb	short loc_3C63E
		xor	ax, ax
		mov	al, cl
		add	ss:5074h, ax
		mov	al, ch
		add	ss:5076h, ax

loc_3C63E:
		jmp	loc_3C540

loc_3C641:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3C0E2		endp

; START OF FUNCTION CHUNK FOR sub_3C0E2
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	cx, ss:5080h
		add	al, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5076h
		mov	ss:507Ch, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		mov	dx, ss:5074h
		sub	dx, ax
		mov	ax, dx
		mov	ss:507Ah, ax
		mov	bp, ax
		mov	word ptr ss:5091h, 0
		mov	word ptr ss:5093h, 0
		mov	byte ptr ss:5090h, 0
		cmp	ax, ss:50A3h
		jge	short loc_3C6C1
		ret

loc_3C6C1:
		mov	ax, ss:507Ch
		sub	ax, ss:50A5h
		jge	short loc_3C732
		or	ax, ax
		jns	short loc_3C6D2
		neg	ax

loc_3C6D2:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_3C6F0
		inc	ax

loc_3C6F0:
		push	ax
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:5093h, ax
		add	ss:507Ch, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ah, ax
		add	ss:5091h, ax
		or	byte ptr ss:5090h, 2

loc_3C732:
		jmp	word ptr ss:51F0h
		mov	ax, ss:507Ah
		sub	ax, ss:50A7h
		jle	short loc_3C79B
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3C760
		inc	ax

loc_3C760:
		push	ax
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ah, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ch, ax
		add	ss:5093h, ax
		or	byte ptr ss:5090h, 4

loc_3C79B:
		mov	ax, ss:507Ah
		inc	ax
		sub	ax, ss:50A3h
		jg	short loc_3C7A8
		ret

loc_3C7A8:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, bp
		sub	dx, ax
		cmp	dx, ss:50A7h
		jle	short loc_3C7D0
		ret

loc_3C7D0:
		cmp	dx, ss:50A3h
		jge	short loc_3C7DD
		or	byte ptr ss:5090h, 1

loc_3C7DD:
		mov	ax, ss:50A9h
		inc	ax
		sub	ax, ss:507Ch
		mov	ss:509Dh, ax
		jle	short loc_3C852
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:50A5h
		jl	short loc_3C852
		cmp	ax, ss:50A9h
		jle	short loc_3C81B
		or	byte ptr ss:5090h, 8

loc_3C81B:
		test	byte ptr ss:5090h, 6
		jz	short loc_3C87C
		mov	ax, ss:5093h
		or	ax, ax
		jz	short loc_3C852
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F93h
		sub	al, ss:508Bh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:5080h
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3C853

loc_3C852:
		ret

loc_3C853:
		mul	cx
		add	ss:508Bh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Bh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5093h
		mov	ss:5085h, al
		jmp	short loc_3C88E

loc_3C87C:
		mov	cx, ss:5080h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch

loc_3C88E:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		mov	cl, ss:5086h
		mov	al, ss:5087h
		or	al, al
		jz	short loc_3C8C9

loc_3C8BE:
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_3C8BE

loc_3C8C9:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3C927

loc_3C8D1:
		mov	al, [si]

loc_3C8D3:
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:50A7h
		inc	dx
		sub	dx, ss:507Ah
		cmp	cx, dx
		jle	short loc_3C94F
		mov	cx, dx
		rep stosb
		pop	cx
		pop	dx
		pop	di
		add	di, ss:50ABh

loc_3C8F3:
		add	dl, bl
		jnb	short loc_3C904
		inc	cl
		dec	word ptr ss:507Ah
		dec	di
		dec	word ptr ss:509Bh

loc_3C904:
		add	ch, bh
		jnb	short loc_3C8F3

loc_3C908:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_3C908
		dec	word ptr ss:509Dh
		jle	short loc_3C94B
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3C94C
		dec	byte ptr ss:5085h
		jg	short loc_3C8D3

loc_3C927:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3C92E:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3C94B
		or	ch, ch
		jz	short loc_3C92E
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3C8D1

loc_3C94B:
		ret

loc_3C94C:
		jmp	loc_3C9D0

loc_3C94F:
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:5090h, 9
		jnz	short loc_3C95D
		jmp	loc_3C1AB

loc_3C95D:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3C927

loc_3C965:
		mov	al, [si]

loc_3C967:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:50ABh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_3C97A:
		add	dl, bl
		jnb	short loc_3C988
		dec	word ptr ss:509Bh
		jle	short loc_3C988
		inc	cl
		dec	di

loc_3C988:
		add	ch, bh
		jnb	short loc_3C97A

loc_3C98C:
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_3C98C
		dec	word ptr ss:509Dh
		jle	short loc_3C9CF
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3C9D0
		dec	byte ptr ss:5085h
		jg	short loc_3C967
		mov	bp, cx
		mov	cx, ss:5080h

loc_3C9B2:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3C9CF
		or	ch, ch
		jz	short loc_3C9B2
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3C965

loc_3C9CF:
		ret

loc_3C9D0:
		or	cl, cl
		jle	short loc_3C9CF
		dec	byte ptr ss:5085h
		jle	short loc_3CA03

loc_3C9DB:
		mov	al, [si]

loc_3C9DD:
		push	di
		push	cx
		xor	ch, ch
		rep stosb
		pop	cx
		pop	di
		add	di, ss:50ABh

loc_3C9EA:
		add	dh, bl
		sbb	cl, 0
		jz	short loc_3CA27
		add	ah, bh
		jnb	short loc_3C9EA
		dec	word ptr ss:509Dh
		jle	short loc_3CA27
		dec	byte ptr ss:5085h
		jg	short loc_3C9DD

loc_3CA03:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3CA0A:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3CA27
		or	ch, ch
		jz	short loc_3CA0A
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3C9DB

loc_3CA27:
		ret
		xor	ax, ax
		mov	ch, ss:5086h
		mov	al, ss:5087h
		xor	dx, dx
		or	ch, ch
		jz	short loc_3CA45

loc_3CA39:
		sub	dh, bh
		adc	ax, 0
		sub	dl, bl
		sbb	ch, 0
		jg	short loc_3CA39

loc_3CA45:
		inc	ax
		mov	ss:5088h, ax
		mov	ax, ss:507Ah
		sub	ax, ss:50A7h
		jg	short loc_3CA57
		jmp	short loc_3CAB0

loc_3CA57:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3CA75
		inc	ax

loc_3CA75:
		push	ax
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ah, ax
		add	ss:5091h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ch, ax
		or	byte ptr ss:5090h, 4

loc_3CAB0:
		mov	ax, ss:507Ah
		inc	ax
		sub	ax, ss:50A3h
		jg	short loc_3CABD

loc_3CABC:
		ret

loc_3CABD:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, bp
		sub	dx, ax
		cmp	dx, ss:50A7h
		jg	short loc_3CABC
		cmp	dx, ss:50A3h
		jge	short loc_3CAF1
		or	byte ptr ss:5090h, 1

loc_3CAF1:
		mov	ax, ss:50A9h
		inc	ax
		sub	ax, ss:507Ch
		mov	ss:509Dh, ax
		jg	short loc_3CB0A
		add	ax, ss:5088h
		jle	short loc_3CB6B
		jg	short loc_3CB32

loc_3CB0A:
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:50A5h
		jl	short loc_3CB6B
		cmp	ax, ss:50A9h
		jl	short loc_3CB38

loc_3CB32:
		or	byte ptr ss:5090h, 8

loc_3CB38:
		test	byte ptr ss:5090h, 6
		jz	short loc_3CB95
		mov	ax, ss:5091h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F92h
		sub	al, ss:508Ah
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:507Eh
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3CB6C

loc_3CB6B:
		ret

loc_3CB6C:
		mul	cx
		add	ss:508Ah, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Ah, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5091h
		mov	ss:5084h, al
		jmp	short loc_3CBA7

loc_3CB95:
		mov	cx, ss:507Eh
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch

loc_3CBA7:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	cl, ss:5087h
		mov	al, ss:5086h
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		or	al, al
		jz	short loc_3CBE2

loc_3CBD7:
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	al, 0
		jg	short loc_3CBD7

loc_3CBE2:
		mov	bp, ss:507Ch
		cmp	bp, ss:50A9h
		jl	short loc_3CC19
		jz	short loc_3CC16
		sub	bp, ss:50A9h
		mov	al, ch
		xor	ch, ch
		sub	cx, bp
		mov	ch, al
		jg	short loc_3CC00
		ret

loc_3CC00:
		mov	bp, ss:50A9h
		shl	bp, 1
		add	bp, ss:50A1h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:507Ah

loc_3CC16:
		jmp	loc_3CD55

loc_3CC19:
		push	cx
		xor	ch, ch
		dec	cx
		sub	bp, cx
		pop	cx
		cmp	bp, ss:50A5h
		jl	short loc_3CC2A

loc_3CC27:
		jmp	loc_3CCBF

loc_3CC2A:
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3CC98

loc_3CC32:
		mov	al, [si]

loc_3CC34:
		cmp	bp, ss:50A5h
		jge	short loc_3CC27
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:50A5h
		xor	ch, ch
		add	cx, dx
		pop	dx

loc_3CC4A:
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	cl
		jg	short loc_3CC4A
		pop	di
		pop	cx
		dec	di
		dec	word ptr ss:507Ah

loc_3CC5E:
		add	ch, bh
		jnb	short loc_3CC6E
		inc	cl
		add	di, ss:50ABh
		dec	word ptr ss:509Dh

loc_3CC6E:
		add	dl, bl
		jnb	short loc_3CC5E

loc_3CC72:
		add	ah, bh
		jnb	short loc_3CC79
		inc	bp
		dec	cl

loc_3CC79:
		add	dh, bl
		jnb	short loc_3CC72
		dec	word ptr ss:509Bh
		jz	short loc_3CCBC
		push	ax
		mov	ax, ss:507Ah
		cmp	ax, ss:50A3h
		pop	ax
		jl	short loc_3CCBC
		dec	byte ptr ss:5084h
		jnz	short loc_3CC34

loc_3CC98:
		push	cx
		mov	cx, ss:507Eh

loc_3CC9E:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3CCBB
		or	ch, ch
		jle	short loc_3CC9E
		mov	ss:5084h, ch
		pop	cx
		jmp	loc_3CC32

loc_3CCBB:
		pop	cx

loc_3CCBC:
		jmp	loc_3CDC0

loc_3CCBF:
		test	byte ptr ss:5090h, 9
		jnz	short loc_3CCCA
		jmp	loc_3C23F

loc_3CCCA:
		mov	bp, ss:50ABh
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3CD1E

loc_3CCD7:
		mov	al, [si]

loc_3CCD9:
		push	cx
		push	di

loc_3CCDB:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3CCDB
		pop	di
		pop	cx
		dec	di

loc_3CCE7:
		add	ch, bh
		jnb	short loc_3CCF6
		dec	word ptr ss:509Dh
		jle	short loc_3CCF6
		inc	cl
		add	di, bp

loc_3CCF6:
		add	dl, bl
		jnb	short loc_3CCE7

loc_3CCFA:
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_3CCFA
		dec	word ptr ss:507Ah
		dec	word ptr ss:509Bh
		jle	short loc_3CD47
		cmp	word ptr ss:509Dh, 0
		jle	short loc_3CD48
		dec	byte ptr ss:5084h
		jnz	short loc_3CCD9

loc_3CD1E:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3CD25:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3CD47
		or	ch, ch
		jle	short loc_3CD25
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3CCD7

loc_3CD47:
		ret

loc_3CD48:
		test	byte ptr ss:5090h, 8
		jz	short loc_3CDC0
		dec	byte ptr ss:5084h

loc_3CD55:
		mov	bp, ss:507Ah
		cmp	bp, ss:50A7h
		jg	short loc_3CDC0
		cmp	byte ptr ss:5084h, 0
		jle	short loc_3CD9D

loc_3CD69:
		mov	al, [si]

loc_3CD6B:
		push	cx
		push	di

loc_3CD6D:
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	cl
		jg	short loc_3CD6D
		pop	di
		pop	cx
		dec	di
		dec	bp
		cmp	bp, ss:50A3h
		jl	short loc_3CDC0

loc_3CD84:
		add	ah, bh
		sbb	cl, 0
		jle	short loc_3CDC0
		add	dh, bl
		jnb	short loc_3CD84
		dec	word ptr ss:509Bh
		jle	short loc_3CDC0
		dec	byte ptr ss:5084h
		jnz	short loc_3CD6B

loc_3CD9D:
		push	cx
		mov	cx, ss:507Eh

loc_3CDA3:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3CDBF
		or	ch, ch
		jle	short loc_3CDA3
		mov	ss:5084h, ch
		pop	cx
		jmp	short loc_3CD69

loc_3CDBF:
		pop	cx

loc_3CDC0:
		ret
		add	ax, ss:506Eh
		mul	word ptr ss:508Ch
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4F93h, al
		mov	cx, ss:5080h
		add	al, cl
		adc	ch, 0
		mov	ss:5085h, ch
		mov	ss:508Bh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5076h
		mov	ss:507Ch, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4F92h, al
		mov	ss:508Ah, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5074h
		mov	ss:507Ah, ax
		mov	bp, ax
		mov	word ptr ss:5091h, 0
		mov	word ptr ss:5093h, 0
		mov	byte ptr ss:5090h, 0
		jmp	word ptr ss:51F0h
		xor	ax, ax
		mov	al, ss:5086h
		mov	ch, ss:5087h
		xor	dx, dx
		or	ch, ch
		jz	short loc_3CE54

loc_3CE48:
		add	dl, bl
		adc	ax, 0
		add	dh, bh
		sbb	ch, 0
		jg	short loc_3CE48

loc_3CE54:
		inc	ax
		mov	ss:5088h, ax
		mov	dx, ax
		mov	ax, ss:507Ah
		add	ax, dx
		sub	ax, ss:50A3h
		jl	short loc_3CE6A
		jmp	short loc_3CEC9

loc_3CE6A:
		or	ax, ax
		jns	short loc_3CE70
		neg	ax

loc_3CE70:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3CE8E
		inc	ax

loc_3CE8E:
		push	ax
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ah, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ch, ax
		add	ss:5093h, ax
		or	byte ptr ss:5090h, 1

loc_3CEC9:
		mov	ax, ss:507Ch
		sub	ax, ss:50A9h
		jle	short loc_3CF2F
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_3CEF2
		inc	ax

loc_3CEF2:
		push	ax
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:5093h, ax
		sub	ss:507Ch, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ah, ax
		or	byte ptr ss:5090h, 8

loc_3CF2F:
		mov	ax, ss:50A7h
		inc	ax
		sub	ax, ss:507Ah
		jg	short loc_3CF3C
		ret

loc_3CF3C:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		stc
		adc	al, ss:5086h
		adc	ah, 0
		cmp	ax, ss:50A3h
		jge	short loc_3CF6B
		ret

loc_3CF6B:
		cmp	ax, ss:50A7h
		jle	short loc_3CF78
		or	byte ptr ss:5090h, 4

loc_3CF78:
		mov	ax, ss:507Ch
		inc	ax
		sub	ax, ss:50A5h
		jle	short loc_3CFEF
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:50A9h
		jg	short loc_3CFEF
		cmp	ax, ss:50A5h
		jge	short loc_3CFB8
		or	byte ptr ss:5090h, 2

loc_3CFB8:
		test	byte ptr ss:5090h, 9
		jz	short loc_3D019
		mov	ax, ss:5093h
		or	ax, ax
		jz	short loc_3D019
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F93h
		sub	al, ss:508Bh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:5080h
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3CFF0

loc_3CFEF:
		ret

loc_3CFF0:
		mul	cx
		add	ss:508Bh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Bh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5093h
		mov	ss:5085h, al
		jmp	short loc_3D02B

loc_3D019:
		mov	cx, ss:5080h
		add	ss:508Bh, cl
		adc	ch, 0
		mov	ss:5085h, ch

loc_3D02B:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		mov	cl, ss:5086h
		mov	al, ss:5087h
		or	al, al
		jz	short loc_3D066

loc_3D05B:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	al, 0
		jg	short loc_3D05B

loc_3D066:
		push	cx
		xor	ch, ch
		sub	ss:509Bh, cx
		pop	cx
		jg	short loc_3D074
		jmp	loc_3D18B

loc_3D074:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3D0D4

loc_3D07C:
		mov	al, [si]

loc_3D07E:
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:50A3h
		sub	dx, ss:507Ah
		jle	short loc_3D0FC
		sub	cx, dx
		jle	short loc_3D097
		add	di, dx
		rep stosb

loc_3D097:
		pop	cx
		pop	dx
		pop	di
		sub	di, ss:50ABh

loc_3D09F:
		add	dl, bl
		jnb	short loc_3D0AB
		dec	cl
		inc	di
		inc	word ptr ss:507Ah

loc_3D0AB:
		add	ch, bh
		jnb	short loc_3D09F

loc_3D0AF:
		add	dh, bl
		jnb	short loc_3D0BA
		dec	word ptr ss:509Bh
		inc	cl

loc_3D0BA:
		add	ah, bh
		jnb	short loc_3D0AF
		dec	word ptr ss:509Dh
		jle	short loc_3D0F8
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3D0F9
		dec	byte ptr ss:5085h
		jg	short loc_3D07E

loc_3D0D4:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3D0DB:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3D0F8
		or	ch, ch
		jz	short loc_3D0DB
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3D07C

loc_3D0F8:
		ret

loc_3D0F9:
		jmp	loc_3D186

loc_3D0FC:
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:5090h, 6
		jnz	short loc_3D10F
		mov	bp, ss:5095h
		jmp	loc_3C32A

loc_3D10F:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3D0D4

loc_3D117:
		mov	al, [si]

loc_3D119:
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:50ABh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_3D12C:
		add	dl, bl
		jnb	short loc_3D138
		dec	cl
		inc	di
		inc	word ptr ss:507Ah

loc_3D138:
		add	ch, bh
		jnb	short loc_3D12C

loc_3D13C:
		add	dh, bl
		jnb	short loc_3D147
		dec	word ptr ss:509Bh
		inc	cl

loc_3D147:
		add	ah, bh
		jnb	short loc_3D13C
		dec	word ptr ss:509Dh
		jle	short loc_3D185
		cmp	word ptr ss:509Bh, 0
		jle	short loc_3D0F9
		dec	byte ptr ss:5085h
		jg	short loc_3D119
		mov	bp, cx
		mov	cx, ss:5080h

loc_3D168:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3D185
		or	ch, ch
		jz	short loc_3D168
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3D117

loc_3D185:
		ret

loc_3D186:
		dec	byte ptr ss:5085h

loc_3D18B:
		cmp	byte ptr ss:5085h, 0
		jle	short loc_3D1E6

loc_3D193:
		mov	al, [si]

loc_3D195:
		push	di
		push	cx
		xor	ch, ch
		mov	bp, ss:507Ah
		add	bp, cx
		stc
		sbb	bp, ss:50A7h
		jle	short loc_3D1AA
		sub	cx, bp

loc_3D1AA:
		rep stosb
		pop	cx
		pop	di
		sub	di, ss:50ABh

loc_3D1B3:
		add	dl, bl
		jnb	short loc_3D1CB
		dec	cl
		inc	di
		inc	word ptr ss:507Ah
		mov	bp, ss:507Ah
		cmp	bp, ss:50A7h
		jg	short loc_3D20A

loc_3D1CB:
		add	ch, bh
		jnb	short loc_3D1B3

loc_3D1CF:
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_3D1CF
		dec	word ptr ss:509Dh
		jle	short loc_3D20A
		dec	byte ptr ss:5085h
		jg	short loc_3D195

loc_3D1E6:
		mov	bp, cx
		mov	cx, ss:5080h

loc_3D1ED:
		inc	si
		add	ss:508Bh, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3D20A
		or	ch, ch
		jz	short loc_3D1ED
		mov	ss:5085h, ch
		mov	cx, bp
		jmp	short loc_3D193

loc_3D20A:
		ret
		xor	ax, ax
		mov	ch, ss:5086h
		mov	al, ss:5087h
		xor	dx, dx
		or	ch, ch
		jz	short loc_3D228

loc_3D21C:
		add	dh, bh
		adc	ax, 0
		add	dl, bl
		sbb	ch, 0
		jg	short loc_3D21C

loc_3D228:
		inc	ax
		mov	ss:5088h, ax
		mov	ax, ss:507Ah
		sub	ax, ss:50A3h
		jl	short loc_3D23A
		jmp	short loc_3D295

loc_3D23A:
		neg	ax
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F92h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3D25A
		inc	ax

loc_3D25A:
		push	ax
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ah, ax
		add	ss:5091h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ch, ax
		or	byte ptr ss:5090h, 1

loc_3D295:
		mov	ax, ss:507Ch
		sub	ax, ss:50A9h
		jle	short loc_3D302
		sub	ax, ss:5088h
		jle	short loc_3D302
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4F93h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_3D2C5
		inc	ax

loc_3D2C5:
		push	ax
		mul	cx
		add	ss:4F93h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:507Ch, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4F92h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:507Ah, ax
		add	ss:5091h, ax
		or	byte ptr ss:5090h, 8

loc_3D302:
		mov	ax, ss:50A7h
		inc	ax
		sub	ax, ss:507Ah
		jg	short loc_3D30F

loc_3D30E:
		ret

loc_3D30F:
		mov	ss:509Bh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:507Eh
		add	al, ss:508Ah
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		cmp	ax, ss:50A3h
		jl	short loc_3D30E
		cmp	ax, ss:50A7h
		jle	short loc_3D341
		or	byte ptr ss:5090h, 4

loc_3D341:
		mov	ax, ss:507Ch
		inc	ax
		sub	ax, ss:50A5h
		jle	short loc_3D30E
		mov	ss:509Dh, ax
		mov	ax, ss:5095h
		mul	word ptr ss:5080h
		add	al, ss:508Bh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5088h
		neg	ax
		add	ax, di
		cmp	ax, ss:50A9h
		jg	short loc_3D3B9
		cmp	ax, ss:50A5h
		jge	short loc_3D386
		or	byte ptr ss:5090h, 2

loc_3D386:
		test	byte ptr ss:5090h, 9
		jz	short loc_3D3E3
		mov	ax, ss:5091h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4F92h
		sub	al, ss:508Ah
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:507Eh
		div	cx
		add	si, ax
		sub	ss:5095h, ax
		jg	short loc_3D3BA

loc_3D3B9:
		ret

loc_3D3BA:
		mul	cx
		add	ss:508Ah, al
		adc	ah, 0
		adc	dx, 0
		add	ss:508Ah, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:5091h
		mov	ss:5084h, al
		jmp	short loc_3D3F5

loc_3D3E3:
		mov	cx, ss:507Eh
		add	ss:508Ah, cl
		adc	ch, 0
		mov	ss:5084h, ch

loc_3D3F5:
		mov	ax, ss:507Ch
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	cl, ss:5087h
		mov	al, ss:5086h
		mov	ah, ss:4F93h
		mov	ch, ah
		mov	dl, ss:4F92h
		mov	dh, dl
		or	al, al
		jz	short loc_3D430

loc_3D425:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	al, 0
		jg	short loc_3D425

loc_3D430:
		test	byte ptr ss:5090h, 2
		jz	short loc_3D447
		push	cx
		xor	ch, ch
		inc	cx
		sub	ss:509Dh, cx
		pop	cx
		jge	short loc_3D447
		jmp	loc_3D595

loc_3D447:
		mov	bp, ss:507Ch
		cmp	bp, ss:50A9h
		jg	short loc_3D456

loc_3D453:
		jmp	loc_3D4FB

loc_3D456:
		mov	bp, ss:50A9h
		shl	bp, 1
		add	bp, ss:50A1h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:507Ah
		mov	bp, ss:507Ch
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3D4D5

loc_3D479:
		mov	al, [si]

loc_3D47B:
		cmp	bp, ss:50A9h
		jle	short loc_3D453
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:50A9h
		xor	ch, ch
		sub	cx, dx
		pop	dx
		jle	short loc_3D49F

loc_3D493:
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	cl
		jg	short loc_3D493

loc_3D49F:
		pop	di
		pop	cx
		inc	di

loc_3D4A2:
		add	ch, bh
		jnb	short loc_3D4BA
		dec	cl
		dec	word ptr ss:509Dh
		dec	bp
		cmp	bp, ss:50A9h
		jge	short loc_3D4BA
		sub	di, ss:50ABh

loc_3D4BA:
		add	dl, bl
		jnb	short loc_3D4A2

loc_3D4BE:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3D4BE
		dec	word ptr ss:509Bh
		jz	short loc_3D4F8
		dec	byte ptr ss:5084h
		jnz	short loc_3D47B

loc_3D4D5:
		push	cx
		mov	cx, ss:507Eh

loc_3D4DB:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3D4F7
		or	ch, ch
		jle	short loc_3D4DB
		mov	ss:5084h, ch
		pop	cx
		jmp	short loc_3D479

loc_3D4F7:
		pop	cx

loc_3D4F8:
		jmp	loc_3D610

loc_3D4FB:
		test	byte ptr ss:5090h, 6
		jnz	short loc_3D506
		jmp	loc_3C3BE

loc_3D506:
		mov	ss:507Ch, bp
		mov	bp, ss:50ABh
		cmp	byte ptr ss:5084h, 0
		jz	short loc_3D55D

loc_3D518:
		mov	al, [si]

loc_3D51A:
		push	cx
		push	di

loc_3D51C:
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_3D51C
		pop	di
		pop	cx
		inc	di

loc_3D528:
		add	ch, bh
		jnb	short loc_3D53A
		dec	word ptr ss:509Dh
		dec	cl
		sub	di, bp
		dec	word ptr ss:507Ch

loc_3D53A:
		add	dl, bl
		jnb	short loc_3D528

loc_3D53E:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3D53E
		dec	word ptr ss:509Bh
		jle	short loc_3D586
		cmp	word ptr ss:509Dh, 0
		jle	short loc_3D587
		dec	byte ptr ss:5084h
		jnz	short loc_3D51A

loc_3D55D:
		mov	bp, cx
		mov	cx, ss:507Eh

loc_3D564:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3D586
		or	ch, ch
		jle	short loc_3D564
		mov	ss:5084h, ch
		mov	cx, bp
		mov	bp, ss:50ABh
		jmp	short loc_3D518

loc_3D586:
		ret

loc_3D587:
		test	byte ptr ss:5090h, 2
		jnz	short loc_3D590
		ret

loc_3D590:
		dec	byte ptr ss:5084h

loc_3D595:
		mov	bp, ss:507Ch
		cmp	byte ptr ss:5084h, 0
		jle	short loc_3D5ED

loc_3D5A2:
		mov	al, [si]

loc_3D5A4:
		push	cx
		push	di
		push	bp

loc_3D5A7:
		cmp	bp, ss:50A5h
		jl	short loc_3D5BB
		mov	es:[di], al
		sub	di, ss:50ABh
		dec	bp
		dec	cl
		jg	short loc_3D5A7

loc_3D5BB:
		pop	bp
		pop	di
		pop	cx
		inc	di
		dec	word ptr ss:509Bh
		jle	short loc_3D610

loc_3D5C6:
		add	ch, bh
		jnb	short loc_3D5D9
		dec	cl
		sub	di, ss:50ABh
		dec	bp
		cmp	bp, ss:50A5h
		jl	short loc_3D610

loc_3D5D9:
		add	dl, bl
		jnb	short loc_3D5C6

loc_3D5DD:
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3D5DD
		dec	byte ptr ss:5084h
		jnz	short loc_3D5A4

loc_3D5ED:
		push	cx
		mov	cx, ss:507Eh

loc_3D5F3:
		inc	si
		add	ss:508Ah, cl
		adc	ch, 0
		dec	word ptr ss:5095h
		jle	short loc_3D60F
		or	ch, ch
		jle	short loc_3D5F3
		mov	ss:5084h, ch
		pop	cx
		jmp	short loc_3D5A2

loc_3D60F:
		pop	cx
; END OF FUNCTION CHUNK FOR sub_3C0E2
seg148		ends
