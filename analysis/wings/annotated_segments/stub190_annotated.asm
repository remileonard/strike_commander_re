stub190		segment	para public 'CODE' use16
		assume cs:stub190
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58BE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0CAE0h		; fileoff
		dw 309h		; codesize
		dw 20h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C00	proc far
		jmp	AudioQueue_Helper_6CC20
sub_58C00	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C05	proc far
		jmp	sub_6CC48
sub_58C05	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C0A	proc far
		jmp	ResourceRecord_WriteFieldWrapper_6CC8A
sub_58C0A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C0F	proc far
		jmp	sub_6CC99
sub_58C0F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C14	proc far
		jmp	AudioQueue_AdvanceAndRelease_6CE9F
sub_58C14	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C19	proc far
		jmp	SoundFX_StopAllChannels_6CE6B
sub_58C19	endp
		db 0, 0
stub190		ends
