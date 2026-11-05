stub218		segment	para public 'CODE' use16
		assume cs:stub218
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_593F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 17850h		; fileoff
		dw 4Ah		; codesize
		dw 4		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59410	proc far
		jmp	sub_77160
sub_59410	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub218		ends
