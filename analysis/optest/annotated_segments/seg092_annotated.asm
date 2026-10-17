seg092		segment	byte public 'CODE' use16
		assume cs:seg092
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_2EFEE	proc far		; CODE XREF: TextRenderer_EncodeCharB_2E977+25P
					; sub_5D287:loc_5D2CFP
		push	es
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	dx, es:63h
		add	dl, 6
		mov	word_47032, dx
		pop	es
		assume es:nothing
		retf
sub_2EFEE	endp

seg092		ends
