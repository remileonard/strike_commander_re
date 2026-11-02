stub211		segment	para public 'CODE' use16
		assume cs:stub211
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47ED0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 51BE0h		; fileoff
		dw 0B48Fh		; codesize
		dw 0ADCh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47EF0	proc far
		jmp	sub_9CBE0
sub_47EF0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub211		ends
