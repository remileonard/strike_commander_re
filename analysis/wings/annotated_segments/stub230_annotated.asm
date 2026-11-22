stub230		segment	para public 'CODE' use16
		assume cs:stub230
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59670	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 21670h		; fileoff
		dw 1615h		; codesize
		dw 18Eh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59690	proc far
		jmp	sub_80380
sub_59690	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub230		ends
