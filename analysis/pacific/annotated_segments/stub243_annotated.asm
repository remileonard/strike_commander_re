stub243		segment	para public 'CODE' use16
		assume cs:stub243
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73150	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0D4E0h		; fileoff
		dw 17Ch		; codesize
		dw 0Ch		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73170	proc far
		jmp	Input_ReadMouseAndAxes_8A700
sub_73170	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub243		ends
