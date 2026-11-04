seg153		segment	para public 'CODE' use16
		assume cs:seg153
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

sub_3F9C4		proc far
		call	sub_3EED3
		jb	short loc_3F9EC
		mov	ax, ss:5068h
		mov	ss:5074h, ax
		mov	ax, ss:506Ah
		mov	ss:5076h, ax
		call	sub_3E3EE
		jnb	short loc_3F9F1
		mov	word ptr ss:51EEh, 5FEh
		jmp	loc_3FA85

loc_3F9EC:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F9F1:
		mov	word ptr ss:51EEh, 3A7h
		jmp	short loc_3FA25
sub_3F9C4		endp

; ----------------------------------------------------------------------

sub_3F9FA		proc far
		call	sub_3EEC6
		jb	short loc_3FA19
		mov	ax, ss:5068h
		mov	ss:5074h, ax
		call	sub_3E3EE
		jnb	short loc_3FA1E
		mov	word ptr ss:51EEh, 45Fh
		jmp	short loc_3FA85

loc_3FA19:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3FA1E:
		mov	word ptr ss:51EEh, 2F1h

loc_3FA25:
		inc	word ptr ss:5074h

loc_3FA2A:
		xor	ax, ax
		add	ss:4F92h, bl
		adc	al, bh
		mov	ss:508Fh, al
		sub	ss:5074h, ax

loc_3FA3C:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3FA80
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3FA6D
		jg	short loc_3FA74
		add	si, 6
		shr	ax, 1
		jb	short loc_3FA59
		add	si, ax
		jmp	short loc_3FA6B

loc_3FA59:
		push	di
		mov	di, ax

loc_3FA5C:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3FA66
		add	si, ax
		dec	si

loc_3FA66:
		sub	di, ax
		jnz	short loc_3FA5C
		pop	di

loc_3FA6B:
		jmp	short loc_3FA3C

loc_3FA6D:
		call	word ptr ss:51EEh
		jmp	short loc_3FA3C

loc_3FA74:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jnz	short loc_3FA2A

loc_3FA80:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3FA85:
		mov	ax, ss:5074h
		inc	ax
		mov	ss:5074h, ax
		cmp	ax, ss:50A7h
		jle	short loc_3FAC7
		mov	dx, ss:50A7h

loc_3FA9A:
		xor	cx, cx
		add	ss:4F92h, bl
		adc	cl, bh
		sub	ax, cx
		cmp	ax, dx
		jle	short loc_3FAB8
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jnz	short loc_3FA9A
		jmp	loc_3FB43

loc_3FAB8:
		mov	ss:5074h, ax
		sub	ax, dx
		or	ax, ax
		jns	short loc_3FAC4
		neg	ax

loc_3FAC4:
		inc	ax
		jmp	short loc_3FAF0

loc_3FAC7:
		xor	ax, ax
		add	ss:4F92h, bl
		adc	al, bh
		adc	ah, 0
		sub	ss:5074h, ax
		mov	cx, ss:50A3h
		sub	cx, ss:5074h
		jle	short loc_3FAF0
		sub	ax, cx
		mov	cx, ss:50A3h
		mov	ss:5074h, cx

loc_3FAF0:
		mov	ss:508Fh, al

loc_3FAF4:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3FB43
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3FB25
		jg	short loc_3FB2C
		add	si, 6
		shr	ax, 1
		jb	short loc_3FB11
		add	si, ax
		jmp	short loc_3FB23

loc_3FB11:
		push	di
		mov	di, ax

loc_3FB14:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3FB1E
		add	si, ax
		dec	si

loc_3FB1E:
		sub	di, ax
		jnz	short loc_3FB14
		pop	di

loc_3FB23:
		jmp	short loc_3FAF4

loc_3FB25:
		call	word ptr ss:51EEh
		jmp	short loc_3FAF4

loc_3FB2C:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3FB43
		mov	ax, ss:5074h
		cmp	ax, ss:50A3h
		jg	short loc_3FAC7

loc_3FB43:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3F9FA		endp

; ----------------------------------------------------------------------

sub_3FB48		proc far
		call	sub_3EEE0
		jb	short loc_3FB60
		call	sub_3E3EE
		jnb	short loc_3FB65
		mov	word ptr ss:51EEh, 45Fh
		jmp	loc_3FBFA

loc_3FB60:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3FB65:
		mov	word ptr ss:51EEh, 2F1h
		jmp	short loc_3FB99
sub_3FB48		endp

; ----------------------------------------------------------------------

sub_3FB6E		proc far
		call	sub_3EEED
		jb	short loc_3FB8D
		mov	ax, ss:506Ah
		mov	ss:5076h, ax
		call	sub_3E3EE
		jnb	short loc_3FB92
		mov	word ptr ss:51EEh, 5FEh
		jmp	short loc_3FBFA

loc_3FB8D:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3FB92:
		mov	word ptr ss:51EEh, 3A7h

