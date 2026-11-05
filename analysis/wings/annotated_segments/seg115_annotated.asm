seg115		segment	para public 'CODE' use16
		assume cs:seg115
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 7, 1Fh, 5Dh, 0CAh, 0Eh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47CD8		proc far

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
		jz	short loc_47D00
		mov	ax, [bp+arg_2]
		out	dx, al
		jmp	short loc_47CEF

loc_47CEF:
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short loc_47CF7

loc_47CF7:
		stosb
		in	al, dx
		jmp	short loc_47CFB

loc_47CFB:
		stosb
		in	al, dx
		jmp	short loc_47CFF

loc_47CFF:
		stosb

loc_47D00:
		pop	di
		pop	bp
		retf	4
sub_47CD8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47D05		proc far

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
		jz	short loc_47D36
		mov	cx, [bp+arg_2]
		mov	bx, [bp+arg_4]
		cld
		mov	dx, 3C7h
		mov	al, bl
		out	dx, al
		jmp	short loc_47D21

loc_47D21:
		mov	dx, 3C9h
		xor	ah, ah
		in	al, dx
		jmp	short loc_47D29

loc_47D29:
		stosb
		in	al, dx
		jmp	short loc_47D2D

loc_47D2D:
		stosb
		in	al, dx
sub_47D05		endp

; START OF FUNCTION CHUNK FOR sub_47D05
		db 0EBh
; END OF FUNCTION CHUNK FOR sub_47D05
seg115		ends
