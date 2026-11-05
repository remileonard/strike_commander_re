stub229		segment	para public 'CODE' use16
		assume cs:stub229
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59640	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1FCA0h		; fileoff
		dw 17DDh		; codesize
		dw 1EAh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59660	proc far
		jmp	sub_7EBA0
sub_59660	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub229		ends
