stub232		segment	para public 'CODE' use16
		assume cs:stub232
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_596D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 23A00h		; fileoff
		dw 7A8h		; codesize
		dw 84h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_596F0	proc far
		jmp	sub_82490
sub_596F0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub232		ends
