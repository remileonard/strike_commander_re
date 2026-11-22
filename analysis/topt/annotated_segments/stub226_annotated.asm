stub226		segment	para public 'CODE' use16
		assume cs:stub226
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48370	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 71400h		; fileoff
		dw 0A6h		; codesize
		dw 0Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48390	proc far
		jmp	sub_BA890
sub_48390	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48395	proc far
		jmp	sub_BA90B
sub_48395	endp
		db 0, 0, 0, 0, 0, 0
stub226		ends
