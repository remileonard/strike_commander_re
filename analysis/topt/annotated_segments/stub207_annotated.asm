stub207		segment	para public 'CODE' use16
		assume cs:stub207
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47E10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 399F0h		; fileoff
		dw 8924h		; codesize
		dw 7F4h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47E30	proc far
		jmp	sub_85FE0
sub_47E30	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub207		ends
