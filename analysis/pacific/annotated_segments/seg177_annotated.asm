seg177		segment	para public 'CODE' use16
		assume cs:seg177
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E5h, 5Dh, 0CAh, 4, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69526		proc far

var_35		= word ptr -35h
var_33		= word ptr -33h
var_31		= word ptr -31h
var_2F		= word ptr -2Fh
var_2D		= word ptr -2Dh
var_2B		= word ptr -2Bh
var_25		= word ptr -25h
var_23		= word ptr -23h
var_21		= word ptr -21h
var_1F		= word ptr -1Fh
var_1D		= word ptr -1Dh
var_1B		= word ptr -1Bh
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 35h
		push	ds
		push	es
		push	si
		push	di
		cld
		push	ss
		pop	es
		lea	di, [bp+var_35]
		mov	si, [bp+arg_6]
		mov	cx, 10h
		rep movsb
		lea	di, [bp+var_25]
		mov	si, [bp+arg_4]
		mov	cx, 13h
		rep movsb
		mov	ax, [bp+arg_2]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_8], ax
		xor	ax, ax
		mov	[bp+var_6], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+var_1D]
		add	ax, 7
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		mov	[bp+var_10], ax
		mov	[bp+var_12], 80h
		mov	bx, [bp+var_2F]
		mov	cx, [bp+var_2B]
		mov	ax, [bp+var_23]
		cmp	ax, cx
		jg	short loc_695B7
		add	ax, [bp+var_1B]
		cmp	ax, cx
		jg	short loc_695B5
		cmp	ax, bx
		jle	short loc_695B7
		sub	ax, [bp+var_1B]
		cmp	ax, bx
		jl	short loc_695B5
		mov	bx, [bp+var_31]
		mov	cx, [bp+var_2D]
		mov	ax, [bp+var_25]
		cmp	ax, cx
		jg	short loc_695B7
		add	ax, [bp+var_1D]
		cmp	ax, cx
		jg	short loc_695B5
		cmp	ax, bx
		jle	short loc_695B7
		sub	ax, [bp+var_1D]
		cmp	ax, bx
		jl	short loc_695B5
		jmp	short loc_695BA

loc_695B5:
		jmp	short loc_695BC

loc_695B7:
		jmp	loc_6971D

loc_695BA:
		jmp	short loc_69621

loc_695BC:
		mov	ax, [bp+var_31]
		sub	ax, [bp+var_25]
		jle	short loc_695E3
		sub	[bp+var_1D], ax
		jle	short loc_695B7
		mov	cx, ax
		and	cx, 7
		shr	[bp+var_12], cl
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	[bp+var_21], ax
		adc	[bp+var_1F], 0
		mov	[bp+var_25], 0

loc_695E3:
		mov	ax, [bp+var_25]
		add	ax, [bp+var_1D]
		dec	ax
		cmp	ax, [bp+var_2D]
		jle	short loc_695F7
		sub	ax, [bp+var_2D]
		sub	[bp+var_1D], ax
		jle	short loc_695B7

loc_695F7:
		mov	dx, [bp+var_2F]
		sub	dx, [bp+var_23]
		jle	short loc_69612
		sub	[bp+var_1B], dx
		mov	ax, [bp+var_10]
		imul	dx
		add	[bp+var_21], ax
		adc	[bp+var_1F], dx
		mov	[bp+var_23], 0

loc_69612:
		mov	ax, [bp+var_23]
		add	ax, [bp+var_1B]
		sub	ax, [bp+var_2B]
		dec	ax
		jle	short loc_69621
		sub	[bp+var_1B], ax

loc_69621:
		shl	[bp+var_23], 1
		mov	ax, [bp+var_33]
		add	[bp+var_23], ax
		mov	es, [bp+var_35]
		push	ax
		push	di
		mov	di, [bp+var_A]
		mov	bl, [di]
		xor	ax, ax
		mov	al, bl
		mov	[bp+var_E], ax
		inc	di
		mov	[bp+var_A], di
		mov	bl, [di]
		mov	[bp+var_6], 1
		mov	di, [bp+var_8]
		mov	bh, [di]
		mov	al, bh
		mov	[bp+var_C], ax
		inc	di
		mov	[bp+var_8], di
		mov	bh, [di]
		mov	[bp+var_4], 1
		mov	[bp+var_2], ds
		pop	di
		pop	ax
		mov	ah, 0FFh

loc_69662:
		lds	si, [bp+var_21]
		mov	di, [bp+var_23]
		add	[bp+var_23], 2
		mov	di, ss:[di]
		add	di, [bp+var_25]
		mov	dx, [bp+var_1D]
		mov	cx, [bp+var_12]
		mov	ch, [si]

loc_6967A:
		test	ch, cl
		jz	short loc_69682
		mov	al, bl
		jmp	short loc_69684

loc_69682:
		mov	al, bh

loc_69684:
		cmp	al, ah
		jz	short loc_6968A
		stosb
		dec	di

loc_6968A:
		inc	di
		shr	cl, 1
		jnb	short loc_69694
		lodsb
		mov	ch, al
		mov	cl, 80h

loc_69694:
		push	ax
		push	di
		push	ds
		mov	ds, [bp+var_2]
		mov	ax, [bp+var_E]
		or	ax, ax
		jz	short loc_696B4
		cmp	ax, 1
		jz	short loc_696B4
		mov	ax, [bp+var_6]
		mov	di, [bp+var_A]
		add	di, ax
		mov	bl, [di]
		inc	ax
		mov	[bp+var_6], ax

loc_696B4:
		mov	ax, [bp+var_C]
		or	ax, ax
		jz	short loc_696CE
		cmp	ax, 1
		jz	short loc_696CE
		mov	ax, [bp+var_4]
		mov	di, [bp+var_8]
		add	di, ax
		mov	bh, [di]
		inc	ax
		mov	[bp+var_4], ax

loc_696CE:
		pop	ds
		pop	di
		pop	ax
		dec	dx
		jnz	short loc_6967A
		push	ax
		mov	ax, [bp+var_10]
		add	[bp+var_21], ax
		adc	[bp+var_1F], 0
		pop	ax
		push	ax
		push	di
		push	ds
		mov	ds, [bp+var_2]
		mov	ax, [bp+var_E]
		cmp	ax, 1
		jnz	short loc_696FC
		mov	ax, [bp+var_6]
		mov	di, [bp+var_A]
		add	di, ax
		mov	bl, [di]
		inc	ax
		mov	[bp+var_6], ax

loc_696FC:
		mov	ax, [bp+var_C]
		cmp	ax, 1
		jnz	short loc_69712
		mov	ax, [bp+var_4]
		mov	di, [bp+var_8]
		add	di, ax
		mov	bh, [di]
		inc	ax
		mov	[bp+var_4], ax

loc_69712:
		pop	ds
		pop	di
		pop	ax
		dec	[bp+var_1B]
		jle	short loc_6971D
		jmp	loc_69662

loc_6971D:
		pop	di
		pop	si
		pop	es
sub_69526		endp
seg177		ends
