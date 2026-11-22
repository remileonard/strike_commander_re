stub296		segment	para public 'CODE' use16
		assume cs:stub296
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74160	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2ECA0h		; fileoff
		dw 122h		; codesize
		dw 0Eh		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74180	proc far
		jmp	sub_AA738
sub_74180	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74185	proc far
		jmp	sub_AA730
sub_74185	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7418A	proc far
		jmp	sub_AA620
sub_7418A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7418F	proc far
		jmp	Debris_ContainerOpWrapperB_AA6B7
sub_7418F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74194	proc far
		jmp	sub_AA6EA
sub_74194	endp
		db 0, 0, 0, 0, 0, 0, 0
stub296		ends
