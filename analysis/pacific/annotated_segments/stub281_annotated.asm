stub281		segment	para public 'CODE' use16
		assume cs:stub281
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73D60	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 29FB0h		; fileoff
		dw 89h		; codesize
		dw 14h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73D80	proc far
		jmp	sub_A5CC0
sub_73D80	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub281		ends
