ovr387		segment	para public 'OVERLAY' use16
		assume cs:ovr387
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAEF0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DAF09
		push	3Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DAF18

loc_DAF09:
		push	si
		push	large 4C49504Ah
		call	sub_75910
		add	sp, 6

loc_DAF18:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DAEF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAF1D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		inc	dx
		cmp	dx, 3
		jl	short loc_DAF2F
		mov	dx, 2

loc_DAF2F:
		mov	ax, dx
		pop	bp
		retf
sub_DAF1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAF33		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 3
		jl	short loc_DAF45
		xor	ax, ax
		jmp	short loc_DAF4E

loc_DAF45:
		dec	dx
		or	dx, dx
		jge	short loc_DAF4C
		xor	dx, dx

loc_DAF4C:
		mov	ax, dx

loc_DAF4E:
		pop	bp
		retf
sub_DAF33		endp
ovr387		ends
