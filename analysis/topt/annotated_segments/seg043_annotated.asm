seg043		segment	para public 'CODE' use16
		assume cs:seg043
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

loc_1B0D1:
		db 0B8h, 0, 0, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B0DA		proc far

var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
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
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		enter	36h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, ss
		mov	es, ax
		lea	di, [bp+var_14]
		mov	cx, 6
		rep movsw
		mov	es, [bp+var_14]
		shl	[bp+var_E], 1
		shl	[bp+var_A], 1
		shl	[bp+arg_4], 1
		mov	ax, [bp+arg_8]
		mov	[bp+var_32], ax
		lfs	bx, [bp+arg_A]
		cmp	[bp+arg_6], 0
		jz	short loc_1B114
		nop
		nop
		cmp	ax, 0
		jnz	short loc_1B14B
		nop
		nop

loc_1B114:
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_A]
		jg	short loc_1B147
		nop
		nop
		cmp	ax, [bp+var_E]
		jl	short loc_1B147
		nop
		nop
		mov	di, [bp+var_12]
		add	di, ax
		mov	di, [di]
		mov	ax, [bp+arg_2]
		cmp	ax, [bp+var_C]
		jg	short loc_1B147
		nop
		nop
		cmp	ax, [bp+var_10]
		jl	short loc_1B147
		nop
		nop
		add	di, ax
		mov	al, es:[di]
		xlatb
		mov	es:[di], al

loc_1B147:
		pop	di
		pop	si
		leave
		retf

loc_1B14B:
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	[bp+var_4], ax
		mov	[bp+var_36], 1
		mov	ax, [bp+arg_6]
		mul	ax
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	[bp+var_20], ax
		mov	[bp+var_1E], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_24], ax
		mov	[bp+var_22], dx
		mov	[bp+var_28], 0
		mov	[bp+var_26], 0
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, [bp+var_20]
		add	dx, [bp+var_1E]
		mov	[bp+var_30], ax
		mov	[bp+var_2E], dx
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx

loc_1B1DF:
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		js	short loc_1B1F2
		nop
		nop
		jmp	loc_1B2F3

loc_1B1F2:
		cmp	[bp+var_36], 1
		jnz	short loc_1B211
		nop
		nop
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_2]
		cmp	ax, [bp+var_C]
		jle	short loc_1B20A
		nop
		nop
		mov	ax, [bp+var_C]

loc_1B20A:
		cmp	ax, [bp+var_10]
		jge	short loc_1B214
		nop
		nop

loc_1B211:
		jmp	loc_1B293

loc_1B214:
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+var_2]
		cmp	ax, [bp+var_10]
		jge	short loc_1B227
		nop
		nop
		mov	ax, [bp+var_10]

loc_1B227:
		cmp	ax, [bp+var_C]
		jg	short loc_1B211
		mov	[bp+var_6], ax
		mov	si, [bp+arg_4]
		add	si, [bp+var_4]
		cmp	si, [bp+var_E]
		jl	short loc_1B211
		cmp	si, [bp+var_A]
		jg	short loc_1B25A
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_1B252:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_1B252

loc_1B25A:
		mov	ax, [bp+var_4]
		or	ax, ax
		jz	short loc_1B293
		nop
		nop
		mov	si, [bp+arg_4]
		sub	si, ax
		jz	short loc_1B293
		nop
		nop
		cmp	si, [bp+var_A]
		jg	short loc_1B293
		nop
		nop
		cmp	si, [bp+var_E]
		jl	short loc_1B293
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_1B28B:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_1B28B

loc_1B293:
		mov	cx, 0
		cmp	[bp+var_2E], 0
		js	short loc_1B2C0
		nop
		nop
		sub	[bp+var_4], 2
		mov	cx, 1
		dec	[bp+var_32]
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		sub	ax, [bp+var_1C]
		sbb	dx, [bp+var_1A]
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx

loc_1B2C0:
		mov	[bp+var_36], cx
		inc	[bp+var_2]
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		add	ax, [bp+var_24]
		adc	dx, [bp+var_22]
		mov	[bp+var_28], ax
		mov	[bp+var_26], dx
		add	ax, [bp+var_20]
		adc	dx, [bp+var_1E]
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		jmp	loc_1B1DF

loc_1B2F3:
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sub	ax, [bp+var_20]
		sbb	dx, [bp+var_1E]
		mov	[bp+var_34], ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, [bp+var_34]
		adc	dx, cx
		sub	ax, [bp+var_28]
		sbb	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		sar	dx, 1
		rcr	ax, 1
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_2]
		cmp	ax, [bp+var_C]
		jle	short loc_1B333
		nop
		nop
		mov	ax, [bp+var_C]

loc_1B333:
		cmp	ax, [bp+var_10]
		jge	short loc_1B33D
		nop
		nop

loc_1B33A:
		jmp	short loc_1B3B8
		nop

loc_1B33D:
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+var_2]
		cmp	ax, [bp+var_10]
		jge	short loc_1B350
		nop
		nop
		mov	ax, [bp+var_10]

loc_1B350:
		cmp	ax, [bp+var_C]
		jg	short loc_1B33A
		mov	[bp+var_6], ax
		mov	si, [bp+arg_4]
		add	si, [bp+var_4]
		cmp	si, [bp+var_E]
		jl	short loc_1B33A
		cmp	si, [bp+var_A]
		jg	short loc_1B383
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_1B37B:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_1B37B

loc_1B383:
		mov	ax, [bp+var_4]
		or	ax, ax
		jz	short loc_1B3B8
		nop
		nop
		mov	si, [bp+arg_4]
		sub	si, ax
		cmp	si, [bp+var_A]
		jg	short loc_1B3B8
		nop
		nop
		cmp	si, [bp+var_E]
		jl	short loc_1B3B8
		nop
		nop
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_1B3B0:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_1B3B0

loc_1B3B8:
		cmp	[bp+var_2E], 0
		jns	short loc_1B3DB
		nop
		nop
		inc	[bp+var_2]
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		add	ax, [bp+var_24]
		adc	dx, [bp+var_22]
		mov	[bp+var_28], ax
		mov	[bp+var_26], dx
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx

loc_1B3DB:
		sub	[bp+var_4], 2
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		sub	ax, [bp+var_1C]
		sbb	dx, [bp+var_1A]
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		sub	ax, [bp+var_18]
		sbb	dx, [bp+var_16]
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx
		dec	[bp+var_32]
sub_1B0DA		endp
seg043		ends
