stub352		segment	para public 'CODE' use16
		assume cs:stub352
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_755D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 49F40h		; fileoff
		dw 0C2Ah		; codesize
		dw 0D8h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755F0	proc far
		jmp	sub_C4FDA
sub_755F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755F5	proc far
		jmp	sub_C4F8E
sub_755F5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755FA	proc far
		jmp	sub_C4440
sub_755FA	endp
		db 0
stub352		ends
