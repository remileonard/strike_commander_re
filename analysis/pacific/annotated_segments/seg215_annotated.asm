seg215		segment	para public 'CODE' use16
		assume cs:seg215
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F6F3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6F70C
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F729

loc_6F70C:
		push	si
		call	sub_6F634
		pop	cx
		mov	byte_7B29A, 0
		mov	word_7B296, 0
sub_6F6F3		endp

; START OF FUNCTION CHUNK FOR sub_6F6F3
		db 0C7h
		push	es
; END OF FUNCTION CHUNK FOR sub_6F6F3
seg215		ends
