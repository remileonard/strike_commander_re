stub240		segment	para public 'CODE' use16
		assume cs:stub240
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59860	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 29E10h		; fileoff
		dw 649h		; codesize
		dw 52h		; relsize
		dw 19h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59880	proc far
		jmp	sub_88050
sub_59880	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59885	proc far
		jmp	InfoWidget_CopyFieldB_88062
sub_59885	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5988A	proc far
		jmp	sub_8807A
sub_5988A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5988F	proc far
		jmp	sub_8808C
sub_5988F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59894	proc far
		jmp	sub_880F6
sub_59894	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59899	proc far
		jmp	sub_88160
sub_59899	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5989E	proc far
		jmp	InfoWidget_Method_Dispatch0CC_8817D
sub_5989E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598A3	proc far
		jmp	sub_8819C
sub_598A3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598A8	proc far
		jmp	InfoWidget_Method_Dispatch0CC_88206
sub_598A8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598AD	proc far
		jmp	InfoWidget_Method_Dispatch0CB_88225
sub_598AD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598B2	proc far
		jmp	sub_88280
sub_598B2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598B7	proc far
		jmp	sub_88250
sub_598B7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598BC	proc far
		jmp	sub_882D2
sub_598BC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598C1	proc far
		jmp	sub_8831F
sub_598C1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598C6	proc far
		jmp	InfoWidget_Method_Dispatch0CC_88420
sub_598C6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598CB	proc far
		jmp	InfoWidget_Method_Dispatch0CD_8843F
sub_598CB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598D0	proc far
		jmp	InfoWidget_ApplyStubHelpers_8846A
sub_598D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598D5	proc far
		jmp	InfoWidget_Helper3_88487
sub_598D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598DA	proc far
		jmp	InfoWidget_Method_DispatchField2A_884B5
sub_598DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598DF	proc far
		jmp	InfoWidget_Helper4_884C2
sub_598DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598E4	proc far
		jmp	InfoWidget_Helper5_884D8
sub_598E4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598E9	proc far
		jmp	InfoWidget_DrawComposite_884FC
sub_598E9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598EE	proc far
		jmp	sub_885EA
sub_598EE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598F3	proc far
		jmp	sub_8860F
sub_598F3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_598F8	proc far
		jmp	sub_88674
sub_598F8	endp
		db 0, 0, 0
stub240		ends
