stub245		segment	para public 'CODE' use16
		assume cs:stub245
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_731B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0D6D0h		; fileoff
		dw 1831h		; codesize
		dw 7Ch		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_731D0	proc far
		jmp	sub_8C0E2
sub_731D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_731D5	proc far
		jmp	AIManeuver_LoadFormationDataC_8A8E0
sub_731D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_731DA	proc far
		jmp	sub_8A99E
sub_731DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_731DF	proc far
		jmp	sub_8A9CA
sub_731DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_731E4	proc far
		jmp	EntityTracker_RegisterAndSelect
sub_731E4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_731E9	proc far
		jmp	sub_8AA2E
sub_731E9	endp
		db 0, 0
stub245		ends
