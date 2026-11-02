seg107		segment	para public 'CODE' use16
		assume cs:seg107
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FEh, 0A3h, 8Ch, 49h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_349D7		proc far
		push	bp
		mov	bp, sp
		push	si
		cmp	word_4D36E, 0
		jnz	short loc_34A17
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_349FF
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		jmp	short loc_34A01

loc_349FF:
		mov	ax, si

loc_34A01:
		mov	word_4D36E, ax
		push	1
		push	0
		push	ax
		call	TextFormat_SetAttribute_3591E
sub_349D7		endp

; START OF FUNCTION CHUNK FOR sub_349D7
		db 83h, 0C4h
; END OF FUNCTION CHUNK FOR sub_349D7
seg107		ends
