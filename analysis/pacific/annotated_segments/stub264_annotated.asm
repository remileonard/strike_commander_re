stub264		segment	para public 'CODE' use16
		assume cs:stub264
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73A10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 24BB0h		; fileoff
		dw 4B3h		; codesize
		dw 40h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A30	proc far
		jmp	MissionText_ReleaseWidgetLabel_A103E
sub_73A30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A35	proc far
		jmp	sub_A0BD0
sub_73A35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A3A	proc far
		jmp	Model_LoadAppearance_A0F26
sub_73A3A	endp
		db 0
stub264		ends
