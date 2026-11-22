stub243		segment	para public 'CODE' use16
		assume cs:stub243
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48740	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74EF0h		; fileoff
		dw 19Ah		; codesize
		dw 0Ah		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48760	proc far
		jmp	sub_BE0E0
sub_48760	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub243		ends
