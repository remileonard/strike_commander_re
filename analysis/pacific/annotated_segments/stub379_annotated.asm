stub379		segment	para public 'CODE' use16
		assume cs:stub379
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75DB0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 5A9E0h		; fileoff
		dw 8C5h		; codesize
		dw 0AAh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75DD0	proc far
		jmp	sub_D3F00
sub_75DD0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub379		ends
