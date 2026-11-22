seg109		segment	para public 'CODE' use16
		assume cs:seg109
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_469E1		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		push	si
		cmp	word_5DD44, 0
		jnz	short loc_46A26
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_46A09
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		jmp	short loc_46A0B

loc_46A09:
		mov	ax, si

loc_46A0B:
		mov	word_5DD44, ax
		mov	al, [bp+arg_0]
		push	ax
		push	0
		push	word_5DD44
		call	TextFormat_SetAttribute_479C4
		add	sp, 6
sub_469E1		endp
seg109		ends
