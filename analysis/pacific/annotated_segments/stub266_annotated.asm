stub266		segment	para public 'CODE' use16
		assume cs:stub266
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73A70	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 25230h		; fileoff
		dw 0C46h		; codesize
		dw 0A0h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A90	proc far
		jmp	sub_A11F0
sub_73A90	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A95	proc far
		jmp	sub_A1620
sub_73A95	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A9A	proc far
		jmp	sub_A1A16
sub_73A9A	endp
		db 0
stub266		ends
