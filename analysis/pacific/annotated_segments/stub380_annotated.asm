stub380		segment	para public 'CODE' use16
		assume cs:stub380
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75DE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 5B350h		; fileoff
		dw 7CCh		; codesize
		dw 8Ch		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E00	proc far
		jmp	sub_D47D0
sub_75E00	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub380		ends
