stub332		segment	para public 'CODE' use16
		assume cs:stub332
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74D40	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3B880h		; fileoff
		dw 4A3h		; codesize
		dw 42h		; relsize
		dw 14h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D60	proc far
		jmp	sub_B6A00
sub_74D60	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D65	proc far
		jmp	InfoWidget_CopyFieldB_B6A12
sub_74D65	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D6A	proc far
		jmp	sub_B6A2A
sub_74D6A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D6F	proc far
		jmp	sub_B6A3C
sub_74D6F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D74	proc far
		jmp	sub_B6A92
sub_74D74	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D79	proc far
		jmp	sub_B6AB1
sub_74D79	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D7E	proc far
		jmp	sub_B6B07
sub_74D7E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D83	proc far
		jmp	InfoWidget_Method_Dispatch0CB_B6B26
sub_74D83	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D88	proc far
		jmp	InfoWidget_MeasureAndDrawStyled_B6B51
sub_74D88	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D8D	proc far
		jmp	InfoWidget_Method_Dispatch0CC_B6C3E
sub_74D8D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D92	proc far
		jmp	InfoWidget_Method_Dispatch0CD_B6C5D
sub_74D92	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D97	proc far
		jmp	InfoWidget_ApplyStubHelpers_B6C88
sub_74D97	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D9C	proc far
		jmp	InfoWidget_Helper3_B6CA5
sub_74D9C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DA1	proc far
		jmp	InfoWidget_Method_DispatchField2A_B6CD3
sub_74DA1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DA6	proc far
		jmp	InfoWidget_Helper4_B6CE0
sub_74DA6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DAB	proc far
		jmp	InfoWidget_Helper5_B6CF6
sub_74DAB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DB0	proc far
		jmp	InfoWidget_DrawComposite_B6D1A
sub_74DB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DB5	proc far
		jmp	sub_B6E08
sub_74DB5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DBA	proc far
		jmp	InfoWidget_MeasureAndDrawC_B6E2D
sub_74DBA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DBF	proc far
		jmp	sub_B6E7E
sub_74DBF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub332		ends
