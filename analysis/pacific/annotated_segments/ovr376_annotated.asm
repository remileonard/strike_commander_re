ovr376		segment	para public 'OVERLAY' use16
		assume cs:ovr376
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0C00		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_D0C1A
		push	0D2h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_D0C3A

loc_D0C1A:
		push	0FBCh
		push	si
		call	CRT_Strcpy
		add	sp, 4
		mov	ax, si
		add	ax, 14h
		push	ax
		push	large 544C4950h
		call	sub_75910
		add	sp, 6

loc_D0C3A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_D0C00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0C3F		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0C8h], 1
		mov	byte ptr [si+0C9h], 1
		mov	[bp+var_1], 49h
		xor	di, di
		jmp	short loc_D0C7F

loc_D0C5C:
		mov	al, [bp+var_1]
		cbw
		push	ax
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D0C74
		mov	bx, di
		mov	byte ptr [bx+si+0CAh], 1
		jmp	short loc_D0C7B

loc_D0C74:
		mov	bx, di
		mov	byte ptr [bx+si+0CAh], 0

loc_D0C7B:
		inc	[bp+var_1]
		inc	di

loc_D0C7F:
		cmp	di, 8
		jl	short loc_D0C5C
		pop	di
		pop	si
		leave
		retf
sub_D0C3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0C88		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0C8h], 1
		mov	byte ptr [si+0C9h], 1
		xor	ax, ax
		jmp	short loc_D0CA5

loc_D0C9D:
		mov	bx, ax
		mov	byte ptr [bx+si+0CAh], 1
		inc	ax

loc_D0CA5:
		cmp	ax, 8
		jl	short loc_D0C9D
		pop	si
		pop	bp
		retf
sub_D0C88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0CAD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	cx, si
		inc	cx
		cmp	cx, 0Ah
		jl	short loc_D0CC2
		mov	cx, 9

loc_D0CC2:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jz	short loc_D0CD1

loc_D0CCD:
		mov	ax, cx
		jmp	short loc_D0CF1

loc_D0CD1:
		xor	ax, ax
		jmp	short loc_D0CEA

loc_D0CD5:
		inc	cx
		cmp	cx, 0Ah
		jl	short loc_D0CDE
		mov	cx, 9

loc_D0CDE:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jnz	short loc_D0CCD
		inc	ax

loc_D0CEA:
		cmp	ax, 0Ah
		jl	short loc_D0CD5
		mov	ax, si

loc_D0CF1:
		pop	si
		pop	bp
		retf
sub_D0CAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0CF4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	si, 0Ah
		jl	short loc_D0D07
		xor	ax, ax
		jmp	short loc_D0D3F

loc_D0D07:
		mov	cx, si
		dec	cx
		cmp	cx, 1
		jge	short loc_D0D12
		mov	cx, 1

loc_D0D12:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jnz	short loc_D0D33
		xor	ax, ax
		jmp	short loc_D0D38

loc_D0D21:
		dec	cx
		or	cx, cx
		jge	short loc_D0D28
		xor	cx, cx

loc_D0D28:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jz	short loc_D0D37

loc_D0D33:
		mov	ax, cx
		jmp	short loc_D0D3F

loc_D0D37:
		inc	ax

loc_D0D38:
		cmp	ax, 0Ah
		jl	short loc_D0D21
		mov	ax, si

loc_D0D3F:
		pop	si
		pop	bp
		retf
sub_D0CF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0D42		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 1
		jz	short loc_D0D78
		or	dx, dx
		jl	short loc_D0D78
		cmp	dx, 0Ah
		jg	short loc_D0D78
		mov	bx, ax
		add	bx, dx
		cmp	byte ptr [bx+0C8h], 0
		jz	short loc_D0D6F
		mov	bx, ax
		add	bx, dx
		mov	byte ptr [bx+0C8h], 0
		jmp	short loc_D0D78

loc_D0D6F:
		mov	bx, ax
		add	bx, dx
		mov	byte ptr [bx+0C8h], 1

loc_D0D78:
		pop	bp
		retf
sub_D0D42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0D7A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	cl, 1
		xor	dx, dx
		jmp	short loc_D0D96

loc_D0D86:
		mov	bx, ax
		add	bx, dx
		cmp	byte ptr [bx+0CAh], 0
		jz	short loc_D0D95
		mov	cl, 0
		jmp	short loc_D0D9B

loc_D0D95:
		inc	dx

loc_D0D96:
		cmp	dx, 8
		jl	short loc_D0D86

loc_D0D9B:
		mov	al, cl
		pop	bp
		retf
sub_D0D7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0D9F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	cx, cx
		xor	dx, dx
		jmp	short loc_D0DB8

loc_D0DAB:
		mov	bx, ax
		add	bx, dx
		cmp	byte ptr [bx+0CAh], 0
		jz	short loc_D0DB7
		inc	cx

loc_D0DB7:
		inc	dx

loc_D0DB8:
		cmp	dx, 8
		jl	short loc_D0DAB
		mov	ax, cx
		pop	bp
		retf
sub_D0D9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0DC1		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_D0D9F
		pop	cx
		mov	[bp+var_2], ax
		mov	di, 1
		mov	[bp+var_6], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_6]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	bx, di
		mov	al, [bx+si+0C8h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D0E12
		push	bx
		push	si
		push	cs
		call	near ptr sub_D0CAD
		add	sp, 4
		mov	di, ax

loc_D0E12:
		mov	[bp+var_8], 0
		jmp	short loc_D0E27

loc_D0E19:
		push	di
		push	si
		push	cs
		call	near ptr sub_D0CAD
		add	sp, 4
		mov	di, ax
		inc	[bp+var_8]

loc_D0E27:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+var_4]
		jl	short loc_D0E19
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_D0DC1		endp
ovr376		ends