loc_3FB99:
		xor	ax, ax
		add	ss:4F92h, bl
		adc	al, bh
		mov	ss:508Fh, al

loc_3FBA6:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3FBF5
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3FBD7
		jg	short loc_3FBDE
		add	si, 6
		shr	ax, 1
		jb	short loc_3FBC3
		add	si, ax
		jmp	short loc_3FBD5

loc_3FBC3:
		push	di
		mov	di, ax

loc_3FBC6:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3FBD0
		add	si, ax
		dec	si

loc_3FBD0:
		sub	di, ax
		jnz	short loc_3FBC6
		pop	di

loc_3FBD5:
		jmp	short loc_3FBA6

loc_3FBD7:
		call	word ptr ss:51EEh
		jmp	short loc_3FBA6

loc_3FBDE:
		xor	ax, ax
		mov	al, ss:508Fh
		add	ss:5074h, ax
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jnz	short loc_3FB99

loc_3FBF5:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3FBFA:
		mov	ax, ss:5074h
		cmp	ax, ss:50A3h
		jge	short loc_3FC31
		mov	dx, ss:50A3h

loc_3FC0A:
		xor	cx, cx
		add	ss:4F92h, bl
		adc	cl, bh
		add	ax, cx
		cmp	ax, dx
		jg	short loc_3FC28
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jnz	short loc_3FC0A
		jmp	loc_3FCAC

loc_3FC28:
		sub	ax, dx
		mov	ss:5074h, dx
		jmp	short loc_3FC4E

loc_3FC31:
		xor	ax, ax
		add	ss:4F92h, bl
		adc	al, bh
		adc	ah, 0
		mov	cx, ss:50A7h
		inc	cx
		sub	cx, ax
		sub	cx, ss:5074h
		jge	short loc_3FC4E
		add	ax, cx

loc_3FC4E:
		mov	ss:508Fh, al

loc_3FC52:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3FCAC
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3FC83
		jg	short loc_3FC8A
		add	si, 6
		shr	ax, 1
		jb	short loc_3FC6F
		add	si, ax
		jmp	short loc_3FC81

loc_3FC6F:
		push	di
		mov	di, ax

loc_3FC72:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3FC7C
		add	si, ax
		dec	si

loc_3FC7C:
		sub	di, ax
		jnz	short loc_3FC72
		pop	di

loc_3FC81:
		jmp	short loc_3FC52

loc_3FC83:
		call	word ptr ss:51EEh
		jmp	short loc_3FC52

loc_3FC8A:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3FCAC
		xor	ax, ax
		mov	al, ss:508Fh
		add	ss:5074h, ax
		mov	ax, ss:5074h
		cmp	ax, ss:50A7h
		jle	short loc_3FC31

loc_3FCAC:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3FB6E		endp

; START OF FUNCTION CHUNK FOR sub_3FB6E
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3FD00
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3FCCA:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3FCE0
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3FCCA
		jz	short loc_3FCF1

loc_3FCE0:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3FCCA

loc_3FCF1:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_4DA6C
		mov	si, 50AEh
		jmp	short loc_3FD0C

loc_3FD00:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3FD0C:
		add	ax, ss:506Eh
		mul	bx
		add	al, ss:4F93h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3FB6E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FD19		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		add	ax, ss:5076h
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:5074h
		mov	ah, ss:5095h
		xor	cx, cx
		mov	cl, ss:508Fh
		mov	bp, cx
		xor	dh, dh

loc_3FD4C:
		add	dl, bl
		adc	dh, bh
		lodsb

loc_3FD51:
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:50ABh
		dec	dh
		jnz	short loc_3FD51
		dec	ah
		jnz	short loc_3FD4C
		pop	ds
		pop	si
		ret
sub_3FD19		endp

; START OF FUNCTION CHUNK FOR sub_3FD19
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3FDB6
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3FD80:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3FD96
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3FD80
		jz	short loc_3FDA7

loc_3FD96:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3FD80

loc_3FDA7:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_4DA6C
		mov	si, 50AEh
		jmp	short loc_3FDC2

loc_3FDB6:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3FDC2:
		add	ax, ss:506Eh
		mul	bx
		add	al, ss:4F93h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3FD19

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FDCF		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		neg	ax
		add	ax, ss:5076h
		shl	ax, 1
		add	ax, ss:50A1h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:5074h
		mov	ah, ss:5095h
		xor	cx, cx
		mov	cl, ss:508Fh
		mov	bp, cx
		xor	dh, dh

loc_3FE04:
		add	dl, bl
		adc	dh, bh
		lodsb

loc_3FE09:
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:50ABh
		dec	dh
		jnz	short loc_3FE09
		dec	ah
		jnz	short loc_3FE04
		pop	ds
		pop	si
		ret
sub_3FDCF		endp

; START OF FUNCTION CHUNK FOR sub_3FDCF
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3FE6E
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3FE38:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3FE4E
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3FE38
		jz	short loc_3FE5F

