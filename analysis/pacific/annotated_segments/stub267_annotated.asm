stub267		segment	para public 'CODE' use16
		assume cs:stub267
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73AA0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 25F20h		; fileoff
		dw 1E6h		; codesize
		dw 16h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73AC0	proc far
		jmp	sub_A1E40
sub_73AC0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub267		ends
