seg067		segment	para public 'CODE' use16
		assume cs:seg067
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 41h, 69h, 0Eh, 0E8h, 0Eh, 0FEh, 83h, 0C4h, 6

loc_27039:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2703C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+6], 0
		jle	short loc_2707B
		inc	word ptr [si+0Ah]
		mov	ax, [si+0Ah]
		cmp	ax, [si+6]
		jl	short loc_2705A
		mov	word ptr [si+0Ah], 0

loc_2705A:
		mov	ax, [si+0Ah]
		mov	dx, 6
		imul	dx
		mov	dx, [si+8]
		add	dx, ax
		mov	di, dx
		mov	eax, [di]
		mov	[si], eax
		mov	al, [di+4]
		mov	[si+4], al
		mov	al, [di+5]
		mov	[si+5], al

loc_2707B:
		pop	di
		pop	si
		pop	bp
		retf
sub_2703C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2707F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_270AE
		les	bx, [bp+arg_0]
		mov	si, es:[bx+6]
		xor	di, di
		jmp	short loc_270A5

loc_27099:
		push	si
		push	cs
		call	near ptr sub_2703C
		add	sp, 2
		inc	di
		add	si, 0Eh

loc_270A5:
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		ja	short loc_27099

loc_270AE:
		pop	di
		pop	si
sub_2707F		endp
seg067		ends
