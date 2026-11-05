seg172		segment	para public 'CODE' use16
		assume cs:seg172
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Eh, 4Ah, 7Ch, 0CFh, 0FFh, 0Eh, 8Eh, 4Ah, 0C7h, 4, 0FFh, 0FFh

loc_5612C:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5612F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_56148
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_56165

loc_56148:
		push	si
		call	sub_56070
		pop	cx
		mov	byte_5E7D0, 0
		mov	word_5E7CC, 0
		mov	word_5E7CE, 0
sub_5612F		endp
seg172		ends
