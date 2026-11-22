stub249		segment	para public 'CODE' use16
		assume cs:stub249
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73320	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 11D70h		; fileoff
		dw 269Eh		; codesize
		dw 0A2h		; relsize
		dw 12h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73340	proc far
		jmp	sub_91387
sub_73340	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73345	proc far
		jmp	sub_9134C
sub_73345	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7334A	proc far
		jmp	HUDSymbol_ReleaseAllRefs_912ED
sub_7334A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7334F	proc far
		jmp	HUDSymbol_RenderWithLOSCheckB_909C8
sub_7334F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73354	proc far
		jmp	sub_8F1B1
sub_73354	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73359	proc far
		jmp	sub_8F39F
sub_73359	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7335E	proc far
		jmp	HUDSymbol_RenderWithClipTestB_8FC94
sub_7335E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73363	proc far
		jmp	HUDSymbol_RenderWithClipTestC_9046D
sub_73363	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73368	proc far
		jmp	sub_900CF
sub_73368	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7336D	proc far
		jmp	HUDSymbol_ComputeTransform_90884
sub_7336D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73372	proc far
		jmp	HUDSymbol_ConstructVariantA_8ED30
sub_73372	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73377	proc far
		jmp	HUDSymbol_ConstructAndInitAngle_8EF41
sub_73377	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7337C	proc far
		jmp	HUDSymbol_ConstructVariantB_8EE38
sub_7337C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73381	proc far
		jmp	HUDSymbol_Helper_8F162
sub_73381	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73386	proc far
		jmp	HUDSymbol_Helper2_8F18F
sub_73386	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7338B	proc far
		jmp	sub_90EDA
sub_7338B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73390	proc far
		jmp	sub_910A7
sub_73390	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73395	proc far
		jmp	sub_910B1
sub_73395	endp
		db 0, 0, 0, 0, 0, 0
stub249		ends
