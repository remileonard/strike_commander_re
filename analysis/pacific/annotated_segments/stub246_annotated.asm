stub246		segment	para public 'CODE' use16
		assume cs:stub246
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_731F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0EF80h		; fileoff
		dw 73Fh		; codesize
		dw 42h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73210	proc far
		jmp	sub_8C830
sub_73210	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73215	proc far
		jmp	sub_8C120
sub_73215	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7321A	proc far
		jmp	sub_8C12A
sub_7321A	endp
		db 0
stub246		ends
