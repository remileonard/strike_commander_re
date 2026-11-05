stub219		segment	para public 'CODE' use16
		assume cs:stub219
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59420	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 178A0h		; fileoff
		dw 64h		; codesize
		dw 6		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59440	proc far
		jmp	sub_771B0
sub_59440	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub219		ends
