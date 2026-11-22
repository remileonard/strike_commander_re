seg025		segment	para public 'CODE' use16
		assume cs:seg025
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 74h, 7, 56h, 9Ah, 3Bh, 3, 0, 0, 59h

loc_1388A:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1388E		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_2]
		xor	di, di
		mov	[bp+var_C], 0
		jmp	short loc_138FE

loc_138A2:
		mov	bx, [bp+arg_0]
		add	bx, [bp+var_C]
		cmp	byte ptr [bx], 20h
		jnz	short loc_138B2
		add	di, 6
		jmp	short loc_138FB

loc_138B2:
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 320032h
		cmp	byte ptr [si+4], 3
		jnz	short loc_138D9
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_138DE

loc_138D9:
		mov	dx, [si+2]
		mov	ax, [si]

loc_138DE:
		push	dx
		push	ax
		mov	bx, [bp+arg_0]
		add	bx, [bp+var_C]
		mov	al, [bx]
		mov	ah, 0
		push	ax
		call	sub_47C50
		mov	ax, [bp+var_6]
		add	ax, 2
		sub	ax, [bp+var_A]
		add	di, ax

loc_138FB:
		inc	[bp+var_C]

loc_138FE:
		push	[bp+arg_0]
		call	CRT_Strlen
		pop	cx
		cmp	ax, [bp+var_C]
		ja	short loc_138A2
		mov	ax, di
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_2], ax
		pop	di
		pop	si
		leave
		retf
sub_1388E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1391A		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	di, [bp+arg_2]
		mov	si, [bp+arg_8]
		cmp	[bp+arg_0], 1
		jnz	short loc_13941
		push	si
		push	[bp+arg_6]
		push	cs
		call	near ptr sub_1388E
		add	sp, 4
		mov	dx, di
		sub	dx, ax
		mov	di, dx
		jmp	short loc_13941

loc_13941:
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[bp+var_E], 0
		jmp	loc_139DB

loc_1394F:
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	di
		push	[bp+var_2]
		cmp	byte ptr [si+4], 3
		jnz	short loc_13974
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_13979

loc_13974:
		mov	dx, [si+2]
		mov	ax, [si]

loc_13979:
		push	dx
		push	ax
		mov	bx, [bp+arg_6]
		add	bx, [bp+var_E]
		mov	al, [bx]
		mov	ah, 0
		push	ax
		call	sub_47C50
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_C]
		mov	[bp+var_4], ax
		add	[bp+var_4], 2
		mov	bx, [bp+arg_6]
		add	bx, [bp+var_E]
		mov	al, [bx]
		mov	ah, 0
		push	ax
		cmp	byte ptr [si+4], 3
		jnz	short loc_139BF
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_139C4

loc_139BF:
		mov	dx, [si+2]
		mov	ax, [si]

loc_139C4:
		push	dx
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+arg_A]
		call	sub_4A194
		add	sp, 0Ch
		add	di, [bp+var_4]
		inc	[bp+var_E]

loc_139DB:
		push	[bp+arg_6]
		call	CRT_Strlen
		pop	cx
		cmp	ax, [bp+var_E]
		jbe	short loc_139EC
		jmp	loc_1394F

loc_139EC:
		pop	di
		pop	si
		leave
		retf
sub_1391A		endp
seg025		ends
