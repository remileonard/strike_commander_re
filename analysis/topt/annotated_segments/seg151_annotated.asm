seg151		segment	para public 'CODE' use16
		assume cs:seg151
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 50h, 8Bh, 0CDh, 0F3h, 0A4h, 0FEh, 0CEh, 75h, 0DFh

loc_3E3E9:
		db 0FCh, 1Fh, 5Eh, 0C3h, 0

; ----------------------------------------------------------------------

sub_3E3EE		proc far
		mov	ax, ss:5064h
		cmp	ax, ss:50A3h
		jl	short loc_3E41C
		mov	ax, ss:5068h
		cmp	ax, ss:50A7h
		jg	short loc_3E41C
		mov	ax, ss:5066h
		cmp	ax, ss:50A5h
		jl	short loc_3E41C
		mov	ax, ss:506Ah
		cmp	ax, ss:50A9h
		jg	short loc_3E41C
		clc
		retf

loc_3E41C:
		stc
		retf
sub_3E3EE		endp

; ----------------------------------------------------------------------

sub_3E41E		proc far
		mov	ax, ds
		mov	es, ax
		mov	si, [bp+6]
		mov	di, 509Fh
		mov	cx, 6
		rep movsw
		mov	si, word_4DA85
		shl	si, 1
		add	si, ss:50A1h
		mov	ax, [si+2]
		sub	ax, [si]
		mov	word_4DA8B, ax
		lds	si, [bp+0Ch]
		mov	bx, [bp+10h]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4], bx
		jb	short loc_3E4BC
		stc
		jz	short loc_3E4BC
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
		mov	ss:506Ch, ax
		mov	di, ax
		lodsw
		mov	ss:506Eh, ax
		stc
		adc	ax, di
		mov	ss:505Ch, ax
		lodsw
		mov	ss:5070h, ax
		mov	di, ax
		neg	ax
		mov	ss:505Ah, ax
		lodsw
		mov	ss:5072h, ax
		stc
		adc	ax, di
		mov	ss:505Eh, ax
		mov	ax, ss:509Fh
		mov	es, ax
		clc

loc_3E4BC:
		jb	short loc_3E506
		mov	bx, [bp+12h]
		or	bx, bx
		jns	short loc_3E4C9
		add	bx, 168h

loc_3E4C9:
		mov	cl, ss:[bx+4AFCh]
		mov	ss:5082h, cl
		mov	ch, ss:[bx+4B56h]
		mov	ss:5083h, ch
		mov	al, ss:[bx+4CBEh]
		add	al, ss:[bx+4E26h]
		xor	al, [bp+16h]
		cbw
		mov	di, ax
		mov	ax, [bp+14h]
		mov	ss:508Ch, ax
		cmp	ax, 100h
		jnb	short loc_3E4FE
		jmp	word ptr ss:[di+5018h]

loc_3E4FE:
		add	di, 8
		jmp	word ptr ss:[di+5018h]

loc_3E506:
		retf
sub_3E41E		endp

; ----------------------------------------------------------------------

sub_3E507		proc far
		mov	dh, al
		mov	ax, ss:506Eh
		mov	cx, ss:5070h
		jmp	short loc_3E539
sub_3E507		endp

; ----------------------------------------------------------------------

sub_3E514		proc far
		mov	dh, al
		mov	ax, ss:506Ch
		mov	cx, ss:5070h
		jmp	short loc_3E539
sub_3E514		endp

; ----------------------------------------------------------------------

sub_3E521		proc far
		mov	dh, al
		mov	ax, ss:506Eh
		mov	cx, ss:5072h
		jmp	short loc_3E539
sub_3E521		endp

; ----------------------------------------------------------------------

sub_3E52E		proc far
		mov	dh, al
		mov	ax, ss:506Ch
		mov	cx, ss:5072h

