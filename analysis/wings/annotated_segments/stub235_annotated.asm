stub235		segment	para public 'CODE' use16
		assume cs:stub235
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59760	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27C70h		; fileoff
		dw 7DAh		; codesize
		dw 8Ah		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59780	proc far
		jmp	sub_860F0
sub_59780	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59785	proc far
		jmp	sub_86155
sub_59785	endp
		db 0, 0, 0, 0, 0, 0
stub235		ends
