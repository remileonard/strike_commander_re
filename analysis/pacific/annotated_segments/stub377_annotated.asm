stub377		segment	para public 'CODE' use16
		assume cs:stub377
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75CD0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 576B0h		; fileoff
		dw 72Fh		; codesize
		dw 1Eh		; relsize
		dw 16h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CF0	proc far
		jmp	sub_D1562
sub_75CF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CF5	proc far
		jmp	sub_D1555
sub_75CF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CFA	proc far
		jmp	sub_D1548
sub_75CFA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CFF	proc far
		jmp	sub_D153B
sub_75CFF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D04	proc far
		jmp	Widget_ApplyStyleAndAllocate_D0E40
sub_75D04	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D09	proc far
		jmp	Widget_Method_Dispatch8_D0E9E
sub_75D09	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D0E	proc far
		jmp	Widget_Method_DispatchC_D0EC0
sub_75D0E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D13	proc far
		jmp	Widget_Method_DispatchChain_D10E3
sub_75D13	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D18	proc far
		jmp	Widget_ComputeAndStoreBounds_D0EE2
sub_75D18	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D1D	proc far
		jmp	sub_D109F
sub_75D1D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D22	proc far
		jmp	sub_D10C1
sub_75D22	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D27	proc far
		jmp	Widget_ComputeBoundsExtent_D114A
sub_75D27	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D2C	proc far
		jmp	sub_D0F4F
sub_75D2C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D31	proc far
		jmp	Widget_RenderWithAttributes_D0F92
sub_75D31	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D36	proc far
		jmp	sub_D101D
sub_75D36	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D3B	proc far
		jmp	sub_D0F2B
sub_75D3B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D40	proc far
		jmp	sub_D117C
sub_75D40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D45	proc far
		jmp	Widget_RenderComplexLayout_D11F9
sub_75D45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D4A	proc far
		jmp	Widget_RenderComplexLayoutWrapper_D1424
sub_75D4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D4F	proc far
		jmp	sub_D1451
sub_75D4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D54	proc far
		jmp	sub_D14B8
sub_75D54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D59	proc far
		jmp	sub_D1449
sub_75D59	endp
		db 0, 0
stub377		ends
