seg091		segment	byte public 'CODE' use16
		assume cs:seg091
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		push	di
		push	ds
		pop	es
		assume es:dseg
		cld
		mov	dx, 3C7h
		mov	di, [bp+6]
		or	di, di
		jz	short loc_2EFB2
		mov	ax, [bp+8]
		out	dx, al
		jmp	short $+2
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short $+2
		stosb
		in	al, dx
		jmp	short $+2
		stosb
		in	al, dx
		jmp	short $+2
		stosb

loc_2EFB2:				; CODE XREF: seg091:0019j
		pop	di
		pop	bp
		retf	4

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2EFB7	proc far		; CODE XREF: sub_2CDC3+16P
					; seg082:028FP

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
		jz	short loc_2EFE8
		mov	cx, [bp+arg_2]
		mov	bx, [bp+arg_4]
		cld

loc_2EFCB:				; CODE XREF: sub_2EFB7+2Fj
		mov	dx, 3C7h
		mov	al, bl
		out	dx, al
		jmp	short $+2
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short $+2
		stosb
		in	al, dx
		jmp	short $+2
		stosb
		in	al, dx
		jmp	short $+2
		stosb
		inc	bl
		loop	loc_2EFCB

loc_2EFE8:				; CODE XREF: sub_2EFB7+Bj
		pop	di
		pop	bp
		retf	6
sub_2EFB7	endp

seg091		ends
