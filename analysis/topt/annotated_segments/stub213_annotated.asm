stub213		segment	para public 'CODE' use16
		assume cs:stub213
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47F30	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 64F50h		; fileoff
		dw 6917h		; codesize
		dw 63Ch		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47F50	proc far
		jmp	sub_AEDE0
sub_47F50	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub213		ends
