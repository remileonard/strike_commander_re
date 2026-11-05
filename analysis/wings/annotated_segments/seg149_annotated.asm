seg149		segment	para public 'CODE' use16
		assume cs:seg149
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Fh, 5Eh, 0C3h, 0

; ----------------------------------------------------------------------

sub_4FC44		proc far
		mov	ax, ss:4700h
		cmp	ax, ss:473Fh
		jl	short loc_4FC72
		mov	ax, ss:4704h
		cmp	ax, ss:4743h
		jg	short loc_4FC72
		mov	ax, ss:4702h
		cmp	ax, ss:4741h
		jl	short loc_4FC72
		mov	ax, ss:4706h
		cmp	ax, ss:4745h
		jg	short loc_4FC72
		clc
		retf

loc_4FC72:
		stc
		retf
sub_4FC44		endp

; ----------------------------------------------------------------------

sub_4FC74		proc far
		mov	ax, ds
		mov	es, ax
		mov	si, [bp+6]
		mov	di, 473Bh
		mov	cx, 6
		rep movsw
		mov	si, word_5E461
		shl	si, 1
		add	si, ss:473Dh
		mov	ax, [si+2]
		sub	ax, [si]
		mov	word_5E467, ax
		lds	si, [bp+0Ch]
		mov	bx, [bp+10h]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4], bx
		jb	short loc_4FD12
		stc
		jz	short loc_4FD12
		mov	ax, ds
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		lodsw
		mov	ss:4708h, ax
		mov	di, ax
		lodsw
		mov	ss:470Ah, ax
		stc
		adc	ax, di
		mov	ss:46F8h, ax
		lodsw
		mov	ss:470Ch, ax
		mov	di, ax
		neg	ax
		mov	ss:46F6h, ax
		lodsw
		mov	ss:470Eh, ax
		stc
		adc	ax, di
		mov	ss:46FAh, ax
		mov	ax, ss:473Bh
		mov	es, ax
		clc

loc_4FD12:
		jb	short loc_4FD5C
		mov	bx, [bp+12h]
		or	bx, bx
		jns	short loc_4FD1F
		add	bx, 168h

loc_4FD1F:
		mov	cl, ss:[bx+4198h]
		mov	ss:471Eh, cl
		mov	ch, ss:[bx+41F2h]
		mov	ss:471Fh, ch
		mov	al, ss:[bx+435Ah]
		add	al, ss:[bx+44C2h]
		xor	al, [bp+16h]
		cbw
		mov	di, ax
		mov	ax, [bp+14h]
		mov	ss:4728h, ax
		cmp	ax, 100h
		jnb	short loc_4FD54
		jmp	word ptr ss:[di+46B4h]

loc_4FD54:
		add	di, 8
		jmp	word ptr ss:[di+46B4h]

loc_4FD5C:
		retf
sub_4FC74		endp

; ----------------------------------------------------------------------

sub_4FD5D		proc far
		mov	dh, al
		mov	ax, ss:470Ah
		mov	cx, ss:470Ch
		jmp	short loc_4FD8F
sub_4FD5D		endp

; ----------------------------------------------------------------------

sub_4FD6A		proc far
		mov	dh, al
		mov	ax, ss:4708h
		mov	cx, ss:470Ch
		jmp	short loc_4FD8F
sub_4FD6A		endp

; ----------------------------------------------------------------------

sub_4FD77		proc far
		mov	dh, al
		mov	ax, ss:470Ah
		mov	cx, ss:470Eh
		jmp	short loc_4FD8F
sub_4FD77		endp

; ----------------------------------------------------------------------

sub_4FD84		proc far
		mov	dh, al
		mov	ax, ss:4708h
		mov	cx, ss:470Eh

loc_4FD8F:
		mov	bx, [bp+8]
		mul	dh
		neg	al
		mov	ss:462Eh, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ss:4710h, bx
		mov	ss:4700h, bx
		cmp	bx, ss:4743h
		jg	short loc_4FE1F
		mov	bp, [bp+0Ah]
		mov	ax, cx
		mul	dh
		neg	al
		mov	ss:462Fh, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bp
		mov	ss:4712h, ax
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_4FE1F
		mov	ax, ss:46F8h
		mul	dh
		add	al, ss:462Eh
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46FCh, ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_4FE1F
		mov	ax, ss:46FAh
		mul	dh
		add	al, ss:462Fh
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46FEh, ax
		add	ax, bp
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_4FE1F
		clc
		retf

loc_4FE1F:
		stc
		retf
sub_4FD84		endp

