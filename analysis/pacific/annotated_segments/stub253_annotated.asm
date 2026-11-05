stub253		segment	para public 'CODE' use16
		assume cs:stub253
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73580	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 184F0h		; fileoff
		dw 0E6Eh		; codesize
		dw 0E2h		; relsize
		dw 0Ch			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735A0	proc far
		jmp	MissionRecord_ReleaseEntry_95FAB
sub_735A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735A5	proc far
		jmp	MissionRecord_Helper_95F76
sub_735A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735AA	proc far
		jmp	TextScroll_Helper_95F58
sub_735AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735AF	proc far
		jmp	sub_9598D
sub_735AF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735B4	proc far
		jmp	sub_95E00
sub_735B4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735B9	proc far
		jmp	sub_95190
sub_735B9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735BE	proc far
		jmp	sub_95311
sub_735BE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735C3	proc far
		jmp	sub_95EBC
sub_735C3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735C8	proc far
		jmp	sub_95AD4
sub_735C8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735CD	proc far
		jmp	sub_95B6C
sub_735CD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735D2	proc far
		jmp	sub_95F25
sub_735D2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_735D7	proc far
		jmp	sub_95F41
sub_735D7	endp
		db 0, 0, 0, 0
stub253		ends
