seg127		segment	para public 'CODE' use16
		assume cs:seg127
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0ECh, 56h, 8Bh, 76h, 6, 8Bh, 44h, 0Ch, 5Eh, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3772C		proc far

var_27		= word ptr -27h
var_25		= word ptr -25h
var_23		= word ptr -23h
var_21		= word ptr -21h
var_1F		= word ptr -1Fh
var_1D		= word ptr -1Dh
var_17		= word ptr -17h
var_15		= word ptr -15h
var_13		= word ptr -13h
var_11		= word ptr -11h
var_F		= word ptr -0Fh
var_D		= word ptr -0Dh
var_B		= byte ptr -0Bh
var_A		= byte ptr -0Ah
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 27h
		push	ds
		push	es
		push	si
		push	di
		cld
		push	ss
		pop	es
		lea	di, [bp+var_27]
		mov	si, [bp+arg_2]
		mov	cx, 10h
		rep movsb
		lea	di, [bp+var_17]
		mov	si, [bp+arg_0]
		mov	cx, 13h
		rep movsb
		mov	ax, [bp+var_F]
		add	ax, 7
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		mov	[bp+var_2], ax
		mov	[bp+var_4], 80h
		mov	bx, [bp+var_21]
		mov	cx, [bp+var_1D]
		mov	ax, [bp+var_15]
		cmp	ax, cx
		jg	short loc_377A5
		add	ax, [bp+var_D]
		cmp	ax, cx
		jg	short loc_377A3
		cmp	ax, bx
		jle	short loc_377A5
		sub	ax, [bp+var_D]
		cmp	ax, bx
		jl	short loc_377A3
		mov	bx, [bp+var_23]
		mov	cx, [bp+var_1F]
		mov	ax, [bp+var_17]
		cmp	ax, cx
		jg	short loc_377A5
		add	ax, [bp+var_F]
		cmp	ax, cx
		jg	short loc_377A3
		cmp	ax, bx
		jle	short loc_377A5
		sub	ax, [bp+var_F]
		cmp	ax, bx
		jl	short loc_377A3
		jmp	short loc_377A8

loc_377A3:
		jmp	short loc_377AA

loc_377A5:
		jmp	loc_37869

loc_377A8:
		jmp	short loc_3780F

loc_377AA:
		mov	ax, [bp+var_23]
		sub	ax, [bp+var_17]
		jle	short loc_377D1
		sub	[bp+var_F], ax
		jle	short loc_377A5
		mov	cx, ax
		and	cx, 7
		shr	[bp+var_4], cl
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	[bp+var_13], ax
		adc	[bp+var_11], 0
		mov	[bp+var_17], 0

loc_377D1:
		mov	ax, [bp+var_17]
		add	ax, [bp+var_F]
		dec	ax
		cmp	ax, [bp+var_1F]
		jle	short loc_377E5
		sub	ax, [bp+var_1F]
		sub	[bp+var_F], ax
		jle	short loc_377A5

loc_377E5:
		mov	dx, [bp+var_21]
		sub	dx, [bp+var_15]
		jle	short loc_37800
		sub	[bp+var_D], dx
		mov	ax, [bp+var_2]
		imul	dx
		add	[bp+var_13], ax
		adc	[bp+var_11], dx
		mov	[bp+var_15], 0

loc_37800:
		mov	ax, [bp+var_15]
		add	ax, [bp+var_D]
		sub	ax, [bp+var_1D]
		dec	ax
		jle	short loc_3780F
		sub	[bp+var_D], ax

loc_3780F:
		shl	[bp+var_15], 1
		mov	ax, [bp+var_25]
		add	[bp+var_15], ax
		mov	es, [bp+var_27]
		mov	bl, [bp+var_B]
		mov	bh, [bp+var_A]
		mov	ah, 0FFh

loc_37823:
		lds	si, [bp+var_13]
		mov	di, [bp+var_15]
		add	[bp+var_15], 2
		mov	di, ss:[di]
		add	di, [bp+var_17]
		mov	dx, [bp+var_F]
		mov	cx, [bp+var_4]
		mov	ch, [si]

loc_3783B:
		test	ch, cl
		jz	short loc_37843
		mov	al, bl
		jmp	short loc_37845

loc_37843:
		mov	al, bh

loc_37845:
		cmp	al, ah
		jz	short loc_3784B
		stosb
		dec	di

loc_3784B:
		inc	di
		shr	cl, 1
		jnb	short loc_37855
		lodsb
		mov	ch, al
		mov	cl, 80h

loc_37855:
		dec	dx
		jnz	short loc_3783B
		push	ax
		mov	ax, [bp+var_2]
		add	[bp+var_13], ax
		adc	[bp+var_11], 0
		pop	ax
		dec	[bp+var_D]
		jg	short loc_37823

loc_37869:
		pop	di
		pop	si
		pop	es
		pop	ds
		mov	sp, bp
		pop	bp
sub_3772C		endp
seg127		ends