; ----------------------------------------------------------------------

sub_4FE21		proc far
		mov	dh, al
		mov	ax, ss:470Eh
		mov	cx, ss:470Ah
		jmp	short loc_4FE53
sub_4FE21		endp

; ----------------------------------------------------------------------

sub_4FE2E		proc far
		mov	dh, al
		mov	ax, ss:470Ch
		mov	cx, ss:470Ah
		jmp	short loc_4FE53
sub_4FE2E		endp

; ----------------------------------------------------------------------

sub_4FE3B		proc far
		mov	dh, al
		mov	ax, ss:470Eh
		mov	cx, ss:4708h
		jmp	short loc_4FE53
sub_4FE3B		endp

; ----------------------------------------------------------------------

sub_4FE48		proc far
		mov	dh, al
		mov	ax, ss:470Ch
		mov	cx, ss:4708h

loc_4FE53:
		mov	bx, [bp+8]
		mul	dh
		neg	al
		mov	ss:462Eh, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ss:4710h, bx
		mov	ss:4700h, bx
		cmp	bx, ss:4743h
		jg	short loc_4FEE5
		mov	bp, [bp+0Ah]
		mov	ax, cx
		mul	dh
		neg	al
		mov	ch, al
		mov	ss:462Fh, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:4712h, bp
		mov	ss:4702h, bp
		cmp	bp, ss:4745h
		jg	short loc_4FEE5
		mov	ax, ss:46F8h
		mul	dh
		add	al, ss:462Fh
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46FEh, ax
		add	ax, bp
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_4FEE5
		mov	ax, ss:46FAh
		mul	dh
		add	al, ss:462Eh
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46FCh, ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_4FEE5
		clc
		retf

loc_4FEE5:
		stc
		retf
sub_4FE48		endp

; ----------------------------------------------------------------------

sub_4FEE7		proc far
		mov	dl, al
		mov	al, cl
		mul	dl
		mov	al, ah
		xor	ah, ah
		mov	cl, al
		or	ax, ax
		jnz	short loc_4FEF8
		inc	ax

loc_4FEF8:
		mov	ss:471Ah, ax
		mov	al, ch
		mul	dl
		mov	al, ah
		xor	ah, ah
		mov	ch, al
		or	ax, ax
		jnz	short loc_4FF0B
		inc	ax

loc_4FF0B:
		mov	ss:471Ch, ax
		mov	ss:471Eh, cx
		mov	ax, ss:46FAh
		mul	cl
		mov	di, ax
		mov	ax, ss:46F8h
		mul	ch
		add	ax, di
		neg	al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46FEh, ax
		mov	ax, ss:46FAh
		mul	ch
		mov	di, ax
		mov	ax, ss:46F8h
		mul	cl
		add	ax, di
		neg	al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46FCh, ax
		mov	bx, [bp+8]
		mov	bp, [bp+0Ah]
		retf
sub_4FEE7		endp

; ----------------------------------------------------------------------

sub_4FF57		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:4702h, bp
		cmp	bp, ss:4745h
		jg	short loc_4FFD4
		mov	ax, ss:46FEh
		add	ax, bp
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_4FFD4
		mov	ax, ss:46FAh
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bx
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_4FFD4
		add	ax, ss:46FCh
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_4FFD4
		clc
		retf

loc_4FFD4:
		stc
		retf
sub_4FF57		endp

; ----------------------------------------------------------------------

sub_4FFD6		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:4704h, bx
		cmp	bx, ss:473Fh
		jl	short loc_50055
		mov	ax, ss:46FCh
		neg	ax
		add	ax, bx
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_50055
		mov	ax, ss:46F8h
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_50055
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_50055
		clc
		retf

loc_50055:
		stc
		retf
sub_4FFD6		endp

; ----------------------------------------------------------------------

sub_50057		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:4700h, bx
		cmp	bx, ss:4743h
		jg	short loc_500D4
		mov	ax, ss:46FCh
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_500D4
		mov	ax, ss:46FAh
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_500D4
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_500D4
		clc
		retf

loc_500D4:
		stc
		retf
sub_50057		endp

; ----------------------------------------------------------------------

sub_500D6		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:4706h, bp
		cmp	bp, ss:4741h
		jl	short loc_50153
		mov	ax, ss:46FEh
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_50153
		mov	ax, ss:46FAh
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_50153
		sub	ax, ss:46FCh
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_50153
		clc
		retf

loc_50153:
		stc
		retf
sub_500D6		endp

; ----------------------------------------------------------------------

