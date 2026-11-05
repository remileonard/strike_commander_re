stub215		segment	para public 'CODE' use16
		assume cs:stub215
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59360	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 17550h		; fileoff
		dw 5		; codesize
		dw 0		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59380	proc far
		jmp	sub_76E80
sub_59380	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub215		ends
