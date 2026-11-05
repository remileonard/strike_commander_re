stub334		segment	para public 'CODE' use16
		assume cs:stub334
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74E90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3C7F0h		; fileoff
		dw 0F4h		; codesize
		dw 8		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EB0	proc far
		jmp	AircraftDynamics_ReadStblChunk_B78C0
sub_74EB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EB5	proc far
		jmp	PlayerComponent_Helper_B7962
sub_74EB5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EBA	proc far
		jmp	sub_B7924
sub_74EBA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EBF	proc far
		jmp	sub_B794C
sub_74EBF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EC4	proc far
		jmp	sub_B7905
sub_74EC4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EC9	proc far
		jmp	sub_B7993
sub_74EC9	endp
		db 0, 0
stub334		ends
