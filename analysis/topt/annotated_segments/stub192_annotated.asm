stub192		segment	para public 'CODE' use16
		assume cs:stub192
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_479C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 8EB0h		; fileoff
		dw 33E6h		; codesize
		dw 23Ch		; relsize
		dw 0Ah			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479E0	proc far
		jmp	ResourceHandle_Destruct_5B331
sub_479E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479E5	proc far
		jmp	ResourceHandle_Construct_5B2F7
sub_479E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479EA	proc far
		jmp	sub_5B2C7
sub_479EA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479EF	proc far
		jmp	Gameflow_ApplyDefaultLoadout_57FA0
sub_479EF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479F4	proc far
		jmp	Gameflow_WeaponLoadout_584A6
sub_479F4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479F9	proc far
		jmp	Gameflow_ApplyDefaultLoadoutAlt_58223
sub_479F9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_479FE	proc far
		jmp	Gameflow_WeaponLoadoutAlt_58DEB
sub_479FE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A03	proc far
		jmp	sub_5974C
sub_47A03	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A08	proc far
		jmp	sub_599BE
sub_47A08	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A0D	proc far
		jmp	sub_5A9E2
sub_47A0D	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub192		ends
