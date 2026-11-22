seg152		segment	para public 'CODE' use16
		assume cs:seg152
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 0ADh, 98h, 4Fh

; ----------------------------------------------------------------------

sub_3F3C4		proc far
		call	sub_3E5CB
		jb	short loc_3F3EB
		mov	bx, ss:5068h
		call	sub_3E3EE
		jnb	short loc_3F3E1
		mov	word ptr ss:51EEh, 222h
		jmp	loc_3F8A2

loc_3F3E1:
		mov	word ptr ss:51EEh, 1A4h
		jmp	loc_3F47C

loc_3F3EB:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3F3C4		endp

; ----------------------------------------------------------------------

sub_3F3F0		proc far
		call	sub_3E5D8
		jb	short loc_3F41B
		mov	bx, ss:5068h
		mov	bp, ss:506Ah
		call	sub_3E3EE
		jnb	short loc_3F412
		mov	word ptr ss:51EEh, 3C2h
		jmp	loc_3F8A2

loc_3F412:
		mov	word ptr ss:51EEh, 342h
		jmp	short loc_3F47C

loc_3F41B:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3F3F0		endp

; ----------------------------------------------------------------------

sub_3F420		proc far
		call	sub_3E5E5
		jb	short loc_3F447
		mov	bx, ss:5064h
		call	sub_3E3EE
		jnb	short loc_3F43D
		mov	word ptr ss:51EEh, 222h
		jmp	loc_3F933

loc_3F43D:
		mov	word ptr ss:51EEh, 1A4h
		jmp	loc_3F4F0

loc_3F447:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3F420		endp

; ----------------------------------------------------------------------

sub_3F44C		proc far
		call	sub_3E5F2
		jb	short loc_3F477
		mov	bx, ss:5064h
		mov	bp, ss:506Ah
		call	sub_3E3EE
		jnb	short loc_3F46E
		mov	word ptr ss:51EEh, 3C2h
		jmp	loc_3F933

loc_3F46E:
		mov	word ptr ss:51EEh, 342h
		jmp	short loc_3F4F0

loc_3F477:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F47C:
		shl	bp, 1
		add	bp, ss:50A1h
		mov	ss:5076h, bp
		mov	ch, ss:4F92h
		mov	cl, ss:505Eh
		mov	bp, ss:50ABh

loc_3F497:
		add	ch, dh
		jb	short loc_3F4A9
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3F497
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F4A9:
		mov	di, ss:505Ah

loc_3F4AE:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3F4EB
		cmp	[si+4], di
		jz	short loc_3F4DA
		jg	short loc_3F4E1
		add	si, 6
		shr	ax, 1
		jb	short loc_3F4C6
		add	si, ax
		jmp	short loc_3F4D8

loc_3F4C6:
		push	di
		mov	di, ax

loc_3F4C9:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3F4D3
		add	si, ax
		dec	si

loc_3F4D3:
		sub	di, ax
		jnz	short loc_3F4C9
		pop	di

loc_3F4D8:
		jmp	short loc_3F4AE

loc_3F4DA:
		call	word ptr ss:51EEh
		jmp	short loc_3F4A9

loc_3F4E1:
		inc	word ptr ss:505Ah
		dec	bx
		dec	cl
		jnz	short loc_3F497

loc_3F4EB:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F4F0:
		shl	bp, 1
		add	bp, ss:50A1h
		mov	ss:5076h, bp
		mov	ch, ss:4F92h
		mov	cl, ss:505Eh
		mov	bp, ss:50ABh

loc_3F50B:
		add	ch, dh
		jb	short loc_3F51D
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3F50B
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F51D:
		mov	di, ss:505Ah

loc_3F522:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3F55F
		cmp	[si+4], di
		jz	short loc_3F54E
		jg	short loc_3F555
		add	si, 6
		shr	ax, 1
		jb	short loc_3F53A
		add	si, ax
		jmp	short loc_3F54C

loc_3F53A:
		push	di
		mov	di, ax

loc_3F53D:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3F547
		add	si, ax
		dec	si

loc_3F547:
		sub	di, ax
		jnz	short loc_3F53D
		pop	di

loc_3F54C:
		jmp	short loc_3F522

loc_3F54E:
		call	word ptr ss:51EEh
		jmp	short loc_3F51D

loc_3F555:
		inc	word ptr ss:505Ah
		inc	bx
		dec	cl
		jnz	short loc_3F50B

loc_3F55F:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
		push	ax
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mul	dh
		add	al, ss:4F93h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		add	ax, ss:5076h
		mov	di, ax
		mov	di, ss:[di]
		add	di, bx
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_3F5AA
		mov	ah, al
		inc	ah

loc_3F597:
		dec	ah
		jz	short loc_3F5A9

loc_3F59B:
		lodsb
		add	dl, dh
		jnb	short loc_3F597
		mov	es:[di], al
		add	di, bp
		dec	ah
		jnz	short loc_3F59B

