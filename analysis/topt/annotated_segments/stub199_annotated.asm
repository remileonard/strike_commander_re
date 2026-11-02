stub199		segment	para public 'CODE' use16
		assume cs:stub199
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47C50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1A040h		; fileoff
		dw 0DECh		; codesize
		dw 0C0h		; relsize
		dw 0Dh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C70	proc far
		jmp	sub_6920F
sub_47C70	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C75	proc far
		jmp	AudioQueue_Helper_691E9
sub_47C75	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C7A	proc far
		jmp	sub_68980
sub_47C7A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C7F	proc far
		jmp	sub_68B2A
sub_47C7F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C84	proc far
		jmp	sub_68CA0
sub_47C84	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C89	proc far
		jmp	AudioQueue_RegisterTickModule_68480
sub_47C89	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C8E	proc far
		jmp	sub_684A1
sub_47C8E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C93	proc far
		jmp	sub_684B6
sub_47C93	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C98	proc far
		jmp	sub_68FD4
sub_47C98	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C9D	proc far
		jmp	sub_69177
sub_47C9D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47CA2	proc far
		jmp	sub_68E7B
sub_47CA2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47CA7	proc far
		jmp	sub_68EBD
sub_47CA7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47CAC	proc far
		jmp	sub_68EFF
sub_47CAC	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub199		ends
