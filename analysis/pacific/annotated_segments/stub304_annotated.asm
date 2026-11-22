stub304		segment	para public 'CODE' use16
		assume cs:stub304
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74350	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 31F00h		; fileoff
		dw 294h		; codesize
		dw 2Eh		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74370	proc far
		jmp	sub_AD630
sub_74370	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74375	proc far
		jmp	Debris_ConstructWithCameraAttach_AD65A
sub_74375	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7437A	proc far
		jmp	MobileObject_LoadDynamicsAndSmoke_AD6E9
sub_7437A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7437F	proc far
		jmp	Camera_ConstructAttachedWithTarget_AD774
sub_7437F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74384	proc far
		jmp	sub_AD7E6
sub_74384	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74389	proc far
		jmp	WorldObject_ConstructWithAIEntity_AD81C
sub_74389	endp
		db 0, 0
stub304		ends
