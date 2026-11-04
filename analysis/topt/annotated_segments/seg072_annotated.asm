seg072		segment	para public 'CODE' use16
		assume cs:seg072
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 8Bh, 0C6h, 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C058		proc far

var_26		= word ptr -26h
var_22		= byte ptr -22h
var_20		= word ptr -20h
arg_0		= word ptr  6

		enter	26h, 0
		push	si
		push	di
		push	ds
		push	fs
		cld
		mov	di, [bp+arg_0]
		mov	[bp+var_22], 0

loc_2C069:
		mov	si, di
		push	ss
		pop	es
		lea	di, [bp+var_20]
		xor	ax, ax
		mov	cx, 10h
		rep stosw
		mov	di, si
		mov	ax, ss:[di+2]
		mov	[bp+var_26], ax
		lds	si, ss:[di+4]

loc_2C084:
		lfs	bx, [si]
		push	bx
		mov	eax, fs:[bx+2]
		mov	cl, [bp+var_22]
		shr	eax, cl
		and	ax, 0Fh
		lea	bx, [bp+var_20]
		add	bx, ax
		add	bx, ax

loc_2C09D:
		mov	dx, ss:[bx]
		cmp	dx, 400h
		jl	short loc_2C0B6
		add	bx, 2
		inc	al
		cmp	al, 10h
		jl	short loc_2C09D
		sub	al, 10h
		sub	bx, 20h
		jmp	short loc_2C09D

loc_2C0B6:
		shl	al, 2
		add	dh, al
		inc	word ptr ss:[bx]
		shl	dx, 2
		les	bx, ss:[di+8]
		add	bx, dx
		pop	word ptr es:[bx]
		mov	es:[bx+2], fs
		add	si, 4
		dec	[bp+var_26]
		jnz	short loc_2C084
		lds	si, ss:[di+4]
		mov	es, ss:[di+0Ah]
		mov	cx, 0Fh

loc_2C0E1:
		mov	dx, 0FFFFh
		jmp	short loc_2C0FE

loc_2C0E6:
		mov	bx, cx
		shl	bx, 0Ah
		add	bx, dx
		shl	bx, 2
		add	bx, ss:[di+8]
		mov	eax, es:[bx]
		mov	[si], eax
		add	si, 4

loc_2C0FE:
		inc	dx
		lea	bx, [bp+var_20]
		add	bx, cx
		add	bx, cx
		cmp	ss:[bx], dx
		jnz	short loc_2C0E6
		dec	cx
		jns	short loc_2C0E1
		add	[bp+var_22], 4
		cmp	[bp+var_22], 20h
		jge	short loc_2C11B
		jmp	loc_2C069

loc_2C11B:
		pop	fs
		pop	ds
		pop	di
		pop	si
sub_2C058		endp
seg072		ends