loc_3F5A9:
		ret

loc_3F5AA:
		push	bx
		mov	bx, ax

loc_3F5AD:
		lodsb
		shr	al, 1
		jb	short loc_3F5CA
		sub	bl, al
		mov	ah, al

loc_3F5B6:
		lodsb
		add	dl, dh
		jnb	short loc_3F5C0
		mov	es:[di], al
		add	di, bp

loc_3F5C0:
		dec	ah
		jnz	short loc_3F5B6
		or	bl, bl
		jnz	short loc_3F5AD
		jmp	short loc_3F5E0

loc_3F5CA:
		sub	bl, al
		mov	ah, al
		lodsb

loc_3F5CF:
		add	dl, dh
		jnb	short loc_3F5D8
		mov	es:[di], al
		add	di, bp

loc_3F5D8:
		dec	ah
		jnz	short loc_3F5CF
		or	bl, bl
		jnz	short loc_3F5AD

loc_3F5E0:
		pop	bx
		ret
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3F62F
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3F5FC:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3F612
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3F5FC
		jz	short loc_3F623

loc_3F612:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3F5FC

loc_3F623:
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3F63B

loc_3F62F:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3F63B:
		add	ax, ss:506Eh
		mul	dh
		add	al, ss:4F93h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, ss:5076h
		mov	bx, ax
		cmp	ax, ss:50A9h
		jle	short loc_3F661

loc_3F65E:
		jmp	loc_3F6FF

loc_3F661:
		mov	ax, ss:5095h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:50A5h
		jl	short loc_3F65E
		cmp	ax, ss:50A9h
		jle	short loc_3F69F
		mov	ax, ss:50A9h
		sub	ax, bx
		mov	ah, al
		xor	al, al
		inc	ah
		sub	al, dl
		sbb	ah, 0
		jb	short loc_3F6FF
		div	dh
		or	ah, ah
		jz	short loc_3F69B
		inc	al

loc_3F69B:
		mov	ss:5095h, al

loc_3F69F:
		mov	ax, bx
		sub	ax, ss:50A5h
		jge	short loc_3F6D9
		or	ax, ax
		jns	short loc_3F6AE
		neg	ax

loc_3F6AE:
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_3F6FF
		div	dh
		or	ah, ah
		jz	short loc_3F6C1
		inc	al

loc_3F6C1:
		xor	ah, ah
		sub	ss:5095h, ax
		jle	short loc_3F6FF
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax

loc_3F6D9:
		mov	di, bx
		shl	di, 1
		add	di, ss:50A1h
		mov	di, ss:[di]
		add	di, bp
		mov	bx, ss:50ABh
		mov	ah, ss:5095h

loc_3F6F1:
		lodsb
		add	dl, dh
		jnb	short loc_3F6FB
		mov	es:[di], al
		add	di, bx

loc_3F6FB:
		dec	ah
		jnz	short loc_3F6F1

loc_3F6FF:
		pop	ds
		pop	si
		ret
		push	ax
		mov	ax, [si+2]
		add	ax, ss:506Eh
		mul	dh
		add	al, ss:4F93h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		neg	ax
		add	ax, ss:5076h
		mov	di, ax
		mov	di, ss:[di]
		add	di, bx
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_3F74A
		mov	ah, al
		inc	ah

loc_3F737:
		dec	ah
		jz	short loc_3F749

loc_3F73B:
		lodsb
		add	dl, dh
		jnb	short loc_3F737
		mov	es:[di], al
		sub	di, bp
		dec	ah
		jnz	short loc_3F73B

loc_3F749:
		ret

loc_3F74A:
		push	bx
		mov	bx, ax

loc_3F74D:
		lodsb
		shr	al, 1
		jb	short loc_3F76A
		sub	bl, al
		mov	ah, al

loc_3F756:
		lodsb
		add	dl, dh
		jnb	short loc_3F760
		mov	es:[di], al
		sub	di, bp

loc_3F760:
		dec	ah
		jnz	short loc_3F756
		or	bl, bl
		jnz	short loc_3F74D
		jmp	short loc_3F780

loc_3F76A:
		sub	bl, al
		mov	ah, al
		lodsb

loc_3F76F:
		add	dl, dh
		jnb	short loc_3F778
		mov	es:[di], al
		sub	di, bp

loc_3F778:
		dec	ah
		jnz	short loc_3F76F
		or	bl, bl
		jnz	short loc_3F74D

loc_3F780:
		pop	bx
		ret
		shr	ax, 1
		mov	ss:5095h, ax
		jnb	short loc_3F7CF
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 50AEh

loc_3F79C:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3F7B2
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3F79C
		jz	short loc_3F7C3

loc_3F7B2:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3F79C

loc_3F7C3:
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 50AEh
		jmp	short loc_3F7DB

