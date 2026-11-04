seg115		segment	para public 'CODE' use16
		assume cs:seg115
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 80h, 0C2h, 6, 89h, 16h, 0B0h, 49h, 7, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35CAA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, 3C8h
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		out	dx, al
		jmp	short loc_35CBA

loc_35CBA:
		inc	dx
		lodsb
		out	dx, al
		jmp	short loc_35CBF

loc_35CBF:
		lodsb
		out	dx, al
		jmp	short loc_35CC3

loc_35CC3:
		lodsb
		out	dx, al
		jmp	short loc_35CC7

loc_35CC7:
		pop	si
		pop	bp
		retf	4
sub_35CAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35CCC		proc far

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
		jmp	short loc_35CE1

loc_35CE1:
		inc	dx
		lodsb
		out	dx, al
		jmp	short loc_35CE6

loc_35CE6:
		lodsb
		out	dx, al
		jmp	short loc_35CEA

loc_35CEA:
		lodsb
		out	dx, al
		jmp	short loc_35CEE

loc_35CEE:
		dec	dx
sub_35CCC		endp

; START OF FUNCTION CHUNK FOR sub_35CCC
		db 0FEh
; END OF FUNCTION CHUNK FOR sub_35CCC
seg115		ends
