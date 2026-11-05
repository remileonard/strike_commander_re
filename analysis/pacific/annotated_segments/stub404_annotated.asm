stub404		segment	para public 'CODE' use16
		assume cs:stub404
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_764F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D0A0h		; fileoff
		dw 55h		; codesize
		dw 6		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76510	proc far
		jmp	sub_E5550
sub_76510	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76515	proc far
		jmp	TextRenderer_EncodeCharB_E5578
sub_76515	endp
		db 0, 0, 0, 0, 0, 0
stub404		ends
