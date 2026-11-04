seg135		segment	para public 'CODE' use16
		assume cs:seg135
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38150		proc far

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
		mov	bx, [bp+arg_0]
		mov	es, [bx]
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_4D4A6, ax
		mov	ax, [bx+4]
		mov	word_4D4AA, ax
		mov	ax, [bx+8]
		mov	word_4D4AE, ax
		mov	si, [bp+arg_2]
		cmp	si, word_4D4AE
		jg	short loc_381D5
		mov	word_4D4B0, si
		cmp	si, word_4D4AA
		jge	short loc_38185
		mov	si, word_4D4AA

loc_38185:
		mov	word_4D4B4, si
		mov	si, [bp+arg_6]
		cmp	si, word_4D4AA
		jl	short loc_381D5
		mov	word_4D4B2, si
		cmp	si, word_4D4AE
		jle	short loc_381A0
		mov	si, word_4D4AE

loc_381A0:
		mov	word_4D4B6, si
		mov	ax, [bx+6]
		shl	ax, 1
		mov	word_4D4A8, ax
		mov	ax, [bx+0Ah]
		shl	ax, 1
		mov	word_4D4AC, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		cmp	ax, word_4D4AC
		jg	short loc_381D5
		mov	word_4D4BA, ax
		mov	ax, [bp+arg_8]
		shl	ax, 1
		cmp	ax, word_4D4A8
		jl	short loc_381D5
		mov	word_4D4B8, ax
		mov	bp, [bx+2]
		jmp	short loc_381D8

loc_381D5:
		jmp	loc_38290

loc_381D8:
		mov	si, word_4D4BA
		cmp	si, word_4D4A8
		jl	short loc_38203
		mov	di, word_4D4B4
		mov	cx, word_4D4B6
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_4D4A6
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	word_4D4BA, 2
		jmp	short loc_3820B

loc_38203:
		mov	si, word_4D4A8
		mov	word_4D4BA, si

loc_3820B:
		mov	si, word_4D4B8
		cmp	si, word_4D4AC
		jg	short loc_38236
		mov	di, word_4D4B4
		mov	cx, word_4D4B6
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_4D4A6
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		sub	word_4D4B8, 2
		jmp	short loc_3823E

loc_38236:
		mov	si, word_4D4AC
		mov	word_4D4B8, si

loc_3823E:
		mov	di, word_4D4B0
		cmp	di, word_4D4AA
		jl	short loc_38267
		mov	si, word_4D4BA
		cmp	si, word_4D4B8
		jg	short loc_38290
		mov	cx, di
		mov	ax, word_4D4A6

loc_38257:
		mov	di, cx
		add	di, [bp+si+saved_0]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_4D4B8
		jle	short loc_38257

loc_38267:
		mov	di, word_4D4B2
		cmp	di, word_4D4AE
		jg	short loc_38290
		mov	si, word_4D4BA
		cmp	si, word_4D4B8
		jg	short loc_38290
		mov	cx, di
		mov	ax, word_4D4A6

loc_38280:
		mov	di, cx
		add	di, [bp+si+saved_0]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_4D4B8
		jle	short loc_38280
sub_38150		endp
seg135		ends
