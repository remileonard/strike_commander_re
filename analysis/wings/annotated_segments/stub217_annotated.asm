stub217		segment	para public 'CODE' use16
		assume cs:stub217
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_593C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 17710h		; fileoff
		dw 133h		; codesize
		dw 0Ah		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_593E0	proc far
		jmp	sub_77020
sub_593E0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub217		ends
