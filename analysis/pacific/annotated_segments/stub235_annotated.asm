stub235		segment	para public 'CODE' use16
		assume cs:stub235
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_72EE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0		; fileoff
		dw 6E3Fh		; codesize
		dw 0		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F00	proc far
		jmp	sub_83216
sub_72F00	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F05	proc far
		jmp	sub_83007
sub_72F05	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F0A	proc far
		jmp	sub_82F80
sub_72F0A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F0F	proc far
		jmp	sub_83253
sub_72F0F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F14	proc far
		jmp	sub_82F83
sub_72F14	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F19	proc far
		jmp	sub_8324D
sub_72F19	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F1E	proc far
		jmp	sub_82FA1
sub_72F1E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F23	proc far
		jmp	sub_8433C
sub_72F23	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub235		ends
