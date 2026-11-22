stub387		segment	para public 'CODE' use16
		assume cs:stub387
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76050	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 61FA0h		; fileoff
		dw 60h		; codesize
		dw 4		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76070	proc far
		jmp	sub_DAEF0
sub_76070	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76075	proc far
		jmp	sub_DAF1D
sub_76075	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7607A	proc far
		jmp	sub_DAF33
sub_7607A	endp
		db 0
stub387		ends
