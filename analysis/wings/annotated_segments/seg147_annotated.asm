seg147		segment	para public 'CODE' use16
		assume cs:seg147
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 20h, 47h, 59h, 0EBh, 93h, 59h, 0C3h, 0

; ----------------------------------------------------------------------

sub_4EE68		proc far
		call	sub_4FD5D
		jb	short loc_4EE80
		call	sub_4FC44
		jnb	short loc_4EE85
		mov	word ptr ss:488Ah, 3D3h
		jmp	loc_4EF00

loc_4EE80:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4EE85:
		mov	word ptr ss:488Ah, 2ECh

loc_4EE8C:
		mov	ax, ss:4712h
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:473Dh
		mov	ch, ss:462Fh
		mov	cl, ss:46FAh

loc_4EEA3:
		add	ch, dh
		jb	short loc_4EEB5
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_4EEA3
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4EEB5:
		mov	di, ss:46F6h

loc_4EEBA:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_4EEFB
		cmp	[si+4], di
		jz	short loc_4EEE6
		jg	short loc_4EEED
		add	si, 6
		shr	ax, 1
		jb	short loc_4EED2
		add	si, ax
		jmp	short loc_4EEE4

loc_4EED2:
		push	di
		mov	di, ax

loc_4EED5:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4EEDF
		add	si, ax
		dec	si

loc_4EEDF:
		sub	di, ax
		jnz	short loc_4EED5
		pop	di

loc_4EEE4:
		jmp	short loc_4EEBA

loc_4EEE6:
		call	word ptr ss:488Ah
		jmp	short loc_4EEB5

loc_4EEED:
		inc	word ptr ss:46F6h
		add	bp, 2
		dec	cl
		jz	short loc_4EEFB
		jmp	short loc_4EEA3

loc_4EEFB:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4EF00:
		mov	ax, ss:4712h
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:473Dh
		mov	ch, ss:462Fh
		mov	cl, ss:46FAh
		cmp	ax, ss:4741h
		jge	short loc_4EF3C

loc_4EF1E:
		inc	word ptr ss:46F6h
		add	ch, dh
		jnb	short loc_4EF36
		add	bp, 2
		inc	ax
		mov	ss:4712h, ax
		cmp	ax, ss:4741h
		jge	short loc_4EF3C

loc_4EF36:
		dec	cl
		jnz	short loc_4EF1E
		jz	short loc_4EF49

loc_4EF3C:
		add	ch, dh
		jb	short loc_4EF4E
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_4EF3C

loc_4EF49:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4EF4E:
		mov	di, ss:46F6h

loc_4EF53:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_4EF49
		cmp	[si+4], di
		jz	short loc_4EF81
		jl	short loc_4EF62
		jmp	short loc_4EF88

loc_4EF62:
		add	si, 6
		shr	ax, 1
		jb	short loc_4EF6D
		add	si, ax
		jmp	short loc_4EF7F

loc_4EF6D:
		push	di
		mov	di, ax

loc_4EF70:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4EF7A
		add	si, ax
		dec	si

loc_4EF7A:
		sub	di, ax
		jnz	short loc_4EF70
		pop	di

loc_4EF7F:
		jmp	short loc_4EF53

loc_4EF81:
		call	word ptr ss:488Ah
		jmp	short loc_4EF4E

loc_4EF88:
		inc	word ptr ss:46F6h
		add	bp, 2
		inc	word ptr ss:4712h
		mov	ax, ss:4712h
		cmp	ax, ss:4745h
		jg	short loc_4EFA4
		dec	cl
		jnz	short loc_4EF3C

loc_4EFA4:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4EE68		endp

; ----------------------------------------------------------------------

sub_4EFA9		proc far
		call	sub_4FD6A
		jb	short loc_4EFD0
		call	sub_4FC44
		jnb	short loc_4EFC1
		mov	word ptr ss:488Ah, 4E5h
		jmp	loc_4EF00

loc_4EFC1:
		mov	word ptr ss:488Ah, 35Ah
		mov	bx, ss:4704h
		jmp	loc_4EE8C

loc_4EFD0:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4EFA9		endp

; ----------------------------------------------------------------------

sub_4EFD5		proc far
		call	sub_4FD77
		jb	short loc_4EFFB
		call	sub_4FC44
		jnb	short loc_4EFED
		mov	word ptr ss:488Ah, 3D3h
		jmp	loc_4F09F

loc_4EFED:
		mov	word ptr ss:488Ah, 2ECh
		mov	bx, ss:4700h
		jmp	short loc_4F02B

loc_4EFFB:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4EFD5		endp

; ----------------------------------------------------------------------

