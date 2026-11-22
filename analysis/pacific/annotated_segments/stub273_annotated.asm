stub273		segment	para public 'CODE' use16
		assume cs:stub273
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73BC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27690h		; fileoff
		dw 133h		; codesize
		dw 0Ah		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73BE0	proc far
		jmp	sub_A3490
sub_73BE0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub273		ends
