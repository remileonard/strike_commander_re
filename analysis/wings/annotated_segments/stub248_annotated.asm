stub248		segment	para public 'CODE' use16
		assume cs:stub248
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59A50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2ADC0h		; fileoff
		dw 55h		; codesize
		dw 6		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59A70	proc far
		jmp	sub_88F40
sub_59A70	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59A75	proc far
		jmp	TextRenderer_EncodeCharB_88F68
sub_59A75	endp
		db 0, 0, 0, 0, 0, 0
stub248		ends
