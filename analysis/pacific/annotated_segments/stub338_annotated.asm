stub338		segment	para public 'CODE' use16
		assume cs:stub338
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75040	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3E870h		; fileoff
		dw 333h		; codesize
		dw 28h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75060	proc far
		jmp	sub_B97C0
sub_75060	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75065	proc far
		jmp	sub_B981F
sub_75065	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7506A	proc far
		jmp	sub_B9A27
sub_7506A	endp
		db 0
stub338		ends
