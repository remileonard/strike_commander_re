ovr375		segment	para public 'OVERLAY' use16
		assume cs:ovr375
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D09D0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_D09EA
		push	0A8h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_D0A0A

loc_D09EA:
		push	si
		push	large 4E53494Dh
		call	sub_75910
		add	sp, 6
		xor	ax, ax
		jmp	short loc_D0A05

loc_D09FD:
		mov	bx, ax
		mov	byte ptr [bx+si+0A0h], 1
		inc	ax

loc_D0A05:
		cmp	ax, 8
		jl	short loc_D09FD

loc_D0A0A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_D09D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0A0F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, di
		inc	cx
		cmp	cx, 8
		jl	short loc_D0A25
		mov	cx, 7

loc_D0A25:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0A0h], 0
		jz	short loc_D0A34

loc_D0A30:
		mov	ax, cx
		jmp	short loc_D0A54

loc_D0A34:
		mov	si, cx
		jmp	short loc_D0A4D

loc_D0A38:
		inc	cx
		cmp	cx, 8
		jl	short loc_D0A41
		mov	cx, 7

loc_D0A41:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0A0h], 0
		jnz	short loc_D0A30
		inc	si

loc_D0A4D:
		cmp	si, 8
		jl	short loc_D0A38
		mov	ax, di

loc_D0A54:
		pop	di
		pop	si
		pop	bp
		retf
sub_D0A0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0A58		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, di
		dec	cx
		or	cx, cx
		jge	short loc_D0A6C
		xor	cx, cx

loc_D0A6C:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0A0h], 0
		jz	short loc_D0A7B

loc_D0A77:
		mov	ax, cx
		jmp	short loc_D0A98

loc_D0A7B:
		mov	si, cx
		jmp	short loc_D0A92

loc_D0A7F:
		dec	cx
		or	cx, cx
		jge	short loc_D0A86
		xor	cx, cx

loc_D0A86:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0A0h], 0
		jnz	short loc_D0A77
		dec	si

loc_D0A92:
		or	si, si
		jg	short loc_D0A7F
		mov	ax, di

loc_D0A98:
		pop	di
		pop	si
		pop	bp
		retf
sub_D0A58		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0A9C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		jmp	short loc_D0AAF

loc_D0AA7:
		mov	bx, ax
		mov	byte ptr [bx+si+0A0h], 0
		inc	ax

loc_D0AAF:
		cmp	ax, 8
		jl	short loc_D0AA7
		mov	bx, [bp+arg_2]
		cmp	bx, 17h
		jbe	short loc_D0ABF
		jmp	loc_D0BB9

loc_D0ABF:
		shl	bx, 1
		jmp	cs:off_D0BCD[bx]	; switch jump

loc_D0AC6:
		mov	byte ptr [si+0A0h], 1
		mov	byte ptr [si+0A1h], 1
		jmp	loc_D0BCA

loc_D0AD3:
		jmp	loc_D0BAF

loc_D0AD6:
		mov	byte ptr [si+0A0h], 1
		mov	byte ptr [si+0A1h], 1
		mov	byte ptr [si+0A2h], 1
		mov	byte ptr [si+0A3h], 1
		push	846h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D0AFA
		jmp	loc_D0BCA

loc_D0AFA:
		jmp	short loc_D0B4D

loc_D0AFC:
		mov	byte ptr [si+0A0h], 1
		push	846h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D0B11
		jmp	loc_D0BCA

loc_D0B11:
		mov	byte ptr [si+0A4h], 1
		jmp	loc_D0BCA

loc_D0B19:
		mov	byte ptr [si+0A0h], 1
		mov	byte ptr [si+0A1h], 1
		mov	byte ptr [si+0A2h], 1
		jmp	short loc_D0BA2

loc_D0B2A:
		jmp	short loc_D0B19

loc_D0B2C:
		mov	byte ptr [si+0A0h], 1
		mov	byte ptr [si+0A1h], 1
		mov	byte ptr [si+0A2h], 1
		mov	byte ptr [si+0A3h], 1
		push	846h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D0BCA

loc_D0B4D:
		mov	byte ptr [si+0A4h], 1
		mov	byte ptr [si+0A5h], 1
		mov	byte ptr [si+0A6h], 1
		mov	byte ptr [si+0A7h], 1
		jmp	short loc_D0BCA

loc_D0B63:
		jmp	short loc_D0B19

loc_D0B65:
		jmp	short loc_D0BAF

loc_D0B67:
		jmp	short loc_D0BA2

loc_D0B69:
		mov	byte ptr [si+0A0h], 1
		jmp	short loc_D0B9D

loc_D0B70:
		mov	byte ptr [si+0A1h], 1
		jmp	short loc_D0BAF

loc_D0B77:
		mov	byte ptr [si+0A3h], 1
		jmp	short loc_D0B83

loc_D0B7E:
		mov	byte ptr [si+0A1h], 1

loc_D0B83:
		mov	byte ptr [si+0A2h], 1
		jmp	short loc_D0BAF

loc_D0B8A:
		jmp	short loc_D0BAF

loc_D0B8C:
		jmp	short loc_D0B9D

loc_D0B8E:
		jmp	loc_D0AC6

loc_D0B91:
		mov	byte ptr [si+0A1h], 1
		mov	byte ptr [si+0A2h], 1
		jmp	short loc_D0BCA

loc_D0B9D:
		mov	byte ptr [si+0A1h], 1

loc_D0BA2:
		mov	byte ptr [si+0A3h], 1
		jmp	short loc_D0BCA

loc_D0BA9:
		jmp	loc_D0AC6

loc_D0BAC:
		jmp	loc_D0AC6

loc_D0BAF:
		mov	byte ptr [si+0A0h], 1
		jmp	short loc_D0BCA

loc_D0BB6:
		jmp	loc_D0AC6

loc_D0BB9:
		xor	ax, ax
		jmp	short loc_D0BC5

loc_D0BBD:
		mov	bx, ax
		mov	byte ptr [bx+si+0A0h], 1
		inc	ax

loc_D0BC5:
		cmp	ax, 8
		jl	short loc_D0BBD

loc_D0BCA:
		pop	si
		pop	bp
		retf
sub_D0A9C		endp

; START OF FUNCTION CHUNK FOR sub_D0A9C
off_D0BCD	dw offset loc_D0AC6
		dw offset loc_D0AD3
		dw offset loc_D0AD6
		dw offset loc_D0AD6
		dw offset loc_D0AFC
		dw offset loc_D0B19
		dw offset loc_D0B2A
		dw offset loc_D0B2C
		dw offset loc_D0B63
		dw offset loc_D0B65
		dw offset loc_D0B67
		dw offset loc_D0B69
		dw offset loc_D0B70
		dw offset loc_D0B77
		dw offset loc_D0B7E
		dw offset loc_D0B8A
		dw offset loc_D0B8C
		dw offset loc_D0B8E
		dw offset loc_D0B91
		dw offset loc_D0B9D
		dw offset loc_D0BA9
		dw offset loc_D0BAC
		dw offset loc_D0BAF
		dw offset loc_D0BB6
; END OF FUNCTION CHUNK FOR sub_D0A9C
ovr375		ends
