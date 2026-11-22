seg175		segment	para public 'CODE' use16
		assume cs:seg175
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 0FFh, 0FFh

loc_44BD3:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44BD6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_44BEF
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_44C0C

loc_44BEF:
		push	si
		call	sub_44B17
		pop	cx
		mov	byte_4DE12, 0
		mov	word_4DE0E, 0
		mov	word_4DE10, 0
		mov	byte_4F77A, 1

loc_44C0C:
		mov	ax, si
		pop	si
		pop	bp
sub_44BD6		endp
seg175		ends
