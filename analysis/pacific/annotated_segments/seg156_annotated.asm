seg156		segment	para public 'CODE' use16
		assume cs:seg156
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 89h, 46h, 0FEh, 0A3h, 4Ch, 48h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67399		proc far
		push	bp
		mov	bp, sp
		push	si
		cmp	word_7AF7E, 0
		jnz	short loc_673D9
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_673C1
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		jmp	short loc_673C3

loc_673C1:
		mov	ax, si

loc_673C3:
		mov	word_7AF7E, ax
		push	1
		push	0
		push	ax
		call	TextFormat_SetAttribute_67D8E
sub_67399		endp
seg156		ends
