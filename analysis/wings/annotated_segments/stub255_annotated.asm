stub255		segment	para public 'CODE' use16
		assume cs:stub255
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59BE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2B500h		; fileoff
		dw 80h		; codesize
		dw 4		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C00	proc far
		jmp	DisplayContext_CommitFrame_89618
sub_59C00	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C05	proc far
		jmp	DisplayContext_CommitFrameWithTag_89661
sub_59C05	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C0A	proc far
		jmp	sub_89677
sub_59C0A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C0F	proc far
		jmp	sub_89610
sub_59C0F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub255		ends
