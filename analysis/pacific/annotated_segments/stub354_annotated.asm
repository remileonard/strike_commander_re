stub354		segment	para public 'CODE' use16
		assume cs:stub354
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75640	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4B2E0h		; fileoff
		dw 14Eh		; codesize
		dw 0		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75660	proc far
		jmp	sub_C56B0
sub_75660	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub354		ends
