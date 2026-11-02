stub210		segment	para public 'CODE' use16
		assume cs:stub210
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47EA0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4BF70h		; fileoff
		dw 570Fh		; codesize
		dw 552h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47EC0	proc far
		jmp	sub_974D0
sub_47EC0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub210		ends
