seg165		segment	para public 'CODE' use16
		assume cs:seg165
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C2h, 6, 89h, 16h, 70h, 48h, 7, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_681A8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, 3C8h
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		out	dx, al
		jmp	short loc_681B8

loc_681B8:
		inc	dx
		lodsb
		out	dx, al
		jmp	short loc_681BD

loc_681BD:
		lodsb
		out	dx, al
		jmp	short loc_681C1

loc_681C1:
		lodsb
		out	dx, al
		jmp	short loc_681C5

loc_681C5:
		pop	si
		pop	bp
		retf	4
sub_681A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_681CA		proc far

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
		jmp	short loc_681DF

loc_681DF:
		inc	dx
		lodsb
		out	dx, al
		jmp	short loc_681E4

loc_681E4:
		lodsb
		out	dx, al
		jmp	short loc_681E8

loc_681E8:
		lodsb
		out	dx, al
		jmp	short loc_681EC

loc_681EC:
		dec	dx
		inc	bl
sub_681CA		endp

; START OF FUNCTION CHUNK FOR sub_681CA
		db 0E2h
; END OF FUNCTION CHUNK FOR sub_681CA
seg165		ends