loc_3E539:
		mov	bx, [bp+8]
		mul	dh
		neg	al
		mov	ss:4F92h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ss:5074h, bx
		mov	ss:5064h, bx
		cmp	bx, ss:50A7h
		jg	short loc_3E5C9
		mov	bp, [bp+0Ah]
		mov	ax, cx
		mul	dh
		neg	al
		mov	ss:4F93h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bp
		mov	ss:5076h, ax
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3E5C9
		mov	ax, ss:505Ch
		mul	dh
		add	al, ss:4F92h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:5060h, ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3E5C9
		mov	ax, ss:505Eh
		mul	dh
		add	al, ss:4F93h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:5062h, ax
		add	ax, bp
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3E5C9
		clc
		retf

loc_3E5C9:
		stc
		retf
sub_3E52E		endp

; ----------------------------------------------------------------------

sub_3E5CB		proc far
		mov	dh, al
		mov	ax, ss:5072h
		mov	cx, ss:506Eh
		jmp	short loc_3E5FD
sub_3E5CB		endp

; ----------------------------------------------------------------------

sub_3E5D8		proc far
		mov	dh, al
		mov	ax, ss:5070h
		mov	cx, ss:506Eh
		jmp	short loc_3E5FD
sub_3E5D8		endp

; ----------------------------------------------------------------------

sub_3E5E5		proc far
		mov	dh, al
		mov	ax, ss:5072h
		mov	cx, ss:506Ch
		jmp	short loc_3E5FD
sub_3E5E5		endp

; ----------------------------------------------------------------------

sub_3E5F2		proc far
		mov	dh, al
		mov	ax, ss:5070h
		mov	cx, ss:506Ch

loc_3E5FD:
		mov	bx, [bp+8]
		mul	dh
		neg	al
		mov	ss:4F92h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ss:5074h, bx
		mov	ss:5064h, bx
		cmp	bx, ss:50A7h
		jg	short loc_3E68F
		mov	bp, [bp+0Ah]
		mov	ax, cx
		mul	dh
		neg	al
		mov	ch, al
		mov	ss:4F93h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:5076h, bp
		mov	ss:5066h, bp
		cmp	bp, ss:50A9h
		jg	short loc_3E68F
		mov	ax, ss:505Ch
		mul	dh
		add	al, ss:4F93h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:5062h, ax
		add	ax, bp
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3E68F
		mov	ax, ss:505Eh
		mul	dh
		add	al, ss:4F92h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:5060h, ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3E68F
		clc
		retf

loc_3E68F:
		stc
		retf
sub_3E5F2		endp

; ----------------------------------------------------------------------

sub_3E691		proc far
		mov	dl, al
		mov	al, cl
		mul	dl
		mov	al, ah
		xor	ah, ah
		mov	cl, al
		or	ax, ax
		jnz	short loc_3E6A2
		inc	ax

loc_3E6A2:
		mov	ss:507Eh, ax
		mov	al, ch
		mul	dl
		mov	al, ah
		xor	ah, ah
		mov	ch, al
		or	ax, ax
		jnz	short loc_3E6B5
		inc	ax

loc_3E6B5:
		mov	ss:5080h, ax
		mov	ss:5082h, cx
		mov	ax, ss:505Eh
		mul	cl
		mov	di, ax
		mov	ax, ss:505Ch
		mul	ch
		add	ax, di
		neg	al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:5062h, ax
		mov	ax, ss:505Eh
		mul	ch
		mov	di, ax
		mov	ax, ss:505Ch
		mul	cl
		add	ax, di
		neg	al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:5060h, ax
		mov	bx, [bp+8]
		mov	bp, [bp+0Ah]
		retf
sub_3E691		endp

; ----------------------------------------------------------------------

sub_3E701		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:5066h, bp
		cmp	bp, ss:50A9h
		jg	short loc_3E77E
		mov	ax, ss:5062h
		add	ax, bp
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3E77E
		mov	ax, ss:505Eh
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bx
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3E77E
		add	ax, ss:5060h
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3E77E
		clc
		retf

