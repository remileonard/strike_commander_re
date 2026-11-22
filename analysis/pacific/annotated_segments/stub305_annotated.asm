stub305		segment	para public 'CODE' use16
		assume cs:stub305
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74390	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 321D0h		; fileoff
		dw 100h		; codesize
		dw 12h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_743B0	proc far
		jmp	sub_AD8D0
sub_743B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_743B5	proc far
		jmp	Camera_ConstructWithSecondaryFlag_AD8FA
sub_743B5	endp
		db 0, 0, 0, 0, 0, 0
stub305		ends
