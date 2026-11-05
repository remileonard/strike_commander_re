stub314		segment	para public 'CODE' use16
		assume cs:stub314
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74640	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 344B0h		; fileoff
		dw 90Eh		; codesize
		dw 40h		; relsize
		dw 0Eh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74660	proc far
		jmp	sub_B02CA
sub_74660	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74665	proc far
		jmp	sub_B02CF
sub_74665	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7466A	proc far
		jmp	sub_B02D6
sub_7466A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7466F	proc far
		jmp	sub_AFA5A
sub_7466F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74674	proc far
		jmp	sub_AFA50
sub_74674	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74679	proc far
		jmp	sub_AFB34
sub_74679	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7467E	proc far
		jmp	sub_AFBE0
sub_7467E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74683	proc far
		jmp	sub_B0321
sub_74683	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74688	proc far
		jmp	MissileBody_BoostPhase_AFBFA
sub_74688	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7468D	proc far
		jmp	MissileBody_SteerToTarget_AFD00
sub_7468D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74692	proc far
		jmp	MissileBody_SetCruiseVelocity_AFFE3
sub_74692	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74697	proc far
		jmp	sub_B0016
sub_74697	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7469C	proc far
		jmp	Widget_Method_Dispatch18_B02B9
sub_7469C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_746A1	proc far
		jmp	sub_B0350
sub_746A1	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub314		ends
