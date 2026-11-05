stub260		segment	para public 'CODE' use16
		assume cs:stub260
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73890	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1EFC0h		; fileoff
		dw 273Bh		; codesize
		dw 36Ah		; relsize
		dw 0Ah			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738B0	proc far
		jmp	InputSystem_Allocate_9DD85
sub_738B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738B5	proc far
		jmp	sub_9CE68
sub_738B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738BA	proc far
		jmp	sub_9C49C
sub_738BA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738BF	proc far
		jmp	sub_9B7FA
sub_738BF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738C4	proc far
		jmp	sub_9D998
sub_738C4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738C9	proc far
		jmp	InputSystem_ReleaseAll_9DC31
sub_738C9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738CE	proc far
		jmp	sub_9DCEF
sub_738CE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738D3	proc far
		jmp	Joystick_GetAxisMaxWrapper_9D97C
sub_738D3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738D8	proc far
		jmp	sub_9B670
sub_738D8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_738DD	proc far
		jmp	sub_9B695
sub_738DD	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub260		ends
