stub257		segment	para public 'CODE' use16
		assume cs:stub257
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73700	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1B200h		; fileoff
		dw 0E47h		; codesize
		dw 0A8h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73720	proc far
		jmp	sub_97C10
sub_73720	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73725	proc far
		jmp	sub_989AE
sub_73725	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7372A	proc far
		jmp	sub_98956
sub_7372A	endp
		db 0
stub257		ends
