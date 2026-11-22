stub234		segment	para public 'CODE' use16
		assume cs:stub234
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59730	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 24580h		; fileoff
		dw 3199h		; codesize
		dw 556h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59750	proc far
		jmp	sub_82F50
sub_59750	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub234		ends
