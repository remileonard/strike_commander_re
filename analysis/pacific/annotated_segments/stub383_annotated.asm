stub383		segment	para public 'CODE' use16
		assume cs:stub383
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75F90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 60460h		; fileoff
		dw 86h		; codesize
		dw 8		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75FB0	proc far
		jmp	sub_D95A0
sub_75FB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75FB5	proc far
		jmp	sub_D9607
sub_75FB5	endp
		db 0, 0, 0, 0, 0, 0
stub383		ends