loc_3FE4E:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3FE38

loc_3FE5F:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_4DA6C
		mov	si, 50AEh
		jmp	short loc_3FE7A

loc_3FE6E:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3FE7A:
		add	ax, ss:506Eh
		mul	bx
		add	al, ss:4F93h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3FDCF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FE87		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5076h
		mov	di, ax
		mov	byte ptr ss:5090h, 0
		cmp	ax, ss:50A9h
		jle	short loc_3FEA9

loc_3FEA6:
		jmp	loc_3FFBB

loc_3FEA9:
		mov	ax, ss:5095h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:50A5h
		jl	short loc_3FEA6
		cmp	ax, ss:50A9h
		jle	short loc_3FF05
		mov	ax, ss:50A9h
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
		jz	short loc_3FEEE
		or	byte ptr ss:5090h, 8

loc_3FEEE:
		mov	ss:5095h, ax
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	word_4DA5C, ax

loc_3FF05:
		mov	ax, di
		sub	ax, ss:50A5h
		jge	short loc_3FF52
		or	ax, ax
		jns	short loc_3FF14
		neg	ax

loc_3FF14:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:5095h, ax
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	di, ss:50A5h
		sub	ax, di
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	dh, al
		jmp	short loc_3FF5A

loc_3FF52:
		mov	dx, cx
		xor	dh, dh
		add	dl, bl
		adc	dh, bh

loc_3FF5A:
		shl	di, 1
		add	di, ss:50A1h
		mov	di, ss:[di]
		add	di, ss:5074h
		xor	cx, cx
		mov	cl, ss:508Fh
		mov	bp, cx
		lodsb
		mov	ah, ss:5095h
		or	ah, ah
		jle	short loc_3FF98
		or	dh, dh
		jz	short loc_3FF8F

loc_3FF80:
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:50ABh
		dec	dh
		jg	short loc_3FF80

loc_3FF8F:
		lodsb
		add	dl, bl
		adc	dh, bh
		dec	ah
		jnz	short loc_3FF80

loc_3FF98:
		test	byte ptr ss:5090h, 8
		jz	short loc_3FFBB
		mov	dx, ss:50A9h
		inc	dx
		sub	dx, word_4DA5C
		mov	dh, dl

loc_3FFAC:
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:50ABh
		dec	dh
		jnz	short loc_3FFAC

loc_3FFBB:
		pop	ds
		pop	si
		ret
sub_3FE87		endp

; START OF FUNCTION CHUNK FOR sub_3FE87
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_4000D
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3FFD7:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3FFED
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3FFD7
		jz	short loc_3FFFE

loc_3FFED:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3FFD7

loc_3FFFE:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_4DA6C
		mov	si, 50AEh
		jmp	short loc_40019

loc_4000D:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_40019:
		add	ax, ss:506Eh
		mul	bx
		add	al, ss:4F93h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3FE87

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40026		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5076h
		mov	di, ax
		mov	byte ptr ss:5090h, 0
		cmp	ax, ss:50A5h
		jge	short loc_4004A

loc_40047:
		jmp	loc_4015F

loc_4004A:
		mov	ax, ss:5095h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:50A9h
		jg	short loc_40047
		cmp	ax, ss:50A5h
		jge	short loc_400AB
		mov	ax, di
		inc	ax
		sub	ax, ss:50A5h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_40092
		or	byte ptr ss:5090h, 2

loc_40092:
		mov	ss:5095h, ax
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		mov	word_4DA5C, ax

loc_400AB:
		mov	ax, di
		sub	ax, ss:50A9h
		jle	short loc_400F6
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:5095h, ax
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
		mov	di, ss:50A9h
		sub	ax, di
		neg	ax
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	dh, al
		jmp	short loc_400FE

loc_400F6:
		mov	dx, cx
		xor	dh, dh
		add	dl, bl
		adc	dh, bh

loc_400FE:
		shl	di, 1
		add	di, ss:50A1h
		mov	di, ss:[di]
		add	di, ss:5074h
		xor	cx, cx
		mov	cl, ss:508Fh
		mov	bp, cx
		lodsb
		mov	ah, ss:5095h
		or	ah, ah
		jle	short loc_4013C
		or	dh, dh
		jz	short loc_40133

loc_40124:
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:50ABh
		dec	dh
		jg	short loc_40124

loc_40133:
		lodsb
		add	dl, bl
		adc	dh, bh
		dec	ah
		jnz	short loc_40124

loc_4013C:
		test	byte ptr ss:5090h, 2
		jz	short loc_4015F
		mov	dx, word_4DA5C
		inc	dx
		sub	dx, ss:50A5h
		mov	dh, dl

loc_40150:
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:50ABh
		dec	dh
		jnz	short loc_40150

loc_4015F:
		pop	ds
sub_40026		endp
seg153		ends
