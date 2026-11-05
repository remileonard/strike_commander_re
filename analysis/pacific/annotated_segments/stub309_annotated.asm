stub309		segment	para public 'CODE' use16
		assume cs:stub309
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74450	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 32720h		; fileoff
		dw 0D4h		; codesize
		dw 4		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74470	proc far
		jmp	Aircraft_SetChildVisible_ADDB0
sub_74470	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74475	proc far
		jmp	Aircraft_InitSpecialChild_ADE01
sub_74475	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7447A	proc far
		jmp	sub_ADE4F
sub_7447A	endp
		db 0
stub309		ends
