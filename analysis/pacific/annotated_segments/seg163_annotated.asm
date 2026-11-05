seg163		segment	para public 'CODE' use16
		assume cs:seg163
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68130		proc far

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
		jz	short loc_68158
		mov	ax, [bp+arg_2]
		out	dx, al
		jmp	short loc_68147

loc_68147:
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short loc_6814F

loc_6814F:
		stosb
		in	al, dx
		jmp	short loc_68153

loc_68153:
		stosb
		in	al, dx
		jmp	short loc_68157

loc_68157:
		stosb

loc_68158:
		pop	di
		pop	bp
		retf	4
sub_68130		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6815D		proc far

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
		jz	short loc_6818E
		mov	cx, [bp+arg_2]
		mov	bx, [bp+arg_4]
		cld

loc_68171:
		mov	dx, 3C7h
		mov	al, bl
		out	dx, al
		jmp	short loc_68179

loc_68179:
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short loc_68181

loc_68181:
		stosb
		in	al, dx
		jmp	short loc_68185

loc_68185:
		stosb
		in	al, dx
		jmp	short loc_68189

loc_68189:
		stosb
		inc	bl
		loop	short loc_68171

loc_6818E:
		pop	di
		pop	bp
sub_6815D		endp
seg163		ends
