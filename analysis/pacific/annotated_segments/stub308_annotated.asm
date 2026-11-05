stub308		segment	para public 'CODE' use16
		assume cs:stub308
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74420	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 325A0h		; fileoff
		dw 15Dh		; codesize
		dw 16h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74440	proc far
		jmp	Camera_ConstructWithHandle_ADC50
sub_74440	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub308		ends
