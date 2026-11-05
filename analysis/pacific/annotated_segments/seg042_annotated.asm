seg042		segment	para public 'CODE' use16
		assume cs:seg042
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 46h, 0E8h, 89h, 44h, 1Ch

loc_1BD26:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BD2A		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, ax
		cmp	di, word_7CADA
		jz	short loc_1BD4F
		jmp	loc_1BDF0

loc_1BD4F:
		push	large [di+63h]
		call	sub_41524
		add	sp, 4
		mov	[bp+var_2], ax
		push	large [di+63h]
		call	sub_41547
		add	sp, 4
		mov	[bp+var_4], ax
		imul	ax, ax, 0Ah
		cwd
		idiv	[bp+var_2]
		mov	[bp+var_6], ax
		mov	al, [si+0Fh]
		mov	ah, 0
		cmp	ax, [bp+var_6]
		jge	short loc_1BDF0
		mov	al, [si+0Fh]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_1BDEB

loc_1BD8A:
		mov	al, [si+0Eh]
		mov	ah, 0
		mov	[bp+var_8], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_8]
		jmp	short loc_1BDB8

loc_1BDA2:
		mov	al, [si+0Eh]
		mov	ah, 0
		mov	[bp+var_A], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_A]

loc_1BDB8:
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	dx, ax
		mov	ax, dx
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		cmp	byte ptr [bx+0Dh], 0
		jnz	short loc_1BDA2
		mov	ax, dx
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	byte ptr [bx+0Dh], 1
		inc	byte ptr [si+0Fh]
		inc	di

loc_1BDEB:
		cmp	di, [bp+var_6]
		jl	short loc_1BD8A

loc_1BDF0:
		pop	di
		pop	si
		leave
		retf
sub_1BD2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BDF4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Fh], 0
		jnz	short loc_1BE08
		jmp	loc_1BEAD

loc_1BE08:
		mov	bx, [si]
		mov	ax, [bx+1E1h]
		mov	[bp+var_2], ax
		xor	di, di
		jmp	loc_1BEA1

loc_1BE16:
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 2
		add	bx, ax
		cmp	word ptr [bx], 29Ah
		jz	short loc_1BEA0
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		cmp	byte ptr [bx+0Dh], 0
		jz	short loc_1BEA0
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	al, [bx+0Ch]
		mov	ah, 0
		imul	ax, ax, 3
		add	ax, [bp+var_2]
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 2
		add	bx, ax
		push	word ptr [bx+2]
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 2
		add	bx, ax
		push	word ptr [bx]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch

loc_1BEA0:
		inc	di

loc_1BEA1:
		mov	al, [si+0Eh]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_1BEAD
		jmp	loc_1BE16

loc_1BEAD:
		pop	di
		pop	si
		leave
sub_1BDF4		endp
seg042		ends
