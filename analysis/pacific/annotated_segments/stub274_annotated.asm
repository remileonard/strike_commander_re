stub274		segment	para public 'CODE' use16
		assume cs:stub274
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73BF0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 277D0h		; fileoff
		dw 49h		; codesize
		dw 4		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73C10	proc far
		jmp	sub_A35D0
sub_73C10	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub274		ends
