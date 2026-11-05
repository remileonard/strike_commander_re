stub307		segment	para public 'CODE' use16
		assume cs:stub307
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_743F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 32350h		; fileoff
		dw 217h		; codesize
		dw 30h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74410	proc far
		jmp	sub_ADA30
sub_74410	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub307		ends
