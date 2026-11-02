stub205		segment	para public 'CODE' use16
		assume cs:stub205
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47DB0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2FD80h		; fileoff
		dw 5D15h		; codesize
		dw 622h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47DD0	proc far
		jmp	sub_7CCD0
sub_47DD0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub205		ends
