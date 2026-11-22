stub226		segment	para public 'CODE' use16
		assume cs:stub226
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_595B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1DD90h		; fileoff
		dw 86Bh		; codesize
		dw 9Ah		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_595D0	proc far
		jmp	sub_7CEC0
sub_595D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_595D5	proc far
		jmp	sub_7D36A
sub_595D5	endp
		db 0, 0, 0, 0, 0, 0
stub226		ends
