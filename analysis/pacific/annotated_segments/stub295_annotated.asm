stub295		segment	para public 'CODE' use16
		assume cs:stub295
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74110	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2E9F0h		; fileoff
		dw 27Ah		; codesize
		dw 2Ah		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74130	proc far
		jmp	Debris_ConstructWithFormation_AA3A0
sub_74130	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74135	proc far
		jmp	sub_AA3F4
sub_74135	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7413A	proc far
		jmp	Debris_ReleaseForceBufferWrapper_AA49F
sub_7413A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7413F	proc far
		jmp	Debris_ConstructWithTorque_AA4DE
sub_7413F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74144	proc far
		jmp	Debris_ContainerOpWrapper_AA54C
sub_74144	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74149	proc far
		jmp	Debris_ConstructWithTorqueB_AA56A
sub_74149	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7414E	proc far
		jmp	Debris_ContainerCompareAndOp_AA5E6
sub_7414E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74153	proc far
		jmp	sub_AA3DE
sub_74153	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub295		ends
