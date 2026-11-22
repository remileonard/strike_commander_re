stub235		segment	para public 'CODE' use16
		assume cs:stub235
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_485C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74350h		; fileoff
		dw 21Ah		; codesize
		dw 24h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_485E0	proc far
		jmp	sub_BD5E0
sub_485E0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub235		ends