loc_3E77E:
		stc
		retf
sub_3E701		endp

; ----------------------------------------------------------------------

sub_3E780		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:5068h, bx
		cmp	bx, ss:50A3h
		jl	short loc_3E7FF
		mov	ax, ss:5060h
		neg	ax
		add	ax, bx
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3E7FF
		mov	ax, ss:505Ch
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3E7FF
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3E7FF
		clc
		retf

loc_3E7FF:
		stc
		retf
sub_3E780		endp

; ----------------------------------------------------------------------

sub_3E801		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:5064h, bx
		cmp	bx, ss:50A7h
		jg	short loc_3E87E
		mov	ax, ss:5060h
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3E87E
		mov	ax, ss:505Eh
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3E87E
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3E87E
		clc
		retf

loc_3E87E:
		stc
		retf
sub_3E801		endp

; ----------------------------------------------------------------------

sub_3E880		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:506Ah, bp
		cmp	bp, ss:50A5h
		jl	short loc_3E8FD
		mov	ax, ss:5062h
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3E8FD
		mov	ax, ss:505Eh
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3E8FD
		sub	ax, ss:5060h
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3E8FD
		clc
		retf

loc_3E8FD:
		stc
		retf
sub_3E880		endp

; ----------------------------------------------------------------------

sub_3E8FF		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:5068h, bx
		cmp	bx, ss:50A3h
		jl	short loc_3E97E
		mov	ax, ss:5060h
		neg	ax
		add	ax, bx
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3E97E
		mov	ax, ss:505Eh
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3E97E
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3E97E
		clc
		retf

loc_3E97E:
		stc
		retf
sub_3E8FF		endp

; ----------------------------------------------------------------------

sub_3E980		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:506Ah, bp
		cmp	bp, ss:50A5h
		jl	short loc_3E9FD
		mov	ax, ss:5062h
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3E9FD
		mov	ax, ss:505Ch
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3E9FD
		sub	ax, ss:5060h
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3E9FD
		clc
		retf

loc_3E9FD:
		stc
		retf
sub_3E980		endp

; ----------------------------------------------------------------------

sub_3E9FF		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:5066h, bp
		cmp	bp, ss:50A9h
		jg	short loc_3EA7A
		mov	ax, ss:5062h
		add	ax, bp
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3EA7A
		mov	ax, ss:505Eh
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3EA7A
		sub	ax, ss:5060h
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3EA7A
		clc
		retf

loc_3EA7A:
		stc
		retf
sub_3E9FF		endp

; ----------------------------------------------------------------------

sub_3EA7C		proc far
		push	cs
		call	near ptr sub_3E691
		mov	ax, ss:5070h
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
		mov	ax, ss:506Eh
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
		mov	ss:5064h, bx
		cmp	bx, ss:50A7h
		jg	short loc_3EAF9
		mov	ax, ss:5060h
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3EAF9
		mov	ax, ss:505Ch
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3EAF9
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3EAF9
		clc
		retf

loc_3EAF9:
		stc
		retf
sub_3EA7C		endp

; ----------------------------------------------------------------------

sub_3EAFB		proc far
		mov	bx, ax
		mov	ax, ss:506Eh
		mov	cx, ss:5070h
		jmp	short loc_3EB2D
sub_3EAFB		endp

; ----------------------------------------------------------------------

sub_3EB08		proc far
		mov	bx, ax
		mov	ax, ss:506Ch
		mov	cx, ss:5070h
		jmp	short loc_3EB2D
sub_3EB08		endp

; ----------------------------------------------------------------------

sub_3EB15		proc far
		mov	bx, ax
		mov	ax, ss:506Eh
		mov	cx, ss:5072h
		jmp	short loc_3EB2D
sub_3EB15		endp

; ----------------------------------------------------------------------

sub_3EB22		proc far
		mov	bx, ax
		mov	ax, ss:506Ch
		mov	cx, ss:5072h

