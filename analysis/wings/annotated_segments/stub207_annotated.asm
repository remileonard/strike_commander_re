stub207		segment	para public 'CODE' use16
		assume cs:stub207
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_591F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 14F50h		; fileoff
		dw 453h		; codesize
		dw 0		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59210	proc far
		jmp	sub_74C28
sub_59210	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub207		ends
