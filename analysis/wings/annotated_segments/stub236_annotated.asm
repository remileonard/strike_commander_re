stub236		segment	para public 'CODE' use16
		assume cs:stub236
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59790	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 284E0h		; fileoff
		dw 6A9h		; codesize
		dw 74h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_597B0	proc far
		jmp	sub_868D0
sub_597B0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub236		ends
