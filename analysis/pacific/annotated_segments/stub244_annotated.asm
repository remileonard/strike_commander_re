stub244		segment	para public 'CODE' use16
		assume cs:stub244
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73180	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0D670h		; fileoff
		dw 53h		; codesize
		dw 8		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_731A0	proc far
		jmp	Input_ReadJoystickButtons_8A880
sub_731A0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub244		ends
