stub271		segment	para public 'CODE' use16
		assume cs:stub271
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73B60	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27230h		; fileoff
		dw 29Ah		; codesize
		dw 18h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73B80	proc far
		jmp	sub_A3060
sub_73B80	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73B85	proc far
		jmp	sub_A3215
sub_73B85	endp
		db 0, 0, 0, 0, 0, 0
stub271		ends
