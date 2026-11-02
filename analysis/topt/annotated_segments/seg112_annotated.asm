seg112		segment	para public 'CODE' use16
		assume cs:seg112
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1, 0EBh, 2

loc_35BA3:
		db 0B0h, 0, 5Fh, 5Eh, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35BAA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	ds
		push	es
		push	si
		push	di
		lds	si, [bp+arg_2]
		mov	bx, [bp+arg_0]
		mov	ax, ds
		xor	dx, dx
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
		shl	bx, 1
		shl	bx, 1
		cmp	bx, [si+4]
		jl	short loc_35BDD
		xor	ax, ax
		jmp	short loc_35C2A

loc_35BDD:
		add	bx, 4
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
		les	di, [bp+arg_A]
		mov	cx, [bp+arg_8]
		mov	dx, [bp+arg_6]
		mov	ax, [si]
		add	ax, cx
		mov	es:[di+4], ax
		mov	ax, cx
		sub	ax, [si+2]
		mov	es:[di], ax
		mov	ax, dx
		sub	ax, [si+4]
		mov	es:[di+2], ax
		mov	ax, [si+6]
		add	ax, dx
		mov	es:[di+6], ax
		mov	ax, 0FFFFh

loc_35C2A:
		pop	di
		pop	si
		pop	es
		pop	ds
		pop	bp
sub_35BAA		endp

; START OF FUNCTION CHUNK FOR sub_35BAA
		db 0CAh
; END OF FUNCTION CHUNK FOR sub_35BAA
seg112		ends
