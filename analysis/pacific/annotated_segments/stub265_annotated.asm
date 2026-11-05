stub265		segment	para public 'CODE' use16
		assume cs:stub265
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73A40	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 250B0h		; fileoff
		dw 151h		; codesize
		dw 20h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A60	proc far
		jmp	sub_A10D8
sub_73A60	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A65	proc far
		jmp	sub_A1090
sub_73A65	endp
		db 0, 0, 0, 0, 0, 0
stub265		ends
