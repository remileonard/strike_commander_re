stub245		segment	para public 'CODE' use16
		assume cs:stub245
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_599D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2AC60h		; fileoff
		dw 0B9h		; codesize
		dw 2		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_599F0	proc far
		jmp	sub_88DF0
sub_599F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_599F5	proc far
		jmp	sub_88E69
sub_599F5	endp
		db 0, 0, 0, 0, 0, 0
stub245		ends
