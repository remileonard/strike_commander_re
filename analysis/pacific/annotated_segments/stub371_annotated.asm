stub371		segment	para public 'CODE' use16
		assume cs:stub371
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75B40	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 56A00h		; fileoff
		dw 141h		; codesize
		dw 0Eh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B60	proc far
		jmp	sub_D01F0
sub_75B60	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub371		ends
