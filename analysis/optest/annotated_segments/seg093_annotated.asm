seg093		segment	byte public 'CODE' use16
		assume cs:seg093
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2F002	proc far		; CODE XREF: seg082:039BP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, 3C8h
		mov	si, [bp+arg_0]

loc_2F00C:				; DATA XREF: seg170:03BEo
		mov	ax, [bp+arg_2]
		out	dx, al
		jmp	short $+2
		inc	dx
		lodsb
		out	dx, al
		jmp	short $+2
		lodsb
		out	dx, al
		jmp	short $+2
		lodsb
		out	dx, al
		jmp	short $+2
		pop	si
		pop	bp
		retf	4
sub_2F002	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2F024	proc far		; CODE XREF: Palette_Upload_2CDE1+88P
					; Palette_Upload_2CDE1+C3P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	dx, 3C8h
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	bx, [bp+arg_4]

loc_2F034:				; CODE XREF: sub_2F024+25j
		mov	al, bl
		out	dx, al
		jmp	short $+2
		inc	dx
		lodsb
		out	dx, al
		jmp	short $+2
		lodsb
		out	dx, al
		jmp	short $+2
		lodsb
		out	dx, al
		jmp	short $+2
		dec	dx
		inc	bl
		loop	loc_2F034
		pop	si
		pop	bp
		retf	6
sub_2F024	endp

seg093		ends
