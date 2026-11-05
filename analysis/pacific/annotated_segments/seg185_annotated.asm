seg185		segment	para public 'CODE' use16
		assume cs:seg185
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6A150		proc far

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
		mov	word_7B0C2, ax
		mov	ax, [bx+4]
		mov	word_7B0C6, ax
		mov	ax, [bx+8]
		mov	word_7B0CA, ax
		mov	si, [bp+arg_2]
		cmp	si, word_7B0CA
		jg	short loc_6A1D5
		mov	word_7B0CC, si
		cmp	si, word_7B0C6
		jge	short loc_6A185
		mov	si, word_7B0C6

loc_6A185:
		mov	word_7B0D0, si
		mov	si, [bp+arg_6]
		cmp	si, word_7B0C6
		jl	short loc_6A1D5
		mov	word_7B0CE, si
		cmp	si, word_7B0CA
		jle	short loc_6A1A0
		mov	si, word_7B0CA

loc_6A1A0:
		mov	word_7B0D2, si
		mov	ax, [bx+6]
		shl	ax, 1
		mov	word_7B0C4, ax
		mov	ax, [bx+0Ah]
		shl	ax, 1
		mov	word_7B0C8, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		cmp	ax, word_7B0C8
		jg	short loc_6A1D5
		mov	word_7B0D6, ax
		mov	ax, [bp+arg_8]
		shl	ax, 1
		cmp	ax, word_7B0C4
		jl	short loc_6A1D5
		mov	word_7B0D4, ax
		mov	bp, [bx+2]
		jmp	short loc_6A1D8

loc_6A1D5:
		jmp	loc_6A290

loc_6A1D8:
		mov	si, word_7B0D6
		cmp	si, word_7B0C4
		jl	short loc_6A203
		mov	di, word_7B0D0
		mov	cx, word_7B0D2
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_7B0C2
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	word_7B0D6, 2
		jmp	short loc_6A20B

loc_6A203:
		mov	si, word_7B0C4
		mov	word_7B0D6, si

loc_6A20B:
		mov	si, word_7B0D4
		cmp	si, word_7B0C8
		jg	short loc_6A236
		mov	di, word_7B0D0
		mov	cx, word_7B0D2
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_7B0C2
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		sub	word_7B0D4, 2
		jmp	short loc_6A23E

loc_6A236:
		mov	si, word_7B0C8
		mov	word_7B0D4, si

loc_6A23E:
		mov	di, word_7B0CC
		cmp	di, word_7B0C6
		jl	short loc_6A267
		mov	si, word_7B0D6
		cmp	si, word_7B0D4
		jg	short loc_6A290
		mov	cx, di
		mov	ax, word_7B0C2

loc_6A257:
		mov	di, cx
		add	di, [bp+si+saved_0]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_7B0D4
		jle	short loc_6A257

loc_6A267:
		mov	di, word_7B0CE
		cmp	di, word_7B0CA
		jg	short loc_6A290
		mov	si, word_7B0D6
		cmp	si, word_7B0D4
		jg	short loc_6A290
		mov	cx, di
		mov	ax, word_7B0C2

loc_6A280:
		mov	di, cx
		add	di, [bp+si+saved_0]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_7B0D4
		jle	short loc_6A280
sub_6A150		endp
seg185		ends
