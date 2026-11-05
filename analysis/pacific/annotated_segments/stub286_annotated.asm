stub286		segment	para public 'CODE' use16
		assume cs:stub286
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73EE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2BB40h		; fileoff
		dw 578h		; codesize
		dw 28h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F00	proc far
		jmp	sub_A7710
sub_73F00	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub286		ends