sub_50155		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:4704h, bx
		cmp	bx, ss:473Fh
		jl	short loc_501D4
		mov	ax, ss:46FCh
		neg	ax
		add	ax, bx
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_501D4
		mov	ax, ss:46FAh
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_501D4
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_501D4
		clc
		retf

loc_501D4:
		stc
		retf
sub_50155		endp

; ----------------------------------------------------------------------

sub_501D6		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:4706h, bp
		cmp	bp, ss:4741h
		jl	short loc_50253
		mov	ax, ss:46FEh
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_50253
		mov	ax, ss:46F8h
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_50253
		sub	ax, ss:46FCh
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_50253
		clc
		retf

loc_50253:
		stc
		retf
sub_501D6		endp

; ----------------------------------------------------------------------

sub_50255		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:4702h, bp
		cmp	bp, ss:4745h
		jg	short loc_502D0
		mov	ax, ss:46FEh
		add	ax, bp
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_502D0
		mov	ax, ss:46FAh
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_502D0
		sub	ax, ss:46FCh
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_502D0
		clc
		retf

loc_502D0:
		stc
		retf
sub_50255		endp

; ----------------------------------------------------------------------

sub_502D2		proc far
		push	cs
		call	near ptr sub_4FEE7
		mov	ax, ss:470Ch
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:4700h, bx
		cmp	bx, ss:4743h
		jg	short loc_5034F
		mov	ax, ss:46FCh
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_5034F
		mov	ax, ss:46F8h
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_5034F
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_5034F
		clc
		retf

loc_5034F:
		stc
		retf
sub_502D2		endp

; ----------------------------------------------------------------------

sub_50351		proc far
		mov	bx, ax
		mov	ax, ss:470Ah
		mov	cx, ss:470Ch
		jmp	short loc_50383
sub_50351		endp

; ----------------------------------------------------------------------

sub_5035E		proc far
		mov	bx, ax
		mov	ax, ss:4708h
		mov	cx, ss:470Ch
		jmp	short loc_50383
sub_5035E		endp

; ----------------------------------------------------------------------

sub_5036B		proc far
		mov	bx, ax
		mov	ax, ss:470Ah
		mov	cx, ss:470Eh
		jmp	short loc_50383
sub_5036B		endp

; ----------------------------------------------------------------------

sub_50378		proc far
		mov	bx, ax
		mov	ax, ss:4708h
		mov	cx, ss:470Eh

loc_50383:
		mul	bx
		neg	al
		mov	ss:462Eh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+8]
		mov	ss:4710h, ax
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_50417
		mov	ax, cx
		mul	bx
		neg	al
		mov	ss:462Fh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+0Ah]
		mov	ss:4712h, ax
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_50417
		mov	ax, ss:46F8h
		mul	bx
		add	al, ss:462Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_50417
		add	ax, ss:4710h
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_50417
		mov	ax, ss:46FAh
		mul	bx
		add	al, ss:462Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_50417
		add	ax, ss:4712h
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_50417
		clc
		retf

loc_50417:
		stc
		retf
sub_50378		endp

; ----------------------------------------------------------------------

sub_50419		proc far
		mov	di, ax
		xor	ax, ax
		mov	al, cl
		mul	di
		mov	al, ah
		mov	ah, dl
		mov	ss:471Ah, ax
		mov	ss:4720h, ah
		mov	ss:4722h, ah
		xor	ax, ax
		mov	al, ch
		mul	di
		mov	al, ah
		mov	ah, dl
		mov	ss:471Ch, ax
		mov	ss:4721h, ah
		mov	ss:4723h, ah
		mov	ax, ss:46FAh
		mul	word ptr ss:471Ah
		mov	di, dx
		mov	bx, ax
		mov	ax, ss:46F8h
		mul	word ptr ss:471Ch
		add	ax, bx
		adc	dx, di
		neg	al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	ss:46FEh, ax
		mov	ax, ss:46FAh
		mul	word ptr ss:471Ch
		mov	di, dx
		mov	bx, ax
		mov	ax, ss:46F8h
		mul	word ptr ss:471Ah
		add	ax, bx
		adc	dx, di
		neg	al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	ss:46FCh, ax
		mov	bx, [bp+8]
		mov	bp, [bp+0Ah]
		retf
sub_50419		endp

; ----------------------------------------------------------------------

sub_504A6		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:4702h, bp
		cmp	bp, ss:4745h
		jg	short loc_50541
		mov	ax, ss:46FEh
		add	ax, bp
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_50541
		mov	ax, ss:46FAh
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bx
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_50541
		add	ax, ss:46FCh
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_50541
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_50541:
		stc
		retf
