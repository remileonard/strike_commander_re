seg131		segment	para public 'CODE' use16
		assume cs:seg131
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49854		proc far

saved_0		= word ptr  0
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	[bp+arg_6], 0
		jz	short loc_49865
		cmp	[bp+arg_8], 0
		jnz	short loc_49892

loc_49865:
		push	[bp+arg_A]
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+arg_6]
		push	ax
		push	[bp+arg_0]
		call	sub_49BA2
		add	sp, 0Ch
		jmp	loc_49B9D

loc_49892:
		mov	si, [bp+arg_0]
		mov	es, [si]
		mov	ax, [si+8]
		mov	word_5DE60, ax
		mov	ax, [si+4]
		mov	word_5DE5C, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_5DE5A, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_5DE5E, ax
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_5DE54, ax
		mov	ax, [bp+arg_2]
		mov	word_5DE62, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_5DE64, ax
		mov	word_5DE56, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_5DE58, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_5DE66, ax
		mov	word_5DE68, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_5DE6A, ax
		mov	word_5DE6C, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_5DE6E, ax
		mov	word_5DE70, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_5DE72, ax
		mov	word_5DE74, dx
		mov	word_5DE76, 0
		mov	word_5DE78, 0
		mov	ax, word_5DE6A
		mov	dx, word_5DE6C
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_5DE7A, ax
		mov	word_5DE7C, dx
		mov	ax, word_5DE66
		mov	dx, word_5DE68
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_5DE6E
		add	dx, word_5DE70
		mov	word_5DE7E, ax
		mov	word_5DE80, dx
		mov	ax, word_5DE66
		mov	dx, word_5DE68
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_5DE7E, ax
		sbb	word_5DE80, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_4996E:
		mov	ax, word_5DE76
		mov	dx, word_5DE78
		sub	ax, word_5DE7A
		sbb	dx, word_5DE7C
		js	short loc_49982
		jmp	loc_49A72

loc_49982:
		mov	dx, word_5DE54
		mov	di, word_5DE62
		add	di, word_5DE56
		cmp	di, word_5DE60
		jg	short loc_499D0
		cmp	di, word_5DE5C
		jl	short loc_499D0
		mov	ax, di
		mov	si, word_5DE64
		add	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_499B7
		cmp	si, word_5DE5E
		jg	short loc_499B7
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_499B7:
		mov	si, word_5DE64
		sub	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_499D0
		cmp	si, word_5DE5E
		jg	short loc_499D0
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_499D0:
		mov	di, word_5DE62
		sub	di, word_5DE56
		cmp	di, word_5DE60
		jg	short loc_49A1A
		cmp	di, word_5DE5C
		jl	short loc_49A1A
		mov	ax, di
		mov	si, word_5DE64
		add	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_49A01
		cmp	si, word_5DE5E
		jg	short loc_49A01
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_49A01:
		mov	si, word_5DE64
		sub	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_49A1A
		cmp	si, word_5DE5E
		jg	short loc_49A1A
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_49A1A:
		cmp	word_5DE80, 0
		js	short loc_49A45
		sub	word_5DE58, 2
		dec	bx
		mov	ax, word_5DE7A
		mov	dx, word_5DE7C
		sub	ax, word_5DE6A
		sbb	dx, word_5DE6C
		mov	word_5DE7A, ax
		mov	word_5DE7C, dx
		sub	word_5DE7E, ax
		sbb	word_5DE80, dx

loc_49A45:
		inc	word_5DE56
		mov	ax, word_5DE76
		mov	dx, word_5DE78
		add	ax, word_5DE72
		adc	dx, word_5DE74
		mov	word_5DE76, ax
		mov	word_5DE78, dx
		add	ax, word_5DE6E
		adc	dx, word_5DE70
		add	word_5DE7E, ax
		adc	word_5DE80, dx
		jmp	loc_4996E

loc_49A72:
		push	bx
		mov	ax, word_5DE66
		mov	dx, word_5DE68
		sub	ax, word_5DE6E
		sbb	dx, word_5DE70
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_5DE76
		sbb	dx, word_5DE78
		sub	ax, word_5DE7A
		sbb	dx, word_5DE7C
		sar	dx, 1
		rcr	ax, 1
		add	word_5DE7E, ax
		adc	word_5DE80, dx
		pop	bx

loc_49AAB:
		mov	dx, word_5DE54
		mov	di, word_5DE62
		add	di, word_5DE56
		cmp	di, word_5DE60
		jg	short loc_49AF9
		cmp	di, word_5DE5C
		jl	short loc_49AF9
		mov	ax, di
		mov	si, word_5DE64
		add	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_49AE0
		cmp	si, word_5DE5E
		jg	short loc_49AE0
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_49AE0:
		mov	si, word_5DE64
		sub	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_49AF9
		cmp	si, word_5DE5E
		jg	short loc_49AF9
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_49AF9:
		mov	di, word_5DE62
		sub	di, word_5DE56
		cmp	di, word_5DE60
		jg	short loc_49B43
		cmp	di, word_5DE5C
		jl	short loc_49B43
		mov	ax, di
		mov	si, word_5DE64
		add	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_49B2A
		cmp	si, word_5DE5E
		jg	short loc_49B2A
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_49B2A:
		mov	si, word_5DE64
		sub	si, word_5DE58
		cmp	si, word_5DE5A
		jl	short loc_49B43
		cmp	si, word_5DE5E
		jg	short loc_49B43
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_49B43:
		cmp	word_5DE80, 0
		jns	short loc_49B6C
		inc	word_5DE56
		mov	ax, word_5DE76
		mov	dx, word_5DE78
		add	ax, word_5DE72
		adc	dx, word_5DE74
		mov	word_5DE76, ax
		mov	word_5DE78, dx
		add	word_5DE7E, ax
		adc	word_5DE80, dx

loc_49B6C:
		sub	word_5DE58, 2
		mov	ax, word_5DE7A
		mov	dx, word_5DE7C
		sub	ax, word_5DE6A
		sbb	dx, word_5DE6C
		mov	word_5DE7A, ax
		mov	word_5DE7C, dx
		sub	ax, word_5DE66
		sbb	dx, word_5DE68
		sub	word_5DE7E, ax
		sbb	word_5DE80, dx
		dec	bx
		js	short loc_49B9D
		jmp	loc_49AAB

loc_49B9D:
		pop	di
		pop	si
		pop	bp
sub_49854		endp
seg131		ends
