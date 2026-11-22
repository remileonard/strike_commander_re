stub241		segment	para public 'CODE' use16
		assume cs:stub241
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_486E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74E20h		; fileoff
		dw 4Dh		; codesize
		dw 4		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48700	proc far
		jmp	sub_BE020
sub_48700	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub241		ends
