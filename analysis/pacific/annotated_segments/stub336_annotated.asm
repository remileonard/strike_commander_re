stub336		segment	para public 'CODE' use16
		assume cs:stub336
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74F80	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3D5D0h		; fileoff
		dw 9B0h		; codesize
		dw 6Eh		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FA0	proc far
		jmp	JDYN_ReadChunkFields_B8DE8
sub_74FA0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FA5	proc far
		jmp	sub_B8F86
sub_74FA5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FAA	proc far
		jmp	PlayerComponent_Helper_B8C67
sub_74FAA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FAF	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryL_B8D54
sub_74FAF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FB4	proc far
		jmp	PlayerComponent_ResetVisualStateDefaults_B8630
sub_74FB4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FB9	proc far
		jmp	sub_B8722
sub_74FB9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FBE	proc far
		jmp	sub_B8DC8
sub_74FBE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FC3	proc far
		jmp	sub_B8786
sub_74FC3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FC8	proc far
		jmp	sub_B8919
sub_74FC8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FCD	proc far
		jmp	sub_B8ABA
sub_74FCD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74FD2	proc far
		jmp	sub_B8FD8
sub_74FD2	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub336		ends
