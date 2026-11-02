stub202		segment	para public 'CODE' use16
		assume cs:stub202
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47D20	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27470h		; fileoff
		dw 60C1h		; codesize
		dw 62Ah		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47D40	proc far
		jmp	sub_74C00
sub_47D40	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub202		ends
