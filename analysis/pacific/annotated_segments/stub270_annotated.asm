stub270		segment	para public 'CODE' use16
		assume cs:stub270
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73B30	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27060h		; fileoff
		dw 196h		; codesize
		dw 2Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73B50	proc far
		jmp	sub_A2EC0
sub_73B50	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73B55	proc far
		jmp	sub_A2FE0
sub_73B55	endp
		db 0, 0, 0, 0, 0, 0
stub270		ends