loc_3EB2D:
		mul	bx
		neg	al
		mov	ss:4F92h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+8]
		mov	ss:5074h, ax
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3EBC1
		mov	ax, cx
		mul	bx
		neg	al
		mov	ss:4F93h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+0Ah]
		mov	ss:5076h, ax
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3EBC1
		mov	ax, ss:505Ch
		mul	bx
		add	al, ss:4F92h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_3EBC1
		add	ax, ss:5074h
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3EBC1
		mov	ax, ss:505Eh
		mul	bx
		add	al, ss:4F93h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_3EBC1
		add	ax, ss:5076h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3EBC1
		clc
		retf

loc_3EBC1:
		stc
		retf
sub_3EB22		endp

; ----------------------------------------------------------------------

sub_3EBC3		proc far
		mov	di, ax
		xor	ax, ax
		mov	al, cl
		mul	di
		mov	al, ah
		mov	ah, dl
		mov	ss:507Eh, ax
		mov	ss:5084h, ah
		mov	ss:5086h, ah
		xor	ax, ax
		mov	al, ch
		mul	di
		mov	al, ah
		mov	ah, dl
		mov	ss:5080h, ax
		mov	ss:5085h, ah
		mov	ss:5087h, ah
		mov	ax, ss:505Eh
		mul	word ptr ss:507Eh
		mov	di, dx
		mov	bx, ax
		mov	ax, ss:505Ch
		mul	word ptr ss:5080h
		add	ax, bx
		adc	dx, di
		neg	al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	ss:5062h, ax
		mov	ax, ss:505Eh
		mul	word ptr ss:5080h
		mov	di, dx
		mov	bx, ax
		mov	ax, ss:505Ch
		mul	word ptr ss:507Eh
		add	ax, bx
		adc	dx, di
		neg	al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	ss:5060h, ax
		mov	bx, [bp+8]
		mov	bp, [bp+0Ah]
		retf
sub_3EBC3		endp

; ----------------------------------------------------------------------

sub_3EC50		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:5066h, bp
		cmp	bp, ss:50A9h
		jg	short loc_3ECEB
		mov	ax, ss:5062h
		add	ax, bp
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3ECEB
		mov	ax, ss:505Eh
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bx
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3ECEB
		add	ax, ss:5060h
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3ECEB
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3ECEB:
		stc
		retf
sub_3EC50		endp

; ----------------------------------------------------------------------

sub_3ECED		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:5068h, bx
		cmp	bx, ss:50A3h
		jl	short loc_3ED8A
		mov	ax, ss:5060h
		neg	ax
		add	ax, bx
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3ED8A
		mov	ax, ss:505Ch
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3ED8A
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3ED8A
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3ED8A:
		stc
		retf
sub_3ECED		endp

; ----------------------------------------------------------------------

sub_3ED8C		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:5064h, bx
		cmp	bx, ss:50A7h
		jg	short loc_3EE27
		mov	ax, ss:5060h
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3EE27
		mov	ax, ss:505Eh
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3EE27
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3EE27
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3EE27:
		stc
		retf
sub_3ED8C		endp

; ----------------------------------------------------------------------

sub_3EE29		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:506Ah, bp
		cmp	bp, ss:50A5h
		jl	short loc_3EEC4
		mov	ax, ss:5062h
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3EEC4
		mov	ax, ss:505Eh
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3EEC4
		sub	ax, ss:5060h
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3EEC4
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3EEC4:
		stc
		retf
sub_3EE29		endp

; ----------------------------------------------------------------------

sub_3EEC6		proc far
		mov	bx, ax
		mov	ax, ss:5072h
		mov	cx, ss:506Eh
		jmp	short loc_3EEF8
sub_3EEC6		endp

; ----------------------------------------------------------------------

sub_3EED3		proc far
		mov	bx, ax
		mov	ax, ss:5070h
		mov	cx, ss:506Eh
		jmp	short loc_3EEF8
