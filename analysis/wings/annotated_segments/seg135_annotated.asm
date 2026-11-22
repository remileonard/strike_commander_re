seg135		segment	para public 'CODE' use16
		assume cs:seg135
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49F14		proc far

var_158		= word ptr -158h
var_156		= word ptr -156h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_150		= word ptr -150h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		enter	158h, 0
		push	si
		push	di
		push	ds
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_10]
		mov	cx, 6
		rep movsw
		mov	ax, [bp+arg_2]
		mov	[bp+var_154], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_156], ax
		mov	ax, [bp+arg_C]
		mov	ah, al
		mov	[bp+var_158], ax
		mov	es, [bp+var_10]
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	[si+4], bx
		jb	short loc_49F54
		jnz	short loc_49F57

loc_49F54:
		jmp	loc_4A00F

loc_49F57:
		xor	eax, eax
		mov	ax, ds
		shl	eax, 4
		add	ax, si
		add	eax, [bx+si]
		mov	si, ax
		and	si, 0Fh
		shr	eax, 4
		mov	ds, ax
		mov	ax, [si]
		add	ax, [bp+var_154]
		cmp	ax, [bp+var_8]
		jg	short loc_49F9F
		mov	ax, [bp+var_154]
		sub	ax, [si+2]
		cmp	ax, [bp+var_C]
		jl	short loc_49F91
		mov	ax, [bp+var_156]
		sub	ax, [si+4]
		cmp	ax, [bp+var_A]

loc_49F91:
		jge	short loc_49F95
		jmp	short loc_4A014

loc_49F95:
		mov	ax, [si+6]
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_6]

loc_49F9F:
		jg	short loc_4A014
		mov	dx, ds
		add	si, 8

loc_49FA6:
		lodsw
		or	ax, ax
		jz	short loc_4A01A
		mov	cx, ax
		lodsw
		add	ax, [bp+var_154]
		mov	di, ax
		lodsw
		add	ax, [bp+var_156]
		shl	ax, 1
		mov	bx, [bp+var_E]
		add	bx, ax
		add	di, ss:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_49FD9
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_49FA6

loc_49FD9:
		mov	bx, cx

loc_49FDB:
		lodsb
		shr	al, 1
		cbw
		push	ax
		mov	cx, ax
		jb	short loc_49FF9
		mov	ax, [bp+var_158]
		add	si, cx
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_49FDB
		jmp	short loc_49FA6

loc_49FF9:
		pop	ax
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_49FDB
		jmp	short loc_49FA6

loc_4A00F:
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_4A014:
		add	si, 8

loc_4A017:
		lodsw
		shr	ax, 1

loc_4A01A:
		jz	short loc_4A00F
		mov	cx, ax
		jnb	short loc_4A022
		jmp	short loc_4A096

loc_4A022:
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_4A092
		cmp	ax, [bp+var_6]
		jg	short loc_4A092
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_4A092
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_4A092
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		mov	ax, [bp+var_C]
		mov	bx, [bp+var_8]
		sub	ax, dx
		jle	short loc_4A065
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_4A065:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_4A080
		add	si, cx
		sub	cx, dx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_4A017

loc_4A080:
		add	si, cx
		push	ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		jmp	short loc_4A017

loc_4A092:
		add	si, cx
		jmp	short loc_4A017

loc_4A096:
		lodsw
		add	ax, [bp+var_154]
		mov	dx, ax
		lodsw
		add	ax, [bp+var_156]
		cmp	ax, [bp+var_A]
		jl	short loc_4A108
		cmp	ax, [bp+var_6]
		jg	short loc_4A108
		mov	bx, ax
		cmp	dx, [bp+var_8]
		jg	short loc_4A108
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_C]
		jl	short loc_4A108
		shl	bx, 1
		add	bx, [bp+var_E]
		mov	di, ss:[bx]
		add	di, dx
		sub	ax, [bp+var_8]
		jg	short loc_4A11B
		sub	dx, [bp+var_C]
		jl	short loc_4A11B
		mov	bx, cx

loc_4A0D3:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4A0F2
		push	ax
		add	si, cx
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		pop	ax
		sub	bx, ax
		jnz	short loc_4A0D3
		jmp	loc_4A017

loc_4A0F2:
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_4A0D3
		jmp	loc_4A017

loc_4A108:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_4A114
		add	si, ax
		dec	si

loc_4A114:
		sub	cx, ax
		jnz	short loc_4A108
		jmp	loc_4A017

loc_4A11B:
		mov	[bp+var_152], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_150]

loc_4A12A:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4A148
		add	si, cx
		sub	bx, ax
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_4A12A
		jmp	short loc_4A15B

loc_4A148:
		sub	bx, ax
		inc	si
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_4A12A

loc_4A15B:
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_150]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_4A174
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_4A174:
		cmp	[bp+var_152], 0
		jle	short loc_4A183
		sub	cx, [bp+var_152]
		mov	ax, [bp+var_152]

loc_4A183:
		mov	ax, [bp+var_158]
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		pop	si
sub_49F14		endp
seg135		ends
