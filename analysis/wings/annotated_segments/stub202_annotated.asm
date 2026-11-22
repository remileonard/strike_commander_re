stub202		segment	para public 'CODE' use16
		assume cs:stub202
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59040	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 125D0h		; fileoff
		dw 3A4h		; codesize
		dw 42h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59060	proc far
		jmp	MissionText_ReleaseWidgetLabel_7265F
sub_59060	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59065	proc far
		jmp	sub_72300
sub_59065	endp
		db 0, 0, 0, 0, 0, 0
stub202		ends