sub_3EED3		endp

; ----------------------------------------------------------------------

sub_3EEE0		proc far
		mov	bx, ax
		mov	ax, ss:5072h
		mov	cx, ss:506Ch
		jmp	short loc_3EEF8
sub_3EEE0		endp

; ----------------------------------------------------------------------

sub_3EEED		proc far
		mov	bx, ax
		mov	ax, ss:5070h
		mov	cx, ss:506Ch

loc_3EEF8:
		inc	ax
		mul	bx
		mov	ss:4F92h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+8]
		mov	ss:5074h, ax
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3EF89
		mov	ax, cx
		mul	bx
		mov	ss:4F93h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+0Ah]
		mov	ss:5076h, ax
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3EF89
		mov	ax, ss:505Eh
		mul	bx
		add	al, ss:4F92h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_3EF89
		add	ax, ss:5074h
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3EF89
		mov	ax, ss:505Ch
		mul	bx
		add	al, ss:4F93h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_3EF89
		add	ax, ss:5076h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3EF89
		clc
		retf

loc_3EF89:
		stc
		retf
sub_3EEED		endp

; ----------------------------------------------------------------------

sub_3EF8B		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:5068h, bx
		cmp	bx, ss:50A3h
		jl	short loc_3F028
		mov	ax, ss:5060h
		neg	ax
		add	ax, bx
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3F028
		mov	ax, ss:505Eh
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3F028
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3F028
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3F028:
		stc
		retf
sub_3EF8B		endp

; ----------------------------------------------------------------------

sub_3F02A		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:506Ah, bp
		cmp	bp, ss:50A5h
		jl	short loc_3F0C5
		mov	ax, ss:5062h
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3F0C5
		mov	ax, ss:505Ch
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3F0C5
		sub	ax, ss:5060h
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3F0C5
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3F0C5:
		stc
		retf
sub_3F02A		endp

; ----------------------------------------------------------------------

sub_3F0C7		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:5066h, bp
		cmp	bp, ss:50A9h
		jg	short loc_3F160
		mov	ax, ss:5062h
		add	ax, bp
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3F160
		mov	ax, ss:505Eh
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3F160
		sub	ax, ss:5060h
		mov	ss:5064h, ax
		cmp	ax, ss:50A7h
		jg	short loc_3F160
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3F160:
		stc
		retf
sub_3F0C7		endp

; ----------------------------------------------------------------------

sub_3F162		proc far
		push	cs
		call	near ptr sub_3EBC3
		mov	ax, ss:5070h
		mov	di, ax
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:506Eh
		mov	di, ax
		mul	word ptr ss:507Eh
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:5064h, bx
		cmp	bx, ss:50A7h
		jg	short loc_3F1FD
		mov	ax, ss:5060h
		add	ax, bx
		mov	ss:5068h, ax
		cmp	ax, ss:50A3h
		jl	short loc_3F1FD
		mov	ax, ss:505Ch
		mul	word ptr ss:5080h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:5066h, ax
		cmp	ax, ss:50A9h
		jg	short loc_3F1FD
		add	ax, ss:5062h
		mov	ss:506Ah, ax
		cmp	ax, ss:50A5h
		jl	short loc_3F1FD
		mov	ss:5074h, bx
		mov	ss:5076h, bp
		mov	bx, ss:5082h
		clc
		retf

loc_3F1FD:
		stc
		retf
sub_3F162		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F1FF		proc far

arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	di
		push	ds
		push	ds
		mov	ax, [bp+arg_12]
		push	ax
		push	cs
		call	near ptr sub_3E41E
		pop	ax
		pop	ds
		jb	short loc_3F227
		mov	di, ax
		mov	bx, 6

loc_3F216:
		mov	ax, ss:[bx+5064h]
		mov	[bx+di], ax
		sub	bx, 2
		jge	short loc_3F216
		mov	ax, 1
		jmp	short loc_3F22A

