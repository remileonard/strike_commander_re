stub214		segment	para public 'CODE' use16
		assume cs:stub214
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47F60	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6BEB0h		; fileoff
		dw 50h		; codesize
		dw 4		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47F80	proc far
		jmp	TranslucentFont_DrawGlyph_B5700
sub_47F80	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub214		ends
