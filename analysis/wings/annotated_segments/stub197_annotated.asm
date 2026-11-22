stub197		segment	para public 'CODE' use16
		assume cs:stub197
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58E40	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 10530h		; fileoff
		dw 824h		; codesize
		dw 3Eh		; relsize
		dw 15h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E60	proc far
		jmp	sub_70BD5
sub_58E60	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E65	proc far
		jmp	sub_70BCD
sub_58E65	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E6A	proc far
		jmp	MissionText_ApplyDualStyle_703E0
sub_58E6A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E6F	proc far
		jmp	sub_7046C
sub_58E6F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E74	proc far
		jmp	MissionText_ReleaseStyleWrapper_704B3
sub_58E74	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E79	proc far
		jmp	MissionText_ReleaseStyles_704D5
sub_58E79	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E7E	proc far
		jmp	sub_7051D
sub_58E7E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E83	proc far
		jmp	MissionText_CopyBufferB_708EB
sub_58E83	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E88	proc far
		jmp	MissionText_Helper4_70946
sub_58E88	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E8D	proc far
		jmp	EntityScreenLayout_ComputeAngularPosition
sub_58E8D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E92	proc far
		jmp	EntityScreenLayout_PrepareAndCompute
sub_58E92	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E97	proc far
		jmp	MissionText_Helper5_7095F
sub_58E97	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58E9C	proc far
		jmp	sub_70570
sub_58E9C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EA1	proc far
		jmp	MissionText_Helper_705D0
sub_58EA1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EA6	proc far
		jmp	MissionText_LoadFormationLabel_70610
sub_58EA6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EAB	proc far
		jmp	MissionText_ConstructFullOrientation_706C3
sub_58EAB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EB0	proc far
		jmp	MissionText_Helper2_70696
sub_58EB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EB5	proc far
		jmp	MissionText_CopyBuffer_70869
sub_58EB5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EBA	proc far
		jmp	sub_708CF
sub_58EBA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EBF	proc far
		jmp	MissionText_Helper3_707FF
sub_58EBF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EC4	proc far
		jmp	MissionText_ReleaseFree_7081F
sub_58EC4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub197		ends
