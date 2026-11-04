stub248		segment	para public 'CODE' use16
		assume cs:stub248
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_488A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 76A30h		; fileoff
		dw 27h		; codesize
		dw 2		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_488C0	proc far
		jmp	sub_BFB30
sub_488C0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub248		ends
