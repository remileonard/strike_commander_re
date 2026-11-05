stub350		segment	para public 'CODE' use16
		assume cs:stub350
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75510	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 470C0h		; fileoff
		dw 615h		; codesize
		dw 7Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75530	proc far
		jmp	sub_C1942
sub_75530	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75535	proc far
		jmp	sub_C1910
sub_75535	endp
		db 0, 0, 0, 0, 0, 0
stub350		ends
