seg145		segment	para public 'CODE' use16
		assume cs:seg145
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_393D4		proc far

var_156		= word ptr -156h
var_154		= word ptr -154h
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
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 156h
		push	si
		push	di
		push	ds
		cld
		mov	[bp+var_156], ds
		push	ss
		pop	es
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
		jb	short loc_39405
		jnz	short loc_39408

loc_39405:
		jmp	loc_394EC

loc_39408:
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
		mov	[bp+var_154], ax
		mov	ax, [si]
		add	ax, [bp+arg_2]
		cmp	ax, [bp+var_A]
		jg	short loc_3946E
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_39460
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		cmp	ax, [bp+var_C]

loc_39460:
		jge	short loc_39465
		jmp	loc_394F3

loc_39465:
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_8]

loc_3946E:
		jle	short loc_39473
		jmp	loc_394F3

loc_39473:
		mov	dx, ds
		add	si, 8

loc_39478:
		lodsw
		or	ax, ax
		jz	short loc_394F9
		mov	cx, ax
		lodsw
		add	ax, [bp+arg_2]
		mov	di, ax
		lodsw
		add	ax, [bp+arg_4]
		shl	ax, 1
		mov	bx, [bp+var_10]
		add	bx, ax
		add	di, ss:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_394AC
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_394A0:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_394A0
		mov	ds, dx
		jmp	short loc_39478

loc_394AC:
		mov	bx, cx

loc_394AE:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_394D1
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_394BF:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_394BF
		mov	ds, dx
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_394AE
		jmp	short loc_39478

loc_394D1:
		sub	bx, ax
		lodsb
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_394DC:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_394DC
		mov	ds, dx
		pop	bx
		or	bx, bx
		jnz	short loc_394AE
		jmp	short loc_39478

loc_394EC:
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf

loc_394F3:
		add	si, 8

loc_394F6:
		lodsw
		shr	ax, 1

loc_394F9:
		jz	short loc_394EC
		mov	cx, ax
		jnb	short loc_39502
		jmp	loc_39582

loc_39502:
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_3957D
		cmp	ax, [bp+var_8]
		jg	short loc_3957D
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_3957D
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_3957D
		shl	bx, 1
		push	ds
		mov	ax, [bp+var_10]
		add	bx, ax
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		mov	ax, [bp+var_E]
		mov	bx, [bp+var_A]
		sub	ax, dx
		jle	short loc_39547
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_39547:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_39567
		sub	cx, dx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_39557:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_39557
		mov	ds, [bp+var_154]
		add	si, dx
		jmp	short loc_394F6

loc_39567:
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_3956E:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_3956E
		mov	ds, [bp+var_154]
		jmp	loc_394F6

loc_3957D:
		add	si, cx
		jmp	loc_394F6

loc_39582:
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_3960A
		cmp	ax, [bp+var_8]
		jg	short loc_3960A
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_3960A
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_3960A
		shl	bx, 1
		push	ds
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]
		sub	dx, [bp+var_E]
		jl	short loc_3961D
		cmp	ax, 0
		jg	short loc_3961D
		mov	bx, cx

loc_395C4:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_395EA
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_395D5:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_395D5
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_395C4
		jmp	loc_394F6

loc_395EA:
		sub	bx, ax
		lodsb
		mov	ah, al
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_395F7:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_395F7
		mov	ds, [bp+var_154]
		pop	bx
		or	bx, bx
		jnz	short loc_395C4
		jmp	loc_394F6

loc_3960A:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_39616
		add	si, ax
		dec	si

loc_39616:
		sub	cx, ax
		jnz	short loc_3960A
		jmp	loc_394F6

loc_3961D:
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_3962B:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39650
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_3963C:
		lodsb
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_3963C
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_3962B
		jmp	short loc_3966D

loc_39650:
		sub	bx, ax
		lodsb
		mov	ah, al
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_3965D:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_3965D
		mov	ds, [bp+var_154]
		pop	bx
		or	bx, bx
		jnz	short loc_3962B

loc_3966D:
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
		jge	short loc_39686
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_39686:
		cmp	[bp+var_2], 0
		jle	short loc_39692
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_39692:
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_3969B:
		lodsb
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_3969B
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		add	si, ax
		pop	si
		pop	ds
		jmp	loc_394F6
sub_393D4		endp
seg145		ends
