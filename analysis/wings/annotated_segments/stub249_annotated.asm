stub249		segment	para public 'CODE' use16
		assume cs:stub249
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59A80	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2AE20h		; fileoff
		dw 17h		; codesize
		dw 2		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59AA0	proc far
		jmp	sub_88FA0
sub_59AA0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub249		ends
