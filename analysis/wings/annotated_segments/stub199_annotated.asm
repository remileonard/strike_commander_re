stub199		segment	para public 'CODE' use16
		assume cs:stub199
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58F50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 11BA0h		; fileoff
		dw 27Ah		; codesize
		dw 2Ah		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F70	proc far
		jmp	Debris_ConstructWithFormation_71950
sub_58F70	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F75	proc far
		jmp	sub_719A4
sub_58F75	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F7A	proc far
		jmp	Debris_ReleaseForceBufferWrapper_71A4F
sub_58F7A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F7F	proc far
		jmp	Debris_ConstructWithTorque_71A8E
sub_58F7F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F84	proc far
		jmp	Debris_ContainerOpWrapper_71AFC
sub_58F84	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F89	proc far
		jmp	Debris_ConstructWithTorqueB_71B1A
sub_58F89	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F8E	proc far
		jmp	Debris_ContainerCompareAndOp_71B96
sub_58F8E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F93	proc far
		jmp	sub_7198E
sub_58F93	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub199		ends
