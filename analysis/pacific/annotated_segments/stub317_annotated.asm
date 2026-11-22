stub317		segment	para public 'CODE' use16
		assume cs:stub317
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74730	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 356D0h		; fileoff
		dw 19Dh		; codesize
		dw 1Ah		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74750	proc far
		jmp	PlayerComponent_SubHelperY_B0BA0
sub_74750	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74755	proc far
		jmp	sub_B0BC3
sub_74755	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7475A	proc far
		jmp	sub_B0BE6
sub_7475A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7475F	proc far
		jmp	sub_B0C42
sub_7475F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74764	proc far
		jmp	PlayerComponent_SubHelperCC_B0C4A
sub_74764	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74769	proc far
		jmp	PlayerComponentVariantQ_ConstructAndInit_B0C6C
sub_74769	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7476E	proc far
		jmp	PlayerComponent_SubHelperZ_B0CAC
sub_7476E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74773	proc far
		jmp	PlayerComponentVariantP_ConstructAndInit_B0CED
sub_74773	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub317		ends
