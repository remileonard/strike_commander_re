stub193		segment	para public 'CODE' use16
		assume cs:stub193
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47A20	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0C4E0h		; fileoff
		dw 129Eh		; codesize
		dw 0D2h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A40	proc far
		jmp	sub_5C60B
sub_47A40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A45	proc far
		jmp	sub_5B390
sub_47A45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A4A	proc far
		jmp	sub_5B60C
sub_47A4A	endp
		db 0
stub193		ends
