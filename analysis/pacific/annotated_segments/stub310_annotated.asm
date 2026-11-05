stub310		segment	para public 'CODE' use16
		assume cs:stub310
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74480	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 32800h		; fileoff
		dw 8		; codesize
		dw 0		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744A0	proc far
		jmp	sub_ADE90
sub_744A0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub310		ends
