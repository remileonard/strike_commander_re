stub231		segment	para public 'CODE' use16
		assume cs:stub231
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48500	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 72ED0h		; fileoff
		dw 726h		; codesize
		dw 4Ch		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48520	proc far
		jmp	sub_BC230
sub_48520	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub231		ends
