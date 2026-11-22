stub196		segment	para public 'CODE' use16
		assume cs:stub196
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58E10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0FCA0h		; fileoff
		dw 84Ch		; codesize
		dw 3Ah		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E30	proc far
		jmp	Debris_AllocateExtended_703B7
sub_58E30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E35	proc far
		jmp	sub_6FB90
sub_58E35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E3A	proc far
		jmp	sub_7002C
sub_58E3A	endp
		db 0
stub196		ends