sub_504A6		endp

; ----------------------------------------------------------------------

sub_50543		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:4704h, bx
		cmp	bx, ss:473Fh
		jl	short loc_505E0
		mov	ax, ss:46FCh
		neg	ax
		add	ax, bx
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_505E0
		mov	ax, ss:46F8h
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_505E0
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_505E0
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_505E0:
		stc
		retf
sub_50543		endp

; ----------------------------------------------------------------------

sub_505E2		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:4700h, bx
		cmp	bx, ss:4743h
		jg	short loc_5067D
		mov	ax, ss:46FCh
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_5067D
		mov	ax, ss:46FAh
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_5067D
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_5067D
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_5067D:
		stc
		retf
sub_505E2		endp

; ----------------------------------------------------------------------

sub_5067F		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:4706h, bp
		cmp	bp, ss:4741h
		jl	short loc_5071A
		mov	ax, ss:46FEh
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_5071A
		mov	ax, ss:46FAh
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_5071A
		sub	ax, ss:46FCh
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_5071A
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_5071A:
		stc
		retf
sub_5067F		endp

; ----------------------------------------------------------------------

sub_5071C		proc far
		mov	bx, ax
		mov	ax, ss:470Eh
		mov	cx, ss:470Ah
		jmp	short loc_5074E
sub_5071C		endp

; ----------------------------------------------------------------------

sub_50729		proc far
		mov	bx, ax
		mov	ax, ss:470Ch
		mov	cx, ss:470Ah
		jmp	short loc_5074E
sub_50729		endp

; ----------------------------------------------------------------------

sub_50736		proc far
		mov	bx, ax
		mov	ax, ss:470Eh
		mov	cx, ss:4708h
		jmp	short loc_5074E
sub_50736		endp

; ----------------------------------------------------------------------

sub_50743		proc far
		mov	bx, ax
		mov	ax, ss:470Ch
		mov	cx, ss:4708h

loc_5074E:
		inc	ax
		mul	bx
		mov	ss:462Eh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+8]
		mov	ss:4710h, ax
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_507DF
		mov	ax, cx
		mul	bx
		mov	ss:462Fh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+0Ah]
		mov	ss:4712h, ax
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_507DF
		mov	ax, ss:46FAh
		mul	bx
		add	al, ss:462Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_507DF
		add	ax, ss:4710h
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_507DF
		mov	ax, ss:46F8h
		mul	bx
		add	al, ss:462Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_507DF
		add	ax, ss:4712h
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_507DF
		clc
		retf

loc_507DF:
		stc
		retf
sub_50743		endp

; ----------------------------------------------------------------------

sub_507E1		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:4704h, bx
		cmp	bx, ss:473Fh
		jl	short loc_5087E
		mov	ax, ss:46FCh
		neg	ax
		add	ax, bx
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_5087E
		mov	ax, ss:46FAh
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_5087E
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_5087E
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_5087E:
		stc
		retf
sub_507E1		endp

; ----------------------------------------------------------------------

sub_50880		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:4706h, bp
		cmp	bp, ss:4741h
		jl	short loc_5091B
		mov	ax, ss:46FEh
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_5091B
		mov	ax, ss:46F8h
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_5091B
		sub	ax, ss:46FCh
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_5091B
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_5091B:
		stc
		retf
sub_50880		endp

; ----------------------------------------------------------------------

sub_5091D		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:4702h, bp
		cmp	bp, ss:4745h
		jg	short loc_509B6
		mov	ax, ss:46FEh
		add	ax, bp
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_509B6
		mov	ax, ss:46FAh
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_509B6
		sub	ax, ss:46FCh
		mov	ss:4700h, ax
		cmp	ax, ss:4743h
		jg	short loc_509B6
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_509B6:
		stc
		retf
sub_5091D		endp

; ----------------------------------------------------------------------

sub_509B8		proc far
		push	cs
		call	near ptr sub_50419
		mov	ax, ss:470Ch
		mov	di, ax
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:470Ah
		mov	di, ax
		mul	word ptr ss:471Ah
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:4700h, bx
		cmp	bx, ss:4743h
		jg	short loc_50A53
		mov	ax, ss:46FCh
		add	ax, bx
		mov	ss:4704h, ax
		cmp	ax, ss:473Fh
		jl	short loc_50A53
		mov	ax, ss:46F8h
		mul	word ptr ss:471Ch
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:4702h, ax
		cmp	ax, ss:4745h
		jg	short loc_50A53
		add	ax, ss:46FEh
		mov	ss:4706h, ax
		cmp	ax, ss:4741h
		jl	short loc_50A53
		mov	ss:4710h, bx
		mov	ss:4712h, bp
		mov	bx, ss:471Eh
		clc
		retf

