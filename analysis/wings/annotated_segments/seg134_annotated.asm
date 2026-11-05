seg134		segment	para public 'CODE' use16
		assume cs:seg134
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49DD0		proc far

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
		mov	word_5DE82, ax
		mov	ax, [bx+4]
		mov	word_5DE86, ax
		mov	ax, [bx+8]
		mov	word_5DE8A, ax
		mov	si, [bp+arg_2]
		cmp	si, word_5DE8A
		jg	short loc_49E55
		mov	word_5DE8C, si
		cmp	si, word_5DE86
		jge	short loc_49E05
		mov	si, word_5DE86

loc_49E05:
		mov	word_5DE90, si
		mov	si, [bp+arg_6]
		cmp	si, word_5DE86
		jl	short loc_49E55
		mov	word_5DE8E, si
		cmp	si, word_5DE8A
		jle	short loc_49E20
		mov	si, word_5DE8A

loc_49E20:
		mov	word_5DE92, si
		mov	ax, [bx+6]
		shl	ax, 1
		mov	word_5DE84, ax
		mov	ax, [bx+0Ah]
		shl	ax, 1
		mov	word_5DE88, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		cmp	ax, word_5DE88
		jg	short loc_49E55
		mov	word_5DE96, ax
		mov	ax, [bp+arg_8]
		shl	ax, 1
		cmp	ax, word_5DE84
		jl	short loc_49E55
		mov	word_5DE94, ax
		mov	bp, [bx+2]
		jmp	short loc_49E58

loc_49E55:
		jmp	loc_49F10

loc_49E58:
		mov	si, word_5DE96
		cmp	si, word_5DE84
		jl	short loc_49E83
		mov	di, word_5DE90
		mov	cx, word_5DE92
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_5DE82
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	word_5DE96, 2
		jmp	short loc_49E8B

loc_49E83:
		mov	si, word_5DE84
		mov	word_5DE96, si

loc_49E8B:
		mov	si, word_5DE94
		cmp	si, word_5DE88
		jg	short loc_49EB6
		mov	di, word_5DE90
		mov	cx, word_5DE92
		sub	cx, di
		inc	cx
		add	di, [bp+si+saved_0]
		mov	ax, word_5DE82
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		sub	word_5DE94, 2
		jmp	short loc_49EBE

loc_49EB6:
		mov	si, word_5DE88
		mov	word_5DE94, si

loc_49EBE:
		mov	di, word_5DE8C
		cmp	di, word_5DE86
		jl	short loc_49EE7
		mov	si, word_5DE96
		cmp	si, word_5DE94
		jg	short loc_49F10
		mov	cx, di
		mov	ax, word_5DE82

loc_49ED7:
		mov	di, cx
		add	di, [bp+si+saved_0]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_5DE94
		jle	short loc_49ED7

loc_49EE7:
		mov	di, word_5DE8E
		cmp	di, word_5DE8A
		jg	short loc_49F10
		mov	si, word_5DE96
		cmp	si, word_5DE94
		jg	short loc_49F10
		mov	cx, di
		mov	ax, word_5DE82

loc_49F00:
		mov	di, cx
		add	di, [bp+si+saved_0]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_5DE94
		jle	short loc_49F00
sub_49DD0		endp
seg134		ends
