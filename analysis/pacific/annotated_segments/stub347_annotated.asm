stub347		segment	para public 'CODE' use16
		assume cs:stub347
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75440	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 462D0h		; fileoff
		dw 2EDh		; codesize
		dw 20h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75460	proc far
		jmp	AudioQueue_Helper_C0EA5
sub_75460	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75465	proc far
		jmp	AudioQueue_InitAndProcess_C0BE0
sub_75465	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7546A	proc far
		jmp	ResourceRecord_WriteFieldWrapper_C0C23
sub_7546A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7546F	proc far
		jmp	sub_C0C32
sub_7546F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75474	proc far
		jmp	AudioQueue_AdvanceAndRelease_C0E1B
sub_75474	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75479	proc far
		jmp	SoundFX_StopAllChannels_C0DE7
sub_75479	endp
		db 0, 0
stub347		ends