loc_50A53:
		stc
		retf
sub_509B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50A55		proc far

arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	di
		push	ds
		push	ds
		mov	ax, [bp+arg_12]
		push	ax
		push	cs
		call	near ptr sub_4FC74
		pop	ax
		pop	ds
		jb	short loc_50A7D
		mov	di, ax
		mov	bx, 6

loc_50A6C:
		mov	ax, ss:[bx+4700h]
		mov	[bx+di], ax
		sub	bx, 2
		jge	short loc_50A6C
		mov	ax, 1
		jmp	short loc_50A80

loc_50A7D:
		mov	ax, 0

loc_50A80:
		pop	ds
		pop	di
		pop	bp
		retf
sub_50A55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50A84		proc far

saved_0		= word ptr  0
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		mov	ax, [bp+arg_12]
		mov	ss:4892h, al
		push	cs
		call	near ptr sub_4FC74
		jb	short loc_50B03
		mov	bx, ss:4700h
		mov	ax, ss:4704h
		cmp	ax, ss:4743h
		jle	short loc_50AAB
		mov	ax, ss:4743h

loc_50AAB:
		cmp	bx, ss:473Fh
		jge	short loc_50AB7
		mov	bx, ss:473Fh

loc_50AB7:
		sub	ax, bx
		inc	ax
		mov	dx, ax
		mov	bp, ss:4702h
		mov	ax, ss:4706h
		cmp	ax, ss:4745h
		jle	short loc_50AD0
		mov	ax, ss:4745h

loc_50AD0:
		cmp	bp, ss:4741h
		jge	short loc_50ADC
		mov	bp, ss:4741h

loc_50ADC:
		sub	ax, bp
		inc	ax
		mov	si, ax
		shl	bp, 1
		add	bp, ss:473Dh
		mov	al, ss:4892h
		mov	ah, al

loc_50AEE:
		mov	di, [bp+saved_0]
		add	di, bx
		mov	cx, dx
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	bp, 2
		dec	si
		jg	short loc_50AEE

loc_50B03:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_50A84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50B08		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		cmp	[bp+arg_E], 100h
		jnz	short loc_50B29
		mov	bx, [bp+arg_C]
		mov	al, [bp+arg_10]
		cbw
		cmp	ax, bx
		jnz	short loc_50B29
		pop	ds
		pop	di
		pop	si
		pop	bp
		jmp	sub_4A194

loc_50B29:
		mov	ax, ds
		mov	es, ax
		mov	si, [bp+arg_0]
		mov	di, 473Bh
		mov	cx, 6
		rep movsw
		mov	si, word_5E461
		shl	si, 1
		add	si, ss:473Dh
		mov	ax, [si+2]
		sub	ax, [si]
		mov	word_5E467, ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4], bx
		jb	short loc_50BC7
		stc
		jz	short loc_50BC7
		mov	ax, ds
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		lodsw
		mov	ss:4708h, ax
		mov	di, ax
		lodsw
		mov	ss:470Ah, ax
		stc
		adc	ax, di
		mov	ss:46F8h, ax
		lodsw
		mov	ss:470Ch, ax
		mov	di, ax
		neg	ax
		mov	ss:46F6h, ax
		lodsw
		mov	ss:470Eh, ax
		stc
		adc	ax, di
		mov	ss:46FAh, ax
		mov	ax, ss:473Bh
		mov	es, ax
		clc

loc_50BC7:
		jnb	short loc_50BCE
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_50BCE:
		mov	bx, [bp+arg_C]
		or	bx, bx
		jns	short loc_50BD9
		add	bx, 168h

loc_50BD9:
		mov	cl, ss:[bx+4198h]
		mov	ss:471Eh, cl
		mov	ch, ss:[bx+41F2h]
		mov	ss:471Fh, ch
		mov	al, ss:[bx+435Ah]
		add	al, ss:[bx+44C2h]
		xor	al, [bp+arg_10]
		cbw
		mov	di, ax
		mov	ax, [bp+arg_E]
		mov	ss:4728h, ax
		cmp	ax, 100h
		jnb	short loc_50C10
		shl	di, 1
		jmp	dword ptr ss:[di+4634h]
sub_50B08		endp
seg149		ends
