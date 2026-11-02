seg117		segment	para public 'CODE' use16
		assume cs:seg117
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FBh, 0ECh, 0A8h, 8, 74h, 0FBh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35D08		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	di, di
		jz	short loc_35D3D
		mov	bx, [bp+arg_4]
		mov	[bx], di
		jmp	short loc_35D3D

loc_35D1E:
		mov	si, dx
		jmp	short loc_35D2E

loc_35D22:
		mov	al, [si]
		mov	di, [bp+arg_4]
		mov	bx, [di]
		cmp	al, [bx]
		jz	short loc_35D33
		inc	si

loc_35D2E:
		cmp	byte ptr [si], 0
		jnz	short loc_35D22

loc_35D33:
		cmp	byte ptr [si], 0
		jz	short loc_35D47
		mov	di, [bp+arg_4]
		inc	word ptr [di]

loc_35D3D:
		mov	di, [bp+arg_4]
		mov	bx, [di]
		cmp	byte ptr [bx], 0
		jnz	short loc_35D1E

loc_35D47:
		mov	di, [bp+arg_4]
		mov	bx, [di]
		cmp	byte ptr [bx], 0
		jnz	short loc_35D55
		xor	ax, ax
		jmp	short loc_35D8E

loc_35D55:
		mov	di, [bp+arg_4]
		mov	ax, [di]
		mov	cx, ax
		jmp	short loc_35D82

loc_35D5E:
		mov	si, dx
		jmp	short loc_35D78

loc_35D62:
		mov	al, [si]
		mov	di, [bp+arg_4]
		mov	bx, [di]
		cmp	al, [bx]
		jnz	short loc_35D77
		mov	byte ptr [bx], 0
		mov	di, [bp+arg_4]
		inc	word ptr [di]
		jmp	short loc_35D8C

loc_35D77:
		inc	si

loc_35D78:
		cmp	byte ptr [si], 0
		jnz	short loc_35D62
		mov	di, [bp+arg_4]
		inc	word ptr [di]

loc_35D82:
		mov	di, [bp+arg_4]
		mov	bx, [di]
		cmp	byte ptr [bx], 0
		jnz	short loc_35D5E

loc_35D8C:
		mov	ax, cx

loc_35D8E:
		pop	di
		pop	si
sub_35D08		endp
seg117		ends
