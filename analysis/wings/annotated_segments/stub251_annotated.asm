stub251		segment	para public 'CODE' use16
		assume cs:stub251
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59AE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2AFD0h		; fileoff
		dw 2Fh		; codesize
		dw 4		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B00	proc far
		jmp	Video_SetModeIfChanged_89130
sub_59B00	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub251		ends
