stub234		segment	para public 'CODE' use16
		assume cs:stub234
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48590	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 73CC0h		; fileoff
		dw 64Eh		; codesize
		dw 3Eh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_485B0	proc far
		jmp	sub_BCF90
sub_485B0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub234		ends
