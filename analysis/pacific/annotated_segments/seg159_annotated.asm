seg159		segment	para public 'CODE' use16
		assume cs:seg159
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 56h, 9Ah, 8, 0, 72h, 69h, 83h, 0C4h, 0Ch

loc_67F8A:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67F8D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di], 0
		jnz	short loc_67F9E

loc_67F9A:
		mov	al, 0
		jmp	short loc_67FC4

loc_67F9E:
		xor	cx, cx
		jmp	short loc_67FBD

loc_67FA2:
		mov	ax, cx
		shl	ax, 1
		mov	bx, [di]
		add	bx, ax
		mov	dx, [bp+arg_2]
		inc	dx
		mov	ax, cx
		imul	dx
		mov	si, [di]
		mov	dx, [si]
		add	dx, ax
		cmp	[bx], dx
		jnz	short loc_67F9A
		inc	cx

loc_67FBD:
		cmp	cx, [bp+arg_4]
		jb	short loc_67FA2
		mov	al, 1

loc_67FC4:
		pop	di
		pop	si
		pop	bp
		retf
sub_67F8D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67FC8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si], 0
		jz	short loc_67FE0
		push	word ptr [si]
		call	sub_3B2
		pop	cx

loc_67FE0:
		mov	ax, di
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_68013
		xor	cx, cx
		jmp	short loc_6800B

loc_67FF6:
		mov	ax, cx
		shl	ax, 1
		mov	bx, [si]
		add	bx, ax
		mov	ax, cx
		imul	[bp+arg_2]
		mov	dx, [bp+arg_6]
		add	dx, ax
		mov	[bx], dx
		inc	cx

loc_6800B:
		cmp	cx, di
		jb	short loc_67FF6
sub_67FC8		endp

; START OF FUNCTION CHUNK FOR sub_67FC8
		db 0B0h
; END OF FUNCTION CHUNK FOR sub_67FC8
seg159		ends
