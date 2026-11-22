stub230		segment	para public 'CODE' use16
		assume cs:stub230
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_484D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 72A70h		; fileoff
		dw 453h		; codesize
		dw 0		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_484F0	proc far
		jmp	sub_BBFB8
sub_484F0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub230		ends
