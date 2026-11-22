stub231		segment	para public 'CODE' use16
		assume cs:stub231
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_596A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 22E20h		; fileoff
		dw 0AE9h		; codesize
		dw 0ECh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_596C0	proc far
		jmp	sub_819A0
sub_596C0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub231		ends
