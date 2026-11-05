stub269		segment	para public 'CODE' use16
		assume cs:stub269
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73B00	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 269B0h		; fileoff
		dw 64Fh		; codesize
		dw 5Eh		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73B20	proc far
		jmp	sub_A2BAB
sub_73B20	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73B25	proc far
		jmp	sub_A2870
sub_73B25	endp
		db 0, 0, 0, 0, 0, 0
stub269		ends
