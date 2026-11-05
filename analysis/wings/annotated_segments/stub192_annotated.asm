stub192		segment	para public 'CODE' use16
		assume cs:stub192
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58C90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0DC20h		; fileoff
		dw 0AC3h		; codesize
		dw 0B6h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58CB0	proc far
		jmp	sub_6DC70
sub_58CB0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub192		ends
