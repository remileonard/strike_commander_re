seg143		segment	para public 'CODE' use16
		assume cs:seg143
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 4Eh, 0F0h, 75h, 0E1h

loc_4AC25:
		db 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4AC2A		proc far

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
		jb	short loc_4AC5B
		jnz	short loc_4AC5E

loc_4AC5B:
		jmp	loc_4AD42

loc_4AC5E:
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
		jg	short loc_4ACC4
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_4ACB6
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		cmp	ax, [bp+var_C]

loc_4ACB6:
		jge	short loc_4ACBB
		jmp	loc_4AD49

loc_4ACBB:
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_8]

loc_4ACC4:
		jle	short loc_4ACC9
		jmp	loc_4AD49

loc_4ACC9:
		mov	dx, ds
		add	si, 8

loc_4ACCE:
		lodsw
		or	ax, ax
		jz	short loc_4AD4F
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
		jb	short loc_4AD02
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4ACF6:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4ACF6
		mov	ds, dx
		jmp	short loc_4ACCE

loc_4AD02:
		mov	bx, cx

loc_4AD04:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4AD27
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4AD15:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4AD15
		mov	ds, dx
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_4AD04
		jmp	short loc_4ACCE

loc_4AD27:
		sub	bx, ax
		lodsb
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4AD32:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4AD32
		mov	ds, dx
		pop	bx
		or	bx, bx
		jnz	short loc_4AD04
		jmp	short loc_4ACCE

loc_4AD42:
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf

loc_4AD49:
		add	si, 8

loc_4AD4C:
		lodsw
		shr	ax, 1

loc_4AD4F:
		jz	short loc_4AD42
		mov	cx, ax
		jnb	short loc_4AD58
		jmp	loc_4ADD8

loc_4AD58:
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_4ADD3
		cmp	ax, [bp+var_8]
		jg	short loc_4ADD3
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_4ADD3
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_4ADD3
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
		jle	short loc_4AD9D
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_4AD9D:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_4ADBD
		sub	cx, dx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4ADAD:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4ADAD
		mov	ds, [bp+var_154]
		add	si, dx
		jmp	short loc_4AD4C

loc_4ADBD:
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4ADC4:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4ADC4
		mov	ds, [bp+var_154]
		jmp	loc_4AD4C

loc_4ADD3:
		add	si, cx
		jmp	loc_4AD4C

loc_4ADD8:
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_4AE60
		cmp	ax, [bp+var_8]
		jg	short loc_4AE60
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_4AE60
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_4AE60
		shl	bx, 1
		push	ds
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]
		sub	dx, [bp+var_E]
		jl	short loc_4AE73
		cmp	ax, 0
		jg	short loc_4AE73
		mov	bx, cx

loc_4AE1A:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4AE40
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4AE2B:
		inc	si
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4AE2B
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_4AE1A
		jmp	loc_4AD4C

loc_4AE40:
		sub	bx, ax
		lodsb
		mov	ah, al
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4AE4D:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4AE4D
		mov	ds, [bp+var_154]
		pop	bx
		or	bx, bx
		jnz	short loc_4AE1A
		jmp	loc_4AD4C

loc_4AE60:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_4AE6C
		add	si, ax
		dec	si

loc_4AE6C:
		sub	cx, ax
		jnz	short loc_4AE60
		jmp	loc_4AD4C

loc_4AE73:
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_4AE81:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_4AEA6
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4AE92:
		lodsb
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4AE92
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
		sub	bx, ax
		jnz	short loc_4AE81
		jmp	short loc_4AEC3

loc_4AEA6:
		sub	bx, ax
		lodsb
		mov	ah, al
		push	bx
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4AEB3:
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4AEB3
		mov	ds, [bp+var_154]
		pop	bx
		or	bx, bx
		jnz	short loc_4AE81

loc_4AEC3:
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
		jge	short loc_4AEDC
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_4AEDC:
		cmp	[bp+var_2], 0
		jle	short loc_4AEE8
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_4AEE8:
		push	bx
		push	ax
		mov	ds, [bp+var_156]
		mov	bx, [bp+arg_C]

loc_4AEF1:
		lodsb
		mov	al, es:[di]
		xlatb
		stosb
		loop	short loc_4AEF1
		mov	ds, [bp+var_154]
		pop	ax
		pop	bx
sub_4AC2A		endp

; START OF FUNCTION CHUNK FOR sub_4AC2A
		db 3
; END OF FUNCTION CHUNK FOR sub_4AC2A
seg143		ends
