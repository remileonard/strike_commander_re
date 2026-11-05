stub241		segment	para public 'CODE' use16
		assume cs:stub241
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_730F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0D290h		; fileoff
		dw 12Dh		; codesize
		dw 0Eh		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73110	proc far
		jmp	sub_8A507
sub_73110	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73115	proc far
		jmp	sub_8A4C0
sub_73115	endp
		db 0, 0, 0, 0, 0, 0
stub241		ends
