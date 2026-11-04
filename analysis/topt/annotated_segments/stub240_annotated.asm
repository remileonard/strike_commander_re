stub240		segment	para public 'CODE' use16
		assume cs:stub240
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_486B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74CE0h		; fileoff
		dw 134h		; codesize
		dw 0Ah		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_486D0	proc far
		jmp	sub_BDEE0
sub_486D0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub240		ends
