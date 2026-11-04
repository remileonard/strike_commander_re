seg113		segment	para public 'CODE' use16
		assume cs:seg113
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Eh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35C32		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		push	ds
		pop	es
		cld
		mov	dx, 3C7h
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_35C5A
		mov	ax, [bp+arg_2]
		out	dx, al
		jmp	short loc_35C49

loc_35C49:
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short loc_35C51

loc_35C51:
		stosb
		in	al, dx
		jmp	short loc_35C55

loc_35C55:
		stosb
		in	al, dx
		jmp	short loc_35C59

loc_35C59:
		stosb

loc_35C5A:
		pop	di
		pop	bp
		retf	4
sub_35C32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35C5F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	di
		push	ds
		pop	es
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_35C90
		mov	cx, [bp+arg_2]
		mov	bx, [bp+arg_4]
		cld

loc_35C73:
		mov	dx, 3C7h
		mov	al, bl
		out	dx, al
		jmp	short loc_35C7B

loc_35C7B:
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short loc_35C83

loc_35C83:
		stosb
		in	al, dx
		jmp	short loc_35C87

loc_35C87:
		stosb
		in	al, dx
		jmp	short loc_35C8B

loc_35C8B:
		stosb
		inc	bl
		loop	short loc_35C73
sub_35C5F		endp
seg113		ends
