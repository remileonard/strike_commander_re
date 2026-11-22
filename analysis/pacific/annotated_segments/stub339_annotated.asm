stub339		segment	para public 'CODE' use16
		assume cs:stub339
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75070	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3EBD0h		; fileoff
		dw 1E1h		; codesize
		dw 24h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75090	proc far
		jmp	sub_B9B00
sub_75090	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75095	proc far
		jmp	sub_B9C57
sub_75095	endp
		db 0, 0, 0, 0, 0, 0
stub339		ends
