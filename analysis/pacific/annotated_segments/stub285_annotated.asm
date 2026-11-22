stub285		segment	para public 'CODE' use16
		assume cs:stub285
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73EB0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2B740h		; fileoff
		dw 3E5h		; codesize
		dw 12h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73ED0	proc far
		jmp	sub_A7320
sub_73ED0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub285		ends
