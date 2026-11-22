seg176		segment	para public 'CODE' use16
		assume cs:seg176
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 7, 56h, 9Ah, 0B2h, 3, 0, 0, 59h

loc_693D9:
		db 5Fh, 5Eh, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_693DE		proc far

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
		jg	short loc_69457
		add	ax, [bp+var_D]
		cmp	ax, cx
		jg	short loc_69455
		cmp	ax, bx
		jle	short loc_69457
		sub	ax, [bp+var_D]
		cmp	ax, bx
		jl	short loc_69455
		mov	bx, [bp+var_23]
		mov	cx, [bp+var_1F]
		mov	ax, [bp+var_17]
		cmp	ax, cx
		jg	short loc_69457
		add	ax, [bp+var_F]
		cmp	ax, cx
		jg	short loc_69455
		cmp	ax, bx
		jle	short loc_69457
		sub	ax, [bp+var_F]
		cmp	ax, bx
		jl	short loc_69455
		jmp	short loc_6945A

loc_69455:
		jmp	short loc_6945C

loc_69457:
		jmp	loc_6951B

loc_6945A:
		jmp	short loc_694C1

loc_6945C:
		mov	ax, [bp+var_23]
		sub	ax, [bp+var_17]
		jle	short loc_69483
		sub	[bp+var_F], ax
		jle	short loc_69457
		mov	cx, ax
		and	cx, 7
		shr	[bp+var_4], cl
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	[bp+var_13], ax
		adc	[bp+var_11], 0
		mov	[bp+var_17], 0

loc_69483:
		mov	ax, [bp+var_17]
		add	ax, [bp+var_F]
		dec	ax
		cmp	ax, [bp+var_1F]
		jle	short loc_69497
		sub	ax, [bp+var_1F]
		sub	[bp+var_F], ax
		jle	short loc_69457

loc_69497:
		mov	dx, [bp+var_21]
		sub	dx, [bp+var_15]
		jle	short loc_694B2
		sub	[bp+var_D], dx
		mov	ax, [bp+var_2]
		imul	dx
		add	[bp+var_13], ax
		adc	[bp+var_11], dx
		mov	[bp+var_15], 0

loc_694B2:
		mov	ax, [bp+var_15]
		add	ax, [bp+var_D]
		sub	ax, [bp+var_1D]
		dec	ax
		jle	short loc_694C1
		sub	[bp+var_D], ax

loc_694C1:
		shl	[bp+var_15], 1
		mov	ax, [bp+var_25]
		add	[bp+var_15], ax
		mov	es, [bp+var_27]
		mov	bl, [bp+var_B]
		mov	bh, [bp+var_A]
		mov	ah, 0FFh

loc_694D5:
		lds	si, [bp+var_13]
		mov	di, [bp+var_15]
		add	[bp+var_15], 2
		mov	di, ss:[di]
		add	di, [bp+var_17]
		mov	dx, [bp+var_F]
		mov	cx, [bp+var_4]
		mov	ch, [si]

loc_694ED:
		test	ch, cl
		jz	short loc_694F5
		mov	al, bl
		jmp	short loc_694F7

loc_694F5:
		mov	al, bh

loc_694F7:
		cmp	al, ah
		jz	short loc_694FD
		stosb
		dec	di

loc_694FD:
		inc	di
		shr	cl, 1
		jnb	short loc_69507
		lodsb
		mov	ch, al
		mov	cl, 80h

loc_69507:
		dec	dx
		jnz	short loc_694ED
		push	ax
		mov	ax, [bp+var_2]
		add	[bp+var_13], ax
		adc	[bp+var_11], 0
		pop	ax
		dec	[bp+var_D]
		jg	short loc_694D5

loc_6951B:
		pop	di
		pop	si
		pop	es
		pop	ds
sub_693DE		endp

; START OF FUNCTION CHUNK FOR sub_693DE
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_693DE
seg176		ends
