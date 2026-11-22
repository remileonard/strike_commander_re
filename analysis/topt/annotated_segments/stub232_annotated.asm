stub232		segment	para public 'CODE' use16
		assume cs:stub232
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48530	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 73650h		; fileoff
		dw 32Fh		; codesize
		dw 1Eh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48550	proc far
		jmp	sub_BC960
sub_48550	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub232		ends
