stub302		segment	para public 'CODE' use16
		assume cs:stub302
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_742F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 31C90h		; fileoff
		dw 18Ah		; codesize
		dw 10h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74310	proc far
		jmp	sub_AD3E0
sub_74310	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74315	proc far
		jmp	sub_AD4A5
sub_74315	endp
		db 0, 0, 0, 0, 0, 0
stub302		ends
