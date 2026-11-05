seg003		segment	para public 'CODE' use16
		assume cs:seg003
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Fh, 0A4h, 0C2h, 10h, 9Dh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4848		proc far

var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
saved_2		= word ptr  2
saved_4		= word ptr  4

		enter	6, 0
		cmp	[bp+saved_2], 0FFFCh
		jnz	short loc_485F
		push	ds
		push	seg dseg
		pop	ds
		cmp	byte_76866, 0
		pop	ds
		jnz	short loc_4895

loc_485F:
		leave
		push	es
		push	ax
		push	di
		push	bx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	ax, 3
		int	10h
		mov	ax, 0B800h
		mov	es, ax
		mov	di, 0
		mov	ah, 7
		mov	al, 4Ah
		stosw
		mov	al, 59h
		stosw
		mov	ah, 3
		mov	al, 50h
		stosw
		mov	al, 49h
		stosw
		pop	bx
		pop	di
		pop	ax
		pop	es
		sti
		call	sub_1DDFE

loc_4895:
		push	bx
		push	ds
		lds	bx, [bp+saved_4]
		mov	al, 0
		mov	[bp+var_4], al
		mov	[bp+var_2], al
		mov	[bp+var_6], 0

loc_48A6:
		mov	al, [bx]
		inc	bx
		cmp	al, 66h
		jz	short loc_48BB
		cmp	al, 0F6h
		jz	short loc_48C1
		cmp	al, 0F7h
		jz	short loc_48C7
		cmp	al, 67h
		jz	short loc_48C9
		jmp	short loc_48A6

loc_48BB:
		xor	[bp+var_2], 1
		jmp	short loc_48A6

loc_48C1:
		xor	[bp+var_6], 1
		jmp	short loc_48CF

loc_48C7:
		jmp	short loc_48CF

loc_48C9:
		xor	[bp+var_4], 1
		jmp	short loc_48A6

loc_48CF:
		mov	al, [bx]
		and	al, 0C7h
		inc	bx
		mov	ah, al
		and	ah, 0C0h
		cmp	ah, 0C0h
		jz	short loc_493A
		nop
		nop
		cmp	[bp+var_4], 0
		jnz	short loc_490C
		nop
		nop
		cmp	al, 6
		jnz	short loc_48F4
		nop
		nop
		add	bx, 2
		jmp	short loc_493A
		nop

loc_48F4:
		and	al, 0C0h
		cmp	al, 40h
		jnz	short loc_4900
		nop
		nop
		inc	bx
		jmp	short loc_493A
		nop

loc_4900:
		cmp	al, 80h
		jnz	short loc_493A
		nop
		nop
		add	bx, 2
		jmp	short loc_493A
		nop

loc_490C:
		cmp	al, 5
		jnz	short loc_4918
		nop
		nop
		add	bx, 4
		jmp	short loc_493A
		nop

loc_4918:
		mov	ah, al
		and	ah, 7
		cmp	ah, 4
		jnz	short loc_4925
		nop
		nop
		inc	bx

loc_4925:
		and	al, 0C0h
		cmp	al, 40h
		jnz	short loc_4931
		nop
		nop
		inc	bx
		jmp	short loc_493A
		nop

loc_4931:
		cmp	al, 80h
		jnz	short loc_493A
		nop
		nop
		add	bx, 4

loc_493A:
		mov	[bp+saved_4], bx
		cmp	[bp+var_6], 0
		jz	short loc_4948
		mov	ax, 7Fh
		jmp	short loc_495E

loc_4948:
		cmp	[bp+var_2], 0
		jz	short loc_4959
		mov	eax, 7FFFFFFFh
		xor	edx, edx
		jmp	short loc_495E

loc_4959:
		mov	ax, 7FFFh
		xor	dx, dx

loc_495E:
		pop	ds
		pop	bx
		leave
		add	sp, 2
		iret
sub_4848		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4965		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		mov	[bp+var_2], seg seg003
		mov	[bp+var_4], 8
		les	di, [bp+var_4]
		mov	cx, word_7684C
		mov	ax, 1209h
sub_4965		endp
seg003		ends
