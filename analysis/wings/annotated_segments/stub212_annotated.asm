stub212		segment	para public 'CODE' use16
		assume cs:stub212
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_592D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 16D30h		; fileoff
		dw 36Eh		; codesize
		dw 3Eh		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_592F0	proc far
		jmp	sub_7689A
sub_592F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_592F5	proc far
		jmp	sub_766F0
sub_592F5	endp
		db 0, 0, 0, 0, 0, 0
stub212		ends
