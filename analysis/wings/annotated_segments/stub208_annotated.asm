stub208		segment	para public 'CODE' use16
		assume cs:stub208
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59220	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 153B0h		; fileoff
		dw 0D6Bh		; codesize
		dw 0ACh		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59240	proc far
		jmp	sub_74EA0
sub_59240	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59245	proc far
		jmp	sub_75334
sub_59245	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5924A	proc far
		jmp	sub_7578D
sub_5924A	endp
		db 0
stub208		ends
