stub244		segment	para public 'CODE' use16
		assume cs:stub244
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48770	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 750A0h		; fileoff
		dw 43Eh		; codesize
		dw 20h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48790	proc far
		jmp	sub_BE280
sub_48790	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48795	proc far
		jmp	sub_BE420
sub_48795	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4879A	proc far
		jmp	sub_BE5D6
sub_4879A	endp
		db 0
stub244		ends
