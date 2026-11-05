seg022		segment	para public 'CODE' use16
		assume cs:seg022
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D174		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_D174		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D17C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	2F8h
		call	sub_A4F0
		pop	cx
		push	2FAh
		call	sub_A4F0
		pop	cx
		push	2F9h
		call	sub_A4F0
		pop	cx
		push	2FCh
		call	sub_A4F0
		pop	cx
		push	2FBh
		call	sub_A4F0
		pop	cx
		pop	bp
		retf
sub_D17C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1B1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	105h
		call	sub_A4F0
		pop	cx
		push	106h
		call	sub_A4F0
		pop	cx
		push	107h
		call	sub_A4F0
		pop	cx
		push	108h
		call	sub_A4F0
		pop	cx
		push	109h
		call	sub_A4F0
		pop	cx
		push	10Ah
		call	sub_A4F0
		pop	cx
		push	10Bh
		call	sub_A4F0
		pop	cx
		push	10Ch
		call	sub_A4F0
		pop	cx
		push	10Dh
		call	sub_A4F0
		pop	cx
		pop	bp
		retf
sub_D1B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D20A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si+2AEh]
		cmp	si, 5
		jl	short loc_D243
		push	105h
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D243
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D243
		push	105h
		call	sub_A455
		pop	cx
		mov	ax, 0CFh
		jmp	loc_D332

loc_D243:
		cmp	si, 0Ah
		jl	short loc_D271
		push	106h
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D271
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D271
		push	106h
		call	sub_A455
		pop	cx
		mov	ax, 0D0h
		jmp	loc_D332

loc_D271:
		cmp	si, 0Fh
		jl	short loc_D29F
		push	107h
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D29F
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D29F
		push	107h
		call	sub_A455
		pop	cx
		mov	ax, 0D1h
		jmp	loc_D332

loc_D29F:
		cmp	si, 14h
		jl	short loc_D2CC
		push	108h
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D2CC
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D2CC
		push	108h
		call	sub_A455
		pop	cx
		mov	ax, 0D2h
		jmp	short loc_D332

loc_D2CC:
		cmp	si, 1Eh
		jl	short loc_D2FE
		push	10Ah
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D2FE
		push	10Ah
		call	sub_A455
		pop	cx
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D2F9
		mov	ax, 0D4h
		jmp	short loc_D332

loc_D2F9:
		mov	ax, 0D3h
		jmp	short loc_D332

loc_D2FE:
		cmp	si, 3Ch
		jl	short loc_D330
		push	10Eh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D330
		push	10Eh
		call	sub_A455
		pop	cx
		push	10Fh
		call	sub_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_D32B
		mov	ax, 0D6h
		jmp	short loc_D332

loc_D32B:
		mov	ax, 0D5h
		jmp	short loc_D332
sub_D20A		endp
seg022		ends