loc_3F227:
		mov	ax, 0

loc_3F22A:
		pop	ds
		pop	di
		pop	bp
		retf
sub_3F1FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F22E		proc far

saved_0		= word ptr  0
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		mov	ax, [bp+arg_12]
		mov	ss:51F6h, al
		push	cs
		call	near ptr sub_3E41E
		jb	short loc_3F2AD
		mov	bx, ss:5064h
		mov	ax, ss:5068h
		cmp	ax, ss:50A7h
		jle	short loc_3F255
		mov	ax, ss:50A7h

loc_3F255:
		cmp	bx, ss:50A3h
		jge	short loc_3F261
		mov	bx, ss:50A3h

loc_3F261:
		sub	ax, bx
		inc	ax
		mov	dx, ax
		mov	bp, ss:5066h
		mov	ax, ss:506Ah
		cmp	ax, ss:50A9h
		jle	short loc_3F27A
		mov	ax, ss:50A9h

loc_3F27A:
		cmp	bp, ss:50A5h
		jge	short loc_3F286
		mov	bp, ss:50A5h

loc_3F286:
		sub	ax, bp
		inc	ax
		mov	si, ax
		shl	bp, 1
		add	bp, ss:50A1h
		mov	al, ss:51F6h
		mov	ah, al

loc_3F298:
		mov	di, [bp+saved_0]
		add	di, bx
		mov	cx, dx
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	bp, 2
		dec	si
		jg	short loc_3F298

loc_3F2AD:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3F22E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F2B2		proc far

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
		jnz	short loc_3F2D3
		mov	bx, [bp+arg_C]
		mov	al, [bp+arg_10]
		cbw
		cmp	ax, bx
		jnz	short loc_3F2D3
		pop	ds
		pop	di
		pop	si
		pop	bp
		jmp	Shape_DrawSpans_38514

loc_3F2D3:
		mov	ax, ds
		mov	es, ax
		mov	si, [bp+arg_0]
		mov	di, 509Fh
		mov	cx, 6
		rep movsw
		mov	si, word_4DA85
		shl	si, 1
		add	si, ss:50A1h
		mov	ax, [si+2]
		sub	ax, [si]
		mov	word_4DA8B, ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4], bx
		jb	short loc_3F371
		stc
		jz	short loc_3F371
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
		mov	ss:506Ch, ax
		mov	di, ax
		lodsw
		mov	ss:506Eh, ax
		stc
		adc	ax, di
		mov	ss:505Ch, ax
		lodsw
		mov	ss:5070h, ax
		mov	di, ax
		neg	ax
		mov	ss:505Ah, ax
		lodsw
		mov	ss:5072h, ax
		stc
		adc	ax, di
		mov	ss:505Eh, ax
		mov	ax, ss:509Fh
		mov	es, ax
		clc

loc_3F371:
		jnb	short loc_3F378
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3F378:
		mov	bx, [bp+arg_C]
		or	bx, bx
		jns	short loc_3F383
		add	bx, 168h

loc_3F383:
		mov	cl, ss:[bx+4AFCh]
		mov	ss:5082h, cl
		mov	ch, ss:[bx+4B56h]
		mov	ss:5083h, ch
		mov	al, ss:[bx+4CBEh]
		add	al, ss:[bx+4E26h]
		xor	al, [bp+arg_10]
		cbw
		mov	di, ax
		mov	ax, [bp+arg_E]
		mov	ss:508Ch, ax
		cmp	ax, 100h
		jnb	short loc_3F3BA
		shl	di, 1
		jmp	dword ptr ss:[di+4F98h]

loc_3F3BA:
		add	di, 8
		shl	di, 1
sub_3F2B2		endp

; START OF FUNCTION CHUNK FOR sub_3F2B2
		db 36h
; END OF FUNCTION CHUNK FOR sub_3F2B2
seg151		ends
