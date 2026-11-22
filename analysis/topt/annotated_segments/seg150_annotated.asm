seg150		segment	para public 'CODE' use16
		assume cs:seg150
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 26h, 88h, 5, 4Fh, 0FEh, 0CCh, 75h, 0F3h, 1Fh, 5Eh, 0C3h

; ----------------------------------------------------------------------

sub_3DBFC		proc far
		call	sub_3EB08
		jb	short loc_3DC1C
		mov	ax, ss:5068h
		mov	ss:5074h, ax
		call	sub_3E3EE
		jnb	short loc_3DC21
		mov	word ptr ss:51EEh, 65Ah
		jmp	loc_3DCC6

loc_3DC1C:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3DC21:
		mov	word ptr ss:51EEh, 3D8h
		jmp	short loc_3DC4E
sub_3DBFC		endp

; ----------------------------------------------------------------------

sub_3DC2A		proc far
		call	sub_3EAFB
		jb	short loc_3DC42
		call	sub_3E3EE
		jnb	short loc_3DC47
		mov	word ptr ss:51EEh, 4B2h
		jmp	loc_3DCC6

loc_3DC42:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3DC47:
		mov	word ptr ss:51EEh, 2FBh

loc_3DC4E:
		mov	ax, ss:5076h
		shl	ax, 1
		add	ax, ss:50A1h
		mov	ss:5076h, ax

loc_3DC5D:
		xor	ax, ax
		add	ss:4F93h, bl
		adc	al, bh
		mov	ss:508Fh, al

loc_3DC6A:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3DC72
		jmp	short loc_3DCC1

loc_3DC72:
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3DC9F
		jl	short loc_3DC80
		jmp	short loc_3DCA6

loc_3DC80:
		add	si, 6
		shr	ax, 1
		jb	short loc_3DC8B
		add	si, ax
		jmp	short loc_3DC9D

loc_3DC8B:
		push	di
		mov	di, ax

loc_3DC8E:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3DC98
		add	si, ax
		dec	si

loc_3DC98:
		sub	di, ax
		jnz	short loc_3DC8E
		pop	di

loc_3DC9D:
		jmp	short loc_3DC6A

loc_3DC9F:
		call	word ptr ss:51EEh
		jmp	short loc_3DC6A

loc_3DCA6:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3DCC1
		xor	ax, ax
		mov	al, ss:508Fh
		shl	ax, 1
		add	ss:5076h, ax
		jmp	short loc_3DC5D

loc_3DCC1:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3DCC6:
		mov	ax, ss:5076h
		cmp	ax, ss:50A5h
		jge	short loc_3DCFC
		mov	dx, ss:50A5h

loc_3DCD6:
		xor	cx, cx
		add	ss:4F93h, bl
		adc	cl, bh
		add	ax, cx
		cmp	ax, dx
		jg	short loc_3DCF3
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jnz	short loc_3DCD6
		jmp	short loc_3DD67

loc_3DCF3:
		mov	ss:5076h, dx
		sub	ax, dx
		jmp	short loc_3DD05

loc_3DCFC:
		xor	ax, ax
		add	ss:4F93h, bl
		adc	al, bh

loc_3DD05:
		mov	ss:508Fh, al

loc_3DD09:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3DD11
		jmp	short loc_3DD67

loc_3DD11:
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3DD3E
		jl	short loc_3DD1F
		jmp	short loc_3DD45

loc_3DD1F:
		add	si, 6
		shr	ax, 1
		jb	short loc_3DD2A
		add	si, ax
		jmp	short loc_3DD3C

loc_3DD2A:
		push	di
		mov	di, ax

loc_3DD2D:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3DD37
		add	si, ax
		dec	si

loc_3DD37:
		sub	di, ax
		jnz	short loc_3DD2D
		pop	di

loc_3DD3C:
		jmp	short loc_3DD09

loc_3DD3E:
		call	word ptr ss:51EEh
		jmp	short loc_3DD09

loc_3DD45:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3DD67
		xor	ax, ax
		mov	al, ss:508Fh
		add	ax, ss:5076h
		mov	ss:5076h, ax
		cmp	ax, ss:50A9h
		jle	short loc_3DCFC

loc_3DD67:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3DC2A		endp

; ----------------------------------------------------------------------

sub_3DD6C		proc far
		call	sub_3EB15
		jb	short loc_3DD84
		call	sub_3E3EE
		jnb	short loc_3DD89
		mov	word ptr ss:51EEh, 4B2h
		jmp	loc_3DE2E

