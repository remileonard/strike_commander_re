stub197		segment	para public 'CODE' use16
		assume cs:stub197
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47BD0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 19040h		; fileoff
		dw 0B7Eh		; codesize
		dw 0F0h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BF0	proc far
		jmp	sub_680F3
sub_47BF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BF5	proc far
		jmp	sub_675C7
sub_47BF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BFA	proc far
		jmp	sub_67C8F
sub_47BFA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BFF	proc far
		jmp	sub_67F55
sub_47BFF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C04	proc far
		jmp	sub_68059
sub_47C04	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C09	proc far
		jmp	sub_675A0
sub_47C09	endp
		db 0, 0
stub197		ends
