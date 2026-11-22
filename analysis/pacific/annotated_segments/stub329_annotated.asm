stub329		segment	para public 'CODE' use16
		assume cs:stub329
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74B70	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 39E00h		; fileoff
		dw 1DFh		; codesize
		dw 1Eh		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B90	proc far
		jmp	sub_B507B
sub_74B90	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B95	proc far
		jmp	sub_B5070
sub_74B95	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B9A	proc far
		jmp	sub_B5115
sub_74B9A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B9F	proc far
		jmp	sub_B5152
sub_74B9F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BA4	proc far
		jmp	PaletteScreen_DispatchWidgetLayoutA_B5168
sub_74BA4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BA9	proc far
		jmp	PaletteScreen_DispatchWidgetLayoutB_B51B6
sub_74BA9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BAE	proc far
		jmp	PaletteScreen_SwitchModeAndDispatch_B5212
sub_74BAE	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub329		ends