sub_4F000		proc far
		call	sub_4FD84
		jb	short loc_4F026
		call	sub_4FC44
		jnb	short loc_4F018
		mov	word ptr ss:488Ah, 4E5h
		jmp	loc_4F09F

loc_4F018:
		mov	word ptr ss:488Ah, 35Ah
		mov	bx, ss:4704h
		jmp	short loc_4F02B

loc_4F026:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F02B:
		mov	ax, ss:4706h
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:473Dh
		mov	ch, ss:462Fh
		mov	cl, ss:46FAh

loc_4F042:
		add	ch, dh
		jb	short loc_4F054
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_4F042
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F054:
		mov	di, ss:46F6h

loc_4F059:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_4F09A
		cmp	[si+4], di
		jz	short loc_4F085
		jg	short loc_4F08C
		add	si, 6
		shr	ax, 1
		jb	short loc_4F071
		add	si, ax
		jmp	short loc_4F083

loc_4F071:
		push	di
		mov	di, ax

loc_4F074:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4F07E
		add	si, ax
		dec	si

loc_4F07E:
		sub	di, ax
		jnz	short loc_4F074
		pop	di

loc_4F083:
		jmp	short loc_4F059

loc_4F085:
		call	word ptr ss:488Ah
		jmp	short loc_4F054

loc_4F08C:
		inc	word ptr ss:46F6h
		sub	bp, 2
		dec	cl
		jz	short loc_4F09A
		jmp	short loc_4F042

loc_4F09A:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F09F:
		mov	ax, ss:4706h
		mov	ss:4712h, ax
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:473Dh
		mov	ch, ss:462Fh
		mov	cl, ss:46FAh
		cmp	ax, ss:4745h
		jle	short loc_4F0DF

loc_4F0C1:
		inc	word ptr ss:46F6h
		add	ch, dh
		jnb	short loc_4F0D9
		sub	bp, 2
		dec	ax
		mov	ss:4712h, ax
		cmp	ax, ss:4745h
		jle	short loc_4F0DF

loc_4F0D9:
		dec	cl
		jnz	short loc_4F0C1
		jz	short loc_4F0EC

loc_4F0DF:
		add	ch, dh
		jb	short loc_4F0F1
		inc	word ptr ss:46F6h
		dec	cl
		jnz	short loc_4F0DF

loc_4F0EC:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_4F0F1:
		mov	di, ss:46F6h

loc_4F0F6:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_4F0EC
		cmp	[si+4], di
		jz	short loc_4F124
		jl	short loc_4F105
		jmp	short loc_4F12B

loc_4F105:
		add	si, 6
		shr	ax, 1
		jb	short loc_4F110
		add	si, ax
		jmp	short loc_4F122

loc_4F110:
		push	di
		mov	di, ax

loc_4F113:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_4F11D
		add	si, ax
		dec	si

loc_4F11D:
		sub	di, ax
		jnz	short loc_4F113
		pop	di

loc_4F122:
		jmp	short loc_4F0F6

loc_4F124:
		call	word ptr ss:488Ah
		jmp	short loc_4F0F1

loc_4F12B:
		inc	word ptr ss:46F6h
		sub	bp, 2
		dec	word ptr ss:4712h
		mov	ax, ss:4712h
		cmp	ax, ss:4741h
		jl	short loc_4F147
		dec	cl
		jnz	short loc_4F0DF

loc_4F147:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4F000		endp

; START OF FUNCTION CHUNK FOR sub_4F000
		push	ax
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Eh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		mov	di, [bp]
		add	di, ax
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_4F187
		mov	ah, al
		inc	ah

loc_4F178:
		dec	ah
		jz	short loc_4F186

loc_4F17C:
		lodsb
		add	dl, dh
		jnb	short loc_4F178
		stosb
		dec	ah
		jnz	short loc_4F17C

loc_4F186:
		ret

loc_4F187:
		mov	bx, ax

loc_4F189:
		lodsb
		shr	al, 1
		jb	short loc_4F1A2
		sub	bl, al
		mov	ah, al

loc_4F192:
		lodsb
		add	dl, dh
		jnb	short loc_4F198
		stosb

loc_4F198:
		dec	ah
		jnz	short loc_4F192
		or	bl, bl
		jnz	short loc_4F189
		jmp	short loc_4F1B4

loc_4F1A2:
		sub	bl, al
		mov	ah, al
		lodsb

loc_4F1A7:
		add	dl, dh
		jnb	short loc_4F1AC
		stosb

loc_4F1AC:
		dec	ah
		jnz	short loc_4F1A7
		or	bl, bl
		jnz	short loc_4F189

loc_4F1B4:
		mov	bx, ss:4710h
		ret
		push	ax
		mov	ax, [si+2]
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Eh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		mov	di, [bp]
		add	di, ax
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_4F1FA
		mov	ah, al
		inc	ah

