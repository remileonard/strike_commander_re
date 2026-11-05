seg187		segment	para public 'CODE' use16
		assume cs:seg187
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Fh, 0E9h, 83h, 0FEh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6A514		proc far

var_152		= word ptr -152h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h

		enter	152h, 0
		push	si
		push	di
		push	ds
		cld
		push	ss
		pop	es
		push	ds
		pop	gs
		mov	si, [bp+arg_0]
		lea	di, [bp+var_12]
		mov	cx, 6
		rep movsw
		mov	es, [bp+var_12]
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4], bx
		jb	short loc_6A541
		jnz	short loc_6A544

loc_6A541:
		jmp	loc_6A600

loc_6A544:
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
		mov	ax, [si]
		add	ax, [bp+arg_2]
		cmp	ax, [bp+var_A]
		jg	short loc_6A5A3
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_6A598
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		cmp	ax, [bp+var_C]

loc_6A598:
		jl	short loc_6A605
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_8]

loc_6A5A3:
		jg	short loc_6A605
		mov	dx, ds
		add	si, 8

loc_6A5AA:
		lodsw
		or	ax, ax
		jz	short loc_6A60B
		mov	cx, ax
		lodsw
		add	ax, [bp+arg_2]
		mov	di, ax
		lodsw
		add	ax, [bp+arg_4]
		shl	ax, 1
		mov	bx, [bp+var_10]
		add	bx, ax
		add	di, gs:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_6A5D5
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_6A5AA

loc_6A5D5:
		mov	bx, cx

loc_6A5D7:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6A5ED
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_6A5D7
		jmp	short loc_6A5AA

loc_6A5ED:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_6A5D7
		jmp	short loc_6A5AA

loc_6A600:
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_6A605:
		add	si, 8

loc_6A608:
		lodsw
		shr	ax, 1

loc_6A60B:
		jz	short loc_6A600
		mov	cx, ax
		jb	short loc_6A679
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_6A675
		cmp	ax, [bp+var_8]
		jg	short loc_6A675
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_6A675
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_6A675
		shl	bx, 1
		push	ds
		mov	ax, [bp+var_10]
		add	bx, ax
		mov	di, gs:[bx]
		pop	ds
		add	di, dx
		mov	ax, [bp+var_E]
		mov	bx, [bp+var_A]
		sub	ax, dx
		jle	short loc_6A656
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_6A656:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_6A66B
		sub	cx, dx
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, dx
		jmp	short loc_6A608

loc_6A66B:
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_6A608

loc_6A675:
		add	si, cx
		jmp	short loc_6A608

loc_6A679:
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_6A6E6
		cmp	ax, [bp+var_8]
		jg	short loc_6A6E6
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_6A6E6
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_6A6E6
		shl	bx, 1
		push	ds
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, gs:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]
		sub	dx, [bp+var_E]
		jl	short loc_6A6F9
		cmp	ax, 0
		jg	short loc_6A6F9
		mov	bx, cx

loc_6A6BB:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6A6D2
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_6A6BB
		jmp	loc_6A608

loc_6A6D2:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_6A6BB
		jmp	loc_6A608

loc_6A6E6:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_6A6F2
		add	si, ax
		dec	si

loc_6A6F2:
		sub	cx, ax
		jnz	short loc_6A6E6
		jmp	loc_6A608

loc_6A6F9:
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_6A707:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6A71D
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_6A707
		jmp	short loc_6A72E

loc_6A71D:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_6A707

loc_6A72E:
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_152]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_6A747
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_6A747:
		cmp	[bp+var_2], 0
		jle	short loc_6A753
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_6A753:
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, ax
		pop	si
		pop	ds
sub_6A514		endp

; START OF FUNCTION CHUNK FOR sub_6A514
		db 0E9h
; END OF FUNCTION CHUNK FOR sub_6A514
seg187		ends
