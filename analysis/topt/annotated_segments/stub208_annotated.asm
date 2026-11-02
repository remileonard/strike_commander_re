stub208		segment	para public 'CODE' use16
		assume cs:stub208
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47E40	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 42B10h		; fileoff
		dw 329Bh		; codesize
		dw 316h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47E60	proc far
		jmp	sub_8E910
sub_47E60	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub208		ends