loc_4F1E8:
		dec	ah
		jz	short loc_4F1F9

loc_4F1EC:
		lodsb
		add	dl, dh
		jnb	short loc_4F1E8
		mov	es:[di], al
		dec	di
		dec	ah
		jnz	short loc_4F1EC

loc_4F1F9:
		ret

loc_4F1FA:
		mov	bx, ax

loc_4F1FC:
		lodsb
		shr	al, 1
		jb	short loc_4F218
		sub	bl, al
		mov	ah, al

loc_4F205:
		lodsb
		add	dl, dh
		jnb	short loc_4F20E
		mov	es:[di], al
		dec	di

loc_4F20E:
		dec	ah
		jnz	short loc_4F205
		or	bl, bl
		jnz	short loc_4F1FC
		jmp	short loc_4F22D

loc_4F218:
		sub	bl, al
		mov	ah, al
		lodsb

loc_4F21D:
		add	dl, dh
		jnb	short loc_4F225
		mov	es:[di], al
		dec	di

loc_4F225:
		dec	ah
		jnz	short loc_4F21D
		or	bl, bl
		jnz	short loc_4F1FC

loc_4F22D:
		mov	bx, ss:4704h
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4F285
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4F24D:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4F263
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4F24D
		jz	short loc_4F274

loc_4F263:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4F24D

loc_4F274:
		pop	es
		pop	ax
		pop	cx
		mov	bx, ss:4710h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4F291

loc_4F285:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4F291:
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Eh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, ss:4710h
		mov	bx, ax
		cmp	ax, ss:4743h
		jle	short loc_4F2B7
		jmp	loc_4F342

loc_4F2B7:
		mov	ax, ss:4731h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:473Fh
		jl	short loc_4F342
		cmp	ax, ss:4743h
		jle	short loc_4F2F4
		mov	ax, ss:4743h
		inc	ax
		sub	ax, bx
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_4F342
		div	dh
		or	ah, ah
		jz	short loc_4F2F0
		inc	al

loc_4F2F0:
		mov	ss:4731h, al

loc_4F2F4:
		mov	ax, bx
		sub	ax, ss:473Fh
		jge	short loc_4F32E
		or	ax, ax
		jns	short loc_4F303
		neg	ax

loc_4F303:
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_4F342
		div	dh
		or	ah, ah
		jz	short loc_4F316
		inc	al

loc_4F316:
		xor	ah, ah
		sub	ss:4731h, ax
		jbe	short loc_4F342
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax

loc_4F32E:
		mov	di, [bp]
		add	di, bx
		mov	ah, ss:4731h

loc_4F338:
		lodsb
		add	dl, dh
		jnb	short loc_4F33E
		stosb

loc_4F33E:
		dec	ah
		jnz	short loc_4F338

loc_4F342:
		pop	ds
		pop	si
		ret
		shr	ax, 1
		mov	ss:4731h, ax
		jnb	short loc_4F392
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 474Ah

loc_4F35F:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4F375
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_4F35F
		jz	short loc_4F386

loc_4F375:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_4F35F

loc_4F386:
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 474Ah
		jmp	short loc_4F39E

loc_4F392:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_4F39E:
		add	ax, ss:470Ah
		mul	dh
		add	al, ss:462Eh
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		mov	bx, ss:4704h
		sub	bx, ax
		cmp	bx, ss:473Fh
		jge	short loc_4F3C4
		jmp	loc_4F44F

loc_4F3C4:
		mov	ax, ss:4731h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:4743h
		jg	short loc_4F44F
		cmp	ax, ss:473Fh
		jge	short loc_4F404
		mov	ax, bx
		inc	ax
		sub	ax, ss:473Fh
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_4F44F
		div	dh
		or	ah, ah
		jz	short loc_4F400
		inc	al

loc_4F400:
		mov	ss:4731h, al

loc_4F404:
		mov	ax, bx
		sub	ax, ss:4743h
		jle	short loc_4F438
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_4F44F
		div	dh
		or	ah, ah
		jz	short loc_4F420
		inc	al

loc_4F420:
		xor	ah, ah
		sub	ss:4731h, ax
		jbe	short loc_4F44F
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax

loc_4F438:
		mov	di, [bp]
		add	di, bx
		mov	ah, ss:4731h

loc_4F442:
		lodsb
		add	dl, dh
		jnb	short loc_4F44B
		mov	es:[di], al
		dec	di

loc_4F44B:
		dec	ah
		jnz	short loc_4F442

loc_4F44F:
		pop	ds
; END OF FUNCTION CHUNK FOR sub_4F000
seg147		ends
