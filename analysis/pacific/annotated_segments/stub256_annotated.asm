stub256		segment	para public 'CODE' use16
		assume cs:stub256
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_736B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1A900h		; fileoff
		dw 878h		; codesize
		dw 84h		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736D0	proc far
		jmp	sub_97BC8
sub_736D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736D5	proc far
		jmp	sub_97B86
sub_736D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736DA	proc far
		jmp	UIWidget_ReleaseWrapper_97390
sub_736DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736DF	proc far
		jmp	sub_97746
sub_736DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736E4	proc far
		jmp	PilotProfile_LoadFromPROF_VersionGate_977E8
sub_736E4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736E9	proc far
		jmp	sub_97419
sub_736E9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736EE	proc far
		jmp	sub_978E6
sub_736EE	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub256		ends
