stub324		segment	para public 'CODE' use16
		assume cs:stub324
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_748E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 367C0h		; fileoff
		dw 2BFh		; codesize
		dw 32h		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74900	proc far
		jmp	Targeting_DestructWithWeakRefs
sub_74900	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74905	proc far
		jmp	sub_B1CF4
sub_74905	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7490A	proc far
		jmp	sub_B1C00
sub_7490A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7490F	proc far
		jmp	sub_B1DD9
sub_7490F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub324		ends
