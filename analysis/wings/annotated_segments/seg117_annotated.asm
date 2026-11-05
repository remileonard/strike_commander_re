seg117		segment	para public 'CODE' use16
		assume cs:seg117
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47D50		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, 3C8h
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		out	dx, al
		jmp	short loc_47D60

loc_47D60:
		inc	dx
		lodsb
		out	dx, al
		jmp	short loc_47D65

loc_47D65:
		lodsb
		out	dx, al
		jmp	short loc_47D69

loc_47D69:
		lodsb
		out	dx, al
		jmp	short loc_47D6D

loc_47D6D:
		pop	si
		pop	bp
		retf	4
sub_47D50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47D72		proc far

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
		mov	al, bl
		out	dx, al
		jmp	short loc_47D87

loc_47D87:
		inc	dx
		lodsb
		out	dx, al
		jmp	short loc_47D8C

loc_47D8C:
		lodsb
		out	dx, al
		jmp	short loc_47D90
sub_47D72		endp
seg117		ends
