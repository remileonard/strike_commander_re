stub209		segment	para public 'CODE' use16
		assume cs:stub209
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47E70	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 460D0h		; fileoff
		dw 5915h		; codesize
		dw 57Ch		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47E90	proc far
		jmp	sub_91BB0
sub_47E90	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub209		ends
