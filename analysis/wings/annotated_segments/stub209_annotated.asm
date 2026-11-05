stub209		segment	para public 'CODE' use16
		assume cs:stub209
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59250	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 161D0h		; fileoff
		dw 204h		; codesize
		dw 16h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59270	proc far
		jmp	sub_75C10
sub_59270	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub209		ends
