ovr374		segment	para public 'OVERLAY' use16
		assume cs:ovr374
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D07A0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_D07BA
		push	0D2h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_D07D0

loc_D07BA:
		push	si
		push	large 4E414C50h
		call	sub_75910
		add	sp, 6
		push	si
		nop
		push	cs
		call	near ptr sub_D07D5
		pop	cx

loc_D07D0:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_D07A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D07D5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		jmp	short loc_D07E8

loc_D07E0:
		mov	bx, ax
		mov	byte ptr [bx+si+0C8h], 0
		inc	ax

loc_D07E8:
		cmp	ax, 0Ah
		jl	short loc_D07E0
		push	848h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D082D
		push	898h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D081B
		push	0A1h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D082D
		mov	byte ptr [si+0C9h], 1
		jmp	short loc_D082D

loc_D081B:
		push	0A0h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D082D
		mov	byte ptr [si+0C8h], 1

loc_D082D:
		push	84Bh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D086D
		push	899h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D085B
		push	0A3h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D086D
		mov	byte ptr [si+0CBh], 1
		jmp	short loc_D086D

loc_D085B:
		push	0A2h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D086D
		mov	byte ptr [si+0CAh], 1

loc_D086D:
		push	84Ch
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D088C
		push	0A4h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D088C
		mov	byte ptr [si+0CCh], 1

loc_D088C:
		push	84Eh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D08AB
		push	0A5h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D08AB
		mov	byte ptr [si+0CDh], 1

loc_D08AB:
		push	849h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D08CA
		push	0A6h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D08CA
		mov	byte ptr [si+0CEh], 1

loc_D08CA:
		push	84Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D08E9
		push	0A7h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D08E9
		mov	byte ptr [si+0CFh], 1

loc_D08E9:
		push	84Dh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D0908
		push	0A8h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D0908
		mov	byte ptr [si+0D0h], 1

loc_D0908:
		push	8B7h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D091A
		mov	byte ptr [si+0D1h], 1

loc_D091A:
		pop	si
		pop	bp
		retf
sub_D07D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D091D		proc far

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
		cmp	cx, 0Ah
		jl	short loc_D0933
		mov	cx, 9

loc_D0933:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jz	short loc_D0942

loc_D093E:
		mov	ax, cx
		jmp	short loc_D0962

loc_D0942:
		mov	si, cx
		jmp	short loc_D095B

loc_D0946:
		inc	cx
		cmp	cx, 0Ah
		jl	short loc_D094F
		mov	cx, 9

loc_D094F:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jnz	short loc_D093E
		inc	si

loc_D095B:
		cmp	si, 0Ah
		jl	short loc_D0946
		mov	ax, di

loc_D0962:
		pop	di
		pop	si
		pop	bp
		retf
sub_D091D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0966		proc far

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
		jge	short loc_D097A
		xor	cx, cx

loc_D097A:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jz	short loc_D0989

loc_D0985:
		mov	ax, cx
		jmp	short loc_D09A6

loc_D0989:
		mov	si, cx
		jmp	short loc_D09A0

loc_D098D:
		dec	cx
		or	cx, cx
		jge	short loc_D0994
		xor	cx, cx

loc_D0994:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+0C8h], 0
		jnz	short loc_D0985
		dec	si

loc_D09A0:
		or	si, si
		jg	short loc_D098D
		mov	ax, di

loc_D09A6:
		pop	di
		pop	si
		pop	bp
		retf
sub_D0966		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D09AA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_D09BE

loc_D09B4:
		mov	bx, ax
		add	bx, dx
		mov	byte ptr [bx+0C8h], 1
		inc	dx

loc_D09BE:
		cmp	dx, 0Ah
		jl	short loc_D09B4
		pop	bp
		retf
sub_D09AA		endp
ovr374		ends
