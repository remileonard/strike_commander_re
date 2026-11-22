stub189		segment	para public 'CODE' use16
		assume cs:stub189
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58B90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0AEB0h		; fileoff
		dw 19E6h		; codesize
		dw 240h		; relsize
		dw 9			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BB0	proc far
		jmp	InputSystem_Allocate_6CBF0
sub_58BB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BB5	proc far
		jmp	sub_6B593
sub_58BB5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BBA	proc far
		jmp	sub_6BC79
sub_58BBA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BBF	proc far
		jmp	sub_6C2B3
sub_58BBF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BC4	proc far
		jmp	sub_6B24C
sub_58BC4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BC9	proc far
		jmp	sub_6C811
sub_58BC9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BCE	proc far
		jmp	InputSystem_ReleaseAll_6CA9C
sub_58BCE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BD3	proc far
		jmp	sub_6CB5A
sub_58BD3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58BD8	proc far
		jmp	Joystick_GetAxisMaxWrapper_6B230
sub_58BD8	endp
		db 0, 0, 0
stub189		ends