loc_3DD84:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3DD89:
		mov	word ptr ss:51EEh, 2FBh
		jmp	short loc_3DDBD
sub_3DD6C		endp

; ----------------------------------------------------------------------

sub_3DD92		proc far
		call	sub_3EB22
		jb	short loc_3DDB1
		mov	ax, ss:5068h
		mov	ss:5074h, ax
		call	sub_3E3EE
		jnb	short loc_3DDB6
		mov	word ptr ss:51EEh, 65Ah
		jmp	short loc_3DE2E

loc_3DDB1:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3DDB6:
		mov	word ptr ss:51EEh, 3D8h

loc_3DDBD:
		mov	ax, ss:506Ah
		inc	ax
		shl	ax, 1
		add	ax, ss:50A1h
		mov	ss:5076h, ax

loc_3DDCD:
		xor	ax, ax
		add	ss:4F93h, bl
		adc	al, bh
		mov	ss:508Fh, al
		shl	ax, 1
		sub	ss:5076h, ax

loc_3DDE1:
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3DDE9
		jmp	short loc_3DE29

loc_3DDE9:
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3DE16
		jl	short loc_3DDF7
		jmp	short loc_3DE1D

loc_3DDF7:
		add	si, 6
		shr	ax, 1
		jb	short loc_3DE02
		add	si, ax
		jmp	short loc_3DE14

loc_3DE02:
		push	di
		mov	di, ax

loc_3DE05:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3DE0F
		add	si, ax
		dec	si

loc_3DE0F:
		sub	di, ax
		jnz	short loc_3DE05
		pop	di

loc_3DE14:
		jmp	short loc_3DDE1

loc_3DE16:
		call	word ptr ss:51EEh
		jmp	short loc_3DDE1

loc_3DE1D:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jnz	short loc_3DDCD

loc_3DE29:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3DE2E:
		mov	ax, ss:506Ah
		inc	ax
		mov	ss:5076h, ax
		cmp	ax, ss:50A9h
		jle	short loc_3DE69
		mov	dx, ss:50A9h

loc_3DE43:
		xor	cx, cx
		add	ss:4F93h, bl
		adc	cl, bh
		sub	ax, cx
		cmp	ax, dx
		jle	short loc_3DE61
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jnz	short loc_3DE43
		jmp	loc_3DEE6

loc_3DE61:
		mov	ss:5076h, ax
		mov	cx, ax
		jmp	short loc_3DE8F

loc_3DE69:
		xor	ax, ax
		add	ss:4F93h, bl
		adc	al, bh
		sub	ss:5076h, ax
		mov	dx, ss:50A5h
		sub	dx, ss:5076h
		jle	short loc_3DE8F
		sub	ax, dx
		mov	dx, ss:50A5h
		mov	ss:5076h, dx

loc_3DE8F:
		mov	ss:508Fh, al

loc_3DE93:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3DEE6
		mov	di, ss:505Ah
		cmp	[si+4], di
		jz	short loc_3DEC6
		jl	short loc_3DEA7
		jmp	short loc_3DECD

loc_3DEA7:
		add	si, 6
		shr	ax, 1
		jb	short loc_3DEB2
		add	si, ax
		jmp	short loc_3DEC4

loc_3DEB2:
		push	di
		mov	di, ax

loc_3DEB5:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3DEBF
		add	si, ax
		dec	si

loc_3DEBF:
		sub	di, ax
		jnz	short loc_3DEB5
		pop	di

loc_3DEC4:
		jmp	short loc_3DE93

loc_3DEC6:
		call	word ptr ss:51EEh
		jmp	short loc_3DE93

loc_3DECD:
		inc	word ptr ss:505Ah
		dec	word ptr ss:505Eh
		jz	short loc_3DEE6
		xor	ax, ax
		mov	ax, ss:5076h
		cmp	ax, ss:50A5h
		jg	short loc_3DE69

loc_3DEE6:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3DD92		endp

; START OF FUNCTION CHUNK FOR sub_3DD92
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mul	bx
		add	al, ss:4F92h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3DD92

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DEFB		proc far

saved_0		= word ptr  0

		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		add	ax, ss:5074h
		mov	ss:5078h, ax
		mov	di, ss:5076h
		mov	di, ss:[di]
		add	di, ax
		xor	bp, bp
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jb	short loc_3DF6C
		mov	ah, al
		xor	cx, cx

loc_3DF2A:
		lodsb
		add	dl, bl
		adc	cl, bh
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_3DF2A

