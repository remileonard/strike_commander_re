stub406		segment	para public 'CODE' use16
		assume cs:stub406
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76550	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D120h		; fileoff
		dw 2Fh		; codesize
		dw 4		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76570	proc far
		jmp	Video_SetModeIfChanged_E55D0
sub_76570	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub406		ends
