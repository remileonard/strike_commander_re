ovr388		segment	para public 'OVERLAY' use16
		assume cs:ovr388
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAF50		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DAF6A
		push	12Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DAF79

loc_DAF6A:
		push	si
		push	large 4E4C504Ah
		call	sub_75910
		add	sp, 6

loc_DAF79:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DAF50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAF7E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		inc	dx
		cmp	dx, 19h
		jl	short loc_DAF90
		mov	dx, 18h

loc_DAF90:
		mov	ax, dx
		pop	bp
		retf
sub_DAF7E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAF94		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		dec	dx
		or	dx, dx
		jge	short loc_DAFA4
		xor	dx, dx

loc_DAFA4:
		mov	ax, dx
		pop	bp
		retf
sub_DAF94		endp
ovr388		ends