loc_3DF37:
		mov	dh, ss:508Fh
		dec	dh
		jz	short loc_3DF6B
		push	si
		push	ds
		push	es
		pop	ds
		mov	ax, bp
		mov	bp, ss:5076h

loc_3DF4B:
		mov	si, ss:5078h
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
		jnz	short loc_3DF4B
		pop	ds
		pop	si

loc_3DF6B:
		ret

loc_3DF6C:
		mov	bx, ax

loc_3DF6E:
		lodsb
		shr	al, 1
		cbw
		jb	short loc_3DF96
		sub	bx, ax
		mov	ah, al
		xor	cx, cx

loc_3DF7A:
		lodsb
		add	dl, ss:508Ch
		adc	cl, ss:508Dh
		adc	ch, 0
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_3DF7A
		or	bl, bl
		jnz	short loc_3DF6E
		jmp	short loc_3DFC0

loc_3DF96:
		sub	bx, ax
		mov	cx, dx
		mul	word ptr ss:508Ch
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
		jnz	short loc_3DF6E

loc_3DFC0:
		mov	bx, ss:508Ch
		jmp	loc_3DF37
sub_3DEFB		endp

; START OF FUNCTION CHUNK FOR sub_3DEFB
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mul	bx
		add	al, ss:4F92h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3DEFB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DFD8		proc far

saved_0		= word ptr  0

		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		neg	ax
		add	ax, ss:5074h
		mov	ss:5078h, ax
		mov	di, ss:5076h
		mov	di, ss:[di]
		add	di, ax
		xor	bp, bp
		std
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jb	short loc_3E049
		mov	ah, al
		xor	cx, cx

loc_3E00A:
		mov	al, [si]
		inc	si
		add	dl, bl
		adc	cl, bh
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_3E00A

loc_3E019:
		mov	dh, ss:508Fh
		dec	dh
		jz	short loc_3E047
		push	si
		push	ds
		push	es
		pop	ds
		mov	ax, bp
		mov	bp, ss:5076h

loc_3E02D:
		mov	si, ss:5078h
		mov	di, si
		add	si, [bp+saved_0]
		add	bp, 2
		add	di, [bp+saved_0]
		mov	cx, ax
		rep movsb
		dec	dh
		jnz	short loc_3E02D
		pop	ds
		pop	si

loc_3E047:
		cld
		ret

loc_3E049:
		mov	bx, ax

loc_3E04B:
		mov	al, [si]
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3E074
		sub	bx, ax
		mov	ah, al
		xor	cx, cx

loc_3E059:
		mov	al, [si]
		inc	si
		add	dl, ss:508Ch
		adc	cl, ss:508Dh
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_3E059
		or	bl, bl
		jnz	short loc_3E04B
		jmp	short loc_3E09A

loc_3E074:
		sub	bx, ax
		mov	cx, dx
		mul	word ptr ss:508Ch
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
		jnz	short loc_3E04B

loc_3E09A:
		mov	bx, ss:508Ch
		jmp	loc_3E019
sub_3DFD8		endp

; START OF FUNCTION CHUNK FOR sub_3DFD8
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3E0F1
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3E0BB:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3E0D1
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3E0BB
		jz	short loc_3E0E2

loc_3E0D1:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3E0BB

loc_3E0E2:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_4DA6C
		mov	si, 50AEh
		jmp	short loc_3E0FD

loc_3E0F1:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3E0FD:
		add	ax, ss:506Eh
		xor	ch, ch
		mul	bx
		add	al, ss:4F92h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3DFD8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E10C		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:5074h
		mov	di, ax
		cmp	ax, ss:50A7h
		jle	short loc_3E128

loc_3E125:
		jmp	loc_3E247

loc_3E128:
		mov	ax, ss:5095h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:50A3h
		jl	short loc_3E125
		cmp	ax, ss:50A7h
		jle	short loc_3E16D
		mov	ax, ss:50A7h
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
		jz	short loc_3E169
		mov	ch, 1

loc_3E169:
		mov	ss:5095h, ax

loc_3E16D:
		mov	ax, di
		sub	ax, ss:50A3h
		jge	short loc_3E1BE
		or	ax, ax
		jns	short loc_3E17C
		neg	ax

loc_3E17C:
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		jb	short loc_3E125
		div	bx
		sub	ss:5095h, ax
		jb	short loc_3E125
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	di, ss:50A3h
		sub	ax, di
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	cl, al
		jmp	short loc_3E1C6

