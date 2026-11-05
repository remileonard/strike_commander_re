stub268		segment	para public 'CODE' use16
		assume cs:stub268
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73AD0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 26120h		; fileoff
		dw 833h		; codesize
		dw 58h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73AF0	proc far
		jmp	sub_A2030
sub_73AF0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub268		ends
