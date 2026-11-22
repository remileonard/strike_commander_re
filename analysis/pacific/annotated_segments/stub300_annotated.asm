stub300		segment	para public 'CODE' use16
		assume cs:stub300
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74270	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 307C0h		; fileoff
		dw 208h		; codesize
		dw 0Eh		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74290	proc far
		jmp	Input_ReadJoystickButtonsExtended_AC010
sub_74290	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74295	proc far
		jmp	sub_AC13C
sub_74295	endp
		db 0, 0, 0, 0, 0, 0
stub300		ends
