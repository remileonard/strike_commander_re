stub322		segment	para public 'CODE' use16
		assume cs:stub322
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74870	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 36330h		; fileoff
		dw 37Bh		; codesize
		dw 12h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74890	proc far
		jmp	Landing_CheckTouchdown_B1790
sub_74890	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub322		ends
