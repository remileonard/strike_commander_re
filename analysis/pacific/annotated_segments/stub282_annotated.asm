stub282		segment	para public 'CODE' use16
		assume cs:stub282
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73D90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2A050h		; fileoff
		dw 80Ch		; codesize
		dw 40h		; relsize
		dw 12h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DB0	proc far
		jmp	MissionText_ApplyDualStyle_A5D50
sub_73DB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DB5	proc far
		jmp	sub_A5DDC
sub_73DB5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DBA	proc far
		jmp	MissionText_ReleaseStyleWrapper_A5E88
sub_73DBA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DBF	proc far
		jmp	MissionText_ReleaseStyles_A5EAA
sub_73DBF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DC4	proc far
		jmp	MissionText_CopyBufferB_A627A
sub_73DC4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DC9	proc far
		jmp	MissionText_Helper4_A62D5
sub_73DC9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DCE	proc far
		jmp	EntityScreenLayout_ComputeAngularPosition
sub_73DCE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DD3	proc far
		jmp	EntityScreenLayout_PrepareAndCompute
sub_73DD3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DD8	proc far
		jmp	MissionText_Helper5_A62EE
sub_73DD8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DDD	proc far
		jmp	MissionText_CopyStringField_A5EF2
sub_73DDD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DE2	proc far
		jmp	MissionText_Helper_A5F57
sub_73DE2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DE7	proc far
		jmp	MissionText_LoadFormationLabel_A5F97
sub_73DE7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DEC	proc far
		jmp	MissionText_ConstructFullOrientation_A604B
sub_73DEC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DF1	proc far
		jmp	MissionText_Helper2_A601E
sub_73DF1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DF6	proc far
		jmp	MissionText_CopyBuffer_A61F1
sub_73DF6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73DFB	proc far
		jmp	Camera_DetachParentWrapper_A6257
sub_73DFB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E00	proc far
		jmp	MissionText_Helper3_A6187
sub_73E00	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E05	proc far
		jmp	MissionText_ReleaseFree_A61A7
sub_73E05	endp
		db 0, 0, 0, 0, 0, 0
stub282		ends
