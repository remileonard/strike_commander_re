stub237		segment	para public 'CODE' use16
		assume cs:stub237
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48620	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74730h		; fileoff
		dw 1CDh		; codesize
		dw 0Ch		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48640	proc far
		jmp	sub_BD980
sub_48640	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub237		ends
