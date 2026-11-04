seg111		segment	para public 'CODE' use16
		assume cs:seg111
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 56h, 9Ah, 6, 0, 0A7h, 37h, 83h, 0C4h, 0Ch

loc_35B1A:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35B1D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di], 0
		jnz	short loc_35B2E

loc_35B2A:
		mov	al, 0
		jmp	short loc_35B54

loc_35B2E:
		xor	cx, cx
		jmp	short loc_35B4D

loc_35B32:
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
		jnz	short loc_35B2A
		inc	cx

loc_35B4D:
		cmp	cx, [bp+arg_4]
		jb	short loc_35B32
		mov	al, 1

loc_35B54:
		pop	di
		pop	si
		pop	bp
		retf
sub_35B1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35B58		proc far

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
		jz	short loc_35B70
		push	word ptr [si]
		call	sub_39C
		pop	cx

loc_35B70:
		mov	ax, di
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_35BA3
		xor	cx, cx
		jmp	short loc_35B9B

loc_35B86:
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

loc_35B9B:
		cmp	cx, di
		jb	short loc_35B86
sub_35B58		endp

; START OF FUNCTION CHUNK FOR sub_35B58
		db 0B0h
; END OF FUNCTION CHUNK FOR sub_35B58
seg111		ends
