stub242		segment	para public 'CODE' use16
		assume cs:stub242
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48710	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74E80h		; fileoff
		dw 65h		; codesize
		dw 6		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48730	proc far
		jmp	sub_BE070
sub_48730	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub242		ends