loc_3E1BE:
		mov	dx, cx
		xor	cx, cx
		add	dl, bl
		adc	cl, bh

loc_3E1C6:
		mov	ax, di
		mov	di, ss:5076h
		shl	di, 1
		add	di, ss:50A1h
		mov	di, ss:[di]
		add	di, ax
		push	ax
		mov	ss:5078h, di
		xor	bp, bp
		mov	ah, ss:5095h
		or	ah, ah
		jz	short loc_3E1F7

loc_3E1EA:
		lodsb
		add	bp, cx
		rep stosb
		add	dl, bl
		adc	cl, bh
		dec	ah
		jnz	short loc_3E1EA

loc_3E1F7:
		pop	ax
		or	dh, dh
		jz	short loc_3E211
		add	ax, bp
		stc
		sbb	ax, ss:50A7h
		or	ax, ax
		jns	short loc_3E20A
		neg	ax

loc_3E20A:
		mov	cx, ax
		add	bp, cx
		lodsb
		rep stosb

loc_3E211:
		mov	dh, ss:508Fh
		dec	dh
		jz	short loc_3E247
		push	es
		pop	ds
		mov	ax, ss:5076h

loc_3E220:
		inc	ax
		cmp	ax, ss:50A9h
		jg	short loc_3E247
		mov	si, ss:5078h
		mov	di, si
		add	di, ss:50ABh
		mov	ss:5078h, di
		mov	cx, bp
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		dec	dh
		jnz	short loc_3E220

loc_3E247:
		pop	ds
		pop	si
		ret
sub_3E10C		endp

; START OF FUNCTION CHUNK FOR sub_3E10C
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3E299
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3E263:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3E279
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3E263
		jz	short loc_3E28A

loc_3E279:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3E263

loc_3E28A:
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_4DA6C
		mov	si, 50AEh
		jmp	short loc_3E2A5

loc_3E299:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3E2A5:
		add	ax, ss:506Eh
		xor	ch, ch
		mul	bx
		add	al, ss:4F92h
		db 8Ah
; END OF FUNCTION CHUNK FOR sub_3E10C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E2B4		proc far
		enter	0D480h, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:5074h
		mov	di, ax
		cmp	ax, ss:50A3h
		jge	short loc_3E2D2

loc_3E2CF:
		jmp	loc_3E3E9

loc_3E2D2:
		mov	ax, ss:5095h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:50A7h
		jg	short loc_3E2CF
		cmp	ax, ss:50A3h
		jge	short loc_3E31A
		mov	ax, di
		inc	ax
		sub	ax, ss:50A3h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_3E316
		mov	ch, 1

loc_3E316:
		mov	ss:5095h, ax

loc_3E31A:
		mov	ax, di
		sub	ax, ss:50A7h
		jle	short loc_3E367
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:5095h, ax
		jle	short loc_3E2CF
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
		mov	di, ss:50A7h
		sub	ax, di
		neg	ax
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	cl, al
		jmp	short loc_3E36F

loc_3E367:
		mov	dx, cx
		xor	cx, cx
		add	dl, bl
		adc	cl, bh

loc_3E36F:
		mov	ax, di
		mov	di, ss:5076h
		shl	di, 1
		add	di, ss:50A1h
		mov	di, ss:[di]
		add	di, ax
		push	ax
		mov	ss:5078h, di
		std
		xor	bp, bp
		mov	ah, ss:5095h
		or	ah, ah
		jz	short loc_3E3A3

loc_3E394:
		mov	al, [si]
		inc	si
		add	bp, cx
		rep stosb
		add	dl, bl
		adc	cl, bh
		dec	ah
		jnz	short loc_3E394

loc_3E3A3:
		pop	ax
		or	dh, dh
		jz	short loc_3E3B9
		sub	ax, bp
		inc	ax
		sub	ax, ss:50A3h
		mov	cx, ax
		add	bp, cx
		mov	al, [si]
		inc	si
		rep stosb

loc_3E3B9:
		mov	dh, ss:508Fh
		dec	dh
		jz	short loc_3E3E9
		push	es
		pop	ds
		mov	ax, ss:5076h
		inc	ax
		cmp	ax, ss:50A9h
		jg	short loc_3E3E9
		mov	si, ss:5078h
		mov	di, si
		add	di, ss:50ABh
sub_3E2B4		endp

; START OF FUNCTION CHUNK FOR sub_3E2B4
		db 36h, 89h, 3Eh, 78h
; END OF FUNCTION CHUNK FOR sub_3E2B4
seg150		ends