loc_3F7CF:
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3F7DB:
		add	ax, ss:506Eh
		mul	dh
		add	al, ss:4F93h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		mov	bx, ss:5076h
		sub	bx, ax
		mov	ax, bx
		cmp	ax, ss:50A5h
		jge	short loc_3F803

loc_3F800:
		jmp	loc_3F89F

loc_3F803:
		mov	ax, ss:5095h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:50A9h
		jg	short loc_3F800
		cmp	ax, ss:50A5h
		jge	short loc_3F845
		mov	ax, ss:50A5h
		sub	ax, bx
		neg	ax
		mov	ah, al
		xor	al, al
		inc	ah
		sub	al, dl
		sbb	ah, 0
		jb	short loc_3F89F
		div	dh
		or	ah, ah
		jz	short loc_3F841
		inc	al

loc_3F841:
		mov	ss:5095h, al

loc_3F845:
		mov	ax, bx
		sub	ax, ss:50A9h
		jle	short loc_3F879
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_3F89F
		div	dh
		or	ah, ah
		jz	short loc_3F861
		inc	al

loc_3F861:
		xor	ah, ah
		sub	ss:5095h, ax
		jle	short loc_3F89F
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax

loc_3F879:
		mov	di, bx
		shl	di, 1
		add	di, ss:50A1h
		mov	di, ss:[di]
		add	di, bp
		mov	bx, ss:50ABh
		mov	ah, ss:5095h

loc_3F891:
		lodsb
		add	dl, dh
		jnb	short loc_3F89B
		mov	es:[di], al
		sub	di, bx

loc_3F89B:
		dec	ah
		jnz	short loc_3F891

loc_3F89F:
		pop	ds
		pop	si
		ret

loc_3F8A2:
		mov	ss:5076h, bp
		mov	ch, ss:4F92h
		mov	cl, ss:505Eh
		mov	bp, bx
		cmp	bp, ss:50A7h
		jle	short loc_3F8D1

loc_3F8BA:
		inc	word ptr ss:505Ah
		add	ch, dh
		jnb	short loc_3F8CB
		dec	bp
		cmp	bp, ss:50A7h
		jle	short loc_3F8D1

loc_3F8CB:
		dec	cl
		jnz	short loc_3F8BA
		jz	short loc_3F8DE

loc_3F8D1:
		add	ch, dh
		jb	short loc_3F8E3
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3F8D1

loc_3F8DE:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F8E3:
		mov	di, ss:505Ah

loc_3F8E8:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3F8DE
		cmp	[si+4], di
		jz	short loc_3F916
		jl	short loc_3F8F7
		jmp	short loc_3F91D

loc_3F8F7:
		add	si, 6
		shr	ax, 1
		jb	short loc_3F902
		add	si, ax
		jmp	short loc_3F914

loc_3F902:
		push	di
		mov	di, ax

loc_3F905:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3F90F
		add	si, ax
		dec	si

loc_3F90F:
		sub	di, ax
		jnz	short loc_3F905
		pop	di

loc_3F914:
		jmp	short loc_3F8E8

loc_3F916:
		call	word ptr ss:51EEh
		jmp	short loc_3F8E3

loc_3F91D:
		dec	bp
		cmp	bp, ss:50A3h
		jl	short loc_3F92E
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3F8D1

loc_3F92E:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F933:
		mov	ss:5076h, bp
		mov	ch, ss:4F92h
		mov	cl, ss:505Eh
		mov	bp, bx
		cmp	bp, ss:50A3h
		jge	short loc_3F962

loc_3F94B:
		inc	word ptr ss:505Ah
		add	ch, dh
		jnb	short loc_3F95C
		inc	bp
		cmp	bp, ss:50A3h
		jge	short loc_3F962

loc_3F95C:
		dec	cl
		jnz	short loc_3F94B
		jz	short loc_3F96F

loc_3F962:
		add	ch, dh
		jb	short loc_3F974
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3F962

loc_3F96F:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F974:
		mov	di, ss:505Ah

loc_3F979:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3F96F
		cmp	[si+4], di
		jz	short loc_3F9A7
		jl	short loc_3F988
		jmp	short loc_3F9AE

loc_3F988:
		add	si, 6
		shr	ax, 1
		jb	short loc_3F993
		add	si, ax
		jmp	short loc_3F9A5

loc_3F993:
		push	di
		mov	di, ax

loc_3F996:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3F9A0
		add	si, ax
		dec	si

loc_3F9A0:
		sub	di, ax
		jnz	short loc_3F996
		pop	di

loc_3F9A5:
		jmp	short loc_3F979

loc_3F9A7:
		call	word ptr ss:51EEh
		jmp	short loc_3F974

loc_3F9AE:
		inc	bp
		cmp	bp, ss:50A7h
		jg	short loc_3F9BF
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3F962

loc_3F9BF:
		pop	ds
sub_3F44C		endp
seg152		ends
