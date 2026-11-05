stub220		segment	para public 'CODE' use16
		assume cs:stub220
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59450	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 17910h		; fileoff
		dw 373h		; codesize
		dw 24h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59470	proc far
		jmp	sub_77220
sub_59470	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59475	proc far
		jmp	sub_77369
sub_59475	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5947A	proc far
		jmp	sub_7747E
sub_5947A	endp
		db 0
stub220		ends
