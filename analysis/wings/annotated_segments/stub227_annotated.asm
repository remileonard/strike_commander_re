stub227		segment	para public 'CODE' use16
		assume cs:stub227
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_595E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1E6A0h		; fileoff
		dw 0C8Ah		; codesize
		dw 0F0h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59600	proc far
		jmp	sub_7D730
sub_59600	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub227		ends
